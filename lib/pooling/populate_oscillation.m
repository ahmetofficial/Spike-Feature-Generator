function [level] = populate_oscillation(level, neuron_stats)
    
    level.oscillation_delta_freq(end+1)  = neuron_stats.oscillation_stats.delta.frequency;
    level.oscillation_delta_power(end+1) = neuron_stats.oscillation_stats.delta.peak_power;
    if(neuron_stats.oscillation_stats.delta.peak_power == -1)
        level.oscillation_delta_exist(end+1)     = 0;
    else
        level.oscillation_delta_exist(end+1)     = 1;
    end
    level.oscillation_theta_freq(end+1)  = neuron_stats.oscillation_stats.theta.frequency;
    level.oscillation_theta_power(end+1) = neuron_stats.oscillation_stats.theta.peak_power;
    if(neuron_stats.oscillation_stats.theta.peak_power == -1)
        level.oscillation_theta_exist(end+1)     = 0;
    else
        level.oscillation_theta_exist(end+1)     = 1;
    end
    level.oscillation_alpha_freq(end+1)  = neuron_stats.oscillation_stats.alpha.frequency;
    level.oscillation_alpha_power(end+1) = neuron_stats.oscillation_stats.alpha.peak_power;
    if(neuron_stats.oscillation_stats.alpha.peak_power == -1)
        level.oscillation_alpha_exist(end+1)     = 0;
    else
        level.oscillation_alpha_exist(end+1)     = 1;
    end
    level.oscillation_beta_freq(end+1)  = neuron_stats.oscillation_stats.beta.frequency;
    level.oscillation_beta_power(end+1) = neuron_stats.oscillation_stats.beta.peak_power;
    if(neuron_stats.oscillation_stats.beta.peak_power == -1)
        level.oscillation_beta_exist(end+1)     = 0;
    else
        level.oscillation_beta_exist(end+1)     = 1;
    end
    level.oscillation_gamma_freq(end+1)  = neuron_stats.oscillation_stats.gamma.frequency;
    level.oscillation_gamma_power(end+1) = neuron_stats.oscillation_stats.gamma.peak_power;
    if(neuron_stats.oscillation_stats.gamma.peak_power == -1)
        level.oscillation_gamma_exist(end+1)     = 0;
    else
        level.oscillation_gamma_exist(end+1)     = 1;
    end

    
    level.delta_band_mean_power(end+1)   = neuron_stats.psd_stats.delta.mean_power;
    level.delta_band_max_power(end+1)    = neuron_stats.psd_stats.delta.max_power;
    level.delta_band_min_power(end+1)    = neuron_stats.psd_stats.delta.min_power;
    level.theta_band_mean_power(end+1)   = neuron_stats.psd_stats.theta.mean_power;
    level.theta_band_max_power(end+1)    = neuron_stats.psd_stats.theta.max_power;
    level.theta_band_min_power(end+1)    = neuron_stats.psd_stats.theta.min_power;
    level.alpha_band_mean_power(end+1)   = neuron_stats.psd_stats.alpha.mean_power;
    level.alpha_band_max_power(end+1)    = neuron_stats.psd_stats.alpha.max_power;
    level.alpha_band_min_power(end+1)    = neuron_stats.psd_stats.alpha.min_power;
    level.beta_band_mean_power(end+1)    = neuron_stats.psd_stats.beta.mean_power;
    level.beta_band_max_power(end+1)     = neuron_stats.psd_stats.beta.max_power;
    level.beta_band_min_power(end+1)     = neuron_stats.psd_stats.beta.min_power;
    level.gamma_band_mean_power(end+1)   = neuron_stats.psd_stats.gamma.mean_power;
    level.gamma_band_max_power(end+1)    = neuron_stats.psd_stats.gamma.max_power;
    level.gamma_band_min_power(end+1)    = neuron_stats.psd_stats.gamma.min_power;

end

