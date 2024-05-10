function generate_track(paths, files, output_path, sub_path)
    
    level_p35 = paths(contains(paths, "+3.5 mm")) + "\" + files(contains(paths, "+3.5 mm"));
    level_p3  = paths(contains(paths, "+3 mm"))   + "\" + files(contains(paths, "+3 mm"));
    level_p25 = paths(contains(paths, "+2.5 mm")) + "\" + files(contains(paths, "+2.5 mm"));
    level_p2  = paths(contains(paths, "+2 mm"))   + "\" + files(contains(paths, "+2 mm"));
    level_p15 = paths(contains(paths, "+1.5 mm")) + "\" + files(contains(paths, "+1.5 mm"));
    level_p1  = paths(contains(paths, "+1 mm"))   + "\" + files(contains(paths, "+1 mm"));
    level_p05 = paths(contains(paths, "+0.5 mm")) + "\" + files(contains(paths, "+0.5 mm"));
    level_p0  = paths(contains(paths, "+0 mm"))   + "\" + files(contains(paths, "+0 mm"));
    level_n05 = paths(contains(paths, "-0.5 mm")) + "\" + files(contains(paths, "-0.5 mm"));
    level_n1  = paths(contains(paths, "-1 mm"))   + "\" + files(contains(paths, "-1 mm"));
    level_n15 = paths(contains(paths, "-1.5 mm")) + "\" + files(contains(paths, "-1.5 mm"));
    level_n2  = paths(contains(paths, "-2 mm"))   + "\" + files(contains(paths, "-2 mm"));
    level_n25 = paths(contains(paths, "-2.5 mm")) + "\" + files(contains(paths, "-2.5 mm"));
    level_n3  = paths(contains(paths, "-3 mm"))   + "\" + files(contains(paths, "-3 mm"));
    level_n35 = paths(contains(paths, "-3.5 mm")) + "\" + files(contains(paths, "-3.5 mm"));
    level_n4  = paths(contains(paths, "-4 mm"))   + "\" + files(contains(paths, "-4 mm"));
    level_n45 = paths(contains(paths, "-4.5 mm")) + "\" + files(contains(paths, "-4.5 mm"));
    level_n5  = paths(contains(paths, "-5 mm"))   + "\" + files(contains(paths, "-5 mm"));
    level_n55 = paths(contains(paths, "-5.5 mm")) + "\" + files(contains(paths, "-5.5 mm"));
    level_n6  = paths(contains(paths, "-6 mm"))   + "\" + files(contains(paths, "-6 mm"));
    level_n65 = paths(contains(paths, "-6.5 mm")) + "\" + files(contains(paths, "-6.5 mm"));
    level_n7  = paths(contains(paths, "-7 mm"))   + "\" + files(contains(paths, "-7 mm"));
    level_n75 = paths(contains(paths, "-7.5 mm")) + "\" + files(contains(paths, "-7.5 mm"));
    level_n8  = paths(contains(paths, "-8 mm"))   + "\" + files(contains(paths, "-8 mm"));
    level_n85 = paths(contains(paths, "-8.5 mm")) + "\" + files(contains(paths, "-8.5 mm"));
    level_n9  = paths(contains(paths, "-9 mm"))   + "\" + files(contains(paths, "-9 mm"));
    level_n95 = paths(contains(paths, "-9.5 mm")) + "\" + files(contains(paths, "-9.5 mm"));
    level_n10 = paths(contains(paths, "-10 mm"))  + "\" + files(contains(paths, "-10 mm"));


    copy_files(level_p35, output_path, strcat(sub_path, "+3.5"));
    copy_files(level_p3,  output_path, strcat(sub_path, "+3"));
    copy_files(level_p25, output_path, strcat(sub_path, "+2.5"));
    copy_files(level_p2,  output_path, strcat(sub_path, "+2"));
    copy_files(level_p15, output_path, strcat(sub_path, "+1.5"));
    copy_files(level_p1,  output_path, strcat(sub_path, "+1"));
    copy_files(level_p05, output_path, strcat(sub_path, "+0.5"));
    copy_files(level_p0,  output_path, strcat(sub_path, "+0"));
    copy_files(level_n05, output_path, strcat(sub_path, "-0.5"));
    copy_files(level_n1,  output_path, strcat(sub_path, "-1"));
    copy_files(level_n15, output_path, strcat(sub_path, "-1.5"));
    copy_files(level_n2,  output_path, strcat(sub_path, "-2"));
    copy_files(level_n25, output_path, strcat(sub_path, "-2.5"));
    copy_files(level_n3,  output_path, strcat(sub_path, "-3"));
    copy_files(level_n35, output_path, strcat(sub_path, "-3.5"));
    copy_files(level_n4,  output_path, strcat(sub_path, "-4"));
    copy_files(level_n45, output_path, strcat(sub_path, "-4.5"));
    copy_files(level_n5,  output_path, strcat(sub_path, "-5"));
    copy_files(level_n55, output_path, strcat(sub_path, "-5.5"));
    copy_files(level_n6,  output_path, strcat(sub_path, "-6"));
    copy_files(level_n65, output_path, strcat(sub_path, "-6.5"));
    copy_files(level_n7,  output_path, strcat(sub_path, "-7"));
    copy_files(level_n75, output_path, strcat(sub_path, "-7.5"));
    copy_files(level_n8,  output_path, strcat(sub_path, "-8"));
    copy_files(level_n85, output_path, strcat(sub_path, "-8.5"));
    copy_files(level_n9,  output_path, strcat(sub_path, "-9"));
    copy_files(level_n95, output_path, strcat(sub_path, "-9.5"));
    copy_files(level_n10, output_path, strcat(sub_path, "-10"));
end

