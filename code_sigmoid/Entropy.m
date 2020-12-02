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
    GrayImages(:,:,k) = double(CurrentIm); %array con le luminanze delle varie immagini
    %figure('Name', 'YCBCR images'); imshow(YCBCRImages(:,:,k));
    %figure('Name', 'entropy'); 
    %imshow (entroptfilt(YCBCRImages(:,:,k)));
    EntropyImages(:,:,k) = entropyfilt(GrayImages(:,:,k)); %array con le immagini entropia calcolate con un quadrato di pixel vicini di grandezza 9 
end
sum(EntropyImages(:,300,:),3)
EntropyWeights = EntropyImages;
LuminanceWeights = GrayImages ./ sum(GrayImages,3);
% sum(EntropyWeights,3)
% sum(LuminanceWeights,3)
%size(EntropyImages)


for k=1:size(image,2)
    ImageVector(:,:,:,k) = image{k};
end

%size(ImageVector)
Weights = max(EntropyWeights,LuminanceWeights);
ScaryImage = uint8(permute(sum(Weights .*permute(double(ImageVector),[1,2,4,3]),3)./sum(Weights,3), [1 2 4 3]));
figure('Name', 'Result'); imshow(ScaryImage(:,:,:,1));
size(ScaryImage)

