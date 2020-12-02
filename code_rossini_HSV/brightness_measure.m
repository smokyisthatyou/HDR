function HSV_normalized_measures = brightness_measure(HSV_iv)
    HSV_normalized_measures = HSV_iv(:,:,3,:) ./ sum(HSV_iv,3);
end