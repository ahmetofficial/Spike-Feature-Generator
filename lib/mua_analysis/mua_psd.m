function [frequency, psd] = mua_psd(data, fs)

    data               = data - mean(data); % removing power at zero frequency
    winlen_denominator = 15;
    overlap_ratio      = 0.5;
    data_length        = length(data);

    % tapering function with selected window size equals to total no of bins.
    % 50% percent overlapping will be used (default in pwelch) to consider
    % tapered useful signal regions for calculation of fft

    window_size      = data_length / winlen_denominator;
    window_vector    = hamming(window_size); 
    overlap          = window_size * overlap_ratio;
    nfft             = data_length;

    [psd, frequency] = pwelch(data, window_vector, overlap, nfft, fs);
end

