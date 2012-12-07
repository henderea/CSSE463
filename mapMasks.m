function out = mapMasks(input_masks, func)
    out = zeros(size(input_masks, 3), 1);
    for i=1:size(input_masks, 3)
        out(i) = func(input_masks(:,:,i));
    end
end