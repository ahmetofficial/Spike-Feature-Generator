clc; clear; close all;

warning('off','all');

%% MAIN PARAMETERS FOR THE ANALYSIS

% the patients that the spike sorting operation were completed.

patients = ["Patient2","Patient3","Patient6","Patient7","Patient8","Patient9","Patient10",...
            "Patient14","Patient18","Patient47"];

        
%% SORTED NEURONS DIRECTORY
% the directory contains patients recording

disp(strcat("Pipeline Features (started  | ", string(datetime('now')), ")"));
disp("    ------------------------------------------------------------");
for i = 1:length(patients)
    
    patient_code     = patients(i);
    disp(strcat("    Pipeline Features -> ", patient_code,  " (started   | ", string(datetime('now')), ")"));
    
    % the directory of sorted neurons that contains different patients
    base_directory   = strcat("Dataset\", patient_code);
    pipeline_biomarker_generation_single_patient(base_directory, patient_code)
    
    disp(strcat("    Pipeline Features -> ", patient_code,  " (finished  | ", string(datetime('now')), ")"));
    disp("    ------------------------------------------------------------");

end

disp(strcat("Pipeline Features (finished | ", string(datetime('now')), ")"));
