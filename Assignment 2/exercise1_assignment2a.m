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
H1 = myhist(GRAY, 25); %Myhist with 25 bins
H2 = myhist(GRAY, 50); %Myhist with 50 bins
H3 = myhist(GRAY, 100); %Myhist with 100 bins

figure(1)
subplot(1,3,1); bar(H1); title('25 bins');
subplot(1,3,2); bar(H2); title('50 bins');
subplot(1,3,3); bar(H3); title('100 bins');



