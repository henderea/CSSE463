function mask = processMask(bg_mask, fg_mask)
    mask = bg_mask & fg_mask;
    mask = medfilt2(mask,[5,5]);
    mask = imclose(mask, strel('diamond',3));
end