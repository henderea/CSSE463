function pt = getCentroid(mask)
    fnd = find(mask == 1);
    t_x = 0;
    t_y = 0;
    for i=1:size(fnd,1)
        [p_x,p_y] = getRowCol(fnd(i),mask);
        t_x = t_x + p_x;
        t_y = t_y + p_y;
    end
    c_x = t_x/size(fnd,1);
    c_y = t_y/size(fnd,1);
    pt = [c_x c_y];
end