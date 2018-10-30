% This script calculates threshold for "Classic Watershed" (plugin for Fiji)

mainPath = fileparts(mfilename('fullpath')); % Get fullpath of this script
cd(mainPath)
addpath('.\FunctionFiles')

imageName = 'linearizedIm2.tif';
adjustmentParameter = 0.5; % The lager value makes the smaller positive area 
                           % in result image of "Classic Watershed" plugin

image = imread3D([folder, '\linearizedIm2.tif']);
isAbove0 = image(image>0); % Remove values outside the original image from the calculation 
tempThreshold = multithresh(isAbove0); % Auto threshold with Otsu's method
% Invert the value as "Classic Watershed" plugin uses an inverted image
threshold = round(max(image(:)) - tempThreshold * 0.5) 



