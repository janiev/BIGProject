function value = furthestPointFinder(x)
%Takes a binary  image as input. Function finds the furthest point !(y,x)! coordinates of Straw.
binaryImage = x;

furthestPoint = [0 0];
for y = 330:760
    furthestPointRow = [0 0];
    for x = 330:940
        if and(binaryImage(y,x)==1,x > furthestPointRow(2))
            furthestPointRow = [y,x];
        end
        if furthestPointRow(2)>furthestPoint(2)
            furthestPoint = furthestPointRow;
        end     
    end
end
value = furthestPoint;

end