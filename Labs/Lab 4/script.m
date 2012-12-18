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
    class = 'ellipse';
    if(c2(i) > 25)
        class = 'circle';
    elseif(elong(i) < 1.05)
        class = 'square';
    elseif(c1(i) > 20)
        class = 'rectangle';
    end
    fprintf('Shape %d: Elongation: %f; C1: %f; C2: %f; classification: %s\n', i, elong(i), c1(i), c2(i), class);
end
