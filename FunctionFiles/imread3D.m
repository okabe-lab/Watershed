function image2 = imread3D(name,folder)
% This function read image stack

if nargin == 1
    info = imfinfo(name); num_images2 = numel(info);
    Isize2 = size(imread(name));
    image2 = zeros(Isize2(1),Isize2(2),num_images2);  
    for i = 1:num_images2 
        image2(:,:,i) = imread(name, i, 'Info', info);
    end

else
    path = [folder '\' name];
    info = imfinfo(path); num_images2 = numel(info);
    Isize2 = size(imread(path));
    image2 = zeros(Isize2(1),Isize2(2),num_images2);
    for i = 1:num_images2
        image2(:,:,i) = imread(path, i, 'Info', info);
    end
end
end