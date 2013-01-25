function centeredMatrix = centerImageMatrix(imgmat)
    meanImg = meanImage(imgmat);
    centeredMatrix = imgmat - repmat(meanImg, 1, size(imgmat, 2));
end