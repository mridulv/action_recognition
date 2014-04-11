clc;
clear;

load('clustering_information.mat');

class = 'hc_';

for i=1:50
    str = [['HOG/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(50,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST/',class],num2str(i)];
    save(str,'hist'); 
end


class = 'jog_';

for i=1:50
    str = [['HOG/',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(50,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST/',class],num2str(i)];
    save(str,'hist'); 
end