function [data_filtered] = filter_signal(data, filter, dt)

    mirror_length  = 0.5 / dt;                                              % the indices corresponds to 500 ms;
    data_mirrored  = [flip(data(1:mirror_length)) data];                    % add in front
    data_mirrored  = [data_mirrored flip(data(end-mirror_length+1: end))];  % add to back                                                 % get lfp filter

    %fvtool(filter)
    data_filtered  = filtfilt(filter, data_mirrored);                       % filter bua
    data_filtered  = data_filtered(mirror_length+1 :end-mirror_length);     % remove added regions

end

