function raw_stable = stable_raw(raw, fs)

    raw_rms_median = rms(raw);
    no_bins        = fix(length(raw)/fs*1000/50);

    if(mod(length(raw),no_bins)~=0)
        % the segment at the end of the data is lower than 50 ms so we need
        % to add it manually as the last bin with zero padding
        extra_segment = mod(length(raw),no_bins); 
        raw_bins = reshape(raw(1:end-extra_segment), fix(length(raw)/fs*1000/50), [])';
        raw_bins = [raw_bins; padarray(raw(end-extra_segment:end),[0,no_bins-extra_segment-1],0,'post')];
    else
        raw_bins = reshape(raw, fix(length(raw)/fs*1000/50), [])';
    end

    raw_stable = [];

    for raw_i = 1:length(raw_bins)
        
        raw_50    = raw_bins(raw_i,:);
        std_50    = std(raw_50);
        rms_50    = rms(raw_50);
        threshold = raw_rms_median + 3 * std_50;

        if rms_50 <= threshold
            raw_stable = [raw_stable, raw_50];
        end
    end
    
end