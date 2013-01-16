function [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = runSVMTest(xTrain, yTrain, xTest, yTest, kernel, param)
    net = svm(size(xTrain, 2), kernel, [param], 10);
    net = svmtrain(net, xTrain, yTrain);
    
    testResults = svmfwd(net, xTest);
    [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = gatherStatistics(testResults, yTest);
end