% The whole shebang

% function [fruit_mask fruit_count fruit_centroids] = fruitFinder(img)
function [fruit_masks] = fruitFinder(img)
neg_filters = [0 1 0.275 0.425 0.1 0.45 false;
               0.15 0.45 0.0 0.9 0.0 0.225 false;
               0.1 0.275 0.125 0.35 0.0 1.0 false;
              ];

banana_filter = [0.12 0.25 0.5 1.0 0.45 1.0 false];
apple_filter = [0.925 0.1 0.6 1.0 0.05 0.5 false];
orange_filter = [0.06 0.11 0.6 1.0 0.5 0.95 false];

fruits = {'banana';'apple'; 'orange'};
list_fruitmask = {banana_filter; apple_filter; orange_filter};
fruit_filters = containers.Map(fruits, list_fruitmask);
fruit_masks = containers.Map;

% Create the negative mask
mask = ~makeMultiMaskFromRGB(img, neg_filters);

% Create and process the fruit-channel masks
for key = keys(fruit_filters)
    ckey = char(key);
    fruit_masks(ckey) = processMask(mask, makeMultiMaskFromRGB(img, fruit_filters(ckey)));
end


end
