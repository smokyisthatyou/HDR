clear; close all;

images = dir('..\test_images\*.tif');
image_names = strcat('..\test_images\',{images.name});
for k=1:numel(images)
  image{k}=imread(image_names{k});
end

% for i=1:12
%     image{i} = imread(strcat("C:/Users/fraro/Desktop/esempi_matlab/hdr1/image",int2str(i),".tif"));
% end

HFilter = [0 -1 0; -1 4 -1; 0 -1 0];

for k=1:size(image,2)
    
    CurrentIm = image{k};
    double(CurrentIm);
    GrayScaleIm(:,:,k) = uint8(CurrentIm(:,:,1) .* 0.299 + CurrentIm(:,:,2) .* 0.587 + CurrentIm(:,:,3) .* 0.114);
%     figure('Name', 'Grayscaled'); imshow(GrayScaleIm);

    ImContrast(:,:,k) = conv2(double(GrayScaleIm(:,:,k)), HFilter);
    
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
% ImResult = max(zeros(width, height, numImages), -(pos3DMatrix - BestContrastIndex).^2 + 1);
ImResult = max(zeros(width, height, numImages), min(pos3DMatrix - BestContrastIndex,
                                                BestContrastIndex - pos3DMatrix));

% Characteristic = zeros(size(ImContrast));
% Characteristic = Characteristic + 1.*
