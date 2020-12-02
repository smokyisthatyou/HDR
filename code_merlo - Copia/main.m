clear all; close all;

image_vector = read_images("..\test_images_2\", "tif");
grayscale_image_vector = grayscale(image_vector);

% Local contrast & sharpness measure
sharpened_image_vector = high_pass_filtering(grayscale_image_vector);
binary_sharpened_iv = best_image_contrast(sharpened_image_vector);

% Brightness measure
normalized_brightness_iv = brightness_measure(grayscale_image_vector);
max(normalized_brightness_iv, [], 'all')

% W measure: local contrast + brightness
W_normalized = W_measure(binary_sharpened_iv, normalized_brightness_iv);
% HDR image
HDR_image = create_HDR(image_vector, W_normalized);
figure('Name', 'HDR unfiltered'); imshow(HDR_image);
% Filtering
HDR_filtered = imguidedfilter(HDR_image);
figure('Name', 'HDR'); imshow(HDR_filtered);
