clear all; close all;

% save multi-exposed images in a vector
image_vector = read_images("..\test_images\test_images_4\", "tif");

% save grayscaled images in a vector
grayscale_iv = double(grayscale(image_vector));

% normalize brightness 
normalized_brightness_iv = grayscale_iv ./ sum(grayscale_iv,3);

% HDR image
HDR_image = create_HDR(image_vector, normalized_brightness_iv);
figure('Name', 'Result - brightness only'); imshow(HDR_image);

% increase saturation to improve image quality
HSV_im = rgb2hsv(HDR_image);
HSV_im(:,:,1) = HSV_im(:,:,1) + 0.015;
HDR_image_sat = hsv2rgb(HSV_im);
figure('Name', 'HDR saturated'); imshow(HDR_image_sat);