% Same as makeMaskFromHSV except that it will convert to HSV 
% color space prior to building the mask.
function mask = makeMaskFromRGB(img, h, s, v)
    mask = makeMaskFromHSV(rgb2hsv(img), h, s, v)
end