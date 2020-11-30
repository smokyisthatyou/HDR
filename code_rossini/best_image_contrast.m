function binary_sharpened_iv = best_image_contrast(sharpened_image_vector)
    
    width = size(sharpened_image_vector,1);
    height = size(sharpened_image_vector,2);
    num_images = size(sharpened_image_vector,3);
    [best_contrast, best_contrast_index] = max(sharpened_image_vector, [], 3);
    
    pos_vector = (1:num_images)';
    numbered_matrices = permute(zeros(num_images, height, width) + pos_vector, [3 2 1]);
    difference_iv = numbered_matrices - best_contrast_index;
    binary_sharpened_iv = max(0, min(difference_iv, -difference_iv) + 1);
    
end