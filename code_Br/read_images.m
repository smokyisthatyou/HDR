function image_vector = read_images(folder_name, extension)
    path = strcat(folder_name, strcat("*.", extension));
    images = dir(path);
    image_names = strcat(folder_name,{images.name});
    for k=1:numel(images)
        cell_images{k}=imread(image_names{k});
    end
    for k=1:size(cell_images,2)
        image_vector(:,:,:,k) = cell_images{k};
    end
end