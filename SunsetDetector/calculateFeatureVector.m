function vector = calculateFeatureVector(src)
    % Takes in an LST image and returns a set of the 294 feature
    % vectors
    x_segment = uint32(floor(size(src, 1) / 7));
    y_segment = uint32(floor(size(src, 2) / 7));
    
    vector = zeros(294, 1);

    for i=1:7
        for j=1:7
            idx = ((((i - 1) * 7) + j - 1) * 6) + 1;
            fprintf('Region: %d-%d, %d-%d on %dx%d', (x_segment * (i - 1) + 1), (x_segment * (i)), (y_segment * (j - 1) + 1), (y_segment * j), size(src, 1), size(src, 2));
            LReg = src((x_segment * (i - 1) + 1):(x_segment * (i)), (y_segment * (j - 1) + 1):(y_segment * j), 1);
            SReg = src((x_segment * (i - 1) + 1):(x_segment * (i)), (y_segment * (j - 1) + 1):(y_segment * j), 2);
            TReg = src((x_segment * (i - 1) + 1):(x_segment * (i)), (y_segment * (j - 1) + 1):(y_segment * j), 3);
            vector(idx) = mean(LReg(:));
            vector(idx + 1) = std(double(LReg(:)));
            vector(idx + 2) = mean(SReg(:));
            vector(idx + 3) = std(double(SReg(:)));
            vector(idx + 4) = mean(TReg(:));
            vector(idx + 5) = std(double(TReg(:)));
        end
    end
    
end