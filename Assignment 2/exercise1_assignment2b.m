%Bins are the classes that divide the entire range of values into
%intervals to count how many values fall into each class
%Chaning the bins you can change the apparent shape of the distribution.
%Too much bins are a problem because few values falls into it
%Few bins are a problem too because the histogram will result as
%a series of unuseful rectangle

% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = imread('umbrellas.jpg'); %Read image and converting to matrix
GRAY = rgb2gray(A); %Converting into grayscale
nbins=25; %Number of bins for the first test
% reshape image in 1D vector prod(size(GRAY))=Number of array elements
% equivalent to numel(GRAY)
H1 = reshape(GRAY, 1, prod(size(GRAY)));  
H2 = myhist(GRAY, nbins);

%Comparing histogram function and myhist function
figure(1)
subplot(1,2,1); histogram(H1,nbins); title('histogram 25 bins');
subplot(1,2,2); bar(H2); title('myhist 25 bins');

%Comparing histogram with different bins
figure(2)
subplot(1,3,1); histogram(H1,nbins); title('histogram 25 bins');
subplot(1,3,2); histogram(H1,(nbins*2)); title('histogram 50 bins');
subplot(1,3,3); histogram(H1,(nbins*4)); title('histogram 100 bins');