function video=cell2vid(frames,filename,framerate)
video=VideoWriter(filename,'MPEG-4');
video.FrameRate=framerate;
open(video);

for i1=1:numel(frames)
    frame=uint8(frames{i1});
    cmp=colormap(slanCM('turbo',max(max(frame))+1));
    frame=ind2rgb(frame,cmp);
    %frame=imbinarize(frame);
    frame=imresize(frame,[1000 1000],'box');
    writeVideo(video,frame);
end

close(video);
    