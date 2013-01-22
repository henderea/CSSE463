function [clusters, ptassignments] = performKMeans(k, points, iterations, seed)
    % Initialize the clusters
    rand('state', seed);
    clusters = rand(k,3)*255; 
    ptassignments = -ones(size(points, 1), size(points, 2));
    
    % For the number of iterations...
    for i=1:iterations
        for pt_x=1:size(points, 1)
            for pt_y=1:size(points, 2)
                point = reshape(points(pt_x, pt_y, :), 1, 3);
                closest_cluster = 1;
                closest_dist = calculateDistance(clusters(1, :), point);
                for clust=2:k
                    dist = calculateDistance(clusters(clust, :), point);
                    if (dist < closest_dist)
                        closest_cluster = clust;
                        closest_dist = dist;
                    end
                end
                ptassignments(pt_x, pt_y) = closest_cluster;
            end
        end
        
        % Recalculate the cluster means
        for clust=1:k
            idx = 1;
            cluster_points = -ones(1,3);
            for pt_x=1:size(points, 1)
                for pt_y=1:size(points, 2)
                    if ptassignments(pt_x, pt_y) == clust
                        cluster_points(idx,:) = points(pt_x, pt_y, :);
                        idx = idx + 1;
                    end
                end
            end
            clusters(clust,:) = mean(cluster_points);
        end
    end
end