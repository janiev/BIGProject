
neutral = [495.5 100];
pixelSize = 0.001;
frameRate = 2500;
initial = [0 0];

%create all necessary variables
neutralY = neutral(1);
initialY = initial(1);
yData = zeros(1,length(positionData));

%create the yData list and find the tops with topList
check = true;
topList = [];
yData(1) = positionData{1}(1);
for i=2:length(positionData)
    yData(i) = positionData{i}(1);
    
    if and(yData(i)<yData(i-1),check)
        check = false;
        topList(end+1) = i;
    end
    if and(yData(i)>yData(i-1),not(check))
        check = true;
        topList(end+1) = i;
    end      
end

%interpret topList and create oscperiod with it
topListEnhanced = topList(2:length(topList)/2);
oscperiodList = diff(topListEnhanced);
oscperiod = mean(oscperiodList)*2;

%check if neutralY is correct
if abs(neutralY-mean(yData))>15
    neutralY = input('lmao');
end
%check if initialY is correct
if initialY==0
    initialY = min(yData);
end

%now calculate the damping
%Step 1 : put everything in the right units
b2 = 1/(oscperiod*(1/frameRate));
neut = neutralY*pixelSize;
b0 = initialY*pixelSize-neut;

dampingCList = zeros(1,length(topListEnhanced));
for i=1:length(topListEnhanced)
    
    frame = topListEnhanced(i);
    t = frame*(1/frameRate);
    
    teller = yData(frame)*pixelSize-neut;
    noemer = b0*cos(2*pi*b2*t);
    
    dampingCList(i) = (1/t)*log(teller/noemer);
    

end

dampingC = mean(dampingCList);

%%
teller = yData(54)*pixelSize-neut;
noemer = b0*cos(2*pi*b2*0.0216);
value = (1/0.0216)*log(teller/noemer);




