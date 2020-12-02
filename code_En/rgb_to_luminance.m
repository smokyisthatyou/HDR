function luminance_image_vector = rgb_to_luminance(image_vector)
for k=1:size(image_vector,4)
    current_ycbcr_image = rgb2ycbcr(image_vector(:,:,:,k));
    luminance_image_vector(:,:,k) = current_ycbcr_image(:,:,1); %array con le luminanze delle varie immagini
end