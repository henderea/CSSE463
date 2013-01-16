function [kernel, param] = runSVMTests(xTrain, yTrain, xTest, yTest, polyparams, rbfparams)
    amax = 0;
    ctest = size(xTest, 1);
    for(i = 1:size(polyparams,1))
        [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = runSVMTest(xTrain, yTrain, xTest, yTest, 'poly', polyparams(i));
        fprintf('Kernel: poly; Param: %.3f\n', polyparams(i));
        fprintf('True positive: %d/%d; True negative: %d/%d; False positive: %d/%d; False negative: %d/%d\n', ctp, ctest, ctn, ctest, cfp, ctest, cfn, ctest);
        fprintf('TPR: %.2f%%; FPR: %.3f%%; Accuracy: %.3f%%\n\n', ctp/(ctp+cfn)*100, cfp/(cfp+ctn)*100, (ctn+ctp)/ctest*100);
        if(accuracy > amax)
            amax = accuracy;
            kernel = 'poly';
            param = polyparams(i);
        end
    end
    for(i = 1:size(rbfparams,1))
        [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = runSVMTest(xTrain, yTrain, xTest, yTest, 'rbf', rbfparams(i));
        fprintf('Kernel: rbf; Param: %.3f\n', rbfparams(i));
        fprintf('True positive: %d/%d; True negative: %d/%d; False positive: %d/%d; False negative: %d/%d\n', ctp, ctest, ctn, ctest, cfp, ctest, cfn, ctest);
        fprintf('TPR: %.2f%%; FPR: %.3f%%; Accuracy: %.3f%%\n\n', ctp/(ctp+cfn)*100, cfp/(cfp+ctn)*100, (ctn+ctp)/ctest*100);
        if(accuracy > amax)
            amax = accuracy;
            kernel = 'rbf';
            param = polyparams(i);
        end
    end
end