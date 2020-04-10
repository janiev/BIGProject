%Reading in image
image = imread('0000742.jpg');

%Disable the transparency channel (not supported in matlab)
%convert to grayscale image
image = rgb2gray(image);

%kies de threshold value
thresholdValue = 47;
binaryImage = image < thresholdValue;

imshow(binaryImage)
