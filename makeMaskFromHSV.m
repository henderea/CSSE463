% Creates a mask from the given image using the three pairs of (min, max)
% values for each channel. Assumes img is in HSV.
function mask = makeMaskFromHSV(img, h, s, v)
    % Generate the predicate for h channel, checking for wraparound
    if h(1) > h(2)
        h_pred = img(:,:,1) >= h(1) | img(:,:,1) <= h(2);
    else
        h_pred = img(:,:,1) >= h(1) & img(:,:,1) <= h(2);
    end

    % Generate the predicate for h channel, checking for wraparound
    if s(1) > s(2)
        s_pred = img(:,:,2) >= s(1) | img(:,:,2) <= s(2);
    else
        s_pred = img(:,:,2) >= s(1) & img(:,:,2) <= s(2);
    end

    % Generate the predicate for h channel, checking for wraparound
    if v(1) > v(2)
        v_pred = img(:,:,3) >= v(1) | img(:,:,3) <= v(2);
    else
        v_pred = img(:,:,3) >= v(1) & img(:,:,3) <= v(2);
    end

    % Now, build the mask
    mask = zeros(size(img, 1), size(img, 2));
    mask(h_pred & s_pred & v_pred) = 1;
end
