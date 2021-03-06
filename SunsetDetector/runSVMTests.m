function [kernel, param] = runSVMTests(xTrain, yTrain, xTest, yTest, polyparams, rbfparams)
    amax = 0;
    ctest = size(xTest, 1);
    [oxTrain, oxTest] = normalizeVectors(xTrain, xTest);
    for(i = 1:size(polyparams,2))
        [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = runSVMTest(oxTrain, yTrain, oxTest, yTest, 'poly', polyparams(i));
        fprintf('Kernel: poly; Param: %.3f\n', polyparams(i));
        fprintf('True positive: %d/%d; True negative: %d/%d; False positive: %d/%d; False negative: %d/%d\n', ctp, ctest, ctn, ctest, cfp, ctest, cfn, ctest);
        fprintf('TPR: %.2f%%; FPR: %.2f%%; Accuracy: %.2f%%\n\n', tpr, fpr, accuracy);
        if(accuracy > amax)
            amax = accuracy;
            kernel = 'poly';
            param = polyparams(i);
        end
    end
    for(i = 1:size(rbfparams,2))
        [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = runSVMTest(oxTrain, yTrain, oxTest, yTest, 'rbf', rbfparams(i));
        fprintf('Kernel: rbf; Param: %.3f\n', rbfparams(i));
        fprintf('True positive: %d/%d; True negative: %d/%d; False positive: %d/%d; False negative: %d/%d\n', ctp, ctest, ctn, ctest, cfp, ctest, cfn, ctest);
        fprintf('TPR: %.2f%%; FPR: %.2f%%; Accuracy: %.2f%%\n\n', tpr, fpr, accuracy);
        if(accuracy > amax)
            amax = accuracy;
            kernel = 'rbf';
            param = rbfparams(i);
        end
    end
end