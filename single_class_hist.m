% This file is used to construct the single class histogram model for each
% of the class

clc;
clear;

%load('clustering_information.mat');

class = 'holly_hand_';

points = zeros(1,50);
points_2 = zeros(1,50);
group = [];

points2 = [];


% This portion construts the single class histogram model for handshaking
% class
for i=1:20
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = points + hist';
end

points = points/norm(points);

class = 'holly_phone_';


% This portion constructs the single class histogram model for "talking on
% a phone" class
for i=1:20
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points_2 = points_2 + hist';
end

points_2 = points_2/norm(points_2);

val_final = [];
class = 'holly_hand_';


% This portion finds the class for each of the test videos given each class
% single class histogram model origianlly belonging to handshake class.
for i=21:28
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = hist'/norm(hist');
    if dot(hist,points) > dot(hist,points_2)
        val_final = [val_final;1];
    else
        val_final = [val_final;2];
    end
end

class= 'holly_phone_';

% This portion finds the class for each of the test videos given each class
% single class histogram model origianlly belonging to "talking on a phone
% class"
for i=21:28
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = hist'/norm(hist');
    if dot(hist,points) > dot(hist,points_2)
        val_final = [val_final;1];
    else
        val_final = [val_final;2];
    end
end
