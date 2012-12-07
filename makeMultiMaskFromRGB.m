function mask = makeMultiMaskFromRGB(img, mask_params)
    mask = makeMultiMaskFromHSV(rgb2hsv(img), mask_params)
end
