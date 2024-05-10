function stats = calculate_features_all_tracks(paths, files)

    % separate the files into right and left hemispheres
    dx_index        = contains(paths, 'GPI dx');     
    dx_paths        = paths(dx_index);
    dx_files        = files(dx_index);                  % right hemisphere GPI 

    sx_index        = contains(paths, 'GPI sx');
    sx_paths        = paths(sx_index);
    sx_files        = files(sx_index);                  % left hemisphere GPI 

    % ANTERIORE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % DX
    dx_anteriore_index     = contains(dx_paths, 'anteriore');
    dx_anteriore_files     = dx_files(dx_anteriore_index);
    dx_anteriore_paths     = dx_paths(dx_anteriore_index);
    levels                 = pool_features_all_levels(dx_anteriore_paths, dx_anteriore_files);
    stats.dx.anteriore.p35 = levels.p35;
    stats.dx.anteriore.p3  = levels.p3;
    stats.dx.anteriore.p25 = levels.p25;
    stats.dx.anteriore.p2  = levels.p2;
    stats.dx.anteriore.p15 = levels.p15;
    stats.dx.anteriore.p1  = levels.p1;
    stats.dx.anteriore.p05 = levels.p05;
    stats.dx.anteriore.p0  = levels.p0;
    stats.dx.anteriore.n05 = levels.n05;
    stats.dx.anteriore.n1  = levels.n1;
    stats.dx.anteriore.n15 = levels.n15;
    stats.dx.anteriore.n2  = levels.n2;
    stats.dx.anteriore.n25 = levels.n25;
    stats.dx.anteriore.n3  = levels.n3;
    stats.dx.anteriore.n35 = levels.n35;
    stats.dx.anteriore.n4  = levels.n4;
    stats.dx.anteriore.n45 = levels.n45;
    stats.dx.anteriore.n5  = levels.n5;
    stats.dx.anteriore.n55 = levels.n55;
    stats.dx.anteriore.n6  = levels.n6;
    stats.dx.anteriore.n65 = levels.n65;
    stats.dx.anteriore.n7  = levels.n7;
    stats.dx.anteriore.n75 = levels.n75;
    stats.dx.anteriore.n8  = levels.n8;
    stats.dx.anteriore.n85 = levels.n85;
    stats.dx.anteriore.n9  = levels.n9;
    stats.dx.anteriore.n95 = levels.n95;
    stats.dx.anteriore.n10 = levels.n10;
    
    % SX
    sx_anteriore_index     = contains(sx_paths, 'anteriore');
    sx_anteriore_files     = sx_files(sx_anteriore_index);
    sx_anteriore_paths     = sx_paths(sx_anteriore_index);
    levels                 = pool_features_all_levels(sx_anteriore_paths, sx_anteriore_files);
    stats.sx.anteriore.p35 = levels.p35;
    stats.sx.anteriore.p3  = levels.p3;
    stats.sx.anteriore.p25 = levels.p25;
    stats.sx.anteriore.p2  = levels.p2;
    stats.sx.anteriore.p15 = levels.p15;
    stats.sx.anteriore.p1  = levels.p1;
    stats.sx.anteriore.p05 = levels.p05;
    stats.sx.anteriore.p0  = levels.p0;
    stats.sx.anteriore.n05 = levels.n05;
    stats.sx.anteriore.n1  = levels.n1;
    stats.sx.anteriore.n15 = levels.n15;
    stats.sx.anteriore.n2  = levels.n2;
    stats.sx.anteriore.n25 = levels.n25;
    stats.sx.anteriore.n3  = levels.n3;
    stats.sx.anteriore.n35 = levels.n35;
    stats.sx.anteriore.n4  = levels.n4;
    stats.sx.anteriore.n45 = levels.n45;
    stats.sx.anteriore.n5  = levels.n5;
    stats.sx.anteriore.n55 = levels.n55;
    stats.sx.anteriore.n6  = levels.n6;
    stats.sx.anteriore.n65 = levels.n65;
    stats.sx.anteriore.n7  = levels.n7;
    stats.sx.anteriore.n75 = levels.n75;
    stats.sx.anteriore.n8  = levels.n8;
    stats.sx.anteriore.n85 = levels.n85;
    stats.sx.anteriore.n9  = levels.n9;
    stats.sx.anteriore.n95 = levels.n95;
    stats.sx.anteriore.n10 = levels.n10;
    
    % CENTRALE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % DX
    dx_centrale_index     = contains(dx_paths, 'centrale');
    dx_centrale_files     = dx_files(dx_centrale_index);
    dx_centrale_paths     = dx_paths(dx_centrale_index);
    levels                = pool_features_all_levels(dx_centrale_paths, dx_centrale_files);
    stats.dx.centrale.p35 = levels.p35;
    stats.dx.centrale.p3  = levels.p3;
    stats.dx.centrale.p25 = levels.p25;
    stats.dx.centrale.p2  = levels.p2;
    stats.dx.centrale.p15 = levels.p15;
    stats.dx.centrale.p1  = levels.p1;
    stats.dx.centrale.p05 = levels.p05;
    stats.dx.centrale.p0  = levels.p0;
    stats.dx.centrale.n05 = levels.n05;
    stats.dx.centrale.n1  = levels.n1;
    stats.dx.centrale.n15 = levels.n15;
    stats.dx.centrale.n2  = levels.n2;
    stats.dx.centrale.n25 = levels.n25;
    stats.dx.centrale.n3  = levels.n3;
    stats.dx.centrale.n35 = levels.n35;
    stats.dx.centrale.n4  = levels.n4;
    stats.dx.centrale.n45 = levels.n45;
    stats.dx.centrale.n5  = levels.n5;
    stats.dx.centrale.n55 = levels.n55;
    stats.dx.centrale.n6  = levels.n6;
    stats.dx.centrale.n65 = levels.n65;
    stats.dx.centrale.n7  = levels.n7;
    stats.dx.centrale.n75 = levels.n75;
    stats.dx.centrale.n8  = levels.n8;
    stats.dx.centrale.n85 = levels.n85;
    stats.dx.centrale.n9  = levels.n9;
    stats.dx.centrale.n95 = levels.n95;
    stats.dx.centrale.n10 = levels.n10;
    
    % SX
    sx_centrale_index     = contains(sx_paths, 'centrale');
    sx_centrale_files     = sx_files(sx_centrale_index);
    sx_centrale_paths     = sx_paths(sx_centrale_index);
    levels                = pool_features_all_levels(sx_centrale_paths, sx_centrale_files);
    stats.sx.centrale.p35 = levels.p35;
    stats.sx.centrale.p3  = levels.p3;
    stats.sx.centrale.p25 = levels.p25;
    stats.sx.centrale.p2  = levels.p2;
    stats.sx.centrale.p15 = levels.p15;
    stats.sx.centrale.p1  = levels.p1;
    stats.sx.centrale.p05 = levels.p05;
    stats.sx.centrale.p0  = levels.p0;
    stats.sx.centrale.n05 = levels.n05;
    stats.sx.centrale.n1  = levels.n1;
    stats.sx.centrale.n15 = levels.n15;
    stats.sx.centrale.n2  = levels.n2;
    stats.sx.centrale.n25 = levels.n25;
    stats.sx.centrale.n3  = levels.n3;
    stats.sx.centrale.n35 = levels.n35;
    stats.sx.centrale.n4  = levels.n4;
    stats.sx.centrale.n45 = levels.n45;
    stats.sx.centrale.n5  = levels.n5;
    stats.sx.centrale.n55 = levels.n55;
    stats.sx.centrale.n6  = levels.n6;
    stats.sx.centrale.n65 = levels.n65;
    stats.sx.centrale.n7  = levels.n7;
    stats.sx.centrale.n75 = levels.n75;
    stats.sx.centrale.n8  = levels.n8;
    stats.sx.centrale.n85 = levels.n85;
    stats.sx.centrale.n9  = levels.n9;
    stats.sx.centrale.n95 = levels.n95;
    stats.sx.centrale.n10 = levels.n10;
    
    % LATERALE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % DX
    dx_laterale_index     = contains(dx_paths, 'laterale');
    dx_laterale_files     = dx_files(dx_laterale_index);
    dx_laterale_paths     = dx_paths(dx_laterale_index);
    levels                = pool_features_all_levels(dx_laterale_paths, dx_laterale_files);
    stats.dx.laterale.p35 = levels.p35;
    stats.dx.laterale.p3  = levels.p3;
    stats.dx.laterale.p25 = levels.p25;
    stats.dx.laterale.p2  = levels.p2;
    stats.dx.laterale.p15 = levels.p15;
    stats.dx.laterale.p1  = levels.p1;
    stats.dx.laterale.p05 = levels.p05;
    stats.dx.laterale.p0  = levels.p0;
    stats.dx.laterale.n05 = levels.n05;
    stats.dx.laterale.n1  = levels.n1;
    stats.dx.laterale.n15 = levels.n15;
    stats.dx.laterale.n2  = levels.n2;
    stats.dx.laterale.n25 = levels.n25;
    stats.dx.laterale.n3  = levels.n3;
    stats.dx.laterale.n35 = levels.n35;
    stats.dx.laterale.n4  = levels.n4;
    stats.dx.laterale.n45 = levels.n45;
    stats.dx.laterale.n5  = levels.n5;
    stats.dx.laterale.n55 = levels.n55;
    stats.dx.laterale.n6  = levels.n6;
    stats.dx.laterale.n65 = levels.n65;
    stats.dx.laterale.n7  = levels.n7;
    stats.dx.laterale.n75 = levels.n75;
    stats.dx.laterale.n8  = levels.n8;
    stats.dx.laterale.n85 = levels.n85;
    stats.dx.laterale.n9  = levels.n9;
    stats.dx.laterale.n95 = levels.n95;
    stats.dx.laterale.n10 = levels.n10;
    
    % SX
    sx_laterale_index     = contains(sx_paths, 'laterale');
    sx_laterale_files     = sx_files(sx_laterale_index);
    sx_laterale_paths     = sx_paths(sx_laterale_index);
    levels                = pool_features_all_levels(sx_laterale_paths, sx_laterale_files);
    stats.sx.laterale.p35 = levels.p35;
    stats.sx.laterale.p3  = levels.p3;
    stats.sx.laterale.p25 = levels.p25;
    stats.sx.laterale.p2  = levels.p2;
    stats.sx.laterale.p15 = levels.p15;
    stats.sx.laterale.p1  = levels.p1;
    stats.sx.laterale.p05 = levels.p05;
    stats.sx.laterale.p0  = levels.p0;
    stats.sx.laterale.n05 = levels.n05;
    stats.sx.laterale.n1  = levels.n1;
    stats.sx.laterale.n15 = levels.n15;
    stats.sx.laterale.n2  = levels.n2;
    stats.sx.laterale.n25 = levels.n25;
    stats.sx.laterale.n3  = levels.n3;
    stats.sx.laterale.n35 = levels.n35;
    stats.sx.laterale.n4  = levels.n4;
    stats.sx.laterale.n45 = levels.n45;
    stats.sx.laterale.n5  = levels.n5;
    stats.sx.laterale.n55 = levels.n55;
    stats.sx.laterale.n6  = levels.n6;
    stats.sx.laterale.n65 = levels.n65;
    stats.sx.laterale.n7  = levels.n7;
    stats.sx.laterale.n75 = levels.n75;
    stats.sx.laterale.n8  = levels.n8;
    stats.sx.laterale.n85 = levels.n85;
    stats.sx.laterale.n9  = levels.n9;
    stats.sx.laterale.n95 = levels.n95;
    stats.sx.laterale.n10 = levels.n10;
    
    % MEDIALE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
 
    % DX
    dx_mediale_index     = contains(dx_paths, 'mediale');
    dx_mediale_files     = dx_files(dx_mediale_index);
    dx_mediale_paths     = dx_paths(dx_mediale_index);
    levels               = pool_features_all_levels(dx_mediale_paths, dx_mediale_files);
    stats.dx.mediale.p35 = levels.p35;
    stats.dx.mediale.p3  = levels.p3;
    stats.dx.mediale.p25 = levels.p25;
    stats.dx.mediale.p2  = levels.p2;
    stats.dx.mediale.p15 = levels.p15;
    stats.dx.mediale.p1  = levels.p1;
    stats.dx.mediale.p05 = levels.p05;
    stats.dx.mediale.p0  = levels.p0;
    stats.dx.mediale.n05 = levels.n05;
    stats.dx.mediale.n1  = levels.n1;
    stats.dx.mediale.n15 = levels.n15;
    stats.dx.mediale.n2  = levels.n2;
    stats.dx.mediale.n25 = levels.n25;
    stats.dx.mediale.n3  = levels.n3;
    stats.dx.mediale.n35 = levels.n35;
    stats.dx.mediale.n4  = levels.n4;
    stats.dx.mediale.n45 = levels.n45;
    stats.dx.mediale.n5  = levels.n5;
    stats.dx.mediale.n55 = levels.n55;
    stats.dx.mediale.n6  = levels.n6;
    stats.dx.mediale.n65 = levels.n65;
    stats.dx.mediale.n7  = levels.n7;
    stats.dx.mediale.n75 = levels.n75;
    stats.dx.mediale.n8  = levels.n8;
    stats.dx.mediale.n85 = levels.n85;
    stats.dx.mediale.n9  = levels.n9;
    stats.dx.mediale.n95 = levels.n95;
    stats.dx.mediale.n10 = levels.n10;
    
    % SX
    sx_mediale_index     = contains(sx_paths, 'mediale');
    sx_mediale_files     = sx_files(sx_mediale_index);
    sx_mediale_paths     = sx_paths(sx_mediale_index);
    levels               = pool_features_all_levels(sx_mediale_paths, sx_mediale_files);
    stats.sx.mediale.p35 = levels.p35;
    stats.sx.mediale.p3  = levels.p3;
    stats.sx.mediale.p25 = levels.p25;
    stats.sx.mediale.p2  = levels.p2;
    stats.sx.mediale.p15 = levels.p15;
    stats.sx.mediale.p1  = levels.p1;
    stats.sx.mediale.p05 = levels.p05;
    stats.sx.mediale.p0  = levels.p0;
    stats.sx.mediale.n05 = levels.n05;
    stats.sx.mediale.n1  = levels.n1;
    stats.sx.mediale.n15 = levels.n15;
    stats.sx.mediale.n2  = levels.n2;
    stats.sx.mediale.n25 = levels.n25;
    stats.sx.mediale.n3  = levels.n3;
    stats.sx.mediale.n35 = levels.n35;
    stats.sx.mediale.n4  = levels.n4;
    stats.sx.mediale.n45 = levels.n45;
    stats.sx.mediale.n5  = levels.n5;
    stats.sx.mediale.n55 = levels.n55;
    stats.sx.mediale.n6  = levels.n6;
    stats.sx.mediale.n65 = levels.n65;
    stats.sx.mediale.n7  = levels.n7;
    stats.sx.mediale.n75 = levels.n75;
    stats.sx.mediale.n8  = levels.n8;
    stats.sx.mediale.n85 = levels.n85;
    stats.sx.mediale.n9  = levels.n9;
    stats.sx.mediale.n95 = levels.n95;
    stats.sx.mediale.n10 = levels.n10;
    
    % POSTERIORE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % DX
    dx_posteriore_index     = contains(dx_paths, 'posteriore');
    dx_posteriore_files     = dx_files(dx_posteriore_index);
    dx_posteriore_paths     = dx_paths(dx_posteriore_index);
    levels                  = pool_features_all_levels(dx_posteriore_paths, dx_posteriore_files);
    stats.dx.posteriore.p35 = levels.p35;
    stats.dx.posteriore.p3  = levels.p3;
    stats.dx.posteriore.p25 = levels.p25;
    stats.dx.posteriore.p2  = levels.p2;
    stats.dx.posteriore.p15 = levels.p15;
    stats.dx.posteriore.p1  = levels.p1;
    stats.dx.posteriore.p05 = levels.p05;
    stats.dx.posteriore.p0  = levels.p0;
    stats.dx.posteriore.n05 = levels.n05;
    stats.dx.posteriore.n1  = levels.n1;
    stats.dx.posteriore.n15 = levels.n15;
    stats.dx.posteriore.n2  = levels.n2;
    stats.dx.posteriore.n25 = levels.n25;
    stats.dx.posteriore.n3  = levels.n3;
    stats.dx.posteriore.n35 = levels.n35;
    stats.dx.posteriore.n4  = levels.n4;
    stats.dx.posteriore.n45 = levels.n45;
    stats.dx.posteriore.n5  = levels.n5;
    stats.dx.posteriore.n55 = levels.n55;
    stats.dx.posteriore.n6  = levels.n6;
    stats.dx.posteriore.n65 = levels.n65;
    stats.dx.posteriore.n7  = levels.n7;
    stats.dx.posteriore.n75 = levels.n75;
    stats.dx.posteriore.n8  = levels.n8;
    stats.dx.posteriore.n85 = levels.n85;
    stats.dx.posteriore.n9  = levels.n9;
    stats.dx.posteriore.n95 = levels.n95;
    stats.dx.posteriore.n10 = levels.n10;
    
    % SX
    sx_posteriore_index     = contains(sx_paths, 'posteriore');
    sx_posteriore_files     = sx_files(sx_posteriore_index);
    sx_posteriore_paths     = sx_paths(sx_posteriore_index);
    levels                  = pool_features_all_levels(sx_posteriore_paths, sx_posteriore_files);
    stats.sx.posteriore.p35 = levels.p35;
    stats.sx.posteriore.p3  = levels.p3;
    stats.sx.posteriore.p25 = levels.p25;
    stats.sx.posteriore.p2  = levels.p2;
    stats.sx.posteriore.p15 = levels.p15;
    stats.sx.posteriore.p1  = levels.p1;
    stats.sx.posteriore.p05 = levels.p05;
    stats.sx.posteriore.p0  = levels.p0;
    stats.sx.posteriore.n05 = levels.n05;
    stats.sx.posteriore.n1  = levels.n1;
    stats.sx.posteriore.n15 = levels.n15;
    stats.sx.posteriore.n2  = levels.n2;
    stats.sx.posteriore.n25 = levels.n25;
    stats.sx.posteriore.n3  = levels.n3;
    stats.sx.posteriore.n35 = levels.n35;
    stats.sx.posteriore.n4  = levels.n4;
    stats.sx.posteriore.n45 = levels.n45;
    stats.sx.posteriore.n5  = levels.n5;
    stats.sx.posteriore.n55 = levels.n55;
    stats.sx.posteriore.n6  = levels.n6;
    stats.sx.posteriore.n65 = levels.n65;
    stats.sx.posteriore.n7  = levels.n7;
    stats.sx.posteriore.n75 = levels.n75;
    stats.sx.posteriore.n8  = levels.n8;
    stats.sx.posteriore.n85 = levels.n85;
    stats.sx.posteriore.n9  = levels.n9;
    stats.sx.posteriore.n95 = levels.n95;
    stats.sx.posteriore.n10 = levels.n10;
    
    save('SpikeTrainAnalysis\data\features_all_tracks.mat','stats');
    
end

