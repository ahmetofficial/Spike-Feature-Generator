function [psd, psd_normalized, psd100, frequency, frequency100] = estimate_psd(data, fs)
    
    data               = data - mean(data); % removing power at zero frequency
    winlen_denominator = 15;
    overlap_ratio      = 0.5;
    
    %remove powerline noise and its 5th harmonic
    data_power_line_removed = removeLineNoise_SpectrumEstimation(data, fs, 'LF = 50, NH = 5');
    data_power_line_removed(isnan(data_power_line_removed))=0;
    data_length             = length(data_power_line_removed);

    % tapering function with selected window size equals to total no of bins.
    % 50% percent overlapping will be used (default in pwelch) to consider
    % tapered useful signal regions for calculation of fft

    window_size      = data_length / winlen_denominator;
    window_vector    = hamming(window_size); 
    overlap          = window_size * overlap_ratio;
    nfft             = data_length;

    [psd, frequency] = pwelch(data_power_line_removed, window_vector, overlap, nfft, fs);
    psd_normalized   = psd ./ sum(psd);         % normalizing the psd
    psd100           = psd(frequency<=100);     % psd in usefull frequency range: 0-100Hz
    psd100           = psd100 ./ sum(psd100);   % normalizing psd in usefull frequency range: 0-100Hz
    frequency100     = frequency(frequency<=100);

    parameters.window_size   = window_size;
    parameters.overlap_ratio = overlap_ratio;
    parameters.nfft          = nfft;
      
end

