% toyProblem.m
% Written by Matthew Boutell, 2006.
% Feel free to distribute at will.
function toyProblem()
clear all;

% We fix the seeds so the data sets are reproducible
seedTrain = 137;
seedTest = 138;
% This tougher data set is commented out.
[xTrain, yTrain] = GenerateGaussianDataSet(seedTrain);
[xTest, yTest] = GenerateGaussianDataSet(seedTest);

% This one isn't too bad at all
%[xTrain, yTrain] = GenerateClusteredDataSet(seedTrain);
%[xTest, yTest] = GenerateClusteredDataSet(seedTest);


% Train the SVM

net = svm(size(xTrain, 2), 'poly', [2], 10);
%net = svm(size(xTrain, 2), 'rbf', [10], 10);
net = svmtrain(net, xTrain, yTrain);

% Run the SVM on the test data
testResults = svmfwd(net, xTest);

% Matches and false pos/neg
matches = testResults(testResults == yTest);
falses = testResults(testResults ~= yTest);

tp = matches(matches == 1);
tn = matches(matches == -1);

fp = falses(falses == 1);
fn = falses(falses == -1);

ctp = size(tp, 1);
ctn = size(tn, 1);

cfp = size(fp, 1);
cfn = size(fn, 1);

ctest = size(yTest, 1);

fprintf('True positive: %d/%d; True negative: %d/%d; False positive: %d/%d; False negative: %d/%d\n', ctp, ctest, ctn, ctest, cfp, ctest, cfn, ctest);
fprintf('TPR: %.2f%%; FPR: %.2f%%; Accuracy: %.2f%%\n', ctp/(ctp+cfn)*100, cfp/(cfp+ctn)*100, (ctn+ctp)/ctest*100);

% Plot against the test data the SVM boundaries.
plotboundary(net, [0,20], [0,20]);

