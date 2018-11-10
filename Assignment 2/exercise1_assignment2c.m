% Histogram stretching is not the correct or more common way to call this
% kind of operation. Instead is better to call it Normalization that is a 
% process that changes the range of pixel intensity values.
% Imagesc (Image with scaled color) as the complete name says
% automatically normalize the image, but it need a colormap

% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = imread('phone.jpg'); %Read image and converting to matrix

figure(1)
subplot(2,2,1); imshow(A); title('Original Image');
subplot(2,2,2); histogram(A,255); title('Original Histogram');
% Passing the matrix to the function and showing it
subplot(2,2,3); imshow(histstretch(A)); title('Stretched Histogram Image');
% Calculatin the histogram stretched
subplot(2,2,4); histogram(histstretch(A),255); title('Stretched Histogram');

figure(2)
subplot(2,2,1); imshow(A); title('Original Image');
subplot(2,2,2); histogram(A,255); title('Original Histogram');
subplot(2,2,3); imagesc(A); colormap(gray); title('Imagesc auto-normalized Image');
