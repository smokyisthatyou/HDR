clear all; close all;

image_vector = read_images("..\test_images_1\", "tif");
HSV_iv = rgb_to_HSV(image_vector);

H_iv = HSV_iv(:,:,1,:);
S_iv = HSV_iv(:,:,2,:);
V_iv = HSV_iv(:,:,3,:);

HSV_normalized(:,:,1,:) = (H_iv ./ sum(H_iv,4));
HSV_normalized(:,:,2,:) = ((size(image_vector,4)/2)/size(image_vector,4)).*(S_iv ./ sum(S_iv,4));
HSV_normalized(:,:,3,:) = V_iv ./ sum(V_iv,4);

HSL_fused_image = sum(HSV_iv .* HSV_normalized, 4);
HDR_image = hsv2rgb(HSL_fused_image);
figure('Name', 'HDR unfiltered'); imshow(HDR_image);

% HSV_normalized_brightness = 
% 
% % Brightness measure
% normalized_brightness_iv = brightness_measure(grayscale_image_vector);
% 
% % W measure: local contrast + brightness
% W_normalized = W_measure(binary_sharpened_iv, normalized_brightness_iv);
% % HDR image
% HDR_image = create_HDR(image_vector, W_normalized);
% figure('Name', 'HDR unfiltered'); imshow(HDR_image);
% % Filtering
% HDR_filtered = imguidedfilter(HDR_image);
% figure('Name', 'HDR'); imshow(HDR_filtered);
