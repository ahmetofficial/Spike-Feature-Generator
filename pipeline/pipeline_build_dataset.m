clc; clear; close all;
warning('off','all');

filelist = dir(fullfile("Dataset", '**\*.*')); 
filelist = filelist(~[filelist.isdir]);  

dataset  = table();

for i = 1 : length(filelist)  
    
    file_name      = filelist(i).name;
    file_name_we   = string(extractBetween(file_name,1,length(file_name)-4)) ; %without extension
    file_path      = strcat(filelist(i).folder);
    file_extension = string(extractBetween(file_name,(length(file_name)-3),length(file_name)));
    
    if(contains(file_name, "STATISTICS") == 1)
        statistic = load(file_path + "\" + file_name);
        statistic = statistic.statistics;
        dataset   = [dataset; statistic];
        disp(file_path);
    end
       
end

save('2. Spike Feature Generator\data\pd_connectivity.mat','dataset');
writetable(dataset,'2. Spike Feature Generator\data\pd_connectivity.csv','Delimiter',',');