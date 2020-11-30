function W_normalized = W_measure(sharpened_image_vector, normalized_brightness_iv, s_weight, b_weight)

    if nargin < 3
%         b_weight = size(binary_sharpened_iv,3) / 2;
        b_weight = 1;
        s_weight = 1;
    end
    
    W = (s_weight .* sharpened_image_vector) .* (b_weight .* normalized_brightness_iv);
    
    W_normalized = double(W ./ sum(W,3));

end