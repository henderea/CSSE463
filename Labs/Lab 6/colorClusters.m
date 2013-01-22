function colored_img = colorClusters(means, assignments)
    colored_img = zeros(size(assignments, 1), size(assignments, 2), size(means, 2));
    for i = 1:size(means, 1)
        [rows, cols] = find(assignments == i);
        for j = 1:size(rows, 1)
            colored_img(rows(j), cols(j), :) = means(i, :);
        end
    end
    colored_img = uint8(colored_img);
end