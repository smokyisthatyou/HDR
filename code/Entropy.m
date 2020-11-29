clear; close all;

images = dir('..\test_images\*.tif');
image_names = strcat('..\test_images\',{images.name});
for k=1:numel(images)
  image{k}=imread(image_names{k});
end

for k=1:size(image,2)
    CurrentIm = rgb2ycbcr(image{k});
    %double(CurrentIm);
    %size(CurrentIm)
    YCBCRImages(:,:,k) = CurrentIm(:,:,1); %array con le luminanze delle varie immagini
    %figure('Name', 'YCBCR images'); imshow(YCBCRImages(:,:,k));
    %figure('Name', 'entropy'); 
    %imshow (entroptfilt(YCBCRImages(:,:,k)));
    EntropyImages(:,:,k) = entropyfilt(YCBCRImages(:,:,k)); %array con le immagini entropia calcolate con un quadrato di pixel vicini di grandezza 9 
end
%size(EntropyImages)

numImages = 12;
for k=1:numImages
    ImageVector(:,:,:,k) = image{k};
end

%size(ImageVector)

ScaryImageNotNormalized = sum(EntropyImages.*permute(double(ImageVector),[1,2,4,3]),3)/sum(EntropyImages,3);
size(ScaryImage)

