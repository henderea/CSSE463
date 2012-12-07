% The whole shebang

function [fruit_masks, fruit_count, fruit_centroids] = fruitFinder(img)
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


    % Create the negative mask
    mask = ~makeMultiMaskFromRGB(img, neg_filters);

    % Create the output containers
    fruit_masks = containers.Map;
    fruit_count = containers.Map;
    fruit_centroids = containers.Map;

    % Create and process the fruit-channel masks
    for key = keys(fruit_filters)
        % Since MATLAB is braindead and the value from keys IS NOT the same
        % type as MATLAB will accept for the map key...
        ckey = char(key);

        % Create/process the mask
        fruit_masks(ckey) = processMask(mask, makeMultiMaskFromRGB(img, fruit_filters(ckey)));

        % Get the basic labeling from bwlabel
        labeled_masks = createRegionMasks(bwlabel(fruit_masks(ckey)));
        
        % Get the average size
        masks_area = mapMasks(labeled_masks, @(x) sum(sum(x)))
        average_size = mean(masks_area)
        filtered_masks = filterMasks(labeled_masks, @(x) (sum(sum(x)) > average_size / 4) & (sum(sum(x)) < average_size * 4));
        fruit_count(ckey) = size(filtered_masks, 3);
    end


end
