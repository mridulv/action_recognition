clc;
clear;

%load('clustering_information.mat');

class = 'hc_';

points = zeros(1,50);
points_2 = zeros(1,50);
group = [];

points2 = [];

for i=1:40
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = points + hist';
end

points = points/norm(points);

class = 'jog_';

for i=1:40
    str = [['HIST/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points_2 = points_2 + hist';
end

points_2 = points_2/norm(points_2);

val_final = [];
class = 'hc_';

for i=41:50
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

class= 'jog_';

for i=41:50
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
