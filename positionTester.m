
%706 is echt kut
minPhotos = 700;
maxPhotos = 750;
pictureFolder = 'C:\Users\janva\Desktop\skool\matlab BIG\pictures';


for i = minPhotos:maxPhotos
i

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



for j = 0:40
    image(positionData{i-644}(1)+j,positionData{i-644}(2),:) = [0, 0, 255];
    image(positionData{i-644}(1)-j,positionData{i-644}(2),:) = [0, 0, 255];
    
    image(positionData{i-644}(1),positionData{i-644}(2)+j,:) = [0, 0, 255];
    image(positionData{i-644}(1),positionData{i-644}(2)-j,:) = [0, 0, 255];
end


figure(i)
imshow(image);

drawnow



end
