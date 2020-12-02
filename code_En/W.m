function W_normalized = W(entropy_image_vector, brightness, s_weight, b_weight)
   
    if nargin < 3
        b_weight = size(entropy_image_vector,3) / 2;
        s_weight = 1;
    end

    W = (s_weight .* entropy_image_vector) .* (b_weight .* brightness);
    
    W_normalized = W ./ sum(W,3);

end