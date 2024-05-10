function spike_train = spike_train_with_refractory_period(spike_count,segment_length)

    refractory  = 3;                                         % minimum distance
    a           = randi(segment_length,100000,spike_count);  % make sufficiently large
    D           = abs(diff(a,[],2));
    idx         = D>= refractory;
    f           = find(sum(idx,2)==spike_count-1);
    spike_train = a(f,:);                                    % trials of spikes
    spike_train = a(1:200, :);

end

