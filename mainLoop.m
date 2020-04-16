
minPhotos = 3209;%input('the smallest index');
maxPhotos = 3600;%input('please the highest index of a photo in the dataset');


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
%specify the picture folder
pictureFolder = 'C:\Users\janva\Desktop\skool\2019_damping_wheat\20190823\images\stem_002';

for i = minPhotos:maxPhotos
i
pictureRank = i-minPhotos+1;
%Reading in ith picture

%first create pictureName
indexString = num2str(i);
decimals = strlength(indexString);
amountZeroes = 7-decimals;
zeroesString = repmat(num2str(0),1,amountZeroes);
pictureName = strcat(zeroesString,indexString);

%Now find that pictureName and read it in
fullFileName = fullfile(pictureFolder, strcat(pictureName,'.jpg'));

image = imread(fullFileName);

%Nu Verwerken we de ith foto

binaryImage = binaryImageFactory(image,160);

positionData{pictureRank} = furthestPointFinder(binaryImage,335);









end
