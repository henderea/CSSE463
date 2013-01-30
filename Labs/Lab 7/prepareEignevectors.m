function images = prepareEignevectors(eigvs, rows, cols)
    images = zeros(rows, cols, 3, size(eigvs, 2));
    for i=1:size(eigvs, 2)
        images(:, :, :, i) = reshape(eigvs(:, i), rows, cols, 3);
    end
    images = uint8(images*(255 / max(max(eigvs))));
end