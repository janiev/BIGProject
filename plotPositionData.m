
t = 1:355
y = [];
for i = 1:355
    y(i) = positionData{i}(1);
end
plot(t,y)