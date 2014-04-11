% This code computes HoG descriptors for the videos as mentioned in our
% report.

function H=HOG(vid)
nwin_x=3;%set here the number of HOG windows per bound box
nwin_y=3;
nwin_t=2;
B=9;%set here the number of histogram bins
[L,C,T]=size(vid); % L num of lines ; C num of columns ; T num of frames
H=zeros(nwin_x*nwin_y*nwin_t*B*B,1); % column vector with zeros
vid=double(vid);
step_x=floor(C/(nwin_x+1));
step_y=floor(L/(nwin_y+1));
step_t=floor(T/(nwin_t+1));
cont=0;
hx = [-1,0,1];
hy = -hx';
ht = cat(3,-1,0,1);
grad_x = imfilter(double(vid),hx);
grad_y = imfilter(double(vid),hy);
grad_t = imfilter(double(vid),ht);
angles1=atan2(grad_y,grad_x);
angles2=atan2(grad_y,grad_t);
magnit=((grad_y.^2)+(grad_x.^2)+(grad_t.^2)).^.5;
for l=0:nwin_y-1
    for m=0:nwin_x-1
        for n=0:nwin_t-1 
            cont=cont+1;
            angles_box1=angles1(l*step_y+1:(l+2)*step_y,m*step_x+1:(m+2)*step_x,n*step_t+1:(n+2)*step_t);
            angles_box2=angles2(l*step_y+1:(l+2)*step_y,m*step_x+1:(m+2)*step_x,n*step_t+1:(n+2)*step_t);
            magnit_box=magnit(l*step_y+1:(l+2)*step_y,m*step_x+1:(m+2)*step_x,n*step_t+1:(n+2)*step_t);
            v_angles1=angles_box1(:);    
            v_angles2=angles_box2(:);    
            v_magnit=magnit_box(:);
            K=max(size(v_angles1));
            %assembling the histogram with 9 bins for each angle(range of 20 degrees per bin)
            bin=0;
            H2=zeros(B*B,1);
            for ang_lim1=-pi+2*pi/B:2*pi/B:pi
                for ang_lim2=-pi+2*pi/B:2*pi/B:pi
                    bin=bin+1;
                    for k=1:K
                        if ((v_angles2(k)<=ang_lim2) && (v_angles1(k)<=ang_lim1))
                            v_angles1(k)=100;
                            v_angles2(k)=100;
                            H2(bin)=H2(bin)+v_magnit(k);
                        end
                    end
                end
            end

            H2=H2/(norm(H2)+0.01);        
            H((cont-1)*B*B+1:cont*B*B,1)=H2;
        end
    end
end
