t = minPhotos:maxPhotos;
y = [];
for i = 1:(maxPhotos-minPhotos+1)
    %y(i) = ((positionData{i}(1)-413)^2+(positionData{i}(2)-680)^2)^(1/2);
    y(i) = positionData{i}(1);
end
plot(t,y);

%%
t = 1:maxPhotos-minPhotos+1;
y = [];
for i = 1:(maxPhotos-minPhotos+1)
    %y(i) = ((positionData{i}(1)-413)^2+(positionData{i}(2)-680)^2)^(1/2);
    y(i) = positionData{i}(1);
end
plot(t,y);

%%
t = 1/frameRate:1/frameRate:0.1204;
y = [];
for i = 1:(maxPhotos-minPhotos+1)
    %y(i) = ((positionData{i}(1)-413)^2+(positionData{i}(2)-680)^2)^(1/2);
    y(i) = yData(i)*pixelSize;
end
plot(t,y);
