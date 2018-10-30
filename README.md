
Matlab scripts for analyzing images of cleared cochlea immunostained with anti-MYO7A antibody (hair cell marker).
_____________________________________________________________________________________________

This program needs:
  - Matlab (R2017b or newer version)
  - Fiji (https://fiji.sc/)
  - "CLASSIC WATERSHED" plugin for Fiji (https://imagej.net/Classic_Watershed) 
    * Please install this plugin in advance. 

Data size:
  Total          48 MB
    - Program     6 KB
    - Test data  48 MB
_____________________________________________________________________________________________

For testing the program, please run the scripts/macro as follows:
  1. Run "Watershed_main1.m" on Matlab, which calculates a threshold value.
  2. Open "Watershed_main2 (macro for Fiji).txt".
  3. Make sure that "threshold" value in line 2 is the same as the value calculated in step 1.
  4. Close "Watershed_main2 (macro for Fiji).txt"
  5. Start Fiji and open "linearizedIm2.tif".
  6. Run "Watershed_main2 (macro for Fiji).txt" on Fiji.
  7. Save resulting "watershed.tif" file.
  8. Run "Watershed_main3.m" on Matlab.

It takes ~5 minutes for running all the scripts on PC with:
   Windows 10 Home,
   Inter Core i7-6700 CPU @ 3.40GHz,
   16.0GB RAM.

Following result files will be saved in "..\Results":
  - "innerImage.tif", "outerImage.tif"   (Images indicating detected cells)
  - "detectedHairCells.xlsx"       (Coordinates of detected cells. Sheet1:IHCs, Sheet2:OHCs)
_____________________________________________________________________________________________

October 30, 2018

Tadatsune Iida
Department of Cellular Neurobiology,
Graduate School of Medicine, University of Tokyo
Email: tadiida@m.u-tokyo.ac.jp

Shigeo Okabe
Department of Cellular Neurobiology,
Graduate School of Medicine, University of Tokyo
Email: okabe@m.u-tokyo.ac.jp