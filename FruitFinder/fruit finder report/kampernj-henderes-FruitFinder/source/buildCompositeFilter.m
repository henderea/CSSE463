function filter = buildCompositeFilter(primary, negate)
    filter = zeros(size(primary, 1) + size(negate, 1), size(primary, 2));
    for i=1:size(primary, 1)
        filter(i,:) = primary(i,:);
    end
    for j=1:size(negate, 1)
        n = negate(i,:);
        filter(i+j,:) = [n(1:6) true];
    end
end