function luminance_image_vector = rgb_to_luminance(image_vector)
for k=1:size(image_vector,4)
    luminance_image_vector(:,:,k) = image_vector(:,:,1,k); %array con le luminanze delle varie immagini
end