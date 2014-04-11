% This code evaluates the 3-D HoG descriptors for videos of a class and stores
% them in a folder named 'HOG'.
% Set the 'number' and 'class' and create a folder by name 'HOG'in the
% workspace before running the code.

function Collecting_HOG(number,class)
    str = [['STIP/',class],num2str(number)];
    str = [str,'.mat'];
    load(str,'corner');
    str = [['Videos/',class],num2str(number)];
    str = [str,'.mat'];
    load(str,'frame');
    s = size(frame);
    count = 1;
    for i=18:(s(1)-18)
        for j=18:(s(2)-18)
            for k=9:(s(3)-9)
                if(corner(i,j,k)==0)
                    h(:,count) = HOG(frame(i-17:i+18,j-17:j+18,k-8:k+9));
                    count = count+1;
                end
            end
        end
    end
    str = [['HOG/',class],num2str(number)];
    save(str,'h');
    clearvars h
end