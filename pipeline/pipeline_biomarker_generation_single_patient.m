%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The function which compute all the necessary spiking features for
% analysis. The function takes the base path reserved for a specific
% patients for the all files (spike sorting). It will calculate all the
% statistics for each sorted neuron of the patient and save as a 
% _STATISTIC.mat file. So, if a patient does have a sorted neuron in a
% specific level of a specific neuron, a STATISTIC file will be generated
% in that level.
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% INPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% base_directory : the main directory of a patient's files.
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% OUTPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% NONE : (a statistic file and several plots which are related to a 
%         particular statistic will be saved).
%
function pipeline_biomarker_generation_single_patient(base_directory, patient_code)
    
    % definition of mer recording
    fs       = 24000;     % sampling frequency
    dt       = 1 / fs;    % time resolution
    bin_size = 0.010;     % interval for converting spike time to binary process (second)
    bin_size = 0.001;     % 1ms

    filelist = dir(fullfile(base_directory, '**\*.*')); 
    filelist = filelist(~[filelist.isdir]);  

    %% ANALYSIS

    % iterate on each .mat file contains spiking activities of sorted neurons
    for i = 1 : length(filelist)                    

        file_name      = filelist(i).name;
        file_name_we   = string(extractBetween(file_name,1,length(file_name)-4)) ; %without extension
        file_path      = strcat(filelist(i).folder);
        file_extension = string(extractBetween(file_name,(length(file_name)-3),length(file_name)));

        % apply the analysis only .mat file contains single unit activity
        if(strcmp(file_extension,'.mat') == 1 && ...
           contains(file_path, "SUA") == 1 && ...
           contains(file_name, "MUA") == 0 && ...
           contains(file_name, "STATISTICS") == 0)

            statistics      = table();

            % define file paths for current depth in the track
            base_directory  = extractBetween(file_path,1,length(file_path)-4);
            raw_directory   = strcat(base_directory, "\RAW\");
            sua_directory   = strcat(base_directory, "\SUA\");
            analy_directory	= strcat(base_directory, "\Analysis");

            raw_file_path	= dir(fullfile(raw_directory, '**\*.*'));
            disp("       > " + sua_directory);
            raw_file_path	= raw_file_path(3);
            raw_file_path	= strcat(raw_directory, raw_file_path.name);

            sua_file_path	= dir(fullfile(sua_directory, '**\*.*'));
            % find the file index of mat file in SUA folder
            sua_index       = find(contains(convertCharsToStrings({sua_file_path(:).name}),".mat")==1 & ...
                                   contains(convertCharsToStrings({sua_file_path(:).name}),"STATISTICS.mat")==0 );
            sua_file_path	= sua_file_path(sua_index);
            sua_file_path	= strcat(sua_directory, sua_file_path.name);

            % -----------------------------------------------------------------
            % DEFINITION OF RAW, MUA, BUA -------------------------------------
            % -----------------------------------------------------------------
                        
            % get the data of sorted spikes from the defined path
            [raw, bua, mua, sua, sua_times, spike_amplitudes, ...
             prespike_tails, postspike_tails] = get_MER(sua_file_path, raw_file_path, dt);
            segment_length                    = length(raw)/fs;
            
            % -----------------------------------------------------------------
            % SUA ANALYSIS FOR EACH NEURON ------------------------------------
            % -----------------------------------------------------------------

            % number of detected neurons for the current depth of the track
            number_of_neurons = length(sua_times);

            for neuron_count = 1:number_of_neurons

                % get the sorted neurons spiking activity
                neuron_name   = sua_times(neuron_count).neuron;
                spiking_times = sua_times(neuron_count).spiking_times ./ 1000; % in seconds
                N             = length(spiking_times);                         % number of spikes
                time_vector   = 0: bin_size: segment_length-bin_size;

                % converting spike times to binary spike train with a specific interval
                spike_train   = spiketime_2_spiketrain(spiking_times, bin_size, segment_length);


                selected_sua  = sua(neuron_count, :);
                sua_psd_path  = strcat(analy_directory, "\", neuron_name, "_spectrum");
                create_folder(sua_psd_path);
                
                % -------------------------------------------------------------
                % INSTANTANENOUS FIRING RATE ----------------------------------
                % -------------------------------------------------------------

                alpha = 4;
                beta  = N ^ (4/5);
                % getting instantenous firing rate
                [ins_firing_rate, h] = BAKS(spiking_times, time_vector', alpha, beta);

                % -------------------------------------------------------------
                % ISI ---------------------------------------------------------
                % -------------------------------------------------------------

                % calculating isi probability for each interval / bin
                [isi, isi_per_bin, isi_probs, bin_centers] = isi_probability(spiking_times, bin_size);

                % get firing rate and firing rate characteristics
                firing_pattern    = get_firing_pattern(spiking_times, N-1);
                log_lambda        = firing_pattern(1);                 % log lambda
                firing_rate       = exp(log_lambda);                   % firing rate
                firing_regularity = firing_pattern(2);                 % log kappa / shape factor
                isi_rho           = firing_pattern(3);                 % isi autocorr rho

                spike_pattern     = firing_characteristic(firing_regularity, ins_firing_rate, spike_train, firing_rate);

                lv                = local_variation(isi);              % local variation metric
                cv                = coefficient_of_variation(isi);     % coefficient of variation metric
                shape_param       = exp(firing_regularity);            % shape parameter of fitted gamma dist
                scale_param       = 1/(exp(log_lambda)*shape_param);   % scale parameter of fitted gamma dist

                isi_mean          = shape_param * scale_param;         % mean of isi distribution
                isi_std           = sqrt(shape_param * scale_param^2); % std of isi distribution
                isi_skewness      = 2 / sqrt(shape_param);             % skewness of isi distribution
                
                pause_index       = sum(isi >= 0.05)/sum(isi < 0.05);      % pause index
                pause_ratio       = sum(isi(isi >= 0.05))/sum(isi < 0.05); % pause ratio
                asymmetry_index   = mode(isi) / mean(isi);                 % asymmetry index

                % fit bin centers according to fitted gamma dist for KS test
                isi_dist  = makedist('Gamma', 'a', shape_param, 'b', scale_param);
                isi_pdf   = pdf(isi_dist, bin_centers);

                % matlab KS test
                [ks_h, p]   = kstest(isi,'CDF',isi_dist,'Alpha',0.05);
                
                % -------------------------------------------------------------
                % BURST DETECTION ---------------------------------------------
                % -------------------------------------------------------------
                if(spike_pattern == "bursting")
                    [burst_stats, burst_plot] = burst_statistics(spiking_times, isi, time_vector,...
                                                                 segment_length, ins_firing_rate);
                    intra_burst_freq  = burst_stats(1);  % average IBF
                    inter_burst_int   = burst_stats(2);  % average IBI
                    burst_int         = burst_stats(3);  % average IB
                    burst_avg_spikes  = burst_stats(4);  % average spikes in burst periods
                    burst_index       = burst_stats(5);  % burst index
                    bspike_proportion = burst_stats(6);  % bursting_spike_proportion
                    burst_count       = burst_stats(7);  % burst count

                    if(burst_int == 0)
                        spike_pattern = "irregular";
                        burst_plot    = NaN;
                    end

                else
                    intra_burst_freq  = 0;               % average IBF
                    inter_burst_int   = 0;               % average IBI
                    burst_int         = 0;               % average IB
                    burst_avg_spikes  = 0;               % average spikes in burst periods
                    bspike_proportion = 0;               % bursting_spike_proportion
                    burst_count       = 0;               % burst count
                    burst_index       = 0;               % burst index
                    burst_plot        = NaN;
                end

                % -------------------------------------------------------------
                % SUA OSCILLATIONS --------------------------------------------
                % -------------------------------------------------------------

                % Method 1: Oscillation Score with Bootstrapping
                oscillation_stats = oscillation_bootstrap(spiking_times, segment_length, fs);

                % Method 2: Spike Train PSD Estimation with Thresholding
                % oscillation_stats = spike_train_oscillation(spike_train);

                % -----------------------------------------------------------------
                % COHERENCE BETWEEN SUA & BUA -------------------------------------
                % -----------------------------------------------------------------   
                [coherence_stats] = coherence(bua, selected_sua, fs, sua_psd_path);
                
                % -------------------------------------------------------------
                % PAUSE DETECTION ---------------------------------------------
                % -------------------------------------------------------------
                pause_stats       = surprisePause(spiking_times, segment_length);

                % -------------------------------------------------------------
                % SPIKE WAVEFORM RELATED FEATURES -----------------------------
                % -------------------------------------------------------------
                
                spike_amplitude    = spike_amplitudes(:,neuron_count).values;
                amplitude_std      = std(spike_amplitude);
                amplitude_skewness = skewness(spike_amplitude, 0);
                amplitude_kurtosis = kurtosis(spike_amplitude, 0);
                
                % amplitude mean baseline deviation in terms of std of raw recording
                AMBD               = mean(spike_amplitude / std(raw)); 
                % absolute amplitude mean baseline deviation in terms of std of raw recording
                AAMBD              = mean(abs(spike_amplitude / std(raw)));
                        
                PreSPV             = std(prespike_tails(:,neuron_count).values); % prespike variance
                PostSPV            = std(postspike_tails(:,neuron_count).values); % prespike variance

                % -------------------------------------------------------------
                % ACF ---------------------------------------------------------
                % -------------------------------------------------------------

                % autocorrelation of spike train
                [acf,lags] = xcorr(spike_train, 'normalized');
                acf        = acf(int32(length(acf))/2:end);
                lags       = lags(int32(length(lags))/2:end);
                lags       = (lags * bin_size)';

                % -------------------------------------------------------------
                % SUA PLOTS -------------------------------------------------------
                % -------------------------------------------------------------

%                 acf_path_name     = strcat(analy_directory, '\', file_name_we, '_', neuron_name, '_ACF.png');
%                 isiprob_path_name = strcat(analy_directory, '\', file_name_we, '_', neuron_name, '_ISIPROB.png');
%                 raster_path_name  = strcat(analy_directory, '\', file_name_we, '_', neuron_name, '_raster.png');
%                 ifr_path_name     = strcat(analy_directory, '\', file_name_we, '_', neuron_name, '_IFR.png');
%                 ks_path_name      = strcat(analy_directory, '\', file_name_we, '_', neuron_name, '_KS.png');
% 
%                 % instantaneuos firing rate, neural pause and bursting plot
%                 %firing_rate_plot(spike_train', time_vector, bin_size, ins_firing_rate, spiking_times, pause_stats, burst_plot, burst_count);
% 
%                 % raster plot
%                 rp_figure = raster_plot(spike_train', time_vector, bin_size);    
%                 saveas(gcf, raster_path_name);
%                 hold off;
% 
%                 % firing rate plot
%                 fr_figure = figure(50);
%                 saveas(gcf, ifr_path_name);
% 
%                 % Kolmogorov-Smirnov plot
%                 [h, ks_figure] = kolmogorov_smirnov_test(isi_pdf, isi_probs, length(isi));     
%                 saveas(gcf, ks_path_name);
%                 hold off;
% 
%                 % isi probability plot
%                 figure; bar(bin_centers, isi_probs.*100 , 'b');
%                 hold on;
%                 plot(bin_centers, isi_pdf, 'LineWidth', 2 , 'color', 'r');
%                 xlabel("ISI [second]"); ylabel("probability [percentage]"); 
%                 title(strcat("ISI Probabilities (bin size ", string(bin_size), " seconds)"));
%                 legend('ISI bins', strcat('Fitted Gamma Distribution (shape:', string(shape_param),...
%                                           ' | scale:', string(scale_param),')'));
%                 saveas(gcf, isiprob_path_name);
%                 hold off;
% 
%                 % acf of spike train            
%                 stem(lags, acf, 'MarkerSize', 2)
%                 xlabel("time [seconds]"); ylabel("autocorrelation");
%                 title(strcat("Autocorrelogram (bin size ", string(bin_size), " seconds)"));
%                 saveas(gcf, acf_path_name);
%                 close all; 

                % -------------------------------------------------------------
                % SAVING STATISTICS -------------------------------------------
                % -------------------------------------------------------------
                path_segment  = split(file_path, "\");

                % hemisphere
                if(contains(file_path, "GPI dx") == 1), hemisphere = 'right'; else, hemisphere = 'left'; end
               
                % trajectory
                if(contains(file_path, "anteriore") == 1)
                    trajectory = "anterior";
                elseif(contains(file_path, "centrale") == 1)
                    trajectory = "central";
                elseif(contains(file_path, "laterale") == 1)
                    trajectory = "lateral";
                elseif(contains(file_path, "mediale") == 1)
                    trajectory = "medial";
                elseif(contains(file_path, "posteriore") == 1)
                    trajectory = "posterior";
                else
                    trajectory = "?";
                end
                
                % depth
      
                if(isempty(strfind(file_path,'+')) == 0) 
                    depth = string(extractBetween(file_path, strfind(file_path,'+'), strlength(file_path)));
                    dlast = strfind(depth,'\');
                    dlast = dlast(1);
                    %depth = string(extractBetween(depth, 1, strfind(depth,'\')-1));
                    depth = string(extractBetween(depth, 1, dlast-1));
                    depth = str2num(depth);
                else
                    depth = string(extractBetween(file_path, strfind(file_path,'-'), strlength(file_path)));
                    dlast = strfind(depth,'\');
                    dlast = dlast(1);
                    %depth = string(extractBetween(depth, 1, strfind(depth,'\')-1));
                    depth = string(extractBetween(depth, 1, dlast-1));
                    depth = str2num(depth);
                end
                
                % prepare table entry with all the analysis results
                neuron_biomarkers = {lower(patient_code), ...   % patient code
                                     hemisphere, ...            % hemisphere
                                     trajectory, ...            % trajectory
                                     depth, ...                 % depth
                                     spike_pattern, ...         % spiking pattern
                                     firing_rate, ...           % mean firing rate
                                     firing_regularity, ...     % firing regularity
                                     cv, ...                    % coefficient of variation
                                     lv, ...                    % local variation
                                     isi_mean, ...              % isi mean
                                     isi_std, ...               % isi standard deviation
                                     isi_skewness, ...          % isi skewness
                                     isi_rho, ...               % isi correlation coefficient
                                     pause_index, ...           % pause index
                                     pause_ratio, ...           % pause ratio
                                     asymmetry_index, ...       % asymmetry index of ISI
                                     amplitude_std, ...
                                     amplitude_skewness, ...
                                     amplitude_kurtosis, ...
                                     AMBD, ... 
                                     AAMBD, ... 
                                     PreSPV, ...
                                     PostSPV, ...
                                     burst_index, ...                               % burst index
                                     burst_avg_spikes, ...                          % average spikes count during bursts
                                     bspike_proportion, ...                         % proportion of bursting spikes
                                     burst_int, ...                                 % mean bursting duration
                                     inter_burst_int, ...                           % mean inter-bursting duration
                                     intra_burst_freq, ...                          % mean bursting frequency
                                     burst_count, ...                               % number of bursts
                                     %pause_stats.mean_intra_pause_frequency,...     % mean pause frequency
                                     %pause_stats.mean_pause_duration,...            % mean pause duration
                                     %pause_stats.proportion_time_in_pauses,...      % pause proportion in time
                                     %pause_stats.proportion_spikes_in_pauses,...    % pause proportion of spikes
                                     %pause_stats.num_pauses,...                     % number of pauses
                                     oscillation_stats.oscillation_frequency_theta, ...
                                     oscillation_stats.oscillation_frequency_alpha, ...
                                     oscillation_stats.oscillation_frequency_beta, ...
                                     oscillation_stats.oscillation_frequency_gamma, ...
                                     coherence_stats.coherence_theta_band, ...
                                     coherence_stats.coherence_frequency_theta_band, ...
                                     coherence_stats.coherence_alpha_band, ...
                                     coherence_stats.coherence_frequency_alpha_band, ...
                                     coherence_stats.coherence_beta_band, ...
                                     coherence_stats.coherence_frequency_beta_band, ...
                                     coherence_stats.coherence_gamma_band, ...
                                     coherence_stats.coherence_frequency_gamma_band
                                     };        
            
                statistics = [statistics; neuron_biomarkers];
            end
            
            statistics.Properties.VariableNames = {'patient', 'hemisphere', 'trajectory', ...
                'depth', 'spike_pattern', 'firing_rate', 'firing_regularity', 'cv', 'lv', 'isi_mean', ...
                'isi_std', 'isi_skewness', 'isi_rho', 'pause_index', 'pause_ratio', 'asymmetry_index', ...
                'amplitude_std', 'amplitude_skewness', 'amplitude_kurtosis', 'AMBD', 'AAMBD', 'PreSPV', 'PostSPV', ...
                'burst_index', 'burst_avg_spikes','bspike_proportion', 'burst_int', 'inter_burst_int', 'burst_freq', 'burst_count'...
                %'pause_freq', 'pause_duration', 'pause_time_proportion', 'pause_spike_proportion', 'pause_count',...
                'oscillation_frequency_theta_band', 'oscillation_frequency_alpha_band',... 
                'oscillation_frequency_beta_band', 'oscillation_frequency_gamma_band', ... 
                'coherence_theta_band', 'coherence_frequency_theta_band',...
                'coherence_alpha_band', 'coherence_frequency_alpha_band',...
                'coherence_beta_band', 'coherence_frequency_beta_band',...
                'coherence_gamma_band', 'coherence_frequency_gamma_band'
                };  

            % save the analysis result to given directory
            statistics_file_name = strcat(file_path, '\', file_name_we, '_STATISTICS.mat');

            % if file exist delete
            if exist(statistics_file_name, 'file') == 2 
                delete(statistics_file_name);
            end
            save(statistics_file_name,'statistics');    
        end
    end
end