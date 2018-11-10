function S = histstretch (I)
%the function is assuming that image is grayscale
v_min = min(I(:));      % find the min. value of pixel in the image
v_max = max(I(:));      % find the max. value of pixel in the image
%s_min = 0;             % unused in the current formula
s_max = 255;
% The original formula is 
% (I-v_min) * ((s_max - s_min)/(v_max-v_min)) + s_min;
% Assuming s_min is 0 it is unuseful
S = (I-v_min) * ((s_max)/(v_max-v_min));


