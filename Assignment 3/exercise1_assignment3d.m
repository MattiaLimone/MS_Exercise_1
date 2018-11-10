% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

[A,map] = imread('lowcon.jpg'); %Read image and converting to matrix
hsvImage = rgb2hsv(A); %Convert image to hsv
%Dividing image into hue satuaration and value channel
hueChannel = hsvImage(:,:,1);
satChannel = hsvImage(:,:,2);
valChannel = hsvImage(:,:,3);
%Working on value channel to adjust intensity 
v_min = min(valChannel(:));      % find the min. value of pixel in the image
v_max = max(valChannel(:));      % find the max. value of pixel in the image
s_max = 1;                       % Max Value in intensity is 1 [0,1] range
% The original formula is 
% (valChannel-v_min) * ((s_max - s_min)/(v_max-v_min)) + s_min;
% Assuming s_min is 0 it is just a waste of time to put it in the operation
new_valChannel = (valChannel-v_min) * ((s_max)/(v_max-v_min));
%Unify the 3 channels
hsvImage = cat(3,hueChannel,satChannel,new_valChannel);
%Conversion to rgb
new_A = hsv2rgb(hsvImage);
%Print out
figure(1)
subplot(1,2,1); imshow(A); title('Original Image');
subplot(1,2,2); imshow(new_A);title('Processed Image with HSV contrast stretching');