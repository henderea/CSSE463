function mask_params = maskFromRGBSelection(img)
    [h,s,v,mask] = selectHSVRegion(img);
    mask(7) = 0;
    mask_params = mask;
    
    % Now, show the region
    imshow(img .* uint8(repmat(makeMultiMaskFromRGB(img, mask_params), [1 1 3])));
end