function HSV_image_vector = to_HSV(image_vector)
    for k=1:size(image_vector,4)
        HSV_image_vector(:,:,k) = rgb2hsv(image_vector(:,:,:,k));
    end
end