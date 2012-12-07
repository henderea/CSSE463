function masks = filterMasks(input_masks, predicate)
    count = 1;
    for i=1:size(input_masks, 3)
        mask = input_masks(:,:,i);
        if predicate(mask) == true
            masks(:,:,count) = mask;
            count = count + 1;
        end
    end
end