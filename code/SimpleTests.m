clear; close all;

Im = imread('minimicrobini.jpg', 'jpg');
figure('Name', 'Original'); imshow(Im);

Im = double(Im);

GrayScaleIm = uint8(Im(:,:,1) .* 0.299 + Im(:,:,2) .* 0.587 + Im(:,:,3) .* 0.114);
figure('Name', 'Grayscaled'); imshow(GrayScaleIm);

HFilter = [0 -1 0; -1 4 -1; 0 -1 0];

ImContrast1 = conv2(double(GrayScaleIm), HFilter);
figure('Name', 'ConstrastSharpen'); imshow(ImContrast1);

LFilter = [1 1 1; 1 -8 1; 1 1 1];
ImContrast2 = filter2(LFilter, double(GrayScaleIm), 'same');
figure('Name', 'ConstrastSharpenLaplacian'); imshow(ImContrast2);


