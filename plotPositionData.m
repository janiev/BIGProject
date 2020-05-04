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
y2 = [];
for i = 1:(maxPhotos-minPhotos+1)
    
    y2(i) = b0*exp((-3.5531*t))*cos(2*12.5*pi*i);
    y(i) = positionData{i}(1)*PIXELSIZE-neut;
end
plot(t,y);

%%
tlol = 1/FRAMERATE:1/FRAMERATE:(maxPhotos-minPhotos+1)/FRAMERATE;
y = [];
y2 = [];
for i = 1:(maxPhotos-minPhotos+1)
    t = i*1/250;
    i
    y(i) = positionData{i}(1)*PIXELSIZE-neut;
    y2(i) = b0*exp((dampingC*t))*cos(2*b2*pi*t);
end
figure
plot(tlol,y);
hold on
plot(tlol,y2);

title('Bekomen Data tov geschat model')
xlabel('tijd (seconden)')
ylabel('verticale uitwijking (mm)')
