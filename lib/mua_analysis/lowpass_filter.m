function data = lowpass_filter(data, cutoff, fs, order)
    nyq           = 0.5 * fs;
    normal_cutoff = cutoff / nyq;
    [b, a]        = butter(order, normal_cutoff, 'low');
    data          = filtfilt(b, a, data);
end