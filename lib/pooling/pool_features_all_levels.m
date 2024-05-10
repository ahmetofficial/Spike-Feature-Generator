%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function returns the all previously calculated firing characteristic
% features from the correspoinding file set.
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% INPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% paths : array of paths of firing characteristics statistic .mat files
% files : the name of the files
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% OUTPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% stats : a struct that contains level-wise firing characteristics 
%
function [levels] = pool_features_all_levels(paths, files)

    level_p35 = generate_levels();
    level_p3  = generate_levels();
    level_p25 = generate_levels();
    level_p2  = generate_levels();
    level_p15 = generate_levels();
    level_p1  = generate_levels();
    level_p05 = generate_levels();
    level_p0  = generate_levels();
    level_n05 = generate_levels();
    level_n1  = generate_levels();
    level_n15 = generate_levels();
    level_n2  = generate_levels();
    level_n25 = generate_levels();
    level_n3  = generate_levels();
    level_n35 = generate_levels();
    level_n4  = generate_levels();
    level_n45 = generate_levels();
    level_n5  = generate_levels();
    level_n55 = generate_levels();
    level_n6  = generate_levels();
    level_n65 = generate_levels();
    level_n7  = generate_levels();
    level_n75 = generate_levels();
    level_n8  = generate_levels();
    level_n85 = generate_levels();
    level_n9  = generate_levels();
    level_n95 = generate_levels();
    level_n10 = generate_levels();
    
    pid_p35 = []; pid_p3 = []; pid_p25 = []; pid_p2 = []; pid_p15 = []; pid_p1 = []; 
    pid_p05 = []; pid_p0 = []; pid_n05 = []; pid_n1 = []; pid_n15 = []; pid_n2 = []; 
    pid_n25 = []; pid_n3 = []; pid_n35 = []; pid_n4 = []; pid_n45 = []; pid_n5 = [];
    pid_n55 = []; pid_n6 = []; pid_n65 = []; pid_n7 = []; pid_n75 = []; pid_n8 = []; 
    pid_n85 = []; pid_n9 = []; pid_n95 = []; pid_n10= [];
    
    
    for index = 1 : length(paths)

        if(contains(paths(index), "+3.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_p35 = populate_firing_characteristics(level_p35, neuron_stats);
                level_p35 = populate_bursting(level_p35, neuron_stats);
                level_p35 = populate_oscillation(level_p35, neuron_stats);
                level_p35 = populate_coherence(level_p35, coherence_stats);
                pid_p35(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "+3"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_p3 = populate_firing_characteristics(level_p3, neuron_stats);
                level_p3 = populate_bursting(level_p3, neuron_stats);
                level_p3 = populate_oscillation(level_p3, neuron_stats);
                level_p3 = populate_coherence(level_p3, coherence_stats);
                pid_p3(end+1) = neuron_stats.patient_id;
                
            end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
        
        elseif(contains(paths(index), "+2.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_p25 = populate_firing_characteristics(level_p25, neuron_stats);
                level_p25 = populate_bursting(level_p25, neuron_stats);
                level_p25 = populate_oscillation(level_p25, neuron_stats);
                level_p25 = populate_coherence(level_p25, coherence_stats);
                pid_p25(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        
        elseif(contains(paths(index), "+2"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_p2 = populate_firing_characteristics(level_p2, neuron_stats);
                level_p2 = populate_bursting(level_p2, neuron_stats);
                level_p2 = populate_oscillation(level_p2, neuron_stats);
                level_p2 = populate_coherence(level_p2, coherence_stats);
                pid_p2(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
        
        elseif(contains(paths(index), "+1.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_p15 = populate_firing_characteristics(level_p15, neuron_stats);
                level_p15 = populate_bursting(level_p15, neuron_stats);
                level_p15 = populate_oscillation(level_p15, neuron_stats);
                level_p15 = populate_coherence(level_p15, coherence_stats);
                pid_p15(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "+1"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_p1 = populate_firing_characteristics(level_p1, neuron_stats);
                level_p1 = populate_bursting(level_p1, neuron_stats);
                level_p1 = populate_oscillation(level_p1, neuron_stats);
                level_p1 = populate_coherence(level_p1, coherence_stats);
                pid_p1(end+1) = neuron_stats.patient_id;
                
            end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "+0.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_p05 = populate_firing_characteristics(level_p05, neuron_stats);
                level_p05 = populate_bursting(level_p05, neuron_stats);
                level_p05 = populate_oscillation(level_p05, neuron_stats);
                level_p05 = populate_coherence(level_p05, coherence_stats);
                pid_p05(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "+0"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_p0 = populate_firing_characteristics(level_p0, neuron_stats);
                level_p0 = populate_bursting(level_p0, neuron_stats);
                level_p0 = populate_oscillation(level_p0, neuron_stats);
                level_p0 = populate_coherence(level_p0, coherence_stats);
                pid_p0(end+1) = neuron_stats.patient_id;
                
            end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-0.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n05 = populate_firing_characteristics(level_n05, neuron_stats);
                level_n05 = populate_bursting(level_n05, neuron_stats);
                level_n05 = populate_oscillation(level_n05, neuron_stats);
                level_n05 = populate_coherence(level_n05, coherence_stats);
                pid_n05(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-1") && ~contains(paths(index), "-10") && ~contains(paths(index), "-1.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n1 = populate_firing_characteristics(level_n1, neuron_stats);
                level_n1 = populate_bursting(level_n1, neuron_stats);
                level_n1 = populate_oscillation(level_n1, neuron_stats);
                level_n1 = populate_coherence(level_n1, coherence_stats);
                pid_n1(end+1) = neuron_stats.patient_id;
                
            end
         
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "-1.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n15 = populate_firing_characteristics(level_n15, neuron_stats);
                level_n15 = populate_bursting(level_n15, neuron_stats);
                level_n15 = populate_oscillation(level_n15, neuron_stats);
                level_n15 = populate_coherence(level_n15, coherence_stats);
                pid_n15(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-2") && ~contains(paths(index), "-2.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n2 = populate_firing_characteristics(level_n2, neuron_stats);
                level_n2 = populate_bursting(level_n2, neuron_stats);
                level_n2 = populate_oscillation(level_n2, neuron_stats);
                level_n2 = populate_coherence(level_n2, coherence_stats);
                pid_n2(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "-2.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n25 = populate_firing_characteristics(level_n25, neuron_stats);
                level_n25 = populate_bursting(level_n25, neuron_stats);
                level_n25 = populate_oscillation(level_n25, neuron_stats);
                level_n25 = populate_coherence(level_n25, coherence_stats);
                pid_n25(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-3") && ~contains(paths(index), "-3.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n3 = populate_firing_characteristics(level_n3, neuron_stats);
                level_n3 = populate_bursting(level_n3, neuron_stats);
                level_n3 = populate_oscillation(level_n3, neuron_stats);
                level_n3 = populate_coherence(level_n3, coherence_stats);
                pid_n3(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "-3.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n35 = populate_firing_characteristics(level_n35, neuron_stats);
                level_n35 = populate_bursting(level_n35, neuron_stats);
                level_n35 = populate_oscillation(level_n35, neuron_stats);
                level_n35 = populate_coherence(level_n35, coherence_stats);
                pid_n35(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-4") && ~contains(paths(index), "-4.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n4 = populate_firing_characteristics(level_n4, neuron_stats);
                level_n4 = populate_bursting(level_n4, neuron_stats);
                level_n4 = populate_oscillation(level_n4, neuron_stats);
                level_n4 = populate_coherence(level_n4, coherence_stats);
                pid_n4(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "-4.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n45 = populate_firing_characteristics(level_n45, neuron_stats);
                level_n45 = populate_bursting(level_n45, neuron_stats);
                level_n45 = populate_oscillation(level_n45, neuron_stats);
                level_n45 = populate_coherence(level_n45, coherence_stats);
                pid_n45(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-5") & ~contains(paths(index), "-5.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n5 = populate_firing_characteristics(level_n5, neuron_stats);
                level_n5 = populate_bursting(level_n5, neuron_stats);
                level_n5 = populate_oscillation(level_n5, neuron_stats);
                level_n5 = populate_coherence(level_n5, coherence_stats);
                pid_n5(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "-5.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n55 = populate_firing_characteristics(level_n55, neuron_stats);
                level_n55 = populate_bursting(level_n55, neuron_stats);
                level_n55 = populate_oscillation(level_n55, neuron_stats);
                level_n55 = populate_coherence(level_n55, coherence_stats);
                pid_n55(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-6") & ~contains(paths(index), "-6.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n6 = populate_firing_characteristics(level_n6, neuron_stats);
                level_n6 = populate_bursting(level_n6, neuron_stats);
                level_n6 = populate_oscillation(level_n6, neuron_stats);
                level_n6 = populate_coherence(level_n6, coherence_stats);
                pid_n6(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "-6.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n65 = populate_firing_characteristics(level_n65, neuron_stats);
                level_n65 = populate_bursting(level_n65, neuron_stats);
                level_n65 = populate_oscillation(level_n65, neuron_stats);
                level_n65 = populate_coherence(level_n65, coherence_stats);
                pid_n65(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-7") & ~contains(paths(index), "-7.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n7 = populate_firing_characteristics(level_n7, neuron_stats);
                level_n7 = populate_bursting(level_n7, neuron_stats);
                level_n7 = populate_oscillation(level_n7, neuron_stats);
                level_n7 = populate_coherence(level_n7, coherence_stats);
                pid_n7(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-7.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n75 = populate_firing_characteristics(level_n75, neuron_stats);
                level_n75 = populate_bursting(level_n75, neuron_stats);
                level_n75 = populate_oscillation(level_n75, neuron_stats);
                level_n75 = populate_coherence(level_n75, coherence_stats);
                pid_n75(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-8") & ~contains(paths(index), "-8.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n8 = populate_firing_characteristics(level_n8, neuron_stats);
                level_n8 = populate_bursting(level_n8, neuron_stats);
                level_n8 = populate_oscillation(level_n8, neuron_stats);
                level_n8 = populate_coherence(level_n8, coherence_stats);
                pid_n8(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "-8.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n85 = populate_firing_characteristics(level_n85, neuron_stats);
                level_n85 = populate_bursting(level_n85, neuron_stats);
                level_n85 = populate_oscillation(level_n85, neuron_stats);
                level_n85 = populate_coherence(level_n85, coherence_stats);
                pid_n85(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-9") & ~contains(paths(index), "-9.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n9 = populate_firing_characteristics(level_n9, neuron_stats);
                level_n9 = populate_bursting(level_n9, neuron_stats);
                level_n9 = populate_oscillation(level_n9, neuron_stats);
                level_n9 = populate_coherence(level_n9, coherence_stats);
                pid_n9(end+1) = neuron_stats.patient_id;
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elseif(contains(paths(index), "-9.5"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n95 = populate_firing_characteristics(level_n95, neuron_stats);
                level_n95 = populate_bursting(level_n95, neuron_stats);
                level_n95 = populate_oscillation(level_n95, neuron_stats);
                level_n95 = populate_coherence(level_n95, coherence_stats);
                pid_n95(end+1) = neuron_stats.patient_id;
               
            end
                   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
        elseif(contains(paths(index), "-10"))

            file_name = files(index);
            file_path = paths(index);
            load(strcat(file_path, "\", file_name));
            coherence_stats = statistics(length(statistics)).coherence_stats;

            for neuron_index = 1 : length(statistics)   % check how many neurons exist

                neuron_stats    = statistics(neuron_index);
                coherence_stats = neuron_stats.coherence_stats;

                level_n10 = populate_firing_characteristics(level_n10, neuron_stats);
                level_n10 = populate_bursting(level_n10, neuron_stats);
                level_n10 = populate_oscillation(level_n10, neuron_stats);
                level_n10 = populate_coherence(level_n10, coherence_stats);
                pid_n10(end+1) = neuron_stats.patient_id;
                
            end                  
        end        
    end
    
    levels.p35     = level_p35;
    levels.p3      = level_p3;
    levels.p25     = level_p25;
    levels.p2      = level_p2;
    levels.p15     = level_p15;
    levels.p1      = level_p1;
    levels.p05     = level_p05;
    levels.p0      = level_p0;
    levels.n05     = level_n05;
    levels.n1      = level_n1;
    levels.n15     = level_n15;
    levels.n2      = level_n2;
    levels.n25     = level_n25;
    levels.n3      = level_n3;
    levels.n35     = level_n35;
    levels.n4      = level_n4;
    levels.n45     = level_n45;
    levels.n5      = level_n5;
    levels.n55     = level_n55;
    levels.n6      = level_n6;
    levels.n65     = level_n65;
    levels.n7      = level_n7;
    levels.n75     = level_n75;
    levels.n8      = level_n8;
    levels.n85     = level_n85;
    levels.n9      = level_n9;
    levels.n95     = level_n95;
    levels.n10     = level_n10;
    levels.p35.pid = pid_p35;
    levels.p3.pid  = pid_p3;
    levels.p25.pid = pid_p25;
    levels.p2.pid  = pid_p2;
    levels.p15.pid = pid_p15;
    levels.p1.pid  = pid_p1;
    levels.p05.pid = pid_p05;
    levels.p0.pid  = pid_p0;
    levels.n05.pid = pid_n05;
    levels.n1.pid  = pid_n1;
    levels.n15.pid = pid_n15;
    levels.n2.pid  = pid_n2;
    levels.n25.pid = pid_n25;
    levels.n3.pid  = pid_n3;
    levels.n35.pid = pid_n35;
    levels.n4.pid  = pid_n4;
    levels.n45.pid = pid_n45;
    levels.n5.pid  = pid_n5;
    levels.n55.pid = pid_n55;
    levels.n6.pid  = pid_n6;
    levels.n65.pid = pid_n65;
    levels.n7.pid  = pid_n7;
    levels.n75.pid = pid_n75;
    levels.n8.pid  = pid_n8;
    levels.n85.pid = pid_n85;
    levels.n9.pid  = pid_n9;
    levels.n95.pid = pid_n95;
    levels.n10.pid = pid_n10;
    
end

