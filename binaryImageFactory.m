function binaryImage = binaryImageFactory(jpgImage,threshholdValue)
%Function converts a tiff image to a useable binaryImage

%convert to grayscale image
image = rgb2gray(jpgImage);

%kies de threshold value
binaryImage = image < threshholdValue;
end