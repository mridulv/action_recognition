% firstly collect the stip features of all the videos
% divide the videos into frames
% then feed the stip and frames into the collect_hog
% Then collect the hog descriptors
% pass it on the vgg_kmeans with one hog description of a single 


clc
clear

tic
total = 28;
% note 20 are train videos and 8 are test videos

%STIP('holly_hand_');
%fprintf('Completed STIP class 1 %d\n',i);

%STIP('holly_phone_');
%fprintf('Completed STIP class 2 %d\n',i);

for i=1:total
    saving_video(i,'holly_hand_');
    fprintf('Completed Saving class 1 %d\n',i);
end
for i=1:total
    Collecting_HOG(i,'holly_hand_');
    fprintf('Completed HOG class 1 %d\n',i);
end

for i=1:total
    saving_video(i,'holly_phone_');
    fprintf('Completed Saving class 2 %d\n',i);
end
for i=1:total
    Collecting_HOG(i,'holly_phone_');
    fprintf('Completed Saving class 2 %d\n',i);
end
toc