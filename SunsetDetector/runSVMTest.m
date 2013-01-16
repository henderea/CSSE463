function [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = runSVMTest(xTrain, yTrain, xTest, yTest, kernel, param)
    net = svm(size(xTrain, 2), kernel, param, 10);
    net = svmtrain(net, xTrain, yTrain);
    
    [testResults,y1] = svmfwd(net, xTest);
    y1b = (y1 - repmat(mean(y1), size(y1,1), size(y1, 2))) / std(y1);
    y1c = ones(size(y1b));
    y1c(y1b < 0) = -1;
    [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = gatherStatistics(y1c, yTest);
end