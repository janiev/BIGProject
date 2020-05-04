function binaryImage = binaryImageFactory(jpgImage,threshholdValue)
%deprecated
%Function converts a jpg image to a useable binaryImage

image = rgb2gray(jpgImage);
image = histeq(image);
%convert to grayscale image

%kies de threshold value
binaryImage = image < threshholdValue;
end
