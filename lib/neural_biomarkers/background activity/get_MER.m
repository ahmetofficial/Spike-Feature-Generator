%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The functions that get the information about sorted spikes. To do that,
% it reads a .mat file that contains a matrix [N,2]; First column represent
% the id of detected neuron. So each number represent a different neuron.
% Second column represents the spiking times of neurons. The spiking times
% that belong to neuron id with 0 rejected (during the spike sorting these
% spiking activities labelled as multi unit activity).
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% INPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% path           : the full path of math file that contains sorted spikes
% 
%% %%%%%%%%%%%%%%%%%%%%%%%%% OUTPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% sua             : struct contains the neuron names and spiking times as
%                   vector. For each row, there are two information.
% mua             : multiunit activity sua + mua
% segment_length  : recording length in ms
% amplitudes      : the amplitudes of spikes
% prespike_tails  : the prespike tail values at 10ms for neuron (10 ms
%                   before spike occurs
% postspike_tails : the postspike tail values at 50ms for neuron (30 ms
%                   after spike occurs

function [raw, bua, mua, sua, sua_times, amplitudes,...
          prespike_tails, postspike_tails] = get_MER(sua_file_path, raw_file_path, dt)

    % get raw data
    raw            = load(raw_file_path);
    raw            = raw.data';
    
    sua_file       = load(sua_file_path);
    spike_shapes   = sua_file.spikes;
    spikes         = sua_file.cluster_class; % loaded matlab file provides 'cluster_class'
    neurons        = unique(spikes(:,1));    % determined neurons after spike sorting [1,2,3...]
    neurons        = neurons(neurons~=0);    % 0 represent the rejected spiking activity
    
    
    
    for i = 1:length(neurons)                % putting spiking times of different neurons in separate arrays
        neuron_index               = neurons(i);
        neuron_spikes              = spikes(spikes(:,1)==neuron_index,:);
        sua_times(i).neuron        = strcat('neuron', string(i));
        sua_times(i).spiking_times = neuron_spikes(:,2);
        
        spike_amplitudes           = spike_shapes(spikes(:,1)==neuron_index,:);
        spike_amplitudes           = spike_amplitudes(:,20);
        amplitudes(i).neuron       = strcat('neuron', string(i));
        amplitudes(i).values       = spike_amplitudes;
        
        left_tail                  = spike_shapes(spikes(:,1)==neuron_index,:);
        left_tail                  = left_tail(:,10);
        prespike_tails(i).neuron   = strcat('neuron', string(i));
        prespike_tails(i).values   = left_tail;
        
        right_tail                 = spike_shapes(spikes(:,1)==neuron_index,:);
        right_tail                 = right_tail(:,50);
        postspike_tails(i).neuron  = strcat('neuron', string(i));
        postspike_tails(i).values  = right_tail;
        
    end
    
    mua_times       = sua_file.cluster_class(:,2)./1000;
    [mua, sua, bua] = define_BUA_MUA(raw, mua_times, sua_times, ...
                                     spike_shapes, dt);
    
end