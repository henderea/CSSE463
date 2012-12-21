function masks = createRegionMasks(mask)
    masks = zeros(size(mask, 1), size(mask, 2), max(max(mask)));
    for i=1:max(max(mask))
        m = zeros(size(mask, 1), size(mask, 2));
        m(mask == i) = 1;
        masks(:,:,i) = m;
    end
end