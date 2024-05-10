function [coherence_stats] = coherence(x, y, fs, figure_path)

    L             = (length(x)/fs)/2;
    alpha         = 0.95;

    data_length   = length(x);
    overlap_ratio = 0;
    window_size   = data_length / L;
    window_vector = hamming(window_size); 
    noverlap      = window_size * overlap_ratio;
    nfft          = data_length;

    % calculate the coherence
    [Cxy,f]       = mscohere(x, y, window_vector, noverlap, nfft, fs);
    f             = f(f<=100); % we are interested in frequencies <=100
    Cxy           = Cxy(1:length(f));

    % define the minimum value for a significant coherence value for
    % alpha=0.95 significance level
    Climit          = 1 - (1-alpha)^(1/(L-1)); 
    significance    = Cxy > Climit;
    Cxy_significant = Cxy(significance);
    f_significant   = f(significance);
    
    [peak_val, peak_loc] = findpeaks(Cxy, f, 'MinPeakProminence', 0.025);

    peak_delta       = peak_val(peak_loc >= 1  & peak_loc < 4);
    peak_loc_delta   = peak_loc(peak_loc >= 1  & peak_loc < 4);
    peak_theta       = peak_val(peak_loc >= 4  & peak_loc < 8);
    peak_loc_theta   = peak_loc(peak_loc >= 4  & peak_loc < 8);
    peak_alpha       = peak_val(peak_loc >= 8  & peak_loc < 12);
    peak_loc_alpha   = peak_loc(peak_loc >= 8  & peak_loc < 12);
    peak_beta        = peak_val(peak_loc >= 12 & peak_loc < 30);
    peak_loc_beta    = peak_loc(peak_loc >= 12 & peak_loc < 30);
    peak_gamma       = peak_val(peak_loc >= 30 & peak_loc <= 100);
    peak_loc_gamma   = peak_loc(peak_loc >= 30 & peak_loc <= 100);

    figure; plot(f, Cxy, 'k'); hold on;
            patch([1 4 4 1], [max(ylim) max(ylim) 0 0], 'y', 'FaceAlpha', .25, 'EdgeAlpha', 0);
            patch([4 8 8 4], [max(ylim) max(ylim) 0 0], 'g', 'FaceAlpha', .25, 'EdgeAlpha', 0);
            patch([8 12 12 8], [max(ylim) max(ylim) 0 0], 'c', 'FaceAlpha', .25, 'EdgeAlpha', 0);
            patch([12 30 30 12], [max(ylim) max(ylim) 0 0], 'r', 'FaceAlpha', .25, 'EdgeAlpha', 0);
            patch([30 100 100 30], [max(ylim) max(ylim) 0 0], 'b', 'FaceAlpha', .25, 'EdgeAlpha', 0);     
            plot(f_significant, Cxy_significant, 'ok', 'MarkerSize', 3); hold on;
            xlabel("Frequency [Hz]"); ylabel("Coherence");
            title("Coherence Between BUA & MUA");
            xlim([0 100]);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Delta Band (1 - 4Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Cxy_delta             = Cxy(f >= 1 & f < 4);
    Cxy_significant_delta = Cxy_significant(f_significant >= 1 & f_significant < 4);
    
    delta                 = {};
    delta.mean_coherence  = mean(Cxy_delta);
    
    if(~isempty(Cxy_significant_delta))
        delta.mean_significant_coherence = mean(Cxy_significant_delta);
    else
        delta.mean_significant_coherence = NaN;
    end
    
    if(~isempty(peak_delta))
        delta.peak_coherence            = max(peak_delta);
        delta.peak_coherence_frequency  = peak_loc_delta(peak_delta==max(peak_delta));
        plot(peak_loc_delta, peak_delta, '*', 'MarkerSize', 6, 'Color', 'r'); hold on;
        plot(delta.peak_coherence_frequency, delta.peak_coherence, 'r.', 'MarkerSize', 30);
    else
        delta.peak_coherence           = NaN;
        delta.peak_coherence_frequency = NaN;
    end
    
    % coherence_stats.delta = delta;

    if(isnan(delta.mean_significant_coherence))
        coherence_stats.coherence_delta_band           = NaN;
        coherence_stats.coherence_frequency_delta_band = NaN;
    else
        coherence_stats.coherence_delta_band           = delta.peak_coherence;
        coherence_stats.coherence_frequency_delta_band = delta.peak_coherence_frequency;
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Theta Band (4 - 8Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Cxy_theta             = Cxy(f >= 4 & f < 8);
    Cxy_significant_theta = Cxy_significant(f_significant >= 4 & f_significant < 8);
    
    theta                 = {};
    theta.mean_coherence  = mean(Cxy_theta);
    
    if(~isempty(Cxy_significant_theta))
        theta.mean_significant_coherence = mean(Cxy_significant_theta);
    else
        theta.mean_significant_coherence = NaN;
    end
    
    if(~isempty(peak_theta))
        theta.peak_coherence            = max(peak_theta);
        theta.peak_coherence_frequency  = peak_loc_theta(peak_theta==max(peak_theta));
        plot(peak_loc_theta, peak_theta, '*', 'MarkerSize', 6, 'Color', 'r'); hold on;
        plot(theta.peak_coherence_frequency, theta.peak_coherence, 'r.', 'MarkerSize', 30);
    else
        theta.peak_coherence           = NaN;
        theta.peak_coherence_frequency = NaN;
    end
    
    % coherence_stats.theta = theta;

    if(isnan(theta.mean_significant_coherence))
        coherence_stats.coherence_theta_band           = NaN;
        coherence_stats.coherence_frequency_theta_band = NaN;
    else
        coherence_stats.coherence_theta_band           = theta.peak_coherence;
        coherence_stats.coherence_frequency_theta_band = theta.peak_coherence_frequency;
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Alpha Band (8 - 12Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Cxy_alpha             = Cxy(f >= 8 & f < 12);
    Cxy_significant_alpha = Cxy_significant(f_significant >= 8 & f_significant < 12);
    
    alpha                 = {};
    alpha.mean_coherence  = mean(Cxy_alpha);
    
    if(~isempty(Cxy_significant_alpha))
        alpha.mean_significant_coherence = mean(Cxy_significant_alpha);
    else
        alpha.mean_significant_coherence = NaN;
    end
    
    if(~isempty(peak_alpha))
        alpha.peak_coherence            = max(peak_alpha);
        alpha.peak_coherence_frequency  = peak_loc_alpha(peak_alpha==max(peak_alpha));
        plot(peak_loc_alpha, peak_alpha, '*', 'MarkerSize', 6, 'Color', 'r'); hold on;
        plot(alpha.peak_coherence_frequency, alpha.peak_coherence, 'r.', 'MarkerSize', 30);
    else
        alpha.peak_coherence           = NaN;
        alpha.peak_coherence_frequency = NaN;
    end
    
    % coherence_stats.alpha = alpha;

    if(isnan(alpha.mean_significant_coherence))
        coherence_stats.coherence_alpha_band           = NaN;
        coherence_stats.coherence_frequency_alpha_band = NaN;
    else
        coherence_stats.coherence_alpha_band           = alpha.peak_coherence;
        coherence_stats.coherence_frequency_alpha_band = alpha.peak_coherence_frequency;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Beta Band (30 - 100Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Cxy_beta             = Cxy(f >= 12 & f < 30);
    Cxy_significant_beta = Cxy_significant(f_significant >= 12 & f_significant < 30);
    
    beta                 = {};
    beta.mean_coherence  = mean(Cxy_beta);
    
    if(~isempty(Cxy_significant_beta))
        beta.mean_significant_coherence = mean(Cxy_significant_beta);
    else
        beta.mean_significant_coherence = NaN;
    end
    
    if(~isempty(peak_beta))
        beta.peak_coherence            = max(peak_beta);
        beta.peak_coherence_frequency  = peak_loc_beta(peak_beta==max(peak_beta));
        plot(peak_loc_beta, peak_beta, '*', 'MarkerSize', 6, 'Color', 'r'); hold on;
        plot(beta.peak_coherence_frequency, beta.peak_coherence, 'r.', 'MarkerSize', 30);
    else
        beta.peak_coherence           = NaN;
        beta.peak_coherence_frequency = NaN;
    end
    
    % coherence_stats.beta = beta;

    if(isnan(beta.mean_significant_coherence))
        coherence_stats.coherence_beta_band           = NaN;
        coherence_stats.coherence_frequency_beta_band = NaN;
    else
        coherence_stats.coherence_beta_band           = beta.peak_coherence;
        coherence_stats.coherence_frequency_beta_band = beta.peak_coherence_frequency;
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Gamma Band (30 - 100Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Cxy_gamma             = Cxy(f >= 30 & f < 100);
    Cxy_significant_gamma = Cxy_significant(f_significant >= 30 & f_significant < 100);
    
    gamma                 = {};
    gamma.mean_coherence  = mean(Cxy_gamma);
    
    if(~isempty(Cxy_significant_gamma))
        gamma.mean_significant_coherence = mean(Cxy_significant_gamma);
    else
        gamma.mean_significant_coherence = NaN;
    end
    
    if(~isempty(peak_gamma))
        gamma.peak_coherence            = max(peak_gamma);
        gamma.peak_coherence_frequency  = peak_loc_gamma(peak_gamma==max(peak_gamma));
        plot(peak_loc_gamma, peak_gamma, '*', 'MarkerSize', 6, 'Color', 'r'); hold on;
        plot(gamma.peak_coherence_frequency, gamma.peak_coherence, 'r.', 'MarkerSize', 30);
    else
        gamma.peak_coherence           = NaN;
        gamma.peak_coherence_frequency = NaN;
    end
    
    % coherence_stats.gamma = gamma;

    if(isnan(gamma.mean_significant_coherence))
        coherence_stats.coherence_gamma_band           = NaN;
        coherence_stats.coherence_frequency_gamma_band = NaN;
    else
        coherence_stats.coherence_gamma_band           = gamma.peak_coherence;
        coherence_stats.coherence_frequency_gamma_band = gamma.peak_coherence_frequency;
    end
    
    saveas(gcf, strcat(figure_path, "\coherence.png"));
    hold off;
    
end

