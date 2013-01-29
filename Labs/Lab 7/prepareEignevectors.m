function images = prepareEignevectors(eigvs, rows, cols)
    images = zeros(rows, cols, 3, size(eigvs, 2));
    for i=1:size(eigvs, 2)
        images(:, :, :, i) = reshape(eigvs(:, i), rows, cols, 3)*255;
    end
    images = uint8(images);
end