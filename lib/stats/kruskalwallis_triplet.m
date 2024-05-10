function kruskalwallis_triplet(stats, path)

    %% Firing Rate : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                       
    firing_rate = padcat(stats.level_1.firing_rate, stats.level_2.firing_rate,...
                         stats.level_3.firing_rate, stats.level_4.firing_rate,...
                         stats.level_5.firing_rate)';

    [p_firing_rate, tbl_firing_rate, stats_firing_rate] = kruskalwallis(firing_rate);

    if(p_firing_rate < 0.05)
        
        firing_rate_path = strcat(path, "\firing_rate");
        if ~exist(firing_rate_path, 'dir')
            mkdir(firing_rate_path)
        end
        save(strcat(firing_rate_path, "\firing_rate.mat"), "firing_rate");
        
        writecell(tbl_firing_rate,strcat(firing_rate_path, "\firing_rate_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_firing_rate)));
        title("Firing Rate");
        xlabel("Level"); ylabel("Frequency [Hz]");
        saveas(gcf,strcat(firing_rate_path, "\firing rate.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(firing_rate, firing_rate_path);
    end
    close all;

    %% Firing Regularity : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    regularity = padcat(stats.level_1.regularity, stats.level_2.regularity,...
                        stats.level_3.regularity, stats.level_4.regularity,...
                        stats.level_5.regularity)';  

    [p_regularity, tbl_regularity, stats_regularity] = kruskalwallis(regularity);

    if(p_regularity < 0.05)
        
        regularity_path = strcat(path, "\regularity");
        if ~exist(regularity_path, 'dir')
            mkdir(regularity_path)
        end
        save(strcat(regularity_path, "\regularity.mat"), "regularity");   
        
        writecell(tbl_regularity,strcat(regularity_path, "\regularity_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_regularity)));
        title("Firing Regularity");
        xlabel("Level"); ylabel("Regularity Value");
        saveas(gcf, strcat(regularity_path, "\firing_regularity.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(regularity, regularity_path);
    end

    close all;

    %% ISI Rho : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    isi_rho = padcat(stats.level_1.isi_rho, stats.level_2.isi_rho,...
                     stats.level_3.isi_rho, stats.level_4.isi_rho,...
                     stats.level_5.isi_rho)';   

    [p_isi_rho, tbl_isi_rho, stats_isi_rho] = kruskalwallis(isi_rho);

    if(p_isi_rho < 0.05)
        
        isi_rho_path = strcat(path, "\isi_rho");
        if ~exist(isi_rho_path, 'dir')
            mkdir(isi_rho_path)
        end
        save(strcat(isi_rho_path, "\isi_rho.mat"), "isi_rho");        
        
        writecell(tbl_isi_rho,strcat(isi_rho_path, "\isi_rho_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_isi_rho)));
        title("ISI Correlation Coefficient");
        xlabel("Level"); ylabel("ISI Correlation Coefficient");
        saveas(gcf, strcat(isi_rho_path, "\isi_rho.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(isi_rho, isi_rho_path);
    end

    %% CV : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                        
    cv = padcat(stats.level_1.cv, stats.level_2.cv,...
                stats.level_3.cv, stats.level_4.cv,...
                stats.level_5.cv)';  

    [p_cv, tbl_cv, stats_cv] = kruskalwallis(cv);

    if(p_cv < 0.05)
        
        cv_path = strcat(path, "\cv");
        if ~exist(cv_path, 'dir')
            mkdir(cv_path)
        end
        save(strcat(cv_path, "\cv.mat"), "cv");       
        
        writecell(tbl_cv,strcat(cv_path, "\cv.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_cv)));
        title("Coefficient of Variation");
        xlabel("Level");  
        saveas(gcf, strcat(cv_path, "\cv.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(cv, cv_path);
    end

    %% LV : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                       
    lv = padcat(stats.level_1.lv, stats.level_2.lv,...
                stats.level_3.lv, stats.level_4.lv,...
                stats.level_5.lv)';

    [p_lv, tbl_lv, stats_lv] = kruskalwallis(lv);

    if(p_lv < 0.05)
        
        lv_path = strcat(path, "\lv");
        if ~exist(lv_path, 'dir')
            mkdir(lv_path)
        end
        save(strcat(lv_path, "\lv.mat"), "lv");
        
        writecell(tbl_lv,strcat(lv_path, "\lv_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_lv)));
        title("Local Variation");
        xlabel("Level");
        saveas(gcf,strcat(lv_path, "\lv.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(lv, lv_path);
    end           

    %% INTRA BURST FREQUENCY : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%                     
    intrabf = padcat(stats.level_1.intrabf, stats.level_2.intrabf,...
                     stats.level_3.intrabf, stats.level_4.intrabf,...
                     stats.level_5.intrabf)'; 

    [p_intrabf, tbl_intrabf, stats_intrabf] = kruskalwallis(intrabf);

    if(p_intrabf < 0.05)
        
        intrabf_path = strcat(path, "\intrabf");
        if ~exist(intrabf_path, 'dir')
            mkdir(intrabf_path)
        end
        save(strcat(intrabf_path, "\intrabf.mat"), "intrabf");       
        
        writecell(tbl_intrabf,strcat(intrabf_path, "\intrabf_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_intrabf)));
        title("Intra Burst Frequency");
        xlabel("Level"); ylabel("Frequency [Hz]"); 
        saveas(gcf, strcat(intrabf_path, "\intrabf.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(intrabf, intrabf_path);
    end

    %% INTER BURST INTERVAL : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                      
    interbi = padcat(stats.level_1.interbi, stats.level_2.interbi,...
                     stats.level_3.interbi, stats.level_4.interbi,...
                     stats.level_5.interbi)';  

    [p_interbi, tbl_interbi, stats_interbi] = kruskalwallis(interbi);

    if(p_interbi < 0.05)
        
        interbi_path = strcat(path, "\interbi");
        if ~exist(interbi_path, 'dir')
            mkdir(interbi_path)
        end
        save(strcat(interbi_path, "\interbi.mat"), "interbi");        
        
        writecell(tbl_interbi,strcat(interbi_path, "\interbi_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_interbi)));
        title("Inter Burst Interval");
        xlabel("Level"); ylabel("Time [milliseconds]");
        saveas(gcf, strcat(interbi_path, "\interbi.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(interbi, interbi_path);
    end      

    %% BURST DURATION : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                         
    intrabi = padcat(stats.level_1.intrabi, stats.level_2.intrabi,...
                     stats.level_3.intrabi, stats.level_4.intrabi,...
                     stats.level_5.intrabi)';  

    [p_intrabi, tbl_intrabi, stats_intrabi] = kruskalwallis(intrabi);

    if(p_intrabi < 0.05)
        
        intrabi_path = strcat(path, "\intrabi");
        if ~exist(intrabi_path, 'dir')
            mkdir(intrabi_path)
        end
        save(strcat(intrabi_path, "\intrabi.mat"), "intrabi");        
        
        writecell(tbl_intrabi,strcat(intrabi_path, "\intrabi_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_intrabi)));
        title("Burst Duration");
        xlabel("Level"); ylabel("Time [milliseconds]"); 
        saveas(gcf, strcat(intrabi_path, "\intrabi.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(intrabi, intrabi_path);
    end

    %% BURST INDEX : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                          
    burst_index = padcat(stats.level_1.burst_index, stats.level_2.burst_index,...
                         stats.level_3.burst_index, stats.level_4.burst_index,...
                         stats.level_5.burst_index)';

    [p_burst_index, tbl_burst_index, stats_burst_index] = kruskalwallis(burst_index);

    if(p_burst_index < 0.05)
        
        burst_index_path = strcat(path, "\burst_index");
        if ~exist(burst_index_path, 'dir')
            mkdir(burst_index_path)
        end
        save(strcat(burst_index_path, "\burst_index.mat"), "burst_index");        
        
        writecell(tbl_burst_index,strcat(burst_index_path, "\burst_index_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_burst_index)));
        title("Burst Index");
        xlabel("Level");  
        saveas(gcf, strcat(burst_index_path, "\burst_index.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(burst_index, burst_index_path);
    end

    %% BURST AVERAGE SPIKES : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                          
    burst_avg_spikes = padcat(stats.level_1.burst_avg_spikes, stats.level_2.burst_avg_spikes,...
                              stats.level_3.burst_avg_spikes, stats.level_4.burst_avg_spikes,...
                              stats.level_5.burst_avg_spikes)';

    [p_burst_avg_spikes, tbl_burst_avg_spikes, stats_burst_avg_spikes] = kruskalwallis(burst_avg_spikes);

    if(p_burst_avg_spikes < 0.05)
        
        burst_avg_spikes_path = strcat(path, "\burst_avg_spikes");
        if ~exist(burst_avg_spikes_path, 'dir')
            mkdir(burst_avg_spikes_path)
        end
        save(strcat(burst_avg_spikes_path, "\burst_avg_spikes.mat"), "burst_avg_spikes");
        
        writecell(tbl_burst_avg_spikes,strcat(burst_avg_spikes_path, "\burst_avg_spikes_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_burst_avg_spikes)));
        title("Burst Average Spikes");
        xlabel("Level"); ylabel("Count");
        saveas(gcf, strcat(burst_avg_spikes_path, "\burst_avg_spikes.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(burst_avg_spikes, burst_avg_spikes_path);
    end

    %% BURST SPIKES PROPORTIONS : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%                     
    bspike_proportion = padcat(stats.level_1.bspike_proportion, stats.level_2.bspike_proportion,...
                               stats.level_3.bspike_proportion, stats.level_4.bspike_proportion,...
                               stats.level_5.bspike_proportion)'; 

    [p_bspike_proportion, tbl_bspike_proportion, stats_bspike_proportion] = kruskalwallis(bspike_proportion);

    if(p_bspike_proportion < 0.05)
        
        bspike_proportion_path = strcat(path, "\bspike_proportion");
        if ~exist(bspike_proportion_path, 'dir')
            mkdir(bspike_proportion_path)
        end
        save(strcat(bspike_proportion_path, "\bspike_proportion.mat"), "bspike_proportion");       
        
        writecell(tbl_bspike_proportion,strcat(bspike_proportion_path, "\bspike_proportion_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_bspike_proportion)));
        title("Burst Spikes Proportion");
        xlabel("Level"); ylabel("Percentage");
        saveas(gcf, strcat(bspike_proportion_path, "\bspike_proportion.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(bspike_proportion, bspike_proportion_path);
    end

    %% ISI MEAN : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                           
    isi_mean          = padcat(stats.level_1.isi_mean, stats.level_2.isi_mean,...
                               stats.level_3.isi_mean, stats.level_4.isi_mean,...
                               stats.level_5.isi_mean)';

    [p_isi_mean, tbl_isi_mean, stats_isi_mean] = kruskalwallis(isi_mean);

    if(p_isi_mean < 0.05)
        
        isi_mean_path = strcat(path, "\isi_mean");
        if ~exist(isi_mean_path, 'dir')
            mkdir(isi_mean_path)
        end
        save(strcat(isi_mean_path, "\isi_mean.mat"), "isi_mean");       
        
        writecell(tbl_isi_mean,strcat(isi_mean_path, "\isi_mean_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_isi_mean)));
        title("ISI Mean");
        xlabel("Level"); 
        saveas(gcf, strcat(isi_mean_path, "\isi_mean.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(isi_mean, isi_mean_path);
    end

    %% ISI STD : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                        
    isi_std           = padcat(stats.level_1.isi_std, stats.level_2.isi_std,...
                               stats.level_3.isi_std, stats.level_4.isi_std,...
                               stats.level_5.isi_std)';

    [p_isi_std, tbl_isi_std, stats_isi_std] = kruskalwallis(isi_std);

    if(p_isi_std < 0.05)
        
        isi_std_path = strcat(path, "\isi_std");
        if ~exist(isi_std_path, 'dir')
            mkdir(isi_std_path)
        end
        save(strcat(isi_std_path, "\isi_std.mat"), "isi_std");       
        
        writecell(tbl_isi_std,strcat(isi_std_path, "\isi_std_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_isi_std)));
        title("ISI STD");
        xlabel("Level");  
        saveas(gcf, strcat(isi_std_path, "\isi_std.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(isi_std, isi_std_path);
    end

    %% ISI SKEWNESS : Kruskal-Wallis Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                     
    isi_skewness      = padcat(stats.level_1.isi_skewness, stats.level_2.isi_skewness,...
                               stats.level_3.isi_skewness, stats.level_4.isi_skewness,...
                               stats.level_5.isi_skewness)';           

    [p_isi_skewness, tbl_isi_skewness, stats_isi_skewness] = kruskalwallis(isi_skewness);

    if(p_isi_skewness < 0.05)
        
        isi_skewness_path = strcat(path, "\isi_skewness");
        if ~exist(isi_skewness_path, 'dir')
            mkdir(isi_skewness_path)
        end
        save(strcat(isi_skewness_path, "\isi_skewness.mat"), "isi_skewness");       
        
        writecell(tbl_isi_skewness,strcat(isi_skewness_path, "\isi_skewness_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_isi_skewness)));
        title("ISI Skewness");
        xlabel("Level");  
        saveas(gcf, strcat(isi_skewness_path, "\isi_skewness.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(isi_skewness, isi_skewness_path);
    end   
    
    %% OSCILLATION: Delta Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    oscillation_delta_freq      = padcat(stats.level_1.oscillation_delta_freq, stats.level_2.oscillation_delta_freq,...
                               stats.level_3.oscillation_delta_freq, stats.level_4.oscillation_delta_freq,...
                               stats.level_5.oscillation_delta_freq)';           

    [p_oscillation_delta_freq, tbl_oscillation_delta_freq, stats_oscillation_delta_freq] = kruskalwallis(oscillation_delta_freq);

    if(p_oscillation_delta_freq < 0.05)
        
        oscillation_delta_freq_path = strcat(path, "\oscillation_delta_freq");
        if ~exist(oscillation_delta_freq_path, 'dir')
            mkdir(oscillation_delta_freq_path)
        end
        save(strcat(oscillation_delta_freq_path, "\oscillation_delta_freq.mat"), "oscillation_delta_freq");       
        
        writecell(tbl_oscillation_delta_freq,strcat(oscillation_delta_freq_path, "\oscillation_delta_freq_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_delta_freq)));
        title("Neural Oscillations Delta Frequencies");
        xlabel("Level"); ylabel("Frequency [Hz]");
        saveas(gcf, strcat(oscillation_delta_freq_path, "\oscillation_delta_freq.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_delta_freq, oscillation_delta_freq_path);
    end
    
    %% OSCILLATION: Delta Power %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_delta_power      = padcat(stats.level_1.oscillation_delta_power, stats.level_2.oscillation_delta_power,...
                               stats.level_3.oscillation_delta_power, stats.level_4.oscillation_delta_power,...
                               stats.level_5.oscillation_delta_power)';           

    [p_oscillation_delta_power, tbl_oscillation_delta_power, stats_oscillation_delta_power] = kruskalwallis(oscillation_delta_power);

    if(p_oscillation_delta_power < 0.05)
        
        oscillation_delta_power_path = strcat(path, "\oscillation_delta_power");
        if ~exist(oscillation_delta_power_path, 'dir')
            mkdir(oscillation_delta_power_path)
        end
        save(strcat(oscillation_delta_power_path, "\oscillation_delta_power.mat"), "oscillation_delta_power");       
        
        writecell(tbl_oscillation_delta_power,strcat(oscillation_delta_power_path, "\oscillation_delta_power_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_delta_power)));
        title("Neural Oscillations Delta Power");
        xlabel("Level"); ylabel("Normalized Peak Power");
        saveas(gcf, strcat(oscillation_delta_power_path, "\oscillation_delta_power.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_delta_power, oscillation_delta_power_path);
    end
    
    %% OSCILLATION: Theta Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_theta_freq      = padcat(stats.level_1.oscillation_theta_freq, stats.level_2.oscillation_theta_freq,...
                               stats.level_3.oscillation_theta_freq, stats.level_4.oscillation_theta_freq,...
                               stats.level_5.oscillation_theta_freq)';           

    [p_oscillation_theta_freq, tbl_oscillation_theta_freq, stats_oscillation_theta_freq] = kruskalwallis(oscillation_theta_freq);

    if(p_oscillation_theta_freq < 0.05)
        
        oscillation_theta_freq_path = strcat(path, "\oscillation_theta_freq");
        if ~exist(oscillation_theta_freq_path, 'dir')
            mkdir(oscillation_theta_freq_path)
        end
        save(strcat(oscillation_theta_freq_path, "\oscillation_theta_freq.mat"), "oscillation_theta_freq");       
        
        writecell(tbl_oscillation_theta_freq,strcat(oscillation_theta_freq_path, "\oscillation_theta_freq_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_theta_freq)));
        title("Neural Oscillations Theta Frequencies");
        xlabel("Level"); ylabel("Frequency [Hz]");
        saveas(gcf, strcat(oscillation_theta_freq_path, "\oscillation_theta_freq.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_theta_freq, oscillation_theta_freq_path);
    end
    
    %% OSCILLATION: Theta Power %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_theta_power      = padcat(stats.level_1.oscillation_theta_power, stats.level_2.oscillation_theta_power,...
                               stats.level_3.oscillation_theta_power, stats.level_4.oscillation_theta_power,...
                               stats.level_5.oscillation_theta_power)';           

    [p_oscillation_theta_power, tbl_oscillation_theta_power, stats_oscillation_theta_power] = kruskalwallis(oscillation_theta_power);

    if(p_oscillation_theta_power < 0.05)
        
        oscillation_theta_power_path = strcat(path, "\oscillation_theta_power");
        if ~exist(oscillation_theta_power_path, 'dir')
            mkdir(oscillation_theta_power_path)
        end
        save(strcat(oscillation_theta_power_path, "\oscillation_theta_power.mat"), "oscillation_theta_power");       
        
        writecell(tbl_oscillation_theta_power,strcat(oscillation_theta_power_path, "\oscillation_theta_power_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_theta_power)));
        title("Neural Oscillations Theta Power");
        xlabel("Level"); ylabel("Normalized Peak Power");
        saveas(gcf, strcat(oscillation_theta_power_path, "\oscillation_theta_power.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_theta_power, oscillation_theta_power_path);
    end
    
    %% OSCILLATION: Alpha Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_alpha_freq      = padcat(stats.level_1.oscillation_alpha_freq, stats.level_2.oscillation_alpha_freq,...
                               stats.level_3.oscillation_alpha_freq, stats.level_4.oscillation_alpha_freq,...
                               stats.level_5.oscillation_alpha_freq)';           

    [p_oscillation_alpha_freq, tbl_oscillation_alpha_freq, stats_oscillation_alpha_freq] = kruskalwallis(oscillation_alpha_freq);

    if(p_oscillation_alpha_freq < 0.05)
        
        oscillation_alpha_freq_path = strcat(path, "\oscillation_alpha_freq");
        if ~exist(oscillation_alpha_freq_path, 'dir')
            mkdir(oscillation_alpha_freq_path)
        end
        save(strcat(oscillation_alpha_freq_path, "\oscillation_alpha_freq.mat"), "oscillation_alpha_freq");       
        
        writecell(tbl_oscillation_alpha_freq,strcat(oscillation_alpha_freq_path, "\oscillation_alpha_freq_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_alpha_freq)));
        title("Neural Oscillations Alpha Frequencies");
        xlabel("Level"); ylabel("Frequency [Hz]");
        saveas(gcf, strcat(oscillation_alpha_freq_path, "\oscillation_alpha_freq.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_alpha_freq, oscillation_alpha_freq_path);
    end
    
    %% OSCILLATION: Alpha Power %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_alpha_power      = padcat(stats.level_1.oscillation_alpha_power, stats.level_2.oscillation_alpha_power,...
                               stats.level_3.oscillation_alpha_power, stats.level_4.oscillation_alpha_power,...
                               stats.level_5.oscillation_alpha_power)';           

    [p_oscillation_alpha_power, tbl_oscillation_alpha_power, stats_oscillation_alpha_power] = kruskalwallis(oscillation_alpha_power);

    if(p_oscillation_alpha_power < 0.05)
        
        oscillation_alpha_power_path = strcat(path, "\oscillation_alpha_power");
        if ~exist(oscillation_alpha_power_path, 'dir')
            mkdir(oscillation_alpha_power_path)
        end
        save(strcat(oscillation_alpha_power_path, "\oscillation_alpha_power.mat"), "oscillation_alpha_power");       
        
        writecell(tbl_oscillation_alpha_power,strcat(oscillation_alpha_power_path, "\oscillation_alpha_power_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_alpha_power)));
        title("Neural Oscillations Alpha Power");
        xlabel("Level"); ylabel("Normalized Peak Power");
        saveas(gcf, strcat(oscillation_alpha_power_path, "\oscillation_alpha_power.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_alpha_power, oscillation_alpha_power_path);
    end
    
    %% OSCILLATION: Beta Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_beta_freq      = padcat(stats.level_1.oscillation_beta_freq, stats.level_2.oscillation_beta_freq,...
                               stats.level_3.oscillation_beta_freq, stats.level_4.oscillation_beta_freq,...
                               stats.level_5.oscillation_beta_freq)';           

    [p_oscillation_beta_freq, tbl_oscillation_beta_freq, stats_oscillation_beta_freq] = kruskalwallis(oscillation_beta_freq);

    if(p_oscillation_beta_freq < 0.05)
        
        oscillation_beta_freq_path = strcat(path, "\oscillation_beta_freq");
        if ~exist(oscillation_beta_freq_path, 'dir')
            mkdir(oscillation_beta_freq_path)
        end
        save(strcat(oscillation_beta_freq_path, "\oscillation_beta_freq.mat"), "oscillation_beta_freq");       
        
        writecell(tbl_oscillation_beta_freq,strcat(oscillation_beta_freq_path, "\oscillation_beta_freq_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_beta_freq)));
        title("Neural Oscillations Beta Frequencies");
        xlabel("Level");  ylabel("Frequency [Hz]");
        saveas(gcf, strcat(oscillation_beta_freq_path, "\oscillation_beta_freq.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_beta_freq, oscillation_beta_freq_path);
    end
    
    %% OSCILLATION: Beta Power %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_beta_power      = padcat(stats.level_1.oscillation_beta_power, stats.level_2.oscillation_beta_power,...
                               stats.level_3.oscillation_beta_power, stats.level_4.oscillation_beta_power,...
                               stats.level_5.oscillation_beta_power)';           

    [p_oscillation_beta_power, tbl_oscillation_beta_power, stats_oscillation_beta_power] = kruskalwallis(oscillation_beta_power);

    if(p_oscillation_beta_power < 0.05)
        
        oscillation_beta_power_path = strcat(path, "\oscillation_beta_power");
        if ~exist(oscillation_beta_power_path, 'dir')
            mkdir(oscillation_beta_power_path)
        end
        save(strcat(oscillation_beta_power_path, "\oscillation_beta_power.mat"), "oscillation_beta_power");       
        
        writecell(tbl_oscillation_beta_power,strcat(oscillation_beta_power_path, "\oscillation_beta_power_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_beta_power)));
        title("Neural Oscillations Beta Power");
        xlabel("Level"); ylabel("Normalized Peak Power");
        saveas(gcf, strcat(oscillation_beta_power_path, "\oscillation_beta_power.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_beta_power, oscillation_beta_power_path);
    end
    
    %% OSCILLATION: Gamma Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_gamma_freq      = padcat(stats.level_1.oscillation_gamma_freq, stats.level_2.oscillation_gamma_freq,...
                               stats.level_3.oscillation_gamma_freq, stats.level_4.oscillation_gamma_freq,...
                               stats.level_5.oscillation_gamma_freq)';           

    [p_oscillation_gamma_freq, tbl_oscillation_gamma_freq, stats_oscillation_gamma_freq] = kruskalwallis(oscillation_gamma_freq);

    if(p_oscillation_gamma_freq < 0.05)
        
        oscillation_gamma_freq_path = strcat(path, "\oscillation_gamma_freq");
        if ~exist(oscillation_gamma_freq_path, 'dir')
            mkdir(oscillation_gamma_freq_path)
        end
        save(strcat(oscillation_gamma_freq_path, "\oscillation_gamma_freq.mat"), "oscillation_gamma_freq");       
        
        writecell(tbl_oscillation_gamma_freq,strcat(oscillation_gamma_freq_path, "\oscillation_gamma_freq_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_gamma_freq)));
        title("Neural Oscillations Gamma Frequencies");
        xlabel("Level"); ylabel("Frequency [Hz]");
        saveas(gcf, strcat(oscillation_gamma_freq_path, "\oscillation_gamma_freq.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_gamma_freq, oscillation_gamma_freq_path);
    end
    
    %% OSCILLATION: Gamma Power %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    oscillation_gamma_power      = padcat(stats.level_1.oscillation_gamma_power, stats.level_2.oscillation_gamma_power,...
                               stats.level_3.oscillation_gamma_power, stats.level_4.oscillation_gamma_power,...
                               stats.level_5.oscillation_gamma_power)';           

    [p_oscillation_gamma_power, tbl_oscillation_gamma_power, stats_oscillation_gamma_power] = kruskalwallis(oscillation_gamma_power);

    if(p_oscillation_gamma_power < 0.05)
        
        oscillation_gamma_power_path = strcat(path, "\oscillation_gamma_power");
        if ~exist(oscillation_gamma_power_path, 'dir')
            mkdir(oscillation_gamma_power_path)
        end
        save(strcat(oscillation_gamma_power_path, "\oscillation_gamma_power.mat"), "oscillation_gamma_power");       
        
        writecell(tbl_oscillation_gamma_power,strcat(oscillation_gamma_power_path, "\oscillation_gamma_power_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_oscillation_gamma_power)));
        title("Neural Oscillations Gamma Power");
        xlabel("Level");  
        saveas(gcf, strcat(oscillation_gamma_power_path, "\oscillation_gamma_power.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(oscillation_gamma_power, oscillation_gamma_power_path);
    end
    
    %% COHERENCE: Delta Mean Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_delta_mean_coherence      = padcat(stats.level_1.coherence_delta_mean_coherence, stats.level_2.coherence_delta_mean_coherence,...
                               stats.level_3.coherence_delta_mean_coherence, stats.level_4.coherence_delta_mean_coherence,...
                               stats.level_5.coherence_delta_mean_coherence)';           

    [p_coherence_delta_mean_coherence, tbl_coherence_delta_mean_coherence, stats_coherence_delta_mean_coherence] = kruskalwallis(coherence_delta_mean_coherence);

    if(p_coherence_delta_mean_coherence < 0.05)
        
        coherence_delta_mean_coherence_path = strcat(path, "\coherence_delta_mean_coherence");
        if ~exist(coherence_delta_mean_coherence_path, 'dir')
            mkdir(coherence_delta_mean_coherence_path)
        end
        save(strcat(coherence_delta_mean_coherence_path, "\coherence_delta_mean_coherence.mat"), "coherence_delta_mean_coherence");       
        
        writecell(tbl_coherence_delta_mean_coherence,strcat(coherence_delta_mean_coherence_path, "\coherence_delta_mean_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_delta_mean_coherence)));
        title("Delta Band Mean Coherence");
        xlabel("Level"); ylabel("Coherence");  
        saveas(gcf, strcat(coherence_delta_mean_coherence_path, "\coherence_delta_mean_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_delta_mean_coherence, coherence_delta_mean_coherence_path);
    end
    
   %% COHERENCE: Delta Max Peak Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_delta_max_peak_coherence      = padcat(stats.level_1.coherence_delta_max_peak_coherence, stats.level_2.coherence_delta_max_peak_coherence,...
                               stats.level_3.coherence_delta_max_peak_coherence, stats.level_4.coherence_delta_max_peak_coherence,...
                               stats.level_5.coherence_delta_max_peak_coherence)';           

    [p_coherence_delta_max_peak_coherence, tbl_coherence_delta_max_peak_coherence, stats_coherence_delta_max_peak_coherence] = kruskalwallis(coherence_delta_max_peak_coherence);

    if(p_coherence_delta_max_peak_coherence < 0.05)
        
        coherence_delta_max_peak_coherence_path = strcat(path, "\coherence_delta_max_peak_coherence");
        if ~exist(coherence_delta_max_peak_coherence_path, 'dir')
            mkdir(coherence_delta_max_peak_coherence_path)
        end
        save(strcat(coherence_delta_max_peak_coherence_path, "\coherence_delta_max_peak_coherence.mat"), "coherence_delta_max_peak_coherence");       
        
        writecell(tbl_coherence_delta_max_peak_coherence,strcat(coherence_delta_max_peak_coherence_path, "\coherence_delta_max_peak_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_delta_max_peak_coherence)));
        title("Delta Band Peak Coherence");
        xlabel("Level"); ylabel("Coherence"); 
        saveas(gcf, strcat(coherence_delta_max_peak_coherence_path, "\coherence_delta_max_peak_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_delta_max_peak_coherence, coherence_delta_max_peak_coherence_path);
    end
    
    %% COHERENCE: Delta Max Peak Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_delta_max_peak_frequency      = padcat(stats.level_1.coherence_delta_max_peak_frequency, stats.level_2.coherence_delta_max_peak_frequency,...
                               stats.level_3.coherence_delta_max_peak_frequency, stats.level_4.coherence_delta_max_peak_frequency,...
                               stats.level_5.coherence_delta_max_peak_frequency)';           

    [p_coherence_delta_max_peak_frequency, tbl_coherence_delta_max_peak_frequency, stats_coherence_delta_max_peak_frequency] = kruskalwallis(coherence_delta_max_peak_frequency);

    if(p_coherence_delta_max_peak_frequency < 0.05)
        
        coherence_delta_max_peak_frequency_path = strcat(path, "\coherence_delta_max_peak_frequency");
        if ~exist(coherence_delta_max_peak_frequency_path, 'dir')
            mkdir(coherence_delta_max_peak_frequency_path)
        end
        save(strcat(coherence_delta_max_peak_frequency_path, "\coherence_delta_max_peak_frequency.mat"), "coherence_delta_max_peak_frequency");       
        
        writecell(tbl_coherence_delta_max_peak_frequency,strcat(coherence_delta_max_peak_frequency_path, "\coherence_delta_max_peak_frequency_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_delta_max_peak_frequency)));
        title("Delta Band Peak Coherence Frequnecy");
        xlabel("Level"); ylabel("Frequency [Hz]"); 
        saveas(gcf, strcat(coherence_delta_max_peak_frequency_path, "\coherence_delta_max_peak_frequency.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_delta_max_peak_frequency, coherence_delta_max_peak_frequency_path);
    end
       
    %% COHERENCE: Theta Mean Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_theta_mean_coherence      = padcat(stats.level_1.coherence_theta_mean_coherence, stats.level_2.coherence_theta_mean_coherence,...
                               stats.level_3.coherence_theta_mean_coherence, stats.level_4.coherence_theta_mean_coherence,...
                               stats.level_5.coherence_theta_mean_coherence)';           

    [p_coherence_theta_mean_coherence, tbl_coherence_theta_mean_coherence, stats_coherence_theta_mean_coherence] = kruskalwallis(coherence_theta_mean_coherence);

    if(p_coherence_theta_mean_coherence < 0.05)
        
        coherence_theta_mean_coherence_path = strcat(path, "\coherence_theta_mean_coherence");
        if ~exist(coherence_theta_mean_coherence_path, 'dir')
            mkdir(coherence_theta_mean_coherence_path)
        end
        save(strcat(coherence_theta_mean_coherence_path, "\coherence_theta_mean_coherence.mat"), "coherence_theta_mean_coherence");       
        
        writecell(tbl_coherence_theta_mean_coherence,strcat(coherence_theta_mean_coherence_path, "\coherence_theta_mean_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_theta_mean_coherence)));
        title("Theta Band Mean Coherence");
        xlabel("Level"); ylabel("Coherence");  
        saveas(gcf, strcat(coherence_theta_mean_coherence_path, "\coherence_theta_mean_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_theta_mean_coherence, coherence_theta_mean_coherence_path);
    end
    
    %% COHERENCE: Theta Max Peak Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_theta_max_peak_coherence      = padcat(stats.level_1.coherence_theta_max_peak_coherence, stats.level_2.coherence_theta_max_peak_coherence,...
                               stats.level_3.coherence_theta_max_peak_coherence, stats.level_4.coherence_theta_max_peak_coherence,...
                               stats.level_5.coherence_theta_max_peak_coherence)';           

    [p_coherence_theta_max_peak_coherence, tbl_coherence_theta_max_peak_coherence, stats_coherence_theta_max_peak_coherence] = kruskalwallis(coherence_theta_max_peak_coherence);

    if(p_coherence_theta_max_peak_coherence < 0.05)
        
        coherence_theta_max_peak_coherence_path = strcat(path, "\coherence_theta_max_peak_coherence");
        if ~exist(coherence_theta_max_peak_coherence_path, 'dir')
            mkdir(coherence_theta_max_peak_coherence_path)
        end
        save(strcat(coherence_theta_max_peak_coherence_path, "\coherence_theta_max_peak_coherence.mat"), "coherence_theta_max_peak_coherence");       
        
        writecell(tbl_coherence_theta_max_peak_coherence,strcat(coherence_theta_max_peak_coherence_path, "\coherence_theta_max_peak_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_theta_max_peak_coherence)));
        title("Theta Band Peak Coherence");
        xlabel("Level"); ylabel("Coherence"); 
        saveas(gcf, strcat(coherence_theta_max_peak_coherence_path, "\coherence_theta_max_peak_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_theta_max_peak_coherence, coherence_theta_max_peak_coherence_path);
    end
    
    %% COHERENCE: Theta Max Peak Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_theta_max_peak_frequency      = padcat(stats.level_1.coherence_theta_max_peak_frequency, stats.level_2.coherence_theta_max_peak_frequency,...
                               stats.level_3.coherence_theta_max_peak_frequency, stats.level_4.coherence_theta_max_peak_frequency,...
                               stats.level_5.coherence_theta_max_peak_frequency)';           

    [p_coherence_theta_max_peak_frequency, tbl_coherence_theta_max_peak_frequency, stats_coherence_theta_max_peak_frequency] = kruskalwallis(coherence_theta_max_peak_frequency);

    if(p_coherence_theta_max_peak_frequency < 0.05)
        
        coherence_theta_max_peak_frequency_path = strcat(path, "\coherence_theta_max_peak_frequency");
        if ~exist(coherence_theta_max_peak_frequency_path, 'dir')
            mkdir(coherence_theta_max_peak_frequency_path)
        end
        save(strcat(coherence_theta_max_peak_frequency_path, "\coherence_theta_max_peak_frequency.mat"), "coherence_theta_max_peak_frequency");       
        
        writecell(tbl_coherence_theta_max_peak_frequency,strcat(coherence_theta_max_peak_frequency_path, "\coherence_theta_max_peak_frequency_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_theta_max_peak_frequency)));
        title("Theta Band Peak Coherence Frequnecy");
        xlabel("Level"); ylabel("Frequency [Hz]"); 
        saveas(gcf, strcat(coherence_theta_max_peak_frequency_path, "\coherence_theta_max_peak_frequency.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_theta_max_peak_frequency, coherence_theta_max_peak_frequency_path);
    end
    
    %% COHERENCE: Alpha Mean Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_alpha_mean_coherence      = padcat(stats.level_1.coherence_alpha_mean_coherence, stats.level_2.coherence_alpha_mean_coherence,...
                               stats.level_3.coherence_alpha_mean_coherence, stats.level_4.coherence_alpha_mean_coherence,...
                               stats.level_5.coherence_alpha_mean_coherence)';           

    [p_coherence_alpha_mean_coherence, tbl_coherence_alpha_mean_coherence, stats_coherence_alpha_mean_coherence] = kruskalwallis(coherence_alpha_mean_coherence);

    if(p_coherence_alpha_mean_coherence < 0.05)
        
        coherence_alpha_mean_coherence_path = strcat(path, "\coherence_alpha_mean_coherence");
        if ~exist(coherence_alpha_mean_coherence_path, 'dir')
            mkdir(coherence_alpha_mean_coherence_path)
        end
        save(strcat(coherence_alpha_mean_coherence_path, "\coherence_alpha_mean_coherence.mat"), "coherence_alpha_mean_coherence");       
        
        writecell(tbl_coherence_alpha_mean_coherence,strcat(coherence_alpha_mean_coherence_path, "\coherence_alpha_mean_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_alpha_mean_coherence)));
        title("Alpha Band Mean Coherence");
        xlabel("Level"); ylabel("Coherence");  
        saveas(gcf, strcat(coherence_alpha_mean_coherence_path, "\coherence_alpha_mean_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_alpha_mean_coherence, coherence_alpha_mean_coherence_path);
    end
    
    %% COHERENCE: Alpha Max Peak Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_alpha_max_peak_coherence      = padcat(stats.level_1.coherence_alpha_max_peak_coherence, stats.level_2.coherence_alpha_max_peak_coherence,...
                               stats.level_3.coherence_alpha_max_peak_coherence, stats.level_4.coherence_alpha_max_peak_coherence,...
                               stats.level_5.coherence_alpha_max_peak_coherence)';           

    [p_coherence_alpha_max_peak_coherence, tbl_coherence_alpha_max_peak_coherence, stats_coherence_alpha_max_peak_coherence] = kruskalwallis(coherence_alpha_max_peak_coherence);

    if(p_coherence_alpha_max_peak_coherence < 0.05)
        
        coherence_alpha_max_peak_coherence_path = strcat(path, "\coherence_alpha_max_peak_coherence");
        if ~exist(coherence_alpha_max_peak_coherence_path, 'dir')
            mkdir(coherence_alpha_max_peak_coherence_path)
        end
        save(strcat(coherence_alpha_max_peak_coherence_path, "\coherence_alpha_max_peak_coherence.mat"), "coherence_alpha_max_peak_coherence");       
        
        writecell(tbl_coherence_alpha_max_peak_coherence,strcat(coherence_alpha_max_peak_coherence_path, "\coherence_alpha_max_peak_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_alpha_max_peak_coherence)));
        title("Alpha Band Peak Coherence");
        xlabel("Level"); ylabel("Coherence"); 
        saveas(gcf, strcat(coherence_alpha_max_peak_coherence_path, "\coherence_alpha_max_peak_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_alpha_max_peak_coherence, coherence_alpha_max_peak_coherence_path);
    end
    
    %% COHERENCE: Alpha Max Peak Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_alpha_max_peak_frequency      = padcat(stats.level_1.coherence_alpha_max_peak_frequency, stats.level_2.coherence_alpha_max_peak_frequency,...
                               stats.level_3.coherence_alpha_max_peak_frequency, stats.level_4.coherence_alpha_max_peak_frequency,...
                               stats.level_5.coherence_alpha_max_peak_frequency)';           

    [p_coherence_alpha_max_peak_frequency, tbl_coherence_alpha_max_peak_frequency, stats_coherence_alpha_max_peak_frequency] = kruskalwallis(coherence_alpha_max_peak_frequency);

    if(p_coherence_alpha_max_peak_frequency < 0.05)
        
        coherence_alpha_max_peak_frequency_path = strcat(path, "\coherence_alpha_max_peak_frequency");
        if ~exist(coherence_alpha_max_peak_frequency_path, 'dir')
            mkdir(coherence_alpha_max_peak_frequency_path)
        end
        save(strcat(coherence_alpha_max_peak_frequency_path, "\coherence_alpha_max_peak_frequency.mat"), "coherence_alpha_max_peak_frequency");       
        
        writecell(tbl_coherence_alpha_max_peak_frequency,strcat(coherence_alpha_max_peak_frequency_path, "\coherence_alpha_max_peak_frequency_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_alpha_max_peak_frequency)));
        title("Alpha Band Peak Coherence Frequnecy");
        xlabel("Level"); ylabel("Frequency [Hz]"); 
        saveas(gcf, strcat(coherence_alpha_max_peak_frequency_path, "\coherence_alpha_max_peak_frequency.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_alpha_max_peak_frequency, coherence_alpha_max_peak_frequency_path);
    end
       
    %% COHERENCE: Beta Mean Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_beta_mean_coherence      = padcat(stats.level_1.coherence_beta_mean_coherence, stats.level_2.coherence_beta_mean_coherence,...
                               stats.level_3.coherence_beta_mean_coherence, stats.level_4.coherence_beta_mean_coherence,...
                               stats.level_5.coherence_beta_mean_coherence)';           

    [p_coherence_beta_mean_coherence, tbl_coherence_beta_mean_coherence, stats_coherence_beta_mean_coherence] = kruskalwallis(coherence_beta_mean_coherence);

    if(p_coherence_beta_mean_coherence < 0.05)
        
        coherence_beta_mean_coherence_path = strcat(path, "\coherence_beta_mean_coherence");
        if ~exist(coherence_beta_mean_coherence_path, 'dir')
            mkdir(coherence_beta_mean_coherence_path)
        end
        save(strcat(coherence_beta_mean_coherence_path, "\coherence_beta_mean_coherence.mat"), "coherence_beta_mean_coherence");       
        
        writecell(tbl_coherence_beta_mean_coherence,strcat(coherence_beta_mean_coherence_path, "\coherence_beta_mean_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_beta_mean_coherence)));
        title("Beta Band Mean Coherence");
        xlabel("Level"); ylabel("Coherence");  
        saveas(gcf, strcat(coherence_beta_mean_coherence_path, "\coherence_beta_mean_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_beta_mean_coherence, coherence_beta_mean_coherence_path);
    end
    
    %% COHERENCE: Beta Max Peak Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_beta_max_peak_coherence      = padcat(stats.level_1.coherence_beta_max_peak_coherence, stats.level_2.coherence_beta_max_peak_coherence,...
                               stats.level_3.coherence_beta_max_peak_coherence, stats.level_4.coherence_beta_max_peak_coherence,...
                               stats.level_5.coherence_beta_max_peak_coherence)';           

    [p_coherence_beta_max_peak_coherence, tbl_coherence_beta_max_peak_coherence, stats_coherence_beta_max_peak_coherence] = kruskalwallis(coherence_beta_max_peak_coherence);

    if(p_coherence_beta_max_peak_coherence < 0.05)
        
        coherence_beta_max_peak_coherence_path = strcat(path, "\coherence_beta_max_peak_coherence");
        if ~exist(coherence_beta_max_peak_coherence_path, 'dir')
            mkdir(coherence_beta_max_peak_coherence_path)
        end
        save(strcat(coherence_beta_max_peak_coherence_path, "\coherence_beta_max_peak_coherence.mat"), "coherence_beta_max_peak_coherence");       
        
        writecell(tbl_coherence_beta_max_peak_coherence,strcat(coherence_beta_max_peak_coherence_path, "\coherence_beta_max_peak_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_beta_max_peak_coherence)));
        title("Beta Band Peak Coherence");
        xlabel("Level"); ylabel("Coherence"); 
        saveas(gcf, strcat(coherence_beta_max_peak_coherence_path, "\coherence_beta_max_peak_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_beta_max_peak_coherence, coherence_beta_max_peak_coherence_path);
    end
    
    %% COHERENCE: Beta Max Peak Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_beta_max_peak_frequency      = padcat(stats.level_1.coherence_beta_max_peak_frequency, stats.level_2.coherence_beta_max_peak_frequency,...
                               stats.level_3.coherence_beta_max_peak_frequency, stats.level_4.coherence_beta_max_peak_frequency,...
                               stats.level_5.coherence_beta_max_peak_frequency)';           

    [p_coherence_beta_max_peak_frequency, tbl_coherence_beta_max_peak_frequency, stats_coherence_beta_max_peak_frequency] = kruskalwallis(coherence_beta_max_peak_frequency);

    if(p_coherence_beta_max_peak_frequency < 0.05)
        
        coherence_beta_max_peak_frequency_path = strcat(path, "\coherence_beta_max_peak_frequency");
        if ~exist(coherence_beta_max_peak_frequency_path, 'dir')
            mkdir(coherence_beta_max_peak_frequency_path)
        end
        save(strcat(coherence_beta_max_peak_frequency_path, "\coherence_beta_max_peak_frequency.mat"), "coherence_beta_max_peak_frequency");       
        
        writecell(tbl_coherence_beta_max_peak_frequency,strcat(coherence_beta_max_peak_frequency_path, "\coherence_beta_max_peak_frequency_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_beta_max_peak_frequency)));
        title("Beta Band Peak Coherence Frequnecy");
        xlabel("Level"); ylabel("Frequency [Hz]"); 
        saveas(gcf, strcat(coherence_beta_max_peak_frequency_path, "\coherence_beta_max_peak_frequency.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_beta_max_peak_frequency, coherence_beta_max_peak_frequency_path);
    end
    
    %% COHERENCE: Beta Mean Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_gamma_mean_coherence      = padcat(stats.level_1.coherence_gamma_mean_coherence, stats.level_2.coherence_gamma_mean_coherence,...
                               stats.level_3.coherence_gamma_mean_coherence, stats.level_4.coherence_gamma_mean_coherence,...
                               stats.level_5.coherence_gamma_mean_coherence)';           

    [p_coherence_gamma_mean_coherence, tbl_coherence_gamma_mean_coherence, stats_coherence_gamma_mean_coherence] = kruskalwallis(coherence_gamma_mean_coherence);

    if(p_coherence_gamma_mean_coherence < 0.05)
        
        coherence_gamma_mean_coherence_path = strcat(path, "\coherence_gamma_mean_coherence");
        if ~exist(coherence_gamma_mean_coherence_path, 'dir')
            mkdir(coherence_gamma_mean_coherence_path)
        end
        save(strcat(coherence_gamma_mean_coherence_path, "\coherence_gamma_mean_coherence.mat"), "coherence_gamma_mean_coherence");       
        
        writecell(tbl_coherence_gamma_mean_coherence,strcat(coherence_gamma_mean_coherence_path, "\coherence_gamma_mean_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_gamma_mean_coherence)));
        title("Beta Band Mean Coherence");
        xlabel("Level"); ylabel("Coherence");  
        saveas(gcf, strcat(coherence_gamma_mean_coherence_path, "\coherence_gamma_mean_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_gamma_mean_coherence, coherence_gamma_mean_coherence_path);
    end
    
    %% COHERENCE: Beta Max Peak Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_gamma_max_peak_coherence      = padcat(stats.level_1.coherence_gamma_max_peak_coherence, stats.level_2.coherence_gamma_max_peak_coherence,...
                               stats.level_3.coherence_gamma_max_peak_coherence, stats.level_4.coherence_gamma_max_peak_coherence,...
                               stats.level_5.coherence_gamma_max_peak_coherence)';           

    [p_coherence_gamma_max_peak_coherence, tbl_coherence_gamma_max_peak_coherence, stats_coherence_gamma_max_peak_coherence] = kruskalwallis(coherence_gamma_max_peak_coherence);

    if(p_coherence_gamma_max_peak_coherence < 0.05)
        
        coherence_gamma_max_peak_coherence_path = strcat(path, "\coherence_gamma_max_peak_coherence");
        if ~exist(coherence_gamma_max_peak_coherence_path, 'dir')
            mkdir(coherence_gamma_max_peak_coherence_path)
        end
        save(strcat(coherence_gamma_max_peak_coherence_path, "\coherence_gamma_max_peak_coherence.mat"), "coherence_gamma_max_peak_coherence");       
        
        writecell(tbl_coherence_gamma_max_peak_coherence,strcat(coherence_gamma_max_peak_coherence_path, "\coherence_gamma_max_peak_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_gamma_max_peak_coherence)));
        title("Beta Band Peak Coherence");
        xlabel("Level"); ylabel("Coherence"); 
        saveas(gcf, strcat(coherence_gamma_max_peak_coherence_path, "\coherence_gamma_max_peak_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_gamma_max_peak_coherence, coherence_gamma_max_peak_coherence_path);
    end
    
    %% COHERENCE: Beta Max Peak Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_gamma_max_peak_frequency      = padcat(stats.level_1.coherence_gamma_max_peak_frequency, stats.level_2.coherence_gamma_max_peak_frequency,...
                               stats.level_3.coherence_gamma_max_peak_frequency, stats.level_4.coherence_gamma_max_peak_frequency,...
                               stats.level_5.coherence_gamma_max_peak_frequency)';           

    [p_coherence_gamma_max_peak_frequency, tbl_coherence_gamma_max_peak_frequency, stats_coherence_gamma_max_peak_frequency] = kruskalwallis(coherence_gamma_max_peak_frequency);

    if(p_coherence_gamma_max_peak_frequency < 0.05)
        
        coherence_gamma_max_peak_frequency_path = strcat(path, "\coherence_gamma_max_peak_frequency");
        if ~exist(coherence_gamma_max_peak_frequency_path, 'dir')
            mkdir(coherence_gamma_max_peak_frequency_path)
        end
        save(strcat(coherence_gamma_max_peak_frequency_path, "\coherence_gamma_max_peak_frequency.mat"), "coherence_gamma_max_peak_frequency");       
        
        writecell(tbl_coherence_gamma_max_peak_frequency,strcat(coherence_gamma_max_peak_frequency_path, "\coherence_gamma_max_peak_frequency_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_gamma_max_peak_frequency)));
        title("Beta Band Peak Coherence Frequnecy");
        xlabel("Level"); ylabel("Frequency [Hz]"); 
        saveas(gcf, strcat(coherence_gamma_max_peak_frequency_path, "\coherence_gamma_max_peak_frequency.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_gamma_max_peak_frequency, coherence_gamma_max_peak_frequency_path);
    end
    
    %% COHERENCE: Gamma Mean Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_gamma_mean_coherence      = padcat(stats.level_1.coherence_gamma_mean_coherence, stats.level_2.coherence_gamma_mean_coherence,...
                               stats.level_3.coherence_gamma_mean_coherence, stats.level_4.coherence_gamma_mean_coherence,...
                               stats.level_5.coherence_gamma_mean_coherence)';           

    [p_coherence_gamma_mean_coherence, tbl_coherence_gamma_mean_coherence, stats_coherence_gamma_mean_coherence] = kruskalwallis(coherence_gamma_mean_coherence);

    if(p_coherence_gamma_mean_coherence < 0.05)
        
        coherence_gamma_mean_coherence_path = strcat(path, "\coherence_gamma_mean_coherence");
        if ~exist(coherence_gamma_mean_coherence_path, 'dir')
            mkdir(coherence_gamma_mean_coherence_path)
        end
        save(strcat(coherence_gamma_mean_coherence_path, "\coherence_gamma_mean_coherence.mat"), "coherence_gamma_mean_coherence");       
        
        writecell(tbl_coherence_gamma_mean_coherence,strcat(coherence_gamma_mean_coherence_path, "\coherence_gamma_mean_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_gamma_mean_coherence)));
        title("Gamma Band Mean Coherence");
        xlabel("Level"); ylabel("Coherence");  
        saveas(gcf, strcat(coherence_gamma_mean_coherence_path, "\coherence_gamma_mean_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_gamma_mean_coherence, coherence_gamma_mean_coherence_path);
    end

    %% COHERENCE: Gamma Max Peak Coherence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_gamma_max_peak_coherence      = padcat(stats.level_1.coherence_gamma_max_peak_coherence, stats.level_2.coherence_gamma_max_peak_coherence,...
                               stats.level_3.coherence_gamma_max_peak_coherence, stats.level_4.coherence_gamma_max_peak_coherence,...
                               stats.level_5.coherence_gamma_max_peak_coherence)';           

    [p_coherence_gamma_max_peak_coherence, tbl_coherence_gamma_max_peak_coherence, stats_coherence_gamma_max_peak_coherence] = kruskalwallis(coherence_gamma_max_peak_coherence);

    if(p_coherence_gamma_max_peak_coherence < 0.05)
        
        coherence_gamma_max_peak_coherence_path = strcat(path, "\coherence_gamma_max_peak_coherence");
        if ~exist(coherence_gamma_max_peak_coherence_path, 'dir')
            mkdir(coherence_gamma_max_peak_coherence_path)
        end
        save(strcat(coherence_gamma_max_peak_coherence_path, "\coherence_gamma_max_peak_coherence.mat"), "coherence_gamma_max_peak_coherence");       
        
        writecell(tbl_coherence_gamma_max_peak_coherence,strcat(coherence_gamma_max_peak_coherence_path, "\coherence_gamma_max_peak_coherence_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_gamma_max_peak_coherence)));
        title("Gamma Band Peak Coherence");
        xlabel("Level"); ylabel("Coherence"); 
        saveas(gcf, strcat(coherence_gamma_max_peak_coherence_path, "\coherence_gamma_max_peak_coherence.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_gamma_max_peak_coherence, coherence_gamma_max_peak_coherence_path);
    end
    
    %% COHERENCE: Gamma Max Peak Frequency %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coherence_gamma_max_peak_frequency      = padcat(stats.level_1.coherence_gamma_max_peak_frequency, stats.level_2.coherence_gamma_max_peak_frequency,...
                               stats.level_3.coherence_gamma_max_peak_frequency, stats.level_4.coherence_gamma_max_peak_frequency,...
                               stats.level_5.coherence_gamma_max_peak_frequency)';           

    [p_coherence_gamma_max_peak_frequency, tbl_coherence_gamma_max_peak_frequency, stats_coherence_gamma_max_peak_frequency] = kruskalwallis(coherence_gamma_max_peak_frequency);

    if(p_coherence_gamma_max_peak_frequency < 0.05)
        
        coherence_gamma_max_peak_frequency_path = strcat(path, "\coherence_gamma_max_peak_frequency");
        if ~exist(coherence_gamma_max_peak_frequency_path, 'dir')
            mkdir(coherence_gamma_max_peak_frequency_path)
        end
        save(strcat(coherence_gamma_max_peak_frequency_path, "\coherence_gamma_max_peak_frequency.mat"), "coherence_gamma_max_peak_frequency");       
        
        writecell(tbl_coherence_gamma_max_peak_frequency,strcat(coherence_gamma_max_peak_frequency_path, "\coherence_gamma_max_peak_frequency_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_coherence_gamma_max_peak_frequency)));
        title("Gamma Band Peak Coherence Frequnecy");
        xlabel("Level"); ylabel("Frequency [Hz]"); 
        saveas(gcf, strcat(coherence_gamma_max_peak_frequency_path, "\coherence_gamma_max_peak_frequency.png"));
        
        % apply Wilcoxon Rank-Sum Test
        wilcoxon_rank_sum(coherence_gamma_max_peak_frequency, coherence_gamma_max_peak_frequency_path);
    end
    
    close all;
end

