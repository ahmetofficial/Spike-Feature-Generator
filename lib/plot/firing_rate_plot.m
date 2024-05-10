function [fig] = firing_rate_plot (spike_train_matrix, time_vector, bin_size, firing_rate, ...
                                   spiking_times, pause_stats, burst_plot, burst_count)

    % plotting intantaneuos firing rate
    fig = figure(50); hold all ;
    
    for trial = 1:size(spike_train_matrix ,1)
        position = time_vector(spike_train_matrix(trial, :) == 1) ;
        
        for spike_index = 1:length(position)
            plot ([position(spike_index) position(spike_index)], [trial-0.5 trial+0.5], 'k') ;
        end
    end

    title(strcat("instantenous firing rate (", string(bin_size), " seconds bin size)"));
    ylabel("frequency [Hz]"); xlabel("time [seconds]");
    hold on; 
    plot(time_vector, firing_rate, 'k');

    % plotting pauses
    for i = 1:length(pause_stats.begin)
        pause_start = spiking_times(pause_stats.begin(i));
        pause_end   = spiking_times(pause_stats.begin(i)) + pause_stats.pause_duration(i);
        patch([pause_start pause_end pause_end pause_start], [max(ylim) max(ylim) 0 0], 'b', 'FaceAlpha', .25, 'EdgeAlpha', 0);
    end

    if(burst_count ~= 0)
        % plotting bursts
            
        time_burst_sec_nz = nonzeros(burst_plot.time_burst_sec);
        burst_freq_nz     = nonzeros(burst_plot.burst_freq);
        
        % sometimes lengths of two previous vectors become different 
        min_index = min([length(time_burst_sec_nz),length(burst_freq_nz)]);
        
        plot(time_burst_sec_nz(1:min_index,:), burst_freq_nz(1:min_index,:), 'k');
        
        hold on;
    
        for i = 1:length(burst_plot.burst_start_time)
            burst_start  = burst_plot.burst_start_time(i);
            burst_finish = burst_plot.burst_finish_time(i);
            patch([burst_start burst_finish burst_finish burst_start], [max(ylim) max(ylim) 0 0], ...
                  'r', 'FaceAlpha', .025 * burst_plot.burst_RS(i), 'EdgeAlpha', 0);
        end
    end

end
