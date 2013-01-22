function colored_img = colorClusters(means, assignments)
    colored_img = zeros(size(assignments, 1), size(assignments, 2), size(means, 2));
    for i = 1:size(means, 1) % k
        [px, py] = find(assignments == i);
        for j=1:size(px)
            
        colored_img(px(j), py(j), 1) = means(i, 1);
        colored_img(px(j), py(j), 2) = means(i, 2);
        colored_img(px(j), py(j), 3) = means(i, 3);
        end
    end
    colored_img = uint8(colored_img);
end