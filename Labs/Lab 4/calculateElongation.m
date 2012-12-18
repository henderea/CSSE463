function elong = calculateElongation(mask)
    evs = eig(calculateCovarianceMatrix(mask));
    elong = sqrt(max(evs) / min(evs));
end