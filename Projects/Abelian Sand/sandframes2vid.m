function average=sandframes2vid(frames,edgeCondition,filename,duration)
[row,col]=size(frames(:,:,end));
average=zeros(row,col,3);
video=VideoWriter(filename,'MPEG-4');
framerate=floor(length(frames)/duration);
video.FrameRate=framerate;
open(video);

cmapList={'Parula','Turbo','HSV','Hot','Cool','Winter','Spring','Summer','Autumn','Sky','Abyss'};
[indx,~]=listdlg('PromptString',"Please select a colormap from the list below...",'ListString',cmapList,'SelectionMode','single');

prompt={'How many colors to use?'};
numCol=inputdlg(prompt,'',1,"10");

cmapName=cat(2,cmapList{indx},'(',char(numCol),')');
cmap=colormap(cmapName);
cmap(end+1,:)=[1 1 1];

if strcmp(edgeCondition,'grow')==1
    frames=normalizesandsize(frames);

    for i1=1:length(frames)
        temp=ind2rgb(frames{i1},cmap);
        temp=imresize(temp,[1080 1080],'box');
        writeVideo(video,temp);
    end
end

if strcmp(edgeCondition,'falloff')==1
    for i1=1:ceil(length(frames)*.07)
        frames=cat(3,frames(:,:,1),frames);
        frames=cat(3,frames,frames(:,:,end));
    end

    for i1=1:length(frames)
        temp=ind2rgb(frames(:,:,i1),cmap);
        average=average+temp;
        temp=imresize(temp,[1080 1080],'box');
        writeVideo(video,temp);
    end
    average=average/length(frames);
    average=imresize(average,[1080 1080],'box');
end

end
