clear all; close all;

image_vector = read_images("..\test_images\test_images_4\", "tif");

%save images' luminance in a vector
luminance_image_vector = rgb_to_luminance (image_vector);

%calculate entropy images from luminance and save them in a vector
entropy_image_vector = entropy_images(luminance_image_vector);

%weight 
W_normalized = W(entropy_image_vector, luminance_image_vector);

%creation of hdr image
ScaryImage = hdr(W_normalized, image_vector); 

figure('Name', 'Result'); imshow(ScaryImage);


