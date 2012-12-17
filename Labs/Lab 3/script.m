img = imread('images/original_image.jpg');
[horz, vert, bidir, grad_mag, grad_dir, dir_image] = sobel(img);

imtool(horz); 
imtool(vert); 
imtool(bidir); 

scaled_mag = uint8(grad_mag * (255 / max(max(grad_mag))));
scaled_dir = uint8(((grad_dir / pi) * 127) + 127);

imtool(scaled_mag); 
imtool(scaled_dir); 

imtool(dir_image);

% Save the images
imwrite(horz, 'images/out_horz.png');
imwrite(vert, 'images/out_vert.png');
imwrite(bidir, 'images/out_bidir.png');
imwrite(scaled_mag, 'images/out_smag.png');
imwrite(scaled_dir, 'images/out_sdir.png');
imwrite(dir_image, 'images/out_dirimg.png');