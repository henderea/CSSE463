function [row,col] = getRowCol(cov,img)
    col = floor(cov / size(img,1));
    row = cov - col*size(img,1);
end