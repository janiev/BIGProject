
neutralLocation = imread('calibratieFoto.jpg');
binaryImage = binaryImageFactory(neutralLocation,150);
loc = furthestPointFinder(binaryImage,335);

t = 1:1000
y = [];
for i = 1:1000
    %y(i) = ((positionData{i}(1)-413)^2+(positionData{i}(2)-680)^2)^(1/2);
    y(i) = positionData{i}(2)
end
plot(t,y)

