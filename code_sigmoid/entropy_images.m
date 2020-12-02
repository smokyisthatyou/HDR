function entropy_image_vector = entropy_images(luminance_image_vector)
for k=1:size(luminance_image_vector,3)
    entropy_image_vector(:,:,k) = entropyfilt(luminance_image_vector(:,:,k), true(25));
%     figure('Name', 'EntropyImage');imshow(entropy_image_vector(:,:,k));
end