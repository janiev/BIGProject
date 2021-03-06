% Auto-generated by cameraCalibrator app on 06-Apr-2020
%-------------------------------------------------------
%DEPRECATED

% Define images to process
imageFileNames = {'/Users/ellequirijnen/Downloads/20190823_stem1/20190823_wheat_call_6_000000.jpg',...
    '/Users/ellequirijnen/Downloads/20190823_stem1/20190823_wheat_call_5_000000.jpg',...
    '/Users/ellequirijnen/Downloads/20190823_stem1/20190823_wheat_call_3_000000.jpg',...
    '/Users/ellequirijnen/Downloads/20190823_stem1/20190823_wheat_call_2_000000.jpg',...
    '/Users/ellequirijnen/Downloads/20190823_stem1/20190823_wheat_call_1_000000.jpg',...
    '/Users/ellequirijnen/Downloads/20190823_stem1/20190823 wheat call 1_000000.jpg',...
    };
% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Read the first image to obtain image size
originalImage = imread(imageFileNames{1});
[mrows, ncols, ~] = size(originalImage);

% Generate world coordinates of the corners of the squares
squareSize = 40;  % in units of 'millimeters'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', true, 'EstimateTangentialDistortion', true, ...
    'NumRadialDistortionCoefficients', 3, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(cameraParams);

% Visualize pattern locations
h2=figure; showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% For example, you can use the calibration data to remove effects of lens distortion.
undistortedImage = undistortImage(originalImage, cameraParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('MeasuringPlanarObjectsExample')
% showdemo('StructureFromMotionExample')
