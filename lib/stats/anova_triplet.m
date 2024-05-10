function anova_triplet(stats, path)

    %% Firing Rate : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                       
    firing_rate = padcat(stats.level_1.firing_rate, stats.level_2.firing_rate,...
                         stats.level_3.firing_rate, stats.level_4.firing_rate,...
                         stats.level_5.firing_rate)';

    [p_firing_rate, tbl_firing_rate, stats_firing_rate] = anova1(firing_rate);

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
    end
    close all;

    %% Firing Regularity : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    regularity = padcat(stats.level_1.regularity, stats.level_2.regularity,...
                        stats.level_3.regularity, stats.level_4.regularity,...
                        stats.level_5.regularity)';  

    [p_regularity, tbl_regularity, stats_regularity] = anova1(regularity);

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
    end

    close all;

    %% ISI Rho : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    isi_rho = padcat(stats.level_1.isi_rho, stats.level_2.isi_rho,...
                     stats.level_3.isi_rho, stats.level_4.isi_rho,...
                     stats.level_5.isi_rho)';   

    [p_isi_rho, tbl_isi_rho, stats_isi_rho] = anova1(isi_rho);

    if(p_isi_rho < 0.05)
        
        isi_rho_path = strcat(path, "\isi_rho");
        if ~exist(isi_rho_path, 'dir')
            mkdir(isi_rho_path)
        end
        save(strcat(isi_rho_path, "\isi_rho.mat"), "isi_rho");        
        
        writecell(tbl_isi_rho,strcat(isi_rho_path, "\isi_rho_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_isi_rho)));
        title("Firing Regularity");
        xlabel("Level"); ylabel("Regularity Value");
        saveas(gcf, strcat(isi_rho_path, "\isi_rho.png"));
    end

    %% CV : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                        
    cv = padcat(stats.level_1.cv, stats.level_2.cv,...
                stats.level_3.cv, stats.level_4.cv,...
                stats.level_5.cv)';  

    [p_cv, tbl_cv, stats_cv] = anova1(cv);

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
    end

    %% LV : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                       
    lv = padcat(stats.level_1.lv, stats.level_2.lv,...
                stats.level_3.lv, stats.level_4.lv,...
                stats.level_5.lv)';

    [p_lv, tbl_lv, stats_lv] = anova1(lv);

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
    end           

    %% INTRA BURST FREQUENCY : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%                     
    intrabf = padcat(stats.level_1.intrabf, stats.level_2.intrabf,...
                     stats.level_3.intrabf, stats.level_4.intrabf,...
                     stats.level_5.intrabf)'; 

    [p_intrabf, tbl_intrabf, stats_intrabf] = anova1(intrabf);

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
    end

    %% INTER BURST INTERVAL : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                      
    interbi = padcat(stats.level_1.interbi, stats.level_2.interbi,...
                     stats.level_3.interbi, stats.level_4.interbi,...
                     stats.level_5.interbi)';  

    [p_interbi, tbl_interbi, stats_interbi] = anova1(interbi);

    if(p_interbi < 0.05)
        
        interbi_path = strcat(path, "\interbi");
        if ~exist(interbi_path, 'dir')
            mkdir(interbi_path)
        end
        save(strcat(interbi_path, "\interbi.mat"), "interbi");        
        
        writecell(tbl_interbi,strcat(interbi_path, "\interbi_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_interbi)));
        title("Inter Burst Interval");
        xlabel("Level"); ylabel("Time [seconds]");
        saveas(gcf, strcat(interbi_path, "\interbi.png"));
    end      

    %% BURST DURATION : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                         
    intrabi = padcat(stats.level_1.intrabi, stats.level_2.intrabi,...
                     stats.level_3.intrabi, stats.level_4.intrabi,...
                     stats.level_5.intrabi)';  

    [p_intrabi, tbl_intrabi, stats_intrabi] = anova1(intrabi);

    if(p_intrabi < 0.05)
        
        intrabi_path = strcat(path, "\intrabi");
        if ~exist(intrabi_path, 'dir')
            mkdir(intrabi_path)
        end
        save(strcat(intrabi_path, "\intrabi.mat"), "intrabi");        
        
        writecell(tbl_intrabi,strcat(intrabi_path, "\intrabi_results.txt"),'Delimiter','tab');
        annotation('textbox', [0.70, 0.8, 0.1, 0.1], 'String', strcat("p = ", num2str(p_intrabi)));
        title("Burst Duration");
        xlabel("Level"); ylabel("Time [seconds]"); 
        saveas(gcf, strcat(intrabi_path, "\intrabi.png"));
    end

    %% BURST INDEX : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                          
    burst_index = padcat(stats.level_1.burst_index, stats.level_2.burst_index,...
                         stats.level_3.burst_index, stats.level_4.burst_index,...
                         stats.level_5.burst_index)';

    [p_burst_index, tbl_burst_index, stats_burst_index] = anova1(burst_index);

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
    end

    %% BURST AVERAGE SPIKES : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                          
    burst_avg_spikes = padcat(stats.level_1.burst_avg_spikes, stats.level_2.burst_avg_spikes,...
                              stats.level_3.burst_avg_spikes, stats.level_4.burst_avg_spikes,...
                              stats.level_5.burst_avg_spikes)';

    [p_burst_avg_spikes, tbl_burst_avg_spikes, stats_burst_avg_spikes] = anova1(burst_avg_spikes);

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
    end

    %% BURST SPIKES PROPORTIONS : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%                     
    bspike_proportion = padcat(stats.level_1.bspike_proportion, stats.level_2.bspike_proportion,...
                               stats.level_3.bspike_proportion, stats.level_4.bspike_proportion,...
                               stats.level_5.bspike_proportion)'; 

    [p_bspike_proportion, tbl_bspike_proportion, stats_bspike_proportion] = anova1(bspike_proportion);

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
    end

    %% ISI MEAN : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                           
    isi_mean          = padcat(stats.level_1.isi_mean, stats.level_2.isi_mean,...
                               stats.level_3.isi_mean, stats.level_4.isi_mean,...
                               stats.level_5.isi_mean)';

    [p_isi_mean, tbl_isi_mean, stats_isi_mean] = anova1(isi_mean);

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
    end

    %% ISI STD : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                        
    isi_std           = padcat(stats.level_1.isi_std, stats.level_2.isi_std,...
                               stats.level_3.isi_std, stats.level_4.isi_std,...
                               stats.level_5.isi_std)';

    [p_isi_std, tbl_isi_std, stats_isi_std] = anova1(isi_std);

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
    end

    %% ISI SKEWNESS : One-Way Anova Test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                     
    isi_skewness      = padcat(stats.level_1.isi_skewness, stats.level_2.isi_skewness,...
                               stats.level_3.isi_skewness, stats.level_4.isi_skewness,...
                               stats.level_5.isi_skewness)';           

    [p_isi_skewness, tbl_isi_skewness, stats_isi_skewness] = anova1(isi_skewness);

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
    end                      

    close all;
end

