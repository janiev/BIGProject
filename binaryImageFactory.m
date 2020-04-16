function binaryImage = binaryImageFactory(jpgImage,threshholdValue)
%Function converts a jpg image to a useable binaryImage

%remove lens distortion
undistortedImage = undistordImage(jpgImage,cameraParams);

image = rgb2gray(undistortedImage);
%convert to grayscale image
image = histeq(image);

%kies de threshold value
binaryImage = image < threshholdValue;
end
