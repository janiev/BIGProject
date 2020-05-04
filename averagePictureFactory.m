function averagePicture = averagePictureFactory(folder,min,max)
%Generate averagePicture of a sequence of pictures
%requires : folder (string), min (int) , max (int)

c = clock;
sec = c(6);

%Reading in first picture
firstPictureFileName = generatePictureName(min,folder);
totimage = rgb2gray(imread(firstPictureFileName));
%totimage = histeq(totimage);
totimage = double(totimage);

for i = min+1:max
    
    %Reading in ith picture
    fullFileName = generatePictureName(i,folder);
    
    %modifying image
    image = rgb2gray(imread(fullFileName));
    %image = histeq(image);
    image = double(image);
    
    %adding all the pictures in double format
    totimage = totimage + image;
end

%generating averagePicture by dividing totimage
totimage = imdivide(totimage,max-min+1);
averagePicture = uint8(totimage);

c = clock;
f = c(6)-sec;
disp(['Computing averagePicture took ',num2str(f),' seconds'])
    
end
