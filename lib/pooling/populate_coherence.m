function [level] = populate_coherence(level, coherence_stats)

    level.delta_band_mean_coherence(end+1)             = coherence_stats.delta.mean_coherence;
    level.delta_band_mean_significant_coherence(end+1) = coherence_stats.delta.mean_significant_coherence;
    level.delta_band_peak_coherence(end+1)             = coherence_stats.delta.peak_coherence;
    level.delta_band_peak_coherence_frequency(end+1)   = coherence_stats.delta.peak_coherence_frequency;
    level.theta_band_mean_coherence(end+1)             = coherence_stats.theta.mean_coherence;
    level.theta_band_mean_significant_coherence(end+1) = coherence_stats.theta.mean_significant_coherence;
    level.theta_band_peak_coherence(end+1)             = coherence_stats.theta.peak_coherence;
    level.theta_band_peak_coherence_frequency(end+1)   = coherence_stats.theta.peak_coherence_frequency;
    level.alpha_band_mean_coherence(end+1)             = coherence_stats.alpha.mean_coherence;
    level.alpha_band_mean_significant_coherence(end+1) = coherence_stats.alpha.mean_significant_coherence;
    level.alpha_band_peak_coherence(end+1)             = coherence_stats.alpha.peak_coherence;
    level.alpha_band_peak_coherence_frequency(end+1)   = coherence_stats.alpha.peak_coherence_frequency;
    level.beta_band_mean_coherence(end+1)              = coherence_stats.beta.mean_coherence;
    level.beta_band_mean_significant_coherence(end+1)  = coherence_stats.beta.mean_significant_coherence;
    level.beta_band_peak_coherence(end+1)              = coherence_stats.beta.peak_coherence;
    level.beta_band_peak_coherence_frequency(end+1)    = coherence_stats.beta.peak_coherence_frequency;
    level.gamma_band_mean_coherence(end+1)             = coherence_stats.gamma.mean_coherence;
    level.gamma_band_mean_significant_coherence(end+1) = coherence_stats.gamma.mean_significant_coherence;
    level.gamma_band_peak_coherence(end+1)             = coherence_stats.gamma.peak_coherence;
    level.gamma_band_peak_coherence_frequency(end+1)   = coherence_stats.gamma.peak_coherence_frequency;
    
end

