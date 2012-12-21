%make a single mask
function mask = makeMask(img,h,s,v)
mask = zeros(size(img,1),size(img,2));
imghsv = rgb2hsv(img);
if(h(1) > h(2) && s(1) > s(2) && v(1) > v(2))
    mask((imghsv(:,:,1) > h(1) | imghsv(:,:,1) < h(2)) & (imghsv(:,:,2) > s(1) | imghsv(:,:,2) < s(2)) & (imghsv(:,:,3) > v(1) | imghsv(:,:,3) < v(2))) = 1;
elseif(h(1) > h(2) && s(1) > s(2))
    mask((imghsv(:,:,1) > h(1) | imghsv(:,:,1) < h(2)) & (imghsv(:,:,2) > s(1) | imghsv(:,:,2) < s(2)) & (imghsv(:,:,3) > v(1) & imghsv(:,:,3) < v(2))) = 1;
elseif(h(1) > h(2) && v(1) > v(2))
    mask((imghsv(:,:,1) > h(1) | imghsv(:,:,1) < h(2)) & (imghsv(:,:,2) > s(1) & imghsv(:,:,2) < s(2)) & (imghsv(:,:,3) > v(1) | imghsv(:,:,3) < v(2))) = 1;
elseif(s(1) > s(2) && v(1) > v(2))
    mask((imghsv(:,:,1) > h(1) & imghsv(:,:,1) < h(2)) & (imghsv(:,:,2) > s(1) | imghsv(:,:,2) < s(2)) & (imghsv(:,:,3) > v(1) | imghsv(:,:,3) < v(2))) = 1;
elseif(h(1) > h(2))
    mask((imghsv(:,:,1) > h(1) | imghsv(:,:,1) < h(2)) & (imghsv(:,:,2) > s(1) & imghsv(:,:,2) < s(2)) & (imghsv(:,:,3) > v(1) & imghsv(:,:,3) < v(2))) = 1;
elseif(s(1) > s(2))
    mask((imghsv(:,:,1) > h(1) & imghsv(:,:,1) < h(2)) & (imghsv(:,:,2) > s(1) | imghsv(:,:,2) < s(2)) & (imghsv(:,:,3) > v(1) & imghsv(:,:,3) < v(2))) = 1;
elseif(v(1) > v(2))
    mask((imghsv(:,:,1) > h(1) & imghsv(:,:,1) < h(2)) & (imghsv(:,:,2) > s(1) & imghsv(:,:,2) < s(2)) & (imghsv(:,:,3) > v(1) | imghsv(:,:,3) < v(2))) = 1;
else
    mask((imghsv(:,:,1) > h(1) & imghsv(:,:,1) < h(2)) & (imghsv(:,:,2) > s(1) & imghsv(:,:,2) < s(2)) & (imghsv(:,:,3) > v(1) & imghsv(:,:,3) < v(2))) = 1;
end