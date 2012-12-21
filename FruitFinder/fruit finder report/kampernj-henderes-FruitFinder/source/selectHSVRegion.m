% Select a region and returns the min/max Hue, Saturation, and Value

% Image is RGB! 
function [h,s,v,stdmask] = selectHSVRegion(image)
    figure, imshow(image); 
    reg = impoly; 
    wait(reg);
    mask = reg.createMask;
    % Process the mask
    hsvimg = rgb2hsv(image);
    masked_img = hsvimg .* double(repmat(mask, [1 1 3]));
    h = hsvimg(:,:,1);
    s = hsvimg(:,:,2);
    v = hsvimg(:,:,3);


    h_masked = h(mask == 1);
    s_masked = s(mask == 1);
    v_masked = v(mask == 1);
    h = [min(h_masked(:)) mean(h_masked(:)) std(h_masked(:)) max(h_masked(:))];
    s = [min(s_masked(:)) mean(s_masked(:)) std(s_masked(:)) max(s_masked(:))];
    v = [min(v_masked(:)) mean(v_masked(:)) std(v_masked(:)) max(v_masked(:))];
    stdmask = [mean(h_masked(:)) - std(h_masked(:)) mean(h_masked(:)) + std(h_masked(:)) mean(s_masked(:)) - std(s_masked(:)) mean(s_masked(:)) + std(s_masked(:)) mean(v_masked(:)) - std(v_masked(:)) mean(v_masked(:)) + std(v_masked(:))];
    % Show the mask, masked image, and histograms
    figure, imshow(mask); figure, imshow(hsv2rgb(masked_img));
    figure, imhist(h_masked);
    figure, imhist(s_masked);
    figure, imhist(v_masked);

end



