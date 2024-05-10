function [level] = populate_firing_characteristics(level, neuron_stats)

    % get the statistics of the current neuron
    level.firing_rate(end+1)   = neuron_stats.chars.fr;            % firing rate
    level.regularity(end+1)    = neuron_stats.chars.regularity;    % spike regularity
    level.isi_rho(end+1)       = neuron_stats.chars.isi_rho;       % isi correlation
    level.cv(end+1)            = neuron_stats.chars.cv;            % coefficient of variation
    level.lv(end+1)            = neuron_stats.chars.lv;            % local variation
    level.isi_mean(end+1)      = neuron_stats.isi_pdf.mean;        % isi mean
    level.isi_std(end+1)       = neuron_stats.isi_pdf.std;         % isi std
    level.isi_skewness(end+1)  = neuron_stats.isi_pdf.skewness;    % isi skewness
    
    %spiking pattern
    if(string(neuron_stats.chars.spike_pattern)=="bursting")
        level.tonic_spiking_pattern(end+1)     = 0;
        level.burst_spiking_pattern(end+1)     = 1;
        level.irregular_spiking_pattern(end+1) = 0;
    elseif(string(neuron_stats.chars.spike_pattern)=="tonic")
        level.tonic_spiking_pattern(end+1)     = 1;
        level.burst_spiking_pattern(end+1)     = 0;
        level.irregular_spiking_pattern(end+1) = 0;
    else
        level.tonic_spiking_pattern(end+1)     = 0;
        level.burst_spiking_pattern(end+1)     = 0;
        level.irregular_spiking_pattern(end+1) = 1;
    end
    

end

