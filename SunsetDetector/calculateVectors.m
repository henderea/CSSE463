function [x, y] = calculateVectors(numBlocks)
    xa = calculateFeatureVectorsForDirectory('GivenImages/TrainSunset', numBlocks);
    xb = calculateFeatureVectorsForDirectory('GivenImages/TrainNonsunsets', numBlocks);
    xc = calculateFeatureVectorsForDirectory('GivenImages/TestSunset', numBlocks);
    xd = calculateFeatureVectorsForDirectory('GivenImages/TestNonsunsets', numBlocks);
    
    ya = ones(size(xa,1),1);
    yb = -ones(size(xb,1),1);
    yc = ones(size(xc,1),1);
    yd = -ones(size(xd,1),1);
    
    x = [xa; xb; xc; xd];
    y = [ya; yb; yc; yd];
end
    