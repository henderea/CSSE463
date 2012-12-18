function [c1, c2] = getCircularity(mask)
    [r, c] = find(mask == 1);
    area = size(r,1);
    boundary = bwtraceboundary(mask, [r(1), c(1)], 'W', 8);
    br = boundary(:,1);
    bc = boundary(:,2);
    rbar = mean(r);
    cbar = mean(c);
    n = size(br,1);
    ur = br - rbar;
    uc = bc - cbar;
    u = sum(sqrt(ur.^2+uc.^2))/n;
    o = sqrt(sum((sqrt(ur.^2+uc.^2)-u).^2)/n);
    c2 = u/o;
    br(end+1) = br(1);
    bc(end+1) = bc(1);
    pr = (br(2:end)-br(1:end-1));
    pc = (bc(2:end)-bc(1:end-1));
    p = sqrt(pr.^2+pc.^2);
    perimeter = sum(p);
    c1 = (perimeter*perimeter)/area;
end