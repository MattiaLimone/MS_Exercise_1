% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

A = imread('trucks.jpg'); %Read image and converting to matrix
B = A(:, :, 3);
B_thr = B > 200;



I = ones(20, 255, 3);
I(:, :, 1) = ones(20, 1) * linspace(0, 1, 255);
figure(1)
subplot(2,4,1);image([0, 1], [0, 1], hsv2rgb(I));

hsvalChannel = rgb2hsv(A);    % Convert RGB to HSV
hueChannel = hsvalChannel(:,:,1); % Get the hue
satChannel = hsvalChannel(:,:,2); % Get the saturation
valChannel = hsvalChannel(:,:,3); % Get the value

hTLow = 180/360; %Degree of cyan first blue
hTHigh = 240/360; %Degree of last blue
sTLow = 0.4; %Minimum value of saturation
sTHigh = 1; %Maxmimum value of saturation
vTLow = 0; %Minimum value     
vTHigh = 1; %Maxmimum value

%Delete value outside the range of saturation
mask = (satChannel >= sTLow) & (satChannel <= sTHigh); 
%Delete value outside the range of value
mask = mask & (valChannel >= vTLow) & (valChannel <= vTHigh);
%Delete value outside the range of hue
mask = mask & (hueChannel >= hTLow) & (hueChannel <= hTHigh);


subplot(2,4,2); imshow(A); title('RGB Original Image');
subplot(2,4,3); imshow(B_thr); title('RGB Blue channel threshold');
subplot(2,4,4); imshow(mask); title('HSV channels threshold');

% This method of color isolation will not work good if the image is noisy. 
% Noise is a common problem because a camera uses an analog to digital 
% converter which can create noise in an image. 
% One potential solution would be to apply a Gaussian blur before running
% hsv thresholding and then use a morphological operation to fill the gaps

A = imgaussfilt(A,1.5);
B = A(:, :, 3);
B_thr = B > 200;

hsvalChannel = rgb2hsv(A);    % Convert RGB to HSV
hueChannel = hsvalChannel(:,:,1); % Get the hue
satChannel = hsvalChannel(:,:,2); % Get the saturation
valChannel = hsvalChannel(:,:,3); % Get the value

hTLow = 180/360; %Degree of cyan first blue
hTHigh = 240/360; %Degree of last blue
sTLow = 0.4; %Minimum value of saturation
sTHigh = 1; %Maxmimum value of saturation
vTLow = 0; %Minimum value     
vTHigh = 1; %Maxmimum value

%Delete value outside the range of saturation
mask = (satChannel >= sTLow) & (satChannel <= sTHigh); 
%Delete value outside the range of value
mask = mask & (valChannel >= vTLow) & (valChannel <= vTHigh);
%Delete value outside the range of hue
mask = mask & (hueChannel >= hTLow) & (hueChannel <= hTHigh);
mask = imfill(mask,'holes');

subplot(2,4,6); imshow(A); title('Gaussian blurred Image');
subplot(2,4,7); imshow(B_thr); title('RGB Blurred Blue channel threshold');
subplot(2,4,8); imshow(mask); title('HSV Blurred channels threshold');
whos mask
A = imread('trucks.jpg'); %Read image and converting to matrix
T = isolate_color(A ,mask);
figure(2)
subplot(1,2,1); imshow(A); title('Original Image');
subplot(1,2,2); imshow(T); title('Color Isolated Image');
