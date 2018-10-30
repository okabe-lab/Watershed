% This script filters the noise and calculate the center coordinates
% of putative inner / outer hair cells from watershed image 
% made by "Classic Watershed" (plugin for Fiji).
% It takes few minutes for running the script.

% Make new folder for saving results
SubFolderPath = [mainPath '\Results'];
if ~exist(SubFolderPath,'file')
    mkdir(mainPath, '\Results')
end

% Read "watershed" image
watershedIm = uint16(imread3D([mainPath, '\watershed.tif']));

% Get centroid and area from "watershed" image
stats = regionprops(watershedIm, 'centroid', 'area');
centroidList = cat(1,stats.Centroid);
volumeList = cat(1,stats.Area);

% Classifying candidates into IHCs and OHCs based on coordinates on y-axis (proximal-distal axis) 
yCoordLimitForIHCs = 30;
yCoordLimitForOHCs = 50;

% Filtering candidates by their volumes 
volumeThresholdForOHCs = 460;
volumeThresholdForIHCs = 600;

innerCandid = (centroidList(:,2) <= yCoordLimitForOHCs).*(centroidList(:,2) >= yCoordLimitForIHCs);
innerCandid = (volumeList >= volumeThresholdForIHCs).*innerCandid;

outerCandid = (centroidList(:,2) > yCoordLimitForOHCs);
outerCandid = (volumeList >= volumeThresholdForOHCs).*outerCandid;

%% Make excel file with coordinates of detected cells
innerCoords = round(sortrows(centroidList(innerCandid>0,[2 1 3]),2));
outerCoords = round(sortrows(centroidList(outerCandid>0,[2 1 3]),2));

xlswrite([mainPath, '\Results\detectedHairCells.xlsx'], innerCoords, 1);
xlswrite([mainPath, '\Results\detectedHairCells.xlsx'], outerCoords, 2);

%% Make images indicating positions of detected cells

innerImage = zeros(size(watershedIm));
candidLabel = find(innerCandid);
for i = 1:size(candidLabel,1)
    innerImage(watershedIm==candidLabel(i))=1;
end
imwrite3D(innerImage,[mainPath, '\Results\innerImage.tif'])

outerImage = zeros(size(watershedIm));
candidLabel = find(outerCandid);
for i = 1:size(candidLabel,1)
    outerImage(watershedIm==candidLabel(i))=1;
end
imwrite3D(outerImage,[mainPath, '\Results\outerImage.tif'])