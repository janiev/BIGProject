fullFileName = fullfile(pictureFolder,'0006000.jpg');
pc = imread(fullFileName);
lm = histeq(rgb2gray(pc));
lm2 = rgb2gray(histeq(pc));
pc = binaryImageFactory(pc,160);

figure(1)
imshow(lm)
figure(2)
imshow(lm2)
