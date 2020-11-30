function normalized_brightness_iv = brightness_measure(grayscale_image_vector)
    double_grayscale = double(grayscale_image_vector);
    normalized_brightness_iv = double_grayscale ./ sum(double_grayscale,3);
                                      
end