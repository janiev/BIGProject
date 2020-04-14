function binaryImage = binaryImageFactory(jpgImage,threshholdValue)
%Function converts a tiff image to a useable binaryImage

%remove lens distortion
undistortedImage = undistordImage(jpgImage,cameraParams);

%convert to grayscale image
image = rgb2gray(undistortedImage);

%kies de threshold value
binaryImage = image < threshholdValue;
end
