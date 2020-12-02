function sharpened_image_vector = high_pass_filtering(grayscale_image_vector)
    HP_filter = [0 -1 0; -1 4 -1; 0 -1 0];
    for k=1:size(grayscale_image_vector,3)
        padded_sharpened_i_v(:,:,k) = conv2(double(grayscale_image_vector(:,:,k)), HP_filter);
    end
    sharpened_image_vector = padded_sharpened_i_v(2:end-1,2:end-1,:);
end