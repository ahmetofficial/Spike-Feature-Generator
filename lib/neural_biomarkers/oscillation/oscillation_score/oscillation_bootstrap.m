% spike_times    = array contains time of spikes in seconds
% segment_length = double value represents the recording time in seconds
% fs             = sampling frequency

function oscillations = oscillation_bootstrap(spike_times, segment_length, fs)

    segment_length = segment_length * 1000; % second to millisecond
    segment_length = int32(segment_length);
    spike_count    = length(spike_times);

    spike_times    = spike_times * 1000; % second to millisecond
    spike_times    = int32(spike_times);
    spike_times    = {spike_times'};

    [OS_theta, CS_theta, OF_theta, AC_theta, ACWP_theta, S_theta] = OScoreSpikes(spike_times, segment_length, 4, 8, fs);
    [OS_alpha, CS_alpha, OF_alpha, AC_alpha, ACWP_alpha, S_alpha] = OScoreSpikes(spike_times, segment_length, 8, 13, fs);
    [OS_beta , CS_beta , OF_beta , AC_beta , ACWP_beta , S_beta]  = OScoreSpikes(spike_times, segment_length, 13, 30, fs);
    [OS_gamma, CS_gamma, OF_gamma, AC_gamma, ACWP_gamma, S_gamma] = OScoreSpikes(spike_times, segment_length, 30, 100, fs);
    
    bootstrap       = spike_train_with_refractory_period(spike_count,segment_length);
  
    null_dist_theta = [];
    null_dist_alpha = [];
    null_dist_beta  = [];
    null_dist_gamma = [];
    
    for i=1:length(bootstrap(:,1))
    
        spike_train                     = {int32(sort(bootstrap(i,:)))};

        try
            [os_btsrp_theta, a, b, c, d, e] = OScoreSpikes(spike_train, segment_length, 4, 8, fs);
        catch
            os_btsrp_theta = 1;
        end
        
        try
            [os_btsrp_alpha, a, b, c, d, e] = OScoreSpikes(spike_train, segment_length, 8, 12, fs);
        catch
            os_btsrp_alpha = 1;
        end

        try
            [os_btsrp_beta , a, b, c, d, e] = OScoreSpikes(spike_train, segment_length, 12, 30, fs);
        catch
            os_btsrp_beta = 1;
        end
        try
            [os_btsrp_gamma, a, b, c, d, e] = OScoreSpikes(spike_train, segment_length, 30, 100, fs);
        catch
            os_btsrp_gamma = 1;
        end

        null_dist_theta                 = [null_dist_theta, os_btsrp_theta];
        null_dist_alpha                 = [null_dist_alpha, os_btsrp_alpha];
        null_dist_beta                  = [null_dist_beta , os_btsrp_beta];
        null_dist_gamma                 = [null_dist_gamma, os_btsrp_gamma];

    end
    
    null_dist_theta = sort(null_dist_theta);
    null_dist_alpha = sort(null_dist_alpha);
    null_dist_beta  = sort(null_dist_beta);
    null_dist_gamma = sort(null_dist_gamma);
    
    threshold_theta = prctile(null_dist_theta,95);
    threshold_alpha = prctile(null_dist_alpha,95);
    threshold_beta  = prctile(null_dist_beta,95);
    threshold_gamma = prctile(null_dist_gamma,95);

    oscillations    = {};

    % THETA BAND
    if (OS_theta >= threshold_theta)
        if(OF_theta < 4) %spectral leakage due to the delta oscillations
            oscillations.oscillation_frequency_theta = NaN;
        else
            oscillations.oscillation_frequency_theta = OF_theta;   
        end
    else
        oscillations.oscillation_frequency_theta = NaN;
    end

    % ALPHA BAND
    if (OS_alpha >= threshold_alpha) 
        if(OF_alpha < 8) % spectral leakage due to the theta oscillations
            if(isnan(oscillations.oscillation_frequency_theta))
                oscillations.oscillation_frequency_theta = OF_alpha;
            end 
            oscillations.oscillation_frequency_alpha = NaN;
        else
            oscillations.oscillation_frequency_alpha = OF_alpha;
        end 
    else
        oscillations.oscillation_frequency_alpha = NaN;
    end

    % BETA BAND
    if (OS_beta >= threshold_beta)
        if(OF_beta < 13) % spectral leakage due to the alpha oscillations
            if(isnan(oscillations.oscillation_frequency_alpha))
                oscillations.oscillation_frequency_alpha = OF_beta;
            end
            oscillations.oscillation_frequency_beta  = NaN;
        else
            oscillations.oscillation_frequency_beta = OF_beta;
        end 
    else
        oscillations.oscillation_frequency_beta = NaN;
    end

    % GAMMA BAND
    if (OS_gamma >= threshold_gamma)
        if(OF_gamma < 30) % spectral leakage due to the beta oscillations
            if(isnan(oscillations.oscillation_frequency_beta))
                oscillations.oscillation_frequency_beta  = OF_gamma;
            end 
            oscillations.oscillation_frequency_gamma = NaN;
        else
            oscillations.oscillation_frequency_gamma = OF_gamma;
        end 
    else
        oscillations.oscillation_frequency_gamma = NaN;
    end

end

