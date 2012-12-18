% Open the image
img = imread('images/shapes.png');

% Run bwlabel and split into separate masks for each shape
shapes = createRegionMasks(bwlabel(img, 4));