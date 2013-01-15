function [oxTrain, oxTest] = normalizeVectors(xTrain, xTest)
    m = mean([xTrain; xTest]);
    s = std([xTrain; xTest]);
    
    oxTrain = (xTrain - repmat(m, size(xTrain, 1), 1)) ./ repmat(s, size(xTrain, 1), 1);
    oxTest = (xTest - repmat(m, size(xTest, 1), 1)) ./ repmat(s, size(xTest, 1), 1);
end
