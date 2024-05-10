function [oscillation_stats] = oscillation(sua_frequency, sua_psd, figure_path)
    
    % get frequency spectrum between [0-100 Hz]
    freq_100Hz = sua_frequency(sua_frequency<=100);
    psd_100Hz  = sua_psd(1:length(freq_100Hz));

    % define oscillation strength threshold
    baseline   = median(psd_100Hz);
    iqrange    = iqr(psd_100Hz);
    oscillation_threshold = baseline + iqrange*3;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % FIND PEAKS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Delta Band (1 - 4Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    f_delta         = sua_frequency(sua_frequency >= 1 & sua_frequency <= 4);
    psd_delta       = sua_psd(sua_frequency >= 1 & sua_frequency <= 4);
    [peak_delta, peak_loc_delta] = findpeaks(psd_delta, f_delta);
    [M,I]           = max(peak_delta);
    peak_delta      = peak_delta(I);
    peak_loc_delta  = peak_loc_delta(I);

    % Theta Band (4 - 8Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    f_theta         = sua_frequency(sua_frequency >= 4 & sua_frequency <= 8);
    psd_theta       = sua_psd(sua_frequency >= 4 & sua_frequency <= 8);
    [peak_theta, peak_loc_theta] = findpeaks(psd_theta, f_theta);
    [M,I]           = max(peak_theta);
    peak_theta      = peak_theta(I);
    peak_loc_theta  = peak_loc_theta(I);

    % Alpha Band (8 - 12Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    f_alpha         = sua_frequency(sua_frequency >= 8 & sua_frequency <= 12);
    psd_alpha       = sua_psd(sua_frequency >= 8 & sua_frequency <= 12);
    [peak_alpha, peak_loc_alpha] = findpeaks(psd_alpha, f_alpha);
    [M,I]           = max(peak_alpha);
    peak_alpha      = peak_alpha(I);
    peak_loc_alpha  = peak_loc_alpha(I);

    % Beta Band (12 - 30Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    f_beta          = sua_frequency(sua_frequency >= 12 & sua_frequency <= 30);
    psd_beta        = sua_psd(sua_frequency >= 12 & sua_frequency <= 30);
    [peak_beta, peak_loc_beta] = findpeaks(psd_beta, f_beta);
    [M,I]           = max(peak_beta);
    peak_beta       = peak_beta(I);
    peak_loc_beta   = peak_loc_beta(I);

    % Gamma Band (30 - 100Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    f_gamma         = sua_frequency(sua_frequency >= 30 & sua_frequency <= 100);
    psd_gamma       = sua_psd(sua_frequency >= 30 & sua_frequency <= 100);
    [peak_gamma, peak_loc_gamma] = findpeaks(psd_gamma, f_gamma);
    [M,I]           = max(peak_gamma);
    peak_gamma      = peak_gamma(I);
    peak_loc_gamma  = peak_loc_gamma(I);

    % fill oscillation stats structure
    oscillation_stats                  = {};
    oscillation_stats.delta            = {};
    oscillation_stats.delta.frequency  = NaN;
    oscillation_stats.delta.peak_power = NaN;
    oscillation_stats.theta            = {}; 
    oscillation_stats.theta.frequency  = NaN;
    oscillation_stats.theta.peak_power = NaN;
    oscillation_stats.alpha            = {};
    oscillation_stats.alpha.frequency  = NaN;
    oscillation_stats.alpha.peak_power = NaN;
    oscillation_stats.beta             = {};
    oscillation_stats.beta.frequency   = NaN;
    oscillation_stats.beta.peak_power  = NaN;
    oscillation_stats.gamma            = {};
    oscillation_stats.gamma.frequency  = NaN;
    oscillation_stats.gamma.peak_power = NaN;
    
    if(~isempty(peak_delta))
        if(peak_delta > oscillation_threshold)
            oscillation_stats.delta.frequency  = peak_loc_delta;
            oscillation_stats.delta.peak_power = peak_delta;
        end
    end

    if(~isempty(peak_theta))
        if(peak_theta > oscillation_threshold)
            oscillation_stats.theta.frequency  = peak_loc_theta;
            oscillation_stats.theta.peak_power = peak_theta;
        end
    end

    if(~isempty(peak_alpha)) 
        if(peak_alpha > oscillation_threshold)
            oscillation_stats.alpha.frequency  = peak_loc_alpha;
            oscillation_stats.alpha.peak_power = peak_alpha;
        end
    end

    if(~isempty(peak_beta)) 
        if(peak_beta > oscillation_threshold)
            oscillation_stats.beta.frequency  = peak_loc_beta;
            oscillation_stats.beta.peak_power = peak_beta;
        end
    end

    if(~isempty(peak_gamma)) 
        if(peak_gamma > oscillation_threshold)
            oscillation_stats.gamma.frequency  = peak_loc_gamma;
            oscillation_stats.gamma.peak_power = peak_gamma;
        end
    end

 figure; plot(sua_frequency, sua_psd); hold on;
         yline(baseline, 'r-', 'LineWidth', 3);
         yline(oscillation_threshold, 'k-', 'LineWidth', 1);

         plot(peak_loc_delta, peak_delta, 'r*', 'LineWidth', 1); hold on;
         plot(peak_loc_theta, peak_theta, 'r*', 'LineWidth', 1); hold on;
         plot(peak_loc_alpha, peak_alpha, 'r*', 'LineWidth', 1); hold on;
         plot(peak_loc_beta , peak_beta , 'r*', 'LineWidth', 1); hold on;
         plot(peak_loc_gamma, peak_gamma, 'r*', 'LineWidth', 1); hold on;

         patch([1 4 4 1], [max(ylim) max(ylim) 0 0], 'y', 'FaceAlpha', .25, 'EdgeAlpha', 0);
         patch([4 8 8 4], [max(ylim) max(ylim) 0 0], 'g', 'FaceAlpha', .25, 'EdgeAlpha', 0);
         patch([8 12 12 8], [max(ylim) max(ylim) 0 0], 'c', 'FaceAlpha', .25, 'EdgeAlpha', 0);
         patch([12 30 30 12], [max(ylim) max(ylim) 0 0], 'r', 'FaceAlpha', .25, 'EdgeAlpha', 0);
         patch([30 100 100 30], [max(ylim) max(ylim) 0 0], 'b', 'FaceAlpha', .25, 'EdgeAlpha', 0); 
         xlim([0 100]);
         
         xlabel("Frequency [Hz]"); ylabel("PSD");
         title("Power Spectral Density of SUA");
         hold off;
        
         saveas(gcf, strcat(figure_path, "\oscillation.png"));
end

