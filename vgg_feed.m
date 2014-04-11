clc;
clear;

X = [];

class = 'holly_hand_';

for i=1:28
    str = [['HOG/',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X h];
    fprintf('holly_hand loading %d \n',i);
end

fprintf('holly_hand loaded \n');

class = 'holly_phone_';

for i=1:28
    str = [['HOG/',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X h];
    fprintf('holly_phone loading %d \n',i);
end

fprintf('holly_phone loaded \n');


k = 50;
[IDX,C] = kmeans(X',k);