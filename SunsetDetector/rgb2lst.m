function result = rgb2lst(src)
   src = int16(src);
   L = src(:,:,1) + src(:,:,2) + src(:,:,3);
   S = src(:,:,1) - src(:,:,3);
   T = src(:,:,1) - (2 * src(:,:,2)) + src(:,:,3);
   result(:,:,1) = L;
   result(:,:,2) = S;
   result(:,:,3) = T;
end