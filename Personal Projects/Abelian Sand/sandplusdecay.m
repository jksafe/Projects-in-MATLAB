function frames=sandplusdecay(initial,edgecondition)

if strcmp(edgecondition,'falloff')==1
    edge=1;
    frames=[];
    frames(:,:,1)=initial;
elseif strcmp(edgecondition,'grow')==1
    edge=2;
    frames={};
    frames{end+1}=initial;
end
[row,col]=size(initial);
new=initial;

while max(max(new))>11
    initial=new;

    if edge==2
        edges=[initial(1,:),initial(end,:),initial(:,1)',initial(:,end)'];
        if max(edges)>3
            initial=padarray(initial,[1 1]);
            new=initial;
        end
    end

    % If using falloff condition for edges of table, need to
    % account for critical points at pile corners and edges
    if edge==1
        for r=1:row
            for c=1:col
                if initial(r,c)>11
                    if r==1 && c==1
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==1 && c==2
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==1 && c==col-1
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==1 && c==col
                        new(r,c-1)=new(r,c-1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==1
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==2 && c==1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==2 && c==2
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==2 && c==col-1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==2 && c==col
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==2
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row-1 && c==1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row-1 && c==2
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row-1 && c==col-1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row-1 && c==col
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row && c==1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row && c==2
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row && c==col-1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row && c==col
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row-1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r,c)=new(r,c)-12;
                    elseif c==1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif c==2
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif c==col-1
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif c==col
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    elseif r==row
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r,c)=new(r,c)-12;
                    else
                        new(r-1,c)=new(r-1,c)+2;
                        new(r,c-1)=new(r,c-1)+2;
                        new(r,c+1)=new(r,c+1)+2;
                        new(r+1,c)=new(r+1,c)+2;
                        new(r-2,c)=new(r-2,c)+1;
                        new(r,c-2)=new(r,c-2)+1;
                        new(r,c+2)=new(r,c+2)+1;
                        new(r+2,c)=new(r+2,c)+1;
                        new(r,c)=new(r,c)-12;
                    end
                end
            end
        end
        frames=cat(3,frames,new);
    end

    if edge==2
        [row,col]=size(initial);
        for r=1:row
            for c=1:col
                if initial(r,c)>11
                    new(r-1,c)=new(r-1,c)+2;
                    new(r,c-1)=new(r,c-1)+2;
                    new(r,c+1)=new(r,c+1)+2;
                    new(r+1,c)=new(r+1,c)+2;
                    new(r-2,c)=new(r-2,c)+1;
                    new(r,c-2)=new(r,c-2)+1;
                    new(r,c+2)=new(r,c+2)+1;
                    new(r+2,c)=new(r+2,c)+1;
                    new(r,c)=new(r,c)-12;
                end
            end
        end
        frames{end+1}=new;
    end

end

end