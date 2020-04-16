function binaryImage = binaryImageFactory(jpgImage,threshholdValue)
%Function converts a jpg image to a useable binaryImage

%remove lens distortion
undistortedImage = undistordImage(jpgImage,cameraParams);

image = histeq(undistortedImage);
%convert to grayscale image
image = rgb2gray(image);

%kies de threshold value
binaryImage = image < threshholdValue;
end
