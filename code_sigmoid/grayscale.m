function grayscale_image_vector = grayscale(image_vector)
    for k=1:size(image_vector,4)
        grayscale_image_vector(:,:,k) = rgb2gray(image_vector(:,:,:,k));
    end
end