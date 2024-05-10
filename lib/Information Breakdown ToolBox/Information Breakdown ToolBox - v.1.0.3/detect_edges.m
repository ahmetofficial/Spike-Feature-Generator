function [edges] = detect_edges(R, nb)
    
    R_flatten = reshape(R,1,[]);
    R_flatten = unique(R_flatten);
    R_flatten = sort(R_flatten(:));
    R_flatten = rmmissing(R_flatten); % remove NaNs
    
    if(R_flatten(1) == 0)
        R_flatten = R_flatten(2:end);
    end
    
    bin_step      = floor(length(R_flatten)/nb);
    
    indexes       = zeros(nb+1, 1);
    edges         = zeros(nb+1, 1);
    
    indexes(1)    = 1;
    edges(1)      = R_flatten(indexes(1));
    
    indexes(nb+1) = length(R_flatten);
    edges(nb+1)   = R_flatten(indexes(nb+1)) + 1;
    
    for i = 1:nb-1
        % no remaining after dividing by bins size
        if((length(R_flatten) - bin_step * nb) == 0)
            if(i==1)
                indexes(i+1) = bin_step + bin_step * (i-1) + 1;
            else
                indexes(i+1) = bin_step + bin_step * (i-1) + 2;
            end
            edges(i+1)   = R_flatten(indexes(i+1));
            
        % remaining after dividing by bins size
        else
            if(i<=length(R_flatten) - bin_step * nb)
                indexes(i+1) = bin_step + (bin_step+1) * (i-1) + 2;
            else
                indexes(i+1) = bin_step + bin_step * (i-1) + 2;
            end
            edges(i+1) = R_flatten(indexes(i+1));
        end          
    end 
end

