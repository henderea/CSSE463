function covar = computeCovarianceMatrix(inMtx)
   scaleMtx = centerImageMatrix(inMtx);
   covar = scaleMtx * scaleMtx'; 
end