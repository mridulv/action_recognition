% This file constructs the modified histograms for each of the class
% (Taking only its top 5 values)

clc;
clear;

%load('clustering_information.mat');

class = 'holly_hand_';

points = zeros(1,50);
points_2 = zeros(1,50);
group = [];

points2 = [];

% This portion constructs the modified histogram for "handshaking class"
for i=1:20
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = points + hist';
end

points = points/norm(points);
[c,i] = sort(points);
points_ind = i(46:50);

class = 'holly_phone_';

% This portion constructs the modified histogram for "Talking on a phone class"
for i=1:20
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points_2 = points_2 + hist';
end

points_2 = points_2/norm(points_2);
[c_2,i_2] = sort(points_2);
points_ind_2 = i_2(46:50);

val_final = [];
class = 'holly_hand_';


% This portion finds the predicted classes for the videos originally
% belonging to the "Handshake class"
for i=21:28
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = hist'/norm(hist');
    val_1 = 0;
    for j=1:size(points_ind,2)
        val_1 = val_1 + points(points_ind(j))*hist(points_ind(j));
    end
    val_2 = 0;
    for j=1:size(points_ind_2,2)
        val_2 = val_2 + points_2(points_ind_2(j))*hist(points_ind_2(j));
    end
    if val_1 > val_2
        val_final = [val_final;1];
    else
        val_final = [val_final;2];
    end
end

class= 'holly_phone_';

% This portion finds the predicted classes for the videos originally
% belonging to the "Talking on a Phone class"
for i=21:28
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = hist'/norm(hist');
    val_1 = 0;
    for j=1:size(points_ind,2)
        val_1 = val_1 + points(points_ind(j))*hist(points_ind(j));
    end
    val_2 = 0;
    for j=1:size(points_ind_2,2)
        val_2 = val_2 + points_2(points_ind_2(j))*hist(points_ind_2(j));
    end
    if val_1 > val_2
        val_final = [val_final;1];
    else
        val_final = [val_final;2];
    end
end
