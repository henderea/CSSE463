function out = reduceMasks(in, initialout, func)
    out = initialout;
    for i=1:size(in, 3)
        out = func(out, in(:,:,i));
    end
end