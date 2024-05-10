function level = generate_levels()

    % firing characteristics
    level.firing_rate                         = []; % all
    level.regularity                          = []; % all
    level.isi_rho                             = []; % all
    level.cv                                  = []; % all
    level.lv                                  = []; % all
    level.isi_mean                            = []; % all
    level.isi_std                             = []; % all
    level.isi_skewness                        = []; % all
    level.tonic_spiking_pattern               = []; % all
    level.burst_spiking_pattern               = []; % all
    level.irregular_spiking_pattern           = []; % all
    
    % bursting
    level.intrabf                             = []; % partial
    level.interbi                             = []; % partial
    level.intrabi                             = []; % partial
    level.burst_index                         = []; % partial
    level.burst_avg_spikes                    = []; % partial
    level.bspike_proportion                   = []; % partial
    
    % power spectral density
    level.delta_band_mean_power               = []; % all
    level.delta_band_max_power                = []; % all
    level.delta_band_min_power                = []; % all
    level.theta_band_mean_power               = []; % all
    level.theta_band_max_power                = []; % all
    level.theta_band_min_power                = []; % all
    level.alpha_band_mean_power               = []; % all
    level.alpha_band_max_power                = []; % all
    level.alpha_band_min_power                = []; % all
    level.beta_band_mean_power                = []; % all
    level.beta_band_max_power                 = []; % all
    level.beta_band_min_power                 = []; % all
    level.gamma_band_mean_power               = []; % all
    level.gamma_band_max_power                = []; % all
    level.gamma_band_min_power                = []; % all
    
    % oscillation
    level.oscillation_delta_exist             = []; % all
    level.oscillation_delta_freq              = []; % partial
    level.oscillation_delta_power             = []; % partial
    level.oscillation_theta_exist             = []; % all
    level.oscillation_theta_freq              = []; % partial
    level.oscillation_theta_power             = []; % partial
    level.oscillation_alpha_exist             = []; % all
    level.oscillation_alpha_freq              = []; % partial
    level.oscillation_alpha_power             = []; % partial
    level.oscillation_beta_exist              = []; % all
    level.oscillation_beta_freq               = []; % partial
    level.oscillation_beta_power              = []; % partial
    level.oscillation_gamma_exist             = []; % all
    level.oscillation_gamma_freq              = []; % partial
    level.oscillation_gamma_power             = []; % partial
    
    % coherence
    level.delta_band_mean_coherence             = []; % partial
    level.delta_band_mean_significant_coherence = []; % partial
    level.delta_band_peak_coherence             = []; % partial
    level.delta_band_peak_coherence_frequency   = []; % partial
    level.theta_band_mean_coherence             = []; % partial
    level.theta_band_mean_significant_coherence = []; % partial
    level.theta_band_peak_coherence             = []; % partial
    level.theta_band_peak_coherence_frequency   = []; % partial
    level.alpha_band_mean_coherence             = []; % partial
    level.alpha_band_mean_significant_coherence = []; % partial
    level.alpha_band_peak_coherence             = []; % partial
    level.alpha_band_peak_coherence_frequency   = []; % partial
    level.beta_band_mean_coherence              = []; % partial
    level.beta_band_mean_significant_coherence  = []; % partial
    level.beta_band_peak_coherence              = []; % partial
    level.beta_band_peak_coherence_frequency    = []; % partial
    level.gamma_band_mean_coherence             = []; % partial
    level.gamma_band_mean_significant_coherence = []; % partial
    level.gamma_band_peak_coherence             = []; % partial
    level.gamma_band_peak_coherence_frequency   = []; % partial
    
end

