function [iPoints,o]=aoc23_10_2(in)
o=in;
[row,col]=size(in);

polygon=[];
for r=1:row
    for c=1:col
        if in(r,c)>0
            o(r,c)=1;
            polygon=[polygon;[c r]];
        end
    end
end
xPoly=polygon(:,1);
yPoly=polygon(:,2);

xTest=[];
yTest=[];
for r=1:row
    for c=1:col
        if in(r,c)==0
            yTest=[yTest;r];
            xTest=[xTest;c];
        end
    end
end

[inside]=inpolygon(xTest,yTest,xPoly,yPoly);
iPoints=[xTest(inside) yTest(inside)];






%{
for r=1:row
    for c=1:col
        if in(r,c)==0
            count=0;
            for i1=c-1:-1:1
                if in(r,i1)==1
                    count=count+1;
                end
            end

            if mod(count,2)==0
                o(r,c)=-1;
            end
        end
    end
end
%}


end
