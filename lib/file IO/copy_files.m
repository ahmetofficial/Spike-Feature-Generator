%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function copies the files from several different directories to one
% specific directory
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% INPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% paths     : array of paths of the files which wants to be copied
%             it has a form of "path name + file name"
% base_path : the base path for the subfolders
% division  : the subfolder name that is under the base path folder
%
%% %%%%%%%%%%%%%%%%%%%%%%%%% OUTPUT PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% NONE (copying the files)
%
function copy_files(paths, base_path, division)

    destination_directory = strcat(base_path, division);
    
    if ~exist(fullfile(destination_directory), 'dir')
        mkdir(fullfile(destination_directory));
    end
    
    for i = 1:length(paths)
        copyfile(paths(i), destination_directory);
    end
    
end

