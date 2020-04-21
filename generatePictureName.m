function fullFileName = generatePictureName(i,folder)
%generate a string with the folder path for picture i

indexString = num2str(i);
decimals = strlength(indexString);
amountZeroes = 7-decimals;
zeroesString = repmat(num2str(0),1,amountZeroes);
pictureName = strcat(zeroesString,indexString);
fullFileName = fullfile(folder, strcat(pictureName,'.jpg'));
end