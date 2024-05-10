function [fig] = data_plot(t, raw, mua, bua, sua)

    colors = ['k', 'b', 'r', 'g', 'm', 'y', 'c'];
    
    fig = figure;
    subplot(4,1,1); plot(t, raw, 'k'); hold on;
    xlabel("time [seconds]"); ylabel("amplitude [μV]"); title("Raw Signal");
    subplot(4,1,2); plot(t, mua, 'b'); hold on;
    xlabel("time [seconds]"); ylabel("amplitude [μV]"); title("SUA & MUA");
    subplot(4,1,3); plot(t, bua, 'r'); hold on;
    xlabel("time [seconds]"); ylabel("amplitude [μV]"); title("Background Activity");
    subplot(4,1,4);
    for i = 1:size(sua,1)
        plot(t, sua(i,:), colors(i)); hold on;
    end
    xlabel("time [seconds]"); ylabel("amplitude [μV]"); title("Spikes");
end

