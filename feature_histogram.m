%Computes Feature Histograms for each video once the clusters are found
%using k-means clustering. The histograms are stored in a folder named
%'Feature_Histograms' both as an array and as a pictre in .jpeg format.
%set 'number' and 'class' and create a folder by name 'Feature_Histograms' 
% in the workspace before running the code.

clear all
close all
load('hogdescriptors.mat')
load('centroids.mat')
for i=1:size(h,2)
    bla = CX - repmat(h(:,i),1,size(CX,2));
    norm = sum(bla.^2,1);
    for j=1:size(CX,2)
        if min(norm) == norm(1,j)
            index(1,i) = j;
        end
    end
end
%%
bla = 0;
for number=1:9  %set the index of the videos belonging to that particular class. Histograms of all the videos are evaluated in a single run.
    class = 'hs';   %set the class of the videos whose HoG descriptors are to be evaluated
    str = [['HOG/',class],num2str(number)];
    str = [str,'.mat'];
    load(str,'h');
    n = hist(index(:,bla+1:bla+size(h,2)),1:size(CX,2));
    n = n/sum(n);
    bla = bla+size(h,2);
    str = [['Feature_Histograms/',class],num2str(number)];
    str = [str,'.mat'];
    save(str,'n');
    bar(n)
    xlim([1 size(CX,2)])
    str = [['Feature_Histograms/',class],num2str(number)];
    str = [str,'.jpg'];
    saveas(gcf,str,'jpg');
end