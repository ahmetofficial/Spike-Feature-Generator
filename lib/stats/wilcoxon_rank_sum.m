function wilcoxon_rank_sum(biomarker, path)
    
    close all;
    
    b_size      = size(biomarker);
    group_count = b_size(2);

    % the matrix denotes statistical difference
    diff_matrix = zeros(group_count, group_count);
    p_values    = zeros(group_count, group_count);

    for i = 1 : group_count
        for j = 1 : group_count
            group_i     = biomarker(:,i);
            group_j     = biomarker(:,j);
            
            % check if both groups only contains NaN
            if(sum(isnan(group_i))==length(group_i) || sum(isnan(group_j))==length(group_j))
                p_value     = 1;
                h           = 0;
            else
                [p_value,h] = ranksum(group_i, group_j, 'alpha', 0.05);
            end

            diff_matrix(i,j) = h;
            p_values(i,j)    = p_value;
        end
    end

    writematrix(diff_matrix, strcat(path, '\wilcoxon_hypothesis.txt'),'Delimiter','tab');
    writematrix(p_values, strcat(path, '\wilcoxon_pvalues.txt'),'Delimiter','tab');
    
    % -------------------------------------------------------------------------
    % PLOTTING ----------------------------------------------------------------
    % -------------------------------------------------------------------------

    if(group_count == 5)
        labels = {'Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5'};
    elseif(group_count == 7)
        labels = {'Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5', 'Level 6', 'Level 7'};
    end

    % first plot --------------------------------------------------------------

    ax(1) = subplot(1,2,1); 
    imagesc(diff_matrix);
    title("Hypothesis Test Results");

    hold on;
    end_line = group_count + 0.5;
    for i = 1:group_count
       plot([.5,end_line],[i-.5,i-.5],'k-');
       plot([i-.5,i-.5],[.5,end_line],'k-');
    end

    xtickangle(45)
    axis image %
    axis ij
    set(gca,'Xtick', 1:group_count, 'XTickLabel', labels,...
            'Ytick',1:group_count,'YTickLabel',labels);

    % color map
    hsv = [.6 1 1; .6 .7 1; .6 .5 1; .6 .3 1; .6 0 1]; 
    colormap(hsv2rgb(hsv));
    c = colorbar;
    c.Location = 'southoutside';
    c.Ticks = [0 1];
    c.TickLabels = {'similar','different'};

    % second plot --------------------------------------------------------------

    ax(2) = subplot(1,2,2);

    imagesc(p_values);
    title("P-Values");

    xtickangle(45)
    axis image %
    axis ij
    set(gca,'Xtick', 1:group_count, 'XTickLabel', labels,...
            'Ytick',1:group_count,'YTickLabel',labels);

    c = parula;
    % c = flipud(c);
    colormap(ax(2),c)
    c = colorbar;
    c.Location = 'southoutside';
    
    saveas(gcf,strcat(path, "\wilcoxon rank-sum.png"));
   
end

