function c = calculateCoefficients(evcts, imgs)
    for i=1:size(imgs, 2)
        c(i,1) = evcts(:,1)' * imgs(:,i);
        c(i,2) = evcts(:,2)' * imgs(:,i);
        c(i,3) = evcts(:,3)' * imgs(:,i);
    end
end