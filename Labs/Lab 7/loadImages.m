function mtx = loadImages(globPath, px, scale)
    files = dir(globPath);
    mtx = zeros(px, size(files, 1) - 3);
    for i=3:size(files, 1)
        fn = files(i).name;
        fn_path = [globPath filesep fn];
        
        img = imread(fn_path);
        resized = imresize(img, 1/double(scale));
        mtx(:,i-2) = reshape(resized, [], 1);
    end
end
    