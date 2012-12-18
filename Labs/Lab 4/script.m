% Open the image
img = imread('images/shapes.png');

% Run bwlabel and split into separate masks for each shape
shapes = createRegionMasks(bwlabel(img, 4));

elong = zeros(size(shapes, 3), 1);
c1 = zeros(size(shapes, 3), 1);
c2 = zeros(size(shapes, 3), 1);

% Calculate and print the results for elongation and circularity
for i=1:size(shapes, 3)
    elong(i) = calculateElongation(shapes(:,:,i));
    [c1(i) c2(i)] = getCircularity(shapes(:,:,i));
    fprintf('Shape %d: Elongation: %f; C1: %f; C2: %f\n', i, elong(i), c1(i), c2(i));
end
