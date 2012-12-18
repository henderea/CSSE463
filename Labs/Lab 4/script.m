% Open the image
img = imread('images/shapes.png');

% Run bwlabel and split into separate masks for each shape
shapes = createRegionMasks(bwlabel(img, 4));

% Calculate and print the results for elongation and circularity
for i=1:size(shapes, 3)
    elong = calculateElongation(shapes(:,:,i));
end