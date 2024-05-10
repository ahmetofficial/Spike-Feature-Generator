function [oscillations] = spike_train_oscillation(spike_train)

fs            = 1000;
window_size   = 2000;                  % 2 seconds equivalent
window_vector = hamming(window_size);
overlap       = window_size / 2;       % 50% overlap between window

% Calculate PSD using Welch method
[psd, freq]   = pwelch(spike_train, window_vector, overlap, [], fs);
mean_30_70    = mean(psd(freq>=30 & freq<=70));
psd           = psd/mean_30_70;

std_30_70     = std(psd(freq>=30 & freq<=70));
threshold     = mean(psd(freq>=30 & freq<=70)) + 4*std_30_70;

oscillations  = {};

if(max(psd(freq>=4 & freq<=8)) < threshold)
    oscillations.oscillation_frequency_theta = NaN;
else
    [M,theta_index] = max(psd(freq>=4 & freq<=8));
    freq_theta = freq(freq>=4 & freq<=8);
    oscillations.oscillation_frequency_theta = freq_theta(theta_index);
end

if(max(psd(freq>=8 & freq<=13)) < threshold)
    oscillations.oscillation_frequency_alpha = NaN;
else
    [M,alpha_index] = max(psd(freq>=8 & freq<=13));
    freq_alpha = freq(freq>=8 & freq<=13);
    oscillations.oscillation_frequency_alpha = freq_alpha(alpha_index);
end

if(max(psd(freq>=13 & freq<=30)) < threshold)
    oscillations.oscillation_frequency_beta = NaN;
else
    [M,beta_index] = max(psd(freq>=13 & freq<=30));
    freq_beta = freq(freq>=13 & freq<=30);
    oscillations.oscillation_frequency_beta = freq_beta(beta_index);
end

if(max(psd(freq>=30 & freq<=100)) < threshold)
    oscillations.oscillation_frequency_gamma = NaN;
else
    [M,gamma_index] = max(psd(freq>=30 & freq<=100));
    freq_gamma = freq(freq>=30 & freq<=100);
    oscillations.oscillation_frequency_gamma = freq_gamma(gamma_index);
end  

% Plot the power spectral density
% plot(freq, psd);
% xlim([4 100]);
% hold on;
% yline(threshold);
% xlabel('Frequency (Hz)');
% ylabel('Normalized Power [%]');
% title('Power Spectral Density');