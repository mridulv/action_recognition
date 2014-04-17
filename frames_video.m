% Helper file for parsing the annotated file and retriveing proper frames
% for each of the video.

clc
clear

files = dir('*.avi');
% Loop through each
for id = 1:length(files)
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
      % Convert to number
    fprintf('name is %s\n',f);
    p = strsplit(f,'_');
    l = p{2};
    o = strsplit(l,'-');
    fr_1 = str2num(o{1});
    fr_2 = str2num(o{2});
    
    f = [f,'.avi'];
    obj = VideoReader(f);

    str = ['constructed/',num2str(id),'.avi'];
    outputVideo = VideoWriter(str);
    outputVideo.FrameRate = obj.FrameRate;
    open(outputVideo);
    
    if fr_2 > obj.NumberofFrames
        for ii = fr_1:obj.NumberofFrames
            img = read(obj, ii);
            writeVideo(outputVideo,img);
        end
    else
        for ii = fr_1:fr_2
            img = read(obj, ii);
            writeVideo(outputVideo,img);
        end
    end
end
