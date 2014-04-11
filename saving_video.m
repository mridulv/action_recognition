% Saves the video as a 3-D matrix in a folder named 'Videos'.
% Set the 'number' and 'class' and create a folder by name 'Videos'in the
% workspace before running the code.

function saving_video(number,class)
    
    str = [['DATA/',class],num2str(number)];
    str = [str,'.avi'];
    obj = mmreader(str);
    video = read(obj);
    nframes = obj.NumberOfFrames;
    %%
    for i=1:nframes
        frame(:,:,i) = rgb2gray(video(:,:,:,i));
    end
    str = [['Videos/',class],num2str(number)];
    save(str,'frame');
end