function [level] = populate_bursting(level, neuron_stats)

    level.intrabf(end+1)          = neuron_stats.chars.iburstf;           % intra-burst-frequency  
    level.interbi(end+1)          = neuron_stats.chars.ibursti;           % inter-burst-interval
    level.intrabi(end+1)          = neuron_stats.chars.burst;             % intra-burst-interval
    level.burst_index(end+1)      = neuron_stats.chars.burst_index;       % burst index
    level.burst_avg_spikes(end+1) = neuron_stats.chars.burst_avg_spikes;  % average burst spikes
    level.bspike_proportion(end+1)= neuron_stats.chars.bspike_proportion; % burst spikes proportions
    
end

