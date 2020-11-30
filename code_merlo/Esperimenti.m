clear; close all;

images = dir('..\test_images_3\*.tif');
image_names = strcat('..\test_images_3\',{images.name});
for k=1:numel(images)
  image{k}=imread(image_names{k});
end

for k=1:size(image,2)
    CurrentIm = rgb2gray(image{k});
    %double(CurrentIm);
    %size(CurrentIm)
    %imshow (entroptfilt(YCBCRImages(:,:,k)));
    EntropyImages(:,:,k) = entropyfilt(CurrentIm); %array con le immagini entropia calcolate con un quadrato di pixel vicini di grandezza 9 
    figure('Name', 'EntropyImage');imshow(EntropyImages(:,:,k));
end
%size(EntropyImages)


for k=1:size(image,2)
    ImageVector(:,:,:,k) = image{k};
end

%size(ImageVector)

ScaryImage = uint8(permute(sum(EntropyImages.*permute(double(ImageVector),[1,2,4,3]),3)./sum(EntropyImages,3), [1 2 4 3]));
figure('Name', 'Result'); imshow(ScaryImage(:,:,:,1));
size(ScaryImage)

