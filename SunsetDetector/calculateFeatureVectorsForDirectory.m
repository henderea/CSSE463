function vectors = calculateFeatureVectorsForDirectory(dirName, numBlocks)
    files = dir(dirName);
    count = 1;
    for i=1:size(files)
        fn = files(i);
        
        if (~fn.isdir)
            try
                vectors(count,:) = calculateFeatureVector(rgb2lst(imread([dirName filesep fn.name])), numBlocks);
                count = count + 1;
            catch err
                fprintf('Error reading file %s: %s: %s\n', [dirName filesep fn.name], err.identifier, err.message);
            end
        end
    end
end