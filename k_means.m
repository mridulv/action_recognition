% This file is used to contruct the bag of word model from the desccriptors
% from all the videos from all the classes

clc;
clear;

X = [];

% Collecting the HOG features from all the videos belonging to the
% handshaking class
class = 'holly_hand_';

for i=1:20
    str = [['HOG/',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X h];
    fprintf('holly_hand loading %d \n',i);
end

fprintf('holly_hand loaded \n');

%Collecting all the HOG features from all the videos belonging to the
%"Taking on a phone class"
class = 'holly_phone_';

for i=1:20
    str = [['HOG/',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X h];
    fprintf('holly_phone loading %d \n',i);
end

fprintf('holly_phone loaded \n');

% Applying K means algorithm to contruct the 50 centroid points.
k = 50;
[IDX,C] = kmeans(X',k);