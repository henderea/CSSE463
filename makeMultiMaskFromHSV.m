% In this case, mask_params is a 2D matrix of all of the filter
% parameters, h_min h_max s_min s_max v_min v_max in each row.
function mask = makeMultiMaskFromHSV(img, mask_params)
    mask = zeros(size(img, 1), size(img, 2));
    for i=1:size(mask_params, 1)
        mask = mask | makeMaskFromHSV(img, [mask_params(i, 1) mask_params(i, 2)], [mask_params(i, 3) mask_params(i, 4)], [mask_params(i,5) mask_params(i,6)]);
    end
end
