function [ctp, ctn, cfp, cfn, tpr, fpr, accuracy] = gatherStatistics(testResults, yValues)
    % Matches and false pos/neg
    matches = testResults(testResults == yValues);
    falses = testResults(testResults ~= yValues);

    tp = matches(matches == 1);
    tn = matches(matches == -1);

    fp = falses(falses == 1);
    fn = falses(falses == -1);

    ctp = size(tp, 1);
    ctn = size(tn, 1);

    cfp = size(fp, 1);
    cfn = size(fn, 1);

    ctest = size(yTest, 1);

    tpr = (ctp/(ctp+cfn)) * 100;
    fpr = (cfp/(cfp+ctn)) * 100;
    accuracy = ((ctn+ctp)/ctest) * 100;
end