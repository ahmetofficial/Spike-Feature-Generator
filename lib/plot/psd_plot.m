function [fig] = psd_plot(psd, frequency, parameters, text)
    
	window_size   = parameters.window_size;
    overlap_ratio = parameters.overlap_ratio; 
    nfft          = parameters.nfft;
    
    fig = figure; 
%     subplot(2,1,1);
    plot(frequency, psd,'k'); 
    xlabel('Frequency (Hz)'); ylabel('μV^2/Hz');
    patch([1 4 4 1], [max(ylim) max(ylim) 0 0], 'y', 'FaceAlpha', .25, 'EdgeAlpha', 0);
    patch([4 8 8 4], [max(ylim) max(ylim) 0 0], 'g', 'FaceAlpha', .25, 'EdgeAlpha', 0);
    patch([8 12 12 8], [max(ylim) max(ylim) 0 0], 'c', 'FaceAlpha', .25, 'EdgeAlpha', 0);
    patch([13 30 30 13], [max(ylim) max(ylim) 0 0], 'r', 'FaceAlpha', .25, 'EdgeAlpha', 0);
    patch([30 100 100 30], [max(ylim) max(ylim) 0 0], 'b', 'FaceAlpha', .25, 'EdgeAlpha', 0);
    title(strcat(text, " - PSD ( window size:", string(window_size),...
                 " | overlap:", string(overlap_ratio*100),...
                 "% | nfft :", string(nfft), " )"));     
    xlim([0 100]);

%     subplot(2,1,2); 
%     plot(frequency, power,'k'); 
%     xlabel('Frequency (Hz)'); ylabel('Power(dB/Hz)');
%     patch([1 4 4 1], [max(ylim) max(ylim) min(ylim) min(ylim)], 'y', 'FaceAlpha', .25, 'EdgeAlpha', 0);
%     patch([4 8 8 4], [max(ylim) max(ylim) min(ylim) min(ylim)], 'g', 'FaceAlpha', .25, 'EdgeAlpha', 0);
%     patch([13 30 30 13], [max(ylim) max(ylim) min(ylim) min(ylim)], 'r', 'FaceAlpha', .25, 'EdgeAlpha', 0);
%     patch([30 100 100 30], [max(ylim) max(ylim) min(ylim) min(ylim)], 'b', 'FaceAlpha', .25, 'EdgeAlpha', 0);
%     title(strcat("Power ( window size:", string(window_size),...
%                  " | overlap:", string(overlap_ratio*100),...
%                  "% | nfft :", string(nfft), " )"));     
%     xlim([0 100]);
end

