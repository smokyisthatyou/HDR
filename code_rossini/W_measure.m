function W_normalized = W_measure(binary_sharpened_iv, normalized_brightness_iv, s_weight, b_weight)

    if nargin < 3
        b_weight = size(binary_sharpened_iv,3) / 2;
        s_weight = 1;
    end
    
    W = s_weight .* double(binary_sharpened_iv) + b_weight .* normalized_brightness_iv;
    
    W_normalized = W ./ sum(W,3);

end