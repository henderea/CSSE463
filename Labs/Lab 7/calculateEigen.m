function [evcts, evls] = calculateEigen(cvMtx)
[evcts, evls] = eigs(cvMtx, 10);
end