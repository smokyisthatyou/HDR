clear; close all;

images = dir('..\test_images\*.tif');
image_names = strcat('..\test_images\',{images.name});
for k=1:numel(images)
  image{k}=imread(image_names{k});
end

% for i=1:12
%     image{i} = imread(strcat("C:/Users/fraro/Desktop/esempi_matlab/hdr1/image",int2str(i),".tif"));
% end


% LOCAL CONTRAST


HFilter = [0 -1 0; -1 4 -1; 0 -1 0];

for k=1:size(image,2)
    
    CurrentIm = image{k};
    double(CurrentIm);
    GrayScaleIm(:,:,k) = uint8(CurrentIm(:,:,1) .* 0.299 + CurrentIm(:,:,2) .* 0.587 + CurrentIm(:,:,3) .* 0.114);
%     figure('Name', 'Grayscaled'); imshow(GrayScaleIm);

    ImC(:,:,k) = conv2(double(GrayScaleIm(:,:,k)), HFilter);
    ImContrast = ImC(2:end-1,2:end-1,:); %removes zero-padding from filter2
%     size(ImContrast)
    
%     figure('Name', 'ConstrastSharpen'); imshow(ImContrast1);

%     LFilter = [1 1 1; 1 -8 1; 1 1 1];
%     ImContrast2 = filter2(LFilter, double(GrayScaleIm), 'same');
%     figure('Name', 'ConstrastSharpenLaplacian'); imshow(ImContrast2);
end
width = size(ImContrast,1);
height = size(ImContrast,2);
numImages = size(ImContrast,3);

[BestContrast, BestContrastIndex] = max(ImContrast, [], 3);
posVector = (1:numImages)';
pos3DMatrix = permute(zeros(numImages, height, width) + posVector, [3 2 1]);
% size(pos3DMatrix)
ImBinContrast = max(0, -(pos3DMatrix - BestContrastIndex).^2 + 1);
% ImBinContrast = max(zeros(width, height, numImages), -(pos3DMatrix - BestContrastIndex).^2 + 1);
% figure('Name', 'Image 1: Binary Local Best Contrast 1'); imshow(ImBinContrast(:,:,1));
% figure('Name', 'Image 7: Binary Local Best Contrast 7'); imshow(ImBinContrast(:,:,7));
% figure('Name', 'Image 12: Binary Local Best Contrast 12'); imshow(ImBinContrast(:,:,12));
% ImResult = max(zeros(width, height, numImages), min(pos3DMatrix - BestContrastIndex,
%                                                 BestContrastIndex - pos3DMatrix));

% BRIGHTNESS

T = 10;
T1 = 255 - T;
GrayScaleIm1 = double(GrayScaleIm);
ImBrightness = GrayScaleIm1 ./ sum(GrayScaleIm1,3);

% ImBinBrightness = min(1, max(0, GrayScaleIm1 - T)) .* min(1, max(0, T1 - GrayScaleIm1));
% figure('Name', 'Image 1: Binary Brightness 1'); imshow(ImBinBrightness(:,:,1));
% figure('Name', 'Image 7: Binary Brightness 7'); imshow(ImBinBrightness(:,:,7));
% figure('Name', 'Image 12: Binary Brightness 12'); imshow(ImBinBrightness(:,:,12));
% size(ImBinContrast)
% size(ImBinBrightness)
% size(image{1})

for k=1:numImages
    ImageVector(:,:,:,k) = image{k};
end

size(ImageVector)
W = double(ImBinContrast) + ImBrightness;
Wnormalized = W ./ sum(W,3);
% figure('Name', 'Image 1: Binary Brightness 1'); imshow(W(:,:,1));
% figure('Name', 'Image 7: Binary Brightness 7'); imshow(W(:,:,7));
% figure('Name', 'Image 12: Binary Brightness 12'); imshow(W(:,:,12));
ScaryImage = uint8(permute(sum(Wnormalized .* permute(double(ImageVector), [1 2 4 3]), 3), [1 2 4 3]));
size(ScaryImage)
% figure('Name', 'Image 1: Binary 1'); imshow(ScaryImage(:,:,:,1));
% figure('Name', 'Image 7: Binary 7'); imshow(ScaryImage(:,:,:,7));
% figure('Name', 'Image 12: Binary 12'); imshow(ScaryImage(:,:,:,12));

% 
% figure('Name', 'Image 1: Binary 1'); imshow(W(:,:,1));
% figure('Name', 'Image 7: Binary 7'); imshow(W(:,:,7));
% figure('Name', 'Image 12: Binary 12'); imshow(W(:,:,12));

figure('Name', 'Blended'); imshow(ScaryImage);

Filtered = imgdiffusefilt(ScaryImage);

figure('Name', 'Filtered'); imshow(Filtered);


