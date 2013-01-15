function vector = calculateFeatureVector(src, numBlocks)
    % Takes in an LST image and returns a set of the 294 feature
    % vectors
    x_segment = uint32(floor(size(src, 1) / numBlocks));
    y_segment = uint32(floor(size(src, 2) / numBlocks));
    
    vector = zeros(numBlocks*numBlocks*6, 1);

    for i=1:numBlocks
        for j=1:numBlocks
            idx = ((((i - 1) * numBlocks) + j - 1) * 6) + 1;
            beginX = (x_segment * (i - 1) + 1);
            endX = (x_segment * i);
            beginY = (y_segment * (j - 1) + 1);
            endY = (y_segment * j);
            
            fprintf('Region: %d-%d, %d-%d on %dx%d', beginX, endX, beginY, endY, size(src, 1), size(src, 2));
            
            % Separate out the regions for L/S/T bands
            LReg = src(beginX:endX, beginY:endY, 1);
            SReg = src(beginX:endX, beginY:endY, 2);
            TReg = src(beginX:endX, beginY:endY, 3);
            
            % Create the vector
            vector(idx) = mean(LReg(:));
            vector(idx + 1) = std(double(LReg(:)));
            vector(idx + 2) = mean(SReg(:));
            vector(idx + 3) = std(double(SReg(:)));
            vector(idx + 4) = mean(TReg(:));
            vector(idx + 5) = std(double(TReg(:)));
        end
    end
    
end