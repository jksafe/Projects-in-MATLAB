function elapsed = getElapsedTime(ged)
elapsed=[];
starts=strfind(ged,'<elapsed>');
for i=1:length(starts);
    temp=[];
    for count=0:2
        if str2num(ged(starts(i)+9+count))==ged(starts(i)+9+count)-'0'
            temp(end+1)=str2num(ged(starts(i)+9+count));
        end
    end
    elapsed(end+1)=polyval(temp,10);
end
    
        
end
