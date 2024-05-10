function [mua, sua, bua_dcremoved] = define_BUA_MUA(raw, mua_times, sua_times_vec, ...
                                               spike_shapes, dt)
                                           
    % take the trasnpose if the raw array comes with different shape
    raw_size      = size(raw);
    raw_size      = raw_size(1);   
    if(raw_size~=1)
        raw = raw';
    end
    
    sua  = zeros(length(sua_times_vec), length(raw));
    
    for neuron = 1:length(sua_times_vec)
        
        sua_times = sua_times_vec(neuron).spiking_times ./ 1000;
        sua_mask  = zeros(1,length(raw));            % mask that will be used to define mua times
        
        for sua_index = 1:length(sua_times)

            peak_time   = sua_times(sua_index);      % the timing of the mua complex
            sua_loc     = int32((peak_time / dt));   % location of the mua 
            peak_value  = raw(sua_loc);              % corresponding value to timing of mua
            sua_complex = spike_shapes(sua_index,:); % mua shape (1x64 array)

            if(peak_value > 0)                       % if mua show positive spike shape
                sua_complex(sua_complex<=0)=0;
                sua_complex(30:64)=0;
                [~,I]   = max(abs(sua_complex));
            else
                sua_complex(sua_complex>=0)=0;       % if mua show negative spike shape
                sua_complex(30:64)=0;
                [~,I]   = max(abs(sua_complex));
            end

            sua_interval           = double(sua_loc-I+1:1:sua_loc-I+1+63); 
            sua_mask(sua_interval) = 1;   

        end
        sua_neuron    = raw .* sua_mask;
        sua(neuron,:) = sua_neuron;
    end
    
    mua_mask = zeros(1,length(raw));
    
    for mua_index = 1:length(mua_times)

        peak_time   = mua_times(mua_index);      % the timing of the mua complex
        mua_loc     = int32((peak_time / dt));   % location of the mua 
        peak_value  = raw(mua_loc);              % corresponding value to timing of mua
        mua_complex = spike_shapes(mua_index,:); % mua shape (1x64 array)

        if(peak_value > 0)                       % if mua show positive spike shape
            mua_complex(mua_complex<=0)=0;
            mua_complex(30:64)=0;
            [~,I]   = max(abs(mua_complex));
        else
            mua_complex(mua_complex>=0)=0;       % if mua show negative spike shape
            mua_complex(30:64)=0;
            [~,I]   = max(abs(mua_complex));
        end
        
        mua_interval     = double(mua_loc-I+1:1:mua_loc-I+1+63); 
        mua_mask(mua_interval) = 1;   

    end

    mua = raw .* mua_mask;  % multi unit activity values
    mua = raw .* mua_mask;  % multi unit activity values
    bua = raw - mua;        % background activities
    
    %----------------------------------------------------------------------
    % FILTER BUA ----------------------------------------------------------
    %----------------------------------------------------------------------

    %fvtool(filter)
    lfp_500_filter = LFP(500);
    bua_filtered   = filter_signal(bua, lfp_500_filter, dt);

    %----------------------------------------------------------------------
    % RECTIFIED BUA -------------------------------------------------------
    %----------------------------------------------------------------------

    % full wave rectification 
    bua_rectified = abs(bua_filtered);  % rectify the filtered bua

    %----------------------------------------------------------------------
    % REMOVE DC OFFSET FROM BUA -------------------------------------------
    %----------------------------------------------------------------------

    % remove DC component with simple detrending
    bua_dcremoved = detrend(bua_rectified, 'constant'); % remove dc offset

end

