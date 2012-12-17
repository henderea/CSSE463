% Sobel.m 

function [horz, vert, bidir, grad_mag, grad_dir, dir_image] = sobel(img)
    SOBEL_HFILTER = ([-1 -2 -1; 0 0 0; 1 2 1] / 8);
    SOBEL_VFILTER = ([-1 0 1; -2 0 2; -1 0 1] / 8);
    
    % Convert to grayscale
    gray = rgb2gray(img);
    
    horz = filter2(SOBEL_HFILTER, gray);
    vert = filter2(SOBEL_VFILTER, gray); 
    bidir = horz + vert;
    
    grad_mag = sqrt(horz.^2 + vert.^2);
    grad_dir = atan2(vert, horz);
    
    dir_image = grad_dir;
    dir_image(grad_mag < 25) = 0;
end