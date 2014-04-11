clc;
clear;

%load('clustering_information.mat');

class = 'hc_';

points = [];
group = [];

points2 = [];

for i=1:40
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;1];
end

for i=41:50
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'jog_';

for i=1:40
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;2];
end

for i=41:50
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

svm_var = svmtrain(points,group);
var_ans = svmclassify(svm_var,points2);
