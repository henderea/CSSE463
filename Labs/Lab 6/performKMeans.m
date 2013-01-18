function [clusters, ptassignments] = performKMeans(k, points, iterations, seed)
    % Initialize the clusters
    rand('state', seed);
    clusters = rand(k,4); 
    ptassignments = -ones(2, size(points,1));
    
    % For the number of iterations...
    for i=1:iterations
        for pt_x=1:size(points, 1)
            for pt_y=1:size(points, 2)
                point = points(pt_x, pt_y, :);
                closest_cluster = 1;
                closest_dist = calculateDistance(clusters(:,:,:, 1), point(1,1,:));
                for clust=2:k
                    dist = calculateDistance(clusters(:,:,:, clust), point(1,1,:));
                    if (dist < closest_dist)
                        closest_cluster = k;
                        closest_dist = dist;
                    end
                end
            end
            
            ptassignments(pt) = closest_cluster;
        end
    end
end