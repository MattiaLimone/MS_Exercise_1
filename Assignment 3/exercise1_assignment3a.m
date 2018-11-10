% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A1 = imread('trucks.jpg'); %Read image and converting to matrix
R1 = A1(:, :, 1); % Gray image of the red channel
G1 = A1(:, :, 2); % Gray image of the green channel
B1 = A1(:, :, 3); % Gray image of the blue channel

A2 = rgb2hsv(A1);
R2 = A2(:, :, 1); % Gray image of the red channel
G2 = A2(:, :, 2); % Gray image of the green channel
B2 = A2(:, :, 3); % Gray image of the blue channel
whos A1
whos A2

figure(1)
subplot(2,4,1); imshow(A1); title('RGB Original image');
subplot(2,4,2); imshow(R1); title('RGB Gray image of the red channel');
subplot(2,4,3); imshow(G1); title('RGB Gray image of the green channel');
subplot(2,4,4); imshow(B1); title('RGB Gray image of the blue channel');
subplot(2,4,5); imshow(A2); title('HSV Original image');
subplot(2,4,6); imshow(R2); title('HSV Gray image of the red channel');
subplot(2,4,7); imshow(G2); title('HSV Gray image of the green channel');
subplot(2,4,8); imshow(B2); title('HSV Gray image of the blue channel');