%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function returns the firing characteristic of the neuron based on its
% firing activity. For firing_regularity > 0.3 the neuron was automatically
% classifid as tonic, for firing_regularity < − 0.3 the neuron was 
% automatically classifid as bursting, for 0.3 > firing_regularity > − 0.3 
% we used an additional criterion based on the firing rate profile: if>70% 
% of the samples was outside the range firing_rate ± 0.5*firing_rate, 
% indicating the presence of both very high and low firing rate, the neuron 
% was classifid as bursting, otherwise as irregular.
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% INPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% firing_regularity : parameter denotes the type of the firing of a neuron
% ins_firing_rate   : array contains instantenous firing rate [nTime x 1]
% spike_train       : array contains  0&1 to represent spike train 
% firing_rate       : estimated overall firing rate of the neuron 
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% OUTPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% spike_pattern     : an string value denotes the type of the type of 
%                     neuronal activity
%
function [spike_pattern] = firing_characteristic(firing_regularity, ins_firing_rate,...
                                                 spike_train, firing_rate)
    spike_firing_rate = nonzeros(spike_train .* ins_firing_rate);

    if(firing_regularity > 0.3)
        spike_pattern = "tonic";
    elseif(firing_regularity < -0.3)
        spike_pattern = "bursting";
    else
        upper_count = sum(spike_firing_rate > (firing_rate + firing_rate * 0.5));
        lower_count = sum(spike_firing_rate < (firing_rate - firing_rate * 0.5));

        % 70 of elements in instantenous firing rate
        burst_threshold = int32(0.7 * length(spike_firing_rate)); 
        % total number of spikes reside outside of the boundaries
        total_outliers  = upper_count + lower_count;      

        if(total_outliers >  burst_threshold)
            spike_pattern = "bursting";
        else
            spike_pattern = "irregular";
        end 
    end
    
end

