function [psd_stats] = psd_statistics(sua_frequency, sua_psd)

    % Delta Band (1 - 4Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    psd_delta       = sua_psd(sua_frequency >= 1 & sua_frequency <= 4);
    mean_delta      = mean(psd_delta);
    max_delta       = max(psd_delta);
    min_delta       = min(psd_delta);

    % Theta Band (4 - 8Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    psd_theta       = sua_psd(sua_frequency >= 4 & sua_frequency <= 8);
    mean_theta      = mean(psd_theta);
    max_theta       = max(psd_theta);
    min_theta       = min(psd_theta);

    % Alpha Band (8 - 12Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    psd_alpha       = sua_psd(sua_frequency >= 8 & sua_frequency <= 12);
    mean_alpha      = mean(psd_alpha);
    max_alpha       = max(psd_alpha);
    min_alpha       = min(psd_alpha);

    % Beta Band (12 - 30Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    psd_beta        = sua_psd(sua_frequency >= 12 & sua_frequency <= 30);
    mean_beta       = mean(psd_beta);
    max_beta        = max(psd_beta);
    min_beta        = min(psd_beta);

    % Gamma Band (30 - 100Hz) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    psd_gamma       = sua_psd(sua_frequency >= 30 & sua_frequency <= 100);
    mean_gamma      = mean(psd_gamma);
    max_gamma       = max(psd_gamma);
    min_gamma       = min(psd_gamma);

    psd_stats.delta.mean_power   = mean_delta;
    psd_stats.delta.max_power    = max_delta;
    psd_stats.delta.min_power    = min_delta;
    psd_stats.theta.mean_power   = mean_theta;
    psd_stats.theta.max_power    = max_theta;
    psd_stats.theta.min_power    = min_theta;
    psd_stats.alpha.mean_power   = mean_alpha;
    psd_stats.alpha.max_power    = max_alpha;
    psd_stats.alpha.min_power    = min_alpha;
    psd_stats.beta.mean_power    = mean_beta;
    psd_stats.beta.max_power     = max_beta;
    psd_stats.beta.min_power     = min_beta;
    psd_stats.gamma.mean_power   = mean_gamma;
    psd_stats.gamma.max_power    = max_gamma;
    psd_stats.gamma.min_power    = min_gamma;
    psd_stats.mean_power         = mean(sua_psd);

 end

