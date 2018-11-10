function S = immask(I , mask)
    %Computing white points
    R = I(:,:,1) .* uint8(mask)*255;
    G = I(:,:,2) .* uint8(mask)*255;
    B = I(:,:,3) .* uint8(mask)*255; 
   
S= cat(3,R,G,B);
