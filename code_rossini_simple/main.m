clear all; close all;

image_vector = read_images("..\test_images_3\", "tif");
grayscale_iv = double(grayscale(image_vector));
normalized_brightness_iv = grayscale_iv ./ sum(grayscale_iv,3);
max(normalized_brightness_iv, [], 'all')
% HDR image
HDR_image = create_HDR(image_vector, normalized_brightness_iv);
figure('Name', 'HDR unfiltered'); imshow(HDR_image);

HSV_im = rgb2hsv(HDR_image);
HSV_im(:,:,1) = HSV_im(:,:,1) + 0.015;
HDR_image_sat = hsv2rgb(HSV_im);
figure('Name', 'HDR unfiltered'); imshow(HDR_image_sat);