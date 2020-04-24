%DODO specify the picture folder

pictureFolder = uigetdir('lmao');%'C:\Users\janva\Desktop\skool\2019_damping_wheat\20190712\images\stem_002broken.5313.258';
pluk = [];
for i = 1:length(pictureFolder)
    if pictureFolder(i) == '.'
        pluk(end+1)=i;
    end
end

maxH = str2num(pictureFolder(pluk(2)+1:length(pictureFolder)));

%DODO
minPhotos = str2num(pictureFolder(pluk(1)+1:pluk(2)-1));%1197;input('the smallest index');
maxPhotos = minPhotos+300;%input('please the highest index of a photo in the dataset');

%constnts
FRAMERATE = 250;
PIXELSIZE = 0.7143;

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
positionData{pictureRank} = furthestPointFinder(binaryImage,maxH);

end
%%
pm = calculateDamping([0 0],[0 0],positionData,PIXELSIZE,FRAMERATE);

t = 1/FRAMERATE:1/FRAMERATE:(maxPhotos-minPhotos+1)/FRAMERATE;
y = [];
for i = 1:(maxPhotos-minPhotos+1)
    %y(i) = ((positionData{i}(1)-413)^2+(positionData{i}(2)-680)^2)^(1/2);
    y(i) = positionData{i}(1)*PIXELSIZE;
end
plot(t,y);
