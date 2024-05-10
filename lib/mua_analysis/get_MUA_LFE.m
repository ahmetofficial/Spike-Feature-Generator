function MUA_low_freq_envelope = get_MUA_LFE(MUA, fs)
    % Selection of the Optimal Algorithm for Real-Tim Estimation of Beta Band 
    % Power during DBS Surgeries iN Patients with Parkinson's Disease

    % 1. full-wave rectification
    MUA_low_freq_envelope = abs(MUA);     
    % 2. mean extraction
    MUA_low_freq_envelope = MUA_low_freq_envelope - mean(MUA_low_freq_envelope);
    % 3. smoothing to obtain low frequency components
    MUA_low_freq_envelope = lowpass_filter(MUA_low_freq_envelope, 100, fs, 4);
end

