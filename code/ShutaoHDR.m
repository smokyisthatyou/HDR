clear; close all;

% images = dir('C:/Users/fraro/Desktop/esempi_matlab/hdr1/*.tif');
% images = {images.name};
% for k=1:numel(images)
%   Im{k}=imread(images{k})
% end

for i=1:12
    image{i} = imread(strcat("C:/Users/fraro/Desktop/esempi_matlab/hdr1/image",int2str(i),".tif"));
end

HFilter = [0 -1 0; -1 4 -1; 0 -1 0];

for i=1:12
    Im = double(image{i});

    GrayScaleIm{i} = uint8(Im(:,:,1) .* 0.299 + Im(:,:,2) .* 0.587 + Im(:,:,3) .* 0.114);
%     figure('Name', 'Grayscaled'); imshow(GrayScaleIm);

    ImContrast{i} = conv2(double(GrayScaleIm), HFilter);
%     figure('Name', 'ConstrastSharpen'); imshow(ImContrast1);

%     LFilter = [1 1 1; 1 -8 1; 1 1 1];
%     ImContrast2 = filter2(LFilter, double(GrayScaleIm), 'same');
%     figure('Name', 'ConstrastSharpenLaplacian'); imshow(ImContrast2);
end

GrayScale(:,:,1)

