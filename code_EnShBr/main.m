clear all; close all;

% save multi-exposed images in a vector
image_vector = read_images("..\test_images\test_images_4\", "tif");

% save brightness images in a vector
brightness_iv = double(grayscale(image_vector));

% highpass filter to detect details - convolution mask used in Shutao paper
sharpened_image_vector = high_pass_filtering(brightness_iv);
binary_sharpened_iv = best_image_contrast(sharpened_image_vector);

%calculate entropy images from brightness and save them in a vector
entropy_image_vector = entropy_images(brightness_iv); 

%normalize entropy and brightness 
max_entropy = max(entropy_image_vector,[], 'all');
max_brightness = max(brightness_iv,[], 'all');
modulated_brightness_iv = brightness_iv / max_brightness;
modulated_entropy_iv = entropy_image_vector / max_entropy;

% TOGLIERE : max_modulated_brightness = max(modulated_brightness_iv,[], 'all');
% TOGLIERE : max_modulated_entropy = max(modulated_entropy_iv,[], 'all');

% calculate weights with entropy and brightness (sum brightness to avoid
% excessively dark images)
W = modulated_entropy_iv .* binary_sharpened_iv + modulated_brightness_iv;

% creation of hdr image
ScaryImage = hdr(W, image_vector);
figure('Name', 'Result - no filter'); imshow(ScaryImage);

% filter with edge preserving self-guided filter
ScaryImage2 = imguidedfilter(ScaryImage);
figure('Name', 'Result - self-guided filter'); imshow(ScaryImage2);

% gaussian filterd image
ScaryImage3 = imgaussfilt(ScaryImage, 1.5);
figure('Name', 'Result - gaussian filter'); imshow(ScaryImage2);

