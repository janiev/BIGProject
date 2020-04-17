
%706 is echt kut
%minPhotos = 3209;%input('the smallest index');
%maxPhotos = 3600
%pictureFolder = 'C:\Users\janva\Desktop\skool\2019_damping_wheat\20190823\images\stem_002';
filename = 'positionDataOverlayed.gif';

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
neutralPosition = rgb2gray(imread('calibratieFoto.jpg'));
image = image+neutralPosition;
image = insertText(image,[0 0],i,'FontSize',40);

for j = 0:40
    image(positionData{i-minPhotos+1}(1)+j,positionData{i-minPhotos+1}(2),:) = [0, 0, 255];
    image(positionData{i-minPhotos+1}(1)-j,positionData{i-minPhotos+1}(2),:) = [0, 0, 255];
    
    image(positionData{i-minPhotos+1}(1),positionData{i-minPhotos+1}(2)+j,:) = [0, 0, 255];
    image(positionData{i-minPhotos+1}(1),positionData{i-minPhotos+1}(2)-j,:) = [0, 0, 255];
end




[A,map] = rgb2ind(image,256);
if i == minPhotos
    disp('lmao')
    imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.25);
else
    imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.25);
end




end
