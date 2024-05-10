function MUA = get_MUA(raw, fs)
    raw_stable          = stable_raw(raw, fs);
    raw_stable_filtered = removeLineNoise_SpectrumEstimation(raw_stable, fs, 'LF = 50, NH = 10');
    raw_stable_filtered = lowpass_filter(raw_stable_filtered, 500, fs, 10);
    MUA                 = highpass_filter(raw_stable_filtered, 300, fs, 5);
end

