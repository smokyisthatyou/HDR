function HDR_image = create_HDR(image_vector, W_normalized)
    weighted_image = sum(W_normalized .* permute(im2double(image_vector), [1 2 4 3]),3);
    HDR_image = im2uint16(permute(weighted_image, [1 2 4 3]));
end