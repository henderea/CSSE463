function dist = calculateDistance(a, b)
    dist = 0;
    for i=1:size(a, 2)
        dist = dist + ((b(i) - a(i)) * (b(i) - a(i)));
    end
    dist = sqrt(double(dist));
end