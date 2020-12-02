clear all; close all;

% save multi-exposed images in a vector
image_vector = read_images("..\test_images\test_images_4\", "tif");

% save luminance images in a vector
luminance_image_vector = rgb_to_luminance (image_vector);

% calculate entropy images from luminance and save them in a vector
entropy_image_vector = entropy_images(luminance_image_vector);

% calculate normalized weights with entropy and luminance
W = entropy_image_vector .* (size(entropy_image_vector,3) / 2 .* luminance_image_vector);
W_normalized = W ./ sum(W,3);

% creation of hdr image
ScaryImage = hdr(W_normalized, image_vector); 
figure('Name', 'Result'); imshow(ScaryImage);


