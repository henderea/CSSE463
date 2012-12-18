function mtx = calculateCovarianceMatrix(mask)
   % I'm lazy and I'm going to do this the lazy way...
   [r,c] = find(mask == 1);
   mtx(1,1) = sum((c - mean(c)) .^2) / sum(sum(mask));
   mtx(2,2) = sum((r - mean(r)) .^2) / sum(sum(mask));
   mtx(1,2) = sum((c - mean(c)) .* (r - mean(r))) / sum(sum(mask));
   mtx(2,1) = mtx(1,2);
end