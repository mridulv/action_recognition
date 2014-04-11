% All the videos are to be stored in a folder named 'DATA' in the
% workspace in ".avi" format. All the videos belonging to a class must have same prefix
% (say, 'su' for standup videos). And the videos of that particular class
% must be named as 'class1','class2'.....(say, su1,su2,su3,... for
% standup). A 3-D matrix indicating STIP points ('0' if yes,'1' if no) is
% stored in a folder named 'STIP'. Even the time taken to evaluate STIPs of
% each video are saved. Set the 'number' and 'class' and create a folder by name 'STIP'in the
% workspace before running the code.

function STIP(class)

    for i=1:3
        for j=1:2
            std=2^((i+1)/2);std_t=2^(j/2);
            [x,y,t] = meshgrid(-1:1,-1:1,-1:1);
            arg   = -((x.*x + y.*y)/(2*std*std)) - (t.*t/(2*std_t*std_t));
            h(:,:,:,6*(j-1)+i) = exp(arg);
            % h(h<eps*max(h(:))) = 0;
            sumh = sum(sum(sum(h(:,:,:,6*(j-1)+i))));
            if sumh ~= 0,
            h(:,:,:,6*(j-1)+i) = h(:,:,:,6*(j-1)+i)/sumh;
            end
        end
    end
    %%
    clearvars x y
    for number=1:28  %set the index of the videos belonging to that particular class. STIPs of all the videos are evaluated in a single run.
        tic
        str = ['DATA/',class];
        str = [str,num2str(number)];
        str = [str,'.avi'];
        obj = mmreader(str);
        nrows = obj.Height;
        ncols = obj.Width;
        video = read(obj);
        nframes = obj.NumberOfFrames;
        for i=1:nframes
            fr(:,:,i) = rgb2gray(video(:,:,:,i));
        end
        corner = ones(nrows,ncols,nframes);
        for n=1:6
            frame = imfilter(fr, h(:,:,:,n));
            frame_x = cat(2,frame(:,2:ncols,:)-frame(:,1:ncols-1,:),zeros(nrows,1,nframes));
            frame_y = cat(1,zeros(1,ncols,nframes),frame(1:nrows-1,:,:)-frame(2:nrows,:,:));
            frame_t = cat(3,frame(:,:,2:nframes)-frame(:,:,1:nframes-1),zeros(nrows,ncols,1));
            frame_x2 = frame_x.*frame_x;frame_y2 = frame_y.*frame_y;frame_t2 = frame_t.*frame_t;
            frame_xy = frame_x.*frame_y;frame_yt = frame_y.*frame_t;frame_xt = frame_x.*frame_t;
            Ix2 = imfilter(frame_x2,h(:,:,:,n));Iy2 = imfilter(frame_y2,h(:,:,:,n));It2 = imfilter(frame_t2,h(:,:,:,n));
            Ixy = imfilter(frame_xy,h(:,:,:,n));Iyt = imfilter(frame_yt,h(:,:,:,n));Ixt = imfilter(frame_xt,h(:,:,:,n));
            clearvars frame_x2 frame_y2 frame_t2 frame_xy frame_yt frame_xt frame_x frame_y frame_t

            for i=1:nrows
                for j=1:ncols
                    for k=1:nframes
                        A = [Ix2(i,j,k) Ixy(i,j,k) Ixt(i,j,k);...
                             Ixy(i,j,k) Iy2(i,j,k) Iyt(i,j,k);...
                             Ixt(i,j,k) Iyt(i,j,k) It2(i,j,k)];
                        A = cast(A,'double');
                        Mc(i,j,k) = det(A) - 0.005*((trace(A))^3);
                    end
                end
            end
            clearvars Ix2 Iy2 It2 Ixy Iyt Ixt

            for i=2:nrows-1
                for j=2:ncols-1
                    for k=2:nframes-1
                        if ((max(max(max(Mc(i-1:i+1,j-1:j+1,k-1:k+1)))) == Mc(i,j,k)) && (Mc(i,j,k) > 10000))
                            corner(i,j,k) = 0;
                        end
                    end
                end
            end
        end
        time = toc;
        str = [['STIP/',class],num2str(number)];
        save(str,'corner','time');
        clearvars A Mc corner fr frame
    end
end