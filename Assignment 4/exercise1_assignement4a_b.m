% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = imread('monitor.jpg'); %Convert image to matrix
B = imread('sunset.jpg'); %Convert second image to matrix

figure(1)
subplot(1,3,1); imshow(A); title("Input Points");

[y2, x2, ch] = size(B); %Calculating 4 corner of second image
x2 = [0;0;x2;x2];
y2 = [0;y2;y2;0];

%Question to let chose user the points or use the pre-processed ones
answer = questdlg('Do you want to chose the points?','Points Selection','Yes','No','No');
% Handle response
switch answer
    case 'Yes'
        figure(1), imshow(A),[x1,y1] = getpts;
        figure(1), hold on, plot(x1,y1,'oy', 'LineWidth', 5, 'MarkerSize', 10);

    case 'No'
        x1 = [355; 343; 495; 517];
        y1 = [271; 452; 397; 241];  
end

%Filling the space with white points
BW = roipoly(A,x1,y1); %This one create a polygon shape
A2= immask(A,BW); %This one convert the polygon into white points
A_white = A+A2; %This one sum the 2 matrix

%Preparing the background for merging images
subplot(1,3,2);imshow(A_white);title("Polygon");

%Estimate Homography inverting matrix and calculating tform for projection
H = estimate_homography(x2,y2,x1,y1); 
M = H.'; 
T = maketform('projective',M); 

% X-coordinates (horizontal) of the first and last columns of A
width=[1 max(size(A,2))]; 
% Y-coordinates (vertical) of the first and last rows of A
height=[1 max(size(A,1))]; 
% Transforming the images with the value calculated
B_transformed = imtransform(B,T,'XData',width,'YData',height);

%Unifying the images
FinalImage=A + B_transformed;

%Printing out
subplot(1,3,3);imshow(FinalImage);title("Processed");

