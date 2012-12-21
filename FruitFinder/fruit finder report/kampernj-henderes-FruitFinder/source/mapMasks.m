function out = mapMasks(input_masks, out_size, func)
    out = zeros(size(input_masks, 3), out_size);
    for i=1:size(input_masks, 3)
        out(i,:) = func(input_masks(:,:,i));
    end
end