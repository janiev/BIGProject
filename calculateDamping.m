function dampingC = calculateDamping(neutral,initial,positionData,pixelSize,frameRate)
%input : neutral (neutralPos vector [y x])==> pass [0 0] for default // initial (initialPos vector
%[y x])==> pass [0 0] for default // positionData (cell array) // pixelSize
%(double) // frameRate (double)

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
%enhance topList ==> make toplistEnhanced
topListDiffMean = mean(diff(topList));
topListEnhanced = [];
for i = 3:length(topList)/2
    
    if abs(topList(i)-topList(i+1))>topListDiffMean*0.3
        topListEnhanced(end+1) = topList(i);
    end
    
end
%interpret topList and create oscperiod with it
%topListEnhanced = topList(3:length(topList)/2);
oscperiodList = diff(topListEnhanced);
oscperiod = mean(oscperiodList)*2;

%check if neutralY is correct
if abs(neutralY-mean(yData))>15
    neutralY = mean(yData);
    disp('Warning : average is useed to calculate neutral strawpos')
end
%check if initialY is correct
if initialY==0
    initialY = min(yData);
    disp('Warning : minimum yData is useed to calculate minimum strawpos')
end

%now calculate the damping (vanaf nu gebruiken we neutralY en initialY)
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

dampingC = [dampingC b2];

end