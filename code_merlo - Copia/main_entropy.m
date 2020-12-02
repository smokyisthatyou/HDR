clear all; close all;

image_vector = read_images("..\test_images_1\", "tif");

%save images' luminance in a vector
% luminance_image_vector = rgb_to_luminance (image_vector);

brightness_iv = double(grayscale(image_vector));
sharpened_image_vector = high_pass_filtering(brightness_iv);
binary_sharpened_iv = best_image_contrast(sharpened_image_vector);
% luminance_iv = double(luminance_image_vector); %max=0.92. alt a: brightness_iv

%calculate entropy images from luminance and save them in a vector
entropy_image_vector = entropy_images(brightness_iv); 

max_entropy = max(entropy_image_vector,[], 'all') %7.6132
% max_luminance = max(luminance_iv,[], 'all')
max_brightness = max(brightness_iv,[], 'all')
modulated_brightness_iv = brightness_iv / max_brightness;
modulated_entropy_iv = entropy_image_vector / max_entropy;
max_modulated_brightness = max(modulated_brightness_iv,[], 'all')
max_modulated_entropy = max(modulated_entropy_iv,[], 'all')
%creation of hdr image

W = (1./(1 + exp(-(modulated_entropy_iv .* binary_sharpened_iv + modulated_brightness_iv)))) + modulated_brightness_iv;
ScaryImage = hdr(W, image_vector);
figure('Name', 'Result'); imshow(ScaryImage);
ScaryImage2 = imguidedfilter(ScaryImage);
figure('Name', 'Result'); imshow(ScaryImage2);
ScaryImage3 = imgaussfilt(ScaryImage, 1.5);
figure('Name', 'Result'); imshow(ScaryImage2);

