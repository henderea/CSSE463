function [xTrain, yTrain, xTest, yTest] = calculateVectors(numBlocks)
    xa = calculateFeatureVectorsForDirectory('GivenImages/TrainSunset', numBlocks);
    xb = calculateFeatureVectorsForDirectory('GivenImages/TrainNonsunsets', numBlocks);
    xc = calculateFeatureVectorsForDirectory('GivenImages/TestSunset', numBlocks);
    xd = calculateFeatureVectorsForDirectory('GivenImages/TestNonsunsets', numBlocks);
    
    ya = ones(size(xa,1),1);
    yb = -ones(size(xb,1),1);
    yc = ones(size(xc,1),1);
    yd = -ones(size(xd,1),1);
    
    xTrain = [xa; xb];
    xTest = [xc; xd];
    yTrain = [ya; yb];
    yTest = [yc; yd];
end
    