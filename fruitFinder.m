% The whole shebang

% function [fruit_mask fruit_count fruit_centroids] = fruitFinder(img)
function [fruit_mask] = fruitFinder(img)
neg_filters = [0 1 0.275 0.425 0.1 0.45 false;
               0.15 0.45 0.0 0.9 0.0 0.225 false;
               0.1 0.275 0.125 0.35 0.0 1.0 false;
              ];

banana_filter = [0.125 0.225 0.65 0.8 0.6 1.0 false];
apple_filter = [0.925 0.1 0.6 1.01 0.05 0.5 false];
orange_filter = [0.0775 0.1071 0.8107 0.9152 0.5977 0.8256 false];

% Create the negative mask
mask = ~makeMultiMaskFromRGB(img, neg_filters);

% Create and process the fruit-channel masks
banana_mask = processMask(mask, makeMultiMaskFromRGB(img, banana_filter));
apple_mask = processMask(mask, makeMultiMaskFromRGB(img, apple_filter));
orange_mask = processMask(mask, makeMultiMaskFromRGB(img, orange_filter));




% Create the output
fruit_mask = zeros(size(img, 1), size(img, 2), 3);
fruit_mask(:,:,1) = apple_mask;
fruit_mask(:,:,2) = banana_mask;
fruit_mask(:,:,3) = orange_mask;

end
