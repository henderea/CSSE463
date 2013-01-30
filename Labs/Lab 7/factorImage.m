function [a, b, c, rimg] = factorImage(evcts, imgs, ind, rows, cols)
    a = evcts(:,1)' * imgs(:,ind);
    b = evcts(:,2)' * imgs(:,ind);
    c = evcts(:,3)' * imgs(:,ind);
    rimg = uint8(reshape((a*evcts(:,1)+b*evcts(:,2)+c*evcts(:,3)), rows, cols, 3));
end