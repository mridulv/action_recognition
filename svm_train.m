% This is used for training the dataset and constructing a SVM.
clc;
clear;

%load('clustering_information.mat');

class = 'holly_hand_';

points = [];
group = [];

points2 = [];


% This part is used to extract the histogram for each of the video of class
% "handshake" for training
for i=1:20
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;1];
end

% This part is used to extract the histogram for each of the video of class
% "handshake" for testing
for i=21:28
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'holly_phone_';

% This part is used to extract the histogram for each of the video of class
% "Talking on a phone" for training
for i=1:20
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;2];
end


% This part is used to extract the histogram for each of the video of class
% "talking on a phone" for testing
for i=21:28
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

% Final Training Process and constructing a SVM
svm_var = svmtrain(points,group);
% Checking for the classes of the test videos
var_ans = svmclassify(svm_var,points2);
