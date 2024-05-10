function quartile_plots(trajectory, trajectory_path)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FIRING RATE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lvl1_fr = trajectory.level_1.firing_rate';
    lvl2_fr = trajectory.level_2.firing_rate';
    lvl3_fr = trajectory.level_3.firing_rate';
    lvl4_fr = trajectory.level_4.firing_rate';
    lvl5_fr = trajectory.level_5.firing_rate';

    max_length = max([length(lvl1_fr), length(lvl2_fr), length(lvl3_fr),... 
                      length(lvl4_fr), length(lvl5_fr)]);

    lvl1_fr(end+1:max_length) = nan; lvl1_fr = reshape(lvl1_fr,[max_length,1]);
    lvl2_fr(end+1:max_length) = nan; lvl2_fr = reshape(lvl2_fr,[max_length,1]);
    lvl3_fr(end+1:max_length) = nan; lvl3_fr = reshape(lvl3_fr,[max_length,1]);
    lvl4_fr(end+1:max_length) = nan; lvl4_fr = reshape(lvl4_fr,[max_length,1]);
    lvl5_fr(end+1:max_length) = nan; lvl5_fr = reshape(lvl5_fr,[max_length,1]);

    X = [lvl1_fr, lvl2_fr, lvl3_fr, lvl4_fr, lvl5_fr];
    figure; boxchart(X);
            legend("Firing Rate");
            xlabel("Level"); ylabel("Frequency [Hz]");
            saveas(gcf, strcat(trajectory_path, "\" , "firing_rate.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%%%%% FIRING REGULARITY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lvl1_regularity = trajectory.level_1.regularity';
    lvl2_regularity = trajectory.level_2.regularity';
    lvl3_regularity = trajectory.level_3.regularity';
    lvl4_regularity = trajectory.level_4.regularity';
    lvl5_regularity = trajectory.level_5.regularity';

    max_length = max([length(lvl1_regularity), length(lvl2_regularity), length(lvl3_regularity),... 
                      length(lvl4_regularity), length(lvl5_regularity)]);
    
    lvl1_regularity(end+1:max_length) = nan; lvl1_regularity = reshape(lvl1_regularity,[max_length,1]);
    lvl2_regularity(end+1:max_length) = nan; lvl2_regularity = reshape(lvl2_regularity,[max_length,1]);
    lvl3_regularity(end+1:max_length) = nan; lvl3_regularity = reshape(lvl3_regularity,[max_length,1]);
    lvl4_regularity(end+1:max_length) = nan; lvl4_regularity = reshape(lvl4_regularity,[max_length,1]);
    lvl5_regularity(end+1:max_length) = nan; lvl5_regularity = reshape(lvl5_regularity,[max_length,1]);

    X = [lvl1_regularity, lvl2_regularity, lvl3_regularity, lvl4_regularity, lvl5_regularity];
    figure; boxchart(X);
            legend("Firing Regularity");
            xlabel("Level"); ylabel("Regularity Value");
            saveas(gcf, strcat(trajectory_path, "\" , "firing_regularity.png"));
            hold off;
            
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ISI RHO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_isi_rho = trajectory.level_1.isi_rho';
    lvl2_isi_rho = trajectory.level_2.isi_rho';
    lvl3_isi_rho = trajectory.level_3.isi_rho';
    lvl4_isi_rho = trajectory.level_4.isi_rho';
    lvl5_isi_rho = trajectory.level_5.isi_rho';

    max_length = max([length(lvl1_isi_rho), length(lvl2_isi_rho), length(lvl3_isi_rho),... 
                      length(lvl4_isi_rho), length(lvl5_isi_rho)]);
    
    lvl1_isi_rho(end+1:max_length) = nan; lvl1_isi_rho = reshape(lvl1_isi_rho,[max_length,1]);
    lvl2_isi_rho(end+1:max_length) = nan; lvl2_isi_rho = reshape(lvl2_isi_rho,[max_length,1]);
    lvl3_isi_rho(end+1:max_length) = nan; lvl3_isi_rho = reshape(lvl3_isi_rho,[max_length,1]);
    lvl4_isi_rho(end+1:max_length) = nan; lvl4_isi_rho = reshape(lvl4_isi_rho,[max_length,1]);
    lvl5_isi_rho(end+1:max_length) = nan; lvl5_isi_rho = reshape(lvl5_isi_rho,[max_length,1]);

    X = [lvl1_isi_rho, lvl2_isi_rho, lvl3_isi_rho, lvl4_isi_rho, lvl5_isi_rho];
    figure; boxchart(X);
            legend("ISI Rho");
            xlabel("Level");
            saveas(gcf, strcat(trajectory_path, "\" , "isi_rho.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%% COEFFICIENT OF VARIATION %%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_cv = trajectory.level_1.cv';
    lvl2_cv = trajectory.level_2.cv';
    lvl3_cv = trajectory.level_3.cv';
    lvl4_cv = trajectory.level_4.cv';
    lvl5_cv = trajectory.level_5.cv';

    max_length = max([length(lvl1_cv), length(lvl2_cv), length(lvl3_cv),... 
                      length(lvl4_cv), length(lvl5_cv)]);

    lvl1_cv(end+1:max_length) = nan; lvl1_cv = reshape(lvl1_cv,[max_length,1]);
    lvl2_cv(end+1:max_length) = nan; lvl2_cv = reshape(lvl2_cv,[max_length,1]);
    lvl3_cv(end+1:max_length) = nan; lvl3_cv = reshape(lvl3_cv,[max_length,1]);
    lvl4_cv(end+1:max_length) = nan; lvl4_cv = reshape(lvl4_cv,[max_length,1]);
    lvl5_cv(end+1:max_length) = nan; lvl5_cv = reshape(lvl5_cv,[max_length,1]);

    X = [lvl1_cv, lvl2_cv, lvl3_cv, lvl4_cv, lvl5_cv];
    figure; boxchart(X);
            legend("Coefficient of Variation");
            xlabel("Level");
            saveas(gcf, strcat(trajectory_path, "\" , "cv.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% LOCAL VARIATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_lv = trajectory.level_1.lv';
    lvl2_lv = trajectory.level_2.lv';
    lvl3_lv = trajectory.level_3.lv';
    lvl4_lv = trajectory.level_4.lv';
    lvl5_lv = trajectory.level_5.lv';

    max_length = max([length(lvl1_lv), length(lvl2_lv), length(lvl3_lv),... 
                      length(lvl4_lv), length(lvl5_lv)]);

    lvl1_lv(end+1:max_length) = nan; lvl1_lv = reshape(lvl1_lv,[max_length,1]);
    lvl2_lv(end+1:max_length) = nan; lvl2_lv = reshape(lvl2_lv,[max_length,1]);
    lvl3_lv(end+1:max_length) = nan; lvl3_lv = reshape(lvl3_lv,[max_length,1]);
    lvl4_lv(end+1:max_length) = nan; lvl4_lv = reshape(lvl4_lv,[max_length,1]);
    lvl5_lv(end+1:max_length) = nan; lvl5_lv = reshape(lvl5_lv,[max_length,1]);

    X = [lvl1_lv, lvl2_lv, lvl3_lv, lvl4_lv, lvl5_lv];
    figure; boxchart(X);
            legend("Local Variation");
            xlabel("Level");
            saveas(gcf, strcat(trajectory_path, "\" , "lv.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%%%% INTRA BURST FREQUENCY %%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_intrabf = trajectory.level_1.intrabf';
    lvl2_intrabf = trajectory.level_2.intrabf';
    lvl3_intrabf = trajectory.level_3.intrabf';
    lvl4_intrabf = trajectory.level_4.intrabf';
    lvl5_intrabf = trajectory.level_5.intrabf';

    max_length = max([length(lvl1_intrabf), length(lvl2_intrabf), length(lvl3_intrabf),... 
                      length(lvl4_intrabf), length(lvl5_intrabf)]);

    lvl1_intrabf(end+1:max_length) = nan; lvl1_intrabf = reshape(lvl1_intrabf,[max_length,1]);
    lvl2_intrabf(end+1:max_length) = nan; lvl2_intrabf = reshape(lvl2_intrabf,[max_length,1]);
    lvl3_intrabf(end+1:max_length) = nan; lvl3_intrabf = reshape(lvl3_intrabf,[max_length,1]);
    lvl4_intrabf(end+1:max_length) = nan; lvl4_intrabf = reshape(lvl4_intrabf,[max_length,1]);
    lvl5_intrabf(end+1:max_length) = nan; lvl5_intrabf = reshape(lvl5_intrabf,[max_length,1]);

    X = [lvl1_intrabf, lvl2_intrabf, lvl3_intrabf, lvl4_intrabf, lvl5_intrabf];
    figure; boxchart(X);
            legend("Intra Burst Frequency");
            xlabel("Level"); ylabel("Frequency [Hz]");
            saveas(gcf, strcat(trajectory_path, "\" , "intrabf.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%%%% INTER BURST INTERVAL %%%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_interbi = trajectory.level_1.interbi';
    lvl2_interbi = trajectory.level_2.interbi';
    lvl3_interbi = trajectory.level_3.interbi';
    lvl4_interbi = trajectory.level_4.interbi';
    lvl5_interbi = trajectory.level_5.interbi';

    max_length = max([length(lvl1_interbi), length(lvl2_interbi), length(lvl3_interbi),... 
                      length(lvl4_interbi), length(lvl5_interbi)]);

    lvl1_interbi(end+1:max_length) = nan; lvl1_interbi = reshape(lvl1_interbi,[max_length,1]);
    lvl2_interbi(end+1:max_length) = nan; lvl2_interbi = reshape(lvl2_interbi,[max_length,1]);
    lvl3_interbi(end+1:max_length) = nan; lvl3_interbi = reshape(lvl3_interbi,[max_length,1]);
    lvl4_interbi(end+1:max_length) = nan; lvl4_interbi = reshape(lvl4_interbi,[max_length,1]);
    lvl5_interbi(end+1:max_length) = nan; lvl5_interbi = reshape(lvl5_interbi,[max_length,1]);

    X = [lvl1_interbi, lvl2_interbi, lvl3_interbi, lvl4_interbi, lvl5_interbi];
    figure; boxchart(X);
            legend("Inter Burst Interval");
            xlabel("Level"); ylabel("Time [seconds]");
            saveas(gcf, strcat(trajectory_path, "\" , "interbi.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%%%% INTRA BURST INTERVAL %%%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_intrabi = trajectory.level_1.intrabi';
    lvl2_intrabi = trajectory.level_2.intrabi';
    lvl3_intrabi = trajectory.level_3.intrabi';
    lvl4_intrabi = trajectory.level_4.intrabi';
    lvl5_intrabi = trajectory.level_5.intrabi';

    max_length = max([length(lvl1_intrabi), length(lvl2_intrabi), length(lvl3_intrabi),... 
                      length(lvl4_intrabi), length(lvl5_intrabi)]);

    lvl1_intrabi(end+1:max_length) = nan; lvl1_intrabi = reshape(lvl1_intrabi,[max_length,1]);
    lvl2_intrabi(end+1:max_length) = nan; lvl2_intrabi = reshape(lvl2_intrabi,[max_length,1]);
    lvl3_intrabi(end+1:max_length) = nan; lvl3_intrabi = reshape(lvl3_intrabi,[max_length,1]);
    lvl4_intrabi(end+1:max_length) = nan; lvl4_intrabi = reshape(lvl4_intrabi,[max_length,1]);
    lvl5_intrabi(end+1:max_length) = nan; lvl5_intrabi = reshape(lvl5_intrabi,[max_length,1]);

    X = [lvl1_intrabi, lvl2_intrabi, lvl3_intrabi, lvl4_intrabi, lvl5_intrabi];
    figure; boxchart(X);
            legend("Intra Burst Interval");
            xlabel("Level"); ylabel("Time [seconds]");
            saveas(gcf, strcat(trajectory_path, "\" , "intrabi.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BURST INDEX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_burst_index = trajectory.level_1.burst_index';
    lvl2_burst_index = trajectory.level_2.burst_index';
    lvl3_burst_index = trajectory.level_3.burst_index';
    lvl4_burst_index = trajectory.level_4.burst_index';
    lvl5_burst_index = trajectory.level_5.burst_index';

    max_length = max([length(lvl1_burst_index), length(lvl2_burst_index), length(lvl3_burst_index),... 
                      length(lvl4_burst_index), length(lvl5_burst_index)]);

    lvl1_burst_index(end+1:max_length) = nan; lvl1_burst_index = reshape(lvl1_burst_index,[max_length,1]);
    lvl2_burst_index(end+1:max_length) = nan; lvl2_burst_index = reshape(lvl2_burst_index,[max_length,1]);
    lvl3_burst_index(end+1:max_length) = nan; lvl3_burst_index = reshape(lvl3_burst_index,[max_length,1]);
    lvl4_burst_index(end+1:max_length) = nan; lvl4_burst_index = reshape(lvl4_burst_index,[max_length,1]);
    lvl5_burst_index(end+1:max_length) = nan; lvl5_burst_index = reshape(lvl5_burst_index,[max_length,1]);

    X = [lvl1_burst_index, lvl2_burst_index, lvl3_burst_index, lvl4_burst_index, lvl5_burst_index];
    figure; boxchart(X);
            legend("Burst Index");
            xlabel("Level");
            saveas(gcf, strcat(trajectory_path, "\" , "burst_index.png"));
            hold off;
            
    %%%%%%%%%%%%%%%%%%%%%%%%%% BURST AVERAGE SPIKES %%%%%%%%%%%%%%%%%%%%%%%%%%%    
            
    lvl1_burst_avg_spikes = trajectory.level_1.burst_avg_spikes';
    lvl2_burst_avg_spikes = trajectory.level_2.burst_avg_spikes';
    lvl3_burst_avg_spikes = trajectory.level_3.burst_avg_spikes';
    lvl4_burst_avg_spikes = trajectory.level_4.burst_avg_spikes';
    lvl5_burst_avg_spikes = trajectory.level_5.burst_avg_spikes';

    max_length = max([length(lvl1_burst_avg_spikes), length(lvl2_burst_avg_spikes), length(lvl3_burst_avg_spikes),... 
                      length(lvl4_burst_avg_spikes), length(lvl5_burst_avg_spikes)]);

    lvl1_burst_avg_spikes(end+1:max_length) = nan; lvl1_burst_avg_spikes = reshape(lvl1_burst_avg_spikes,[max_length,1]);
    lvl2_burst_avg_spikes(end+1:max_length) = nan; lvl2_burst_avg_spikes = reshape(lvl2_burst_avg_spikes,[max_length,1]);
    lvl3_burst_avg_spikes(end+1:max_length) = nan; lvl3_burst_avg_spikes = reshape(lvl3_burst_avg_spikes,[max_length,1]);
    lvl4_burst_avg_spikes(end+1:max_length) = nan; lvl4_burst_avg_spikes = reshape(lvl4_burst_avg_spikes,[max_length,1]);
    lvl5_burst_avg_spikes(end+1:max_length) = nan; lvl5_burst_avg_spikes = reshape(lvl5_burst_avg_spikes,[max_length,1]);

    X = [lvl1_burst_avg_spikes, lvl2_burst_avg_spikes, lvl3_burst_avg_spikes, lvl4_burst_avg_spikes, lvl5_burst_avg_spikes];
    figure; boxchart(X);
            legend("Burst Average Spikes");
            xlabel("Level"); ylabel("Count");
            saveas(gcf, strcat(trajectory_path, "\" , "burst_avg_spikes.png"));
            hold off;   
    
    %%%%%%%%%%%%%%%%%%%%%%%% BURST SPIKES PROPORTIONS %%%%%%%%%%%%%%%%%%%%%%%%%
    lvl1_bspike_proportion = trajectory.level_1.bspike_proportion';
    lvl2_bspike_proportion = trajectory.level_2.bspike_proportion';
    lvl3_bspike_proportion = trajectory.level_3.bspike_proportion';
    lvl4_bspike_proportion = trajectory.level_4.bspike_proportion';
    lvl5_bspike_proportion = trajectory.level_5.bspike_proportion';

    max_length = max([length(lvl1_bspike_proportion), length(lvl2_bspike_proportion), length(lvl3_bspike_proportion),... 
                      length(lvl4_bspike_proportion), length(lvl5_bspike_proportion)]);
    
    lvl1_bspike_proportion(end+1:max_length) = nan; lvl1_bspike_proportion = reshape(lvl1_bspike_proportion,[max_length,1]);
    lvl2_bspike_proportion(end+1:max_length) = nan; lvl2_bspike_proportion = reshape(lvl2_bspike_proportion,[max_length,1]);
    lvl3_bspike_proportion(end+1:max_length) = nan; lvl3_bspike_proportion = reshape(lvl3_bspike_proportion,[max_length,1]);
    lvl4_bspike_proportion(end+1:max_length) = nan; lvl4_bspike_proportion = reshape(lvl4_bspike_proportion,[max_length,1]);
    lvl5_bspike_proportion(end+1:max_length) = nan; lvl5_bspike_proportion = reshape(lvl5_bspike_proportion,[max_length,1]);

    X = [lvl1_bspike_proportion, lvl2_bspike_proportion, lvl3_bspike_proportion, lvl4_bspike_proportion, lvl5_bspike_proportion];
    figure; boxchart(X);
            legend("Burst Spikes Proportion");
            xlabel("Level"); ylabel("Percentage");
            saveas(gcf, strcat(trajectory_path, "\" , "burst_spike_proportion.png"));
            hold off;
            
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ISI MEAN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_isi_mean = trajectory.level_1.isi_mean';
    lvl2_isi_mean = trajectory.level_2.isi_mean';
    lvl3_isi_mean = trajectory.level_3.isi_mean';
    lvl4_isi_mean = trajectory.level_4.isi_mean';
    lvl5_isi_mean = trajectory.level_5.isi_mean';

    max_length = max([length(lvl1_isi_mean), length(lvl2_isi_mean), length(lvl3_isi_mean),... 
                      length(lvl4_isi_mean), length(lvl5_isi_mean)]);
    
    lvl1_isi_mean(end+1:max_length) = nan; lvl1_isi_mean = reshape(lvl1_isi_mean,[max_length,1]);
    lvl2_isi_mean(end+1:max_length) = nan; lvl2_isi_mean = reshape(lvl2_isi_mean,[max_length,1]);
    lvl3_isi_mean(end+1:max_length) = nan; lvl3_isi_mean = reshape(lvl3_isi_mean,[max_length,1]);
    lvl4_isi_mean(end+1:max_length) = nan; lvl4_isi_mean = reshape(lvl4_isi_mean,[max_length,1]);
    lvl5_isi_mean(end+1:max_length) = nan; lvl5_isi_mean = reshape(lvl5_isi_mean,[max_length,1]);

    X = [lvl1_isi_mean, lvl2_isi_mean, lvl3_isi_mean, lvl4_isi_mean, lvl5_isi_mean];
    figure; boxchart(X);
            legend("ISI Mean");
            xlabel("Level");
            saveas(gcf, strcat(trajectory_path, "\" , "isi_mean.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ISI STD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_isi_std = trajectory.level_1.isi_std';
    lvl2_isi_std = trajectory.level_2.isi_std';
    lvl3_isi_std = trajectory.level_3.isi_std';
    lvl4_isi_std = trajectory.level_4.isi_std';
    lvl5_isi_std = trajectory.level_5.isi_std';

    max_length = max([length(lvl1_isi_std), length(lvl2_isi_std), length(lvl3_isi_std),... 
                      length(lvl4_isi_std), length(lvl5_isi_std)]);

    lvl1_isi_std(end+1:max_length) = nan; lvl1_isi_std = reshape(lvl1_isi_std,[max_length,1]);
    lvl2_isi_std(end+1:max_length) = nan; lvl2_isi_std = reshape(lvl2_isi_std,[max_length,1]);
    lvl3_isi_std(end+1:max_length) = nan; lvl3_isi_std = reshape(lvl3_isi_std,[max_length,1]);
    lvl4_isi_std(end+1:max_length) = nan; lvl4_isi_std = reshape(lvl4_isi_std,[max_length,1]);
    lvl5_isi_std(end+1:max_length) = nan; lvl5_isi_std = reshape(lvl5_isi_std,[max_length,1]);

    X = [lvl1_isi_std, lvl2_isi_std, lvl3_isi_std, lvl4_isi_std, lvl5_isi_std];
    figure; boxchart(X);
            legend("ISI STD");
            xlabel("Level");
            saveas(gcf, strcat(trajectory_path, "\" , "isi_std.png"));
            hold off;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ISI SKEWNESS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_isi_skewness = trajectory.level_1.isi_skewness';
    lvl2_isi_skewness = trajectory.level_2.isi_skewness';
    lvl3_isi_skewness = trajectory.level_3.isi_skewness';
    lvl4_isi_skewness = trajectory.level_4.isi_skewness';
    lvl5_isi_skewness = trajectory.level_5.isi_skewness';

    max_length = max([length(lvl1_isi_skewness), length(lvl2_isi_skewness), length(lvl3_isi_skewness),... 
                      length(lvl4_isi_skewness), length(lvl5_isi_skewness)]);

    lvl1_isi_skewness(end+1:max_length) = nan; lvl1_isi_skewness = reshape(lvl1_isi_skewness,[max_length,1]);
    lvl2_isi_skewness(end+1:max_length) = nan; lvl2_isi_skewness = reshape(lvl2_isi_skewness,[max_length,1]);
    lvl3_isi_skewness(end+1:max_length) = nan; lvl3_isi_skewness = reshape(lvl3_isi_skewness,[max_length,1]);
    lvl4_isi_skewness(end+1:max_length) = nan; lvl4_isi_skewness = reshape(lvl4_isi_skewness,[max_length,1]);
    lvl5_isi_skewness(end+1:max_length) = nan; lvl5_isi_skewness = reshape(lvl5_isi_skewness,[max_length,1]);

    X = [lvl1_isi_skewness, lvl2_isi_skewness, lvl3_isi_skewness, lvl4_isi_skewness, lvl5_isi_skewness];
    figure; boxchart(X);
            legend("ISI Skewness");
            xlabel("Level");
            saveas(gcf, strcat(trajectory_path, "\" , "isi_skewness.png"));
            hold off;
            
    %%%%%%%%%%%%%%%%%%%%%%% OSCILLATION DELTA FREQUENCY %%%%%%%%%%%%%%%%%%%%%%%%

    lvl1_oscillation_delta_freq = trajectory.level_1.oscillation_delta_freq';
    lvl2_oscillation_delta_freq = trajectory.level_2.oscillation_delta_freq';
    lvl3_oscillation_delta_freq = trajectory.level_3.oscillation_delta_freq';
    lvl4_oscillation_delta_freq = trajectory.level_4.oscillation_delta_freq';
    lvl5_oscillation_delta_freq = trajectory.level_5.oscillation_delta_freq';

    max_length = max([length(lvl1_oscillation_delta_freq), length(lvl2_oscillation_delta_freq), length(lvl3_oscillation_delta_freq),... 
                      length(lvl4_oscillation_delta_freq), length(lvl5_oscillation_delta_freq)]);

    lvl1_oscillation_delta_freq(end+1:max_length) = nan; lvl1_oscillation_delta_freq = reshape(lvl1_oscillation_delta_freq,[max_length,1]);
    lvl2_oscillation_delta_freq(end+1:max_length) = nan; lvl2_oscillation_delta_freq = reshape(lvl2_oscillation_delta_freq,[max_length,1]);
    lvl3_oscillation_delta_freq(end+1:max_length) = nan; lvl3_oscillation_delta_freq = reshape(lvl3_oscillation_delta_freq,[max_length,1]);
    lvl4_oscillation_delta_freq(end+1:max_length) = nan; lvl4_oscillation_delta_freq = reshape(lvl4_oscillation_delta_freq,[max_length,1]);
    lvl5_oscillation_delta_freq(end+1:max_length) = nan; lvl5_oscillation_delta_freq = reshape(lvl5_oscillation_delta_freq,[max_length,1]);

    X = [lvl1_oscillation_delta_freq, lvl2_oscillation_delta_freq, lvl3_oscillation_delta_freq, lvl4_oscillation_delta_freq, lvl5_oscillation_delta_freq];
    figure; boxchart(X);
            legend("Oscillation Delta Frequency");
            xlabel("Level");
            saveas(gcf, strcat(trajectory_path, "\" , "oscillation_delta_freq.png"));
            hold off;


    close all;
end
