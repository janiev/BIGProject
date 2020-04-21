%DODO
minPhotos = 4297;%input('the smallest index');
maxPhotos = minPhotos+300;%input('please the highest index of a photo in the dataset');

%constnts
FRAMERATE = 250;
PIXELSIZE = 0.001;

%% Check of maxPhotos valid is
%TO DO : geen check voor minPhotos, en enkel check of maxPhotos niet te groot is
amountDecimals = strlength(num2str(maxPhotos));
if amountDecimals>7
    disp('lmao je hebt te veel fotos, pas de iteratie methode doorheen de fotos aan')
    return
end
%% MAIN LOOP

%initialize position data list
positionData = cell(1,maxPhotos-minPhotos+1);


%DODO specify the picture folder
pictureFolder = 'C:\Users\janva\Desktop\skool\2019_damping_wheat\20190823\images\stem_014';


%generate averagePicture
averagePicture = histeq(averagePictureFactory(pictureFolder,minPhotos,minPhotos+15));

for i = minPhotos:maxPhotos

%Give user feedback program is running
disp([num2str(((i-minPhotos+1)/(maxPhotos-minPhotos+1))*100) '%'])
pictureRank = i-minPhotos+1;


%read in ith image
fullFileName = generatePictureName(i,pictureFolder);
image = imread(fullFileName);

%preproces that image
image = histeq(rgb2gray(image));
image = uint8(double(averagePicture)-double(image));
binaryImage = image > 24;
binaryImage = bwareaopen(binaryImage,50);


%DODO now proces image and find furthestpoint
positionData{pictureRank} = furthestPointFinder(binaryImage,220);

end
%%
pm = calculateDamping([0 0],[0 0],positionData,PIXELSIZE,FRAMERATE);
