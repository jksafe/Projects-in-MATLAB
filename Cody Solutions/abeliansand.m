function [final,frames,vid_frames] = abeliansand(initial,frames)
trigger = 0;
if length(frames) == 0
    frames{end+1} = initial;
end

edges = [initial(1,:) initial(end,:) initial(:,1)' initial(:,end)'];  
if max(edges) > 3 
    initial = padarray(initial,[1 1]);  
end

[row,col] = size(initial);  
for r=1:row
     if trigger == 1;           
         trigger = 0;            
         continue;       
     end
    for c=1:col
        if initial(r,c) > 3
            % During iterations, it's possible for edges to accumulate
            % value > 3, if this happens, there are two options:
            % 1. 'continue' to preserve current value for later evaluation
            % 2. Use recursion to cycle back through beginning to trigger
            % padding statement
            % This accomodation is important for more accurately preserving 
            % thesymmetry of the sandpile through the iterations
            if r==1 | r==row | c==1 | c==col
                trigger = 1;
                %[final,frames,vid_frames] = abeliansand(initial,frames);
                %continue              
                initial = padarray(initial,[1 1]);
                row = row + 1;
                col = col + 2;
                r = r + 1;
                c = c + 1;
                
                initial(r-1,c) = initial(r-1,c) + 1;
                initial(r+1,c) = initial(r+1,c) + 1;                               
                initial(r,c-1) = initial(r,c-1) + 1;                          
                initial(r,c+1) = initial(r,c+1) + 1;                           
                initial(r,c) = initial(r,c) - 4;               
                break                                          
            end
                       
            initial(r-1,c) = initial(r-1,c) + 1;
            initial(r+1,c) = initial(r+1,c) + 1;                               
            initial(r,c-1) = initial(r,c-1) + 1;                          
            initial(r,c+1) = initial(r,c+1) + 1;                           
            initial(r,c) = initial(r,c) - 4;          
        end        
    end    
end


if max(max(initial))>3     
    frames{end+1} = initial;      
    [final,frames,vid_frames] = abeliansand(initial,frames);  
else   
    final = initial;    
    frames{end+1} = final;      
    % Helper function that accounts for growing pile size and pads      
    % smaller piles with 0's (black border) so that all piles are equal to      
    % final pile size, the result is seen in the final video where the      
    % total area of pile seems to grow and relative pixel size stays      
    % constant           
    vid_frames = normalizesandsize(frames);
      
    for x=1:length(vid_frames)         
        %vid_frames{x} = linearizeim(vid_frames{x});          
        vid_frames{x} = double2rgb(vid_frames{x},prism);          
        vid_frames{x} = imresize(vid_frames{x},[500 500],'box');    
    end
        
    duration = 30;      
    frame_rate = length(vid_frames)/duration;          
    for count=1:2*frame_rate          
        % Create still frames of initial condition
        vid_frames = cat(2,vid_frames{1},vid_frames);                  
        % Create still frames of stable, end condition         
        vid_frames{end+1} = vid_frames{end};
    end
    cell2vid(vid_frames,'abeliansand_flow.mp4',frame_rate);
end
end