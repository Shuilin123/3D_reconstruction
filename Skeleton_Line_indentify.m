function [ output_args ] = Skeleton_Line_indentify( input_args,threshold ,bw_threshold)
% 骨架线进行标识 by水林 2022.5.20
% 输入待处理的图像和认为联通的数量的最小阈值
%
    global image;
    global img;
    global flag;
    if length(size(input_args))==3
        input_args=rgb2gray(input_args);
    end
    image=input_args;
    imgx=im2bw(image,bw_threshold);
    image=bwmorph(imgx,'thin',inf);
    figure('name','二值化后的图');
    imshow(image);
    %% 离散点滤波
    image=bwareaopen(image,threshold);
%     label=0.5*pi;
    %% 骨架线边界连接
    image=skeleton_line_repair(image);
    stried=0.5*pi;
    flag=1;
    [m,n]=size(image);
    img=zeros(m,n);
    figure('name','骨架线图');
    imshow(image);
    msg=inputdlg('center number','Inf');
    nums=str2double(msg{1});
    msgx=inputdlg('total phase','Inf');
    label=str2double(msgx{1});
    label=label*pi;
    uiwait(msgbox('Please select a hot deformation center','modal'));
    [xpoint,ypoint] = ginput_espi(nums);        %Select starting point for the guided floodfill algorithm
    mid_y = round(xpoint);
    mid_x = round(ypoint);
	tic
    for k=1:size(mid_x)
        %% 搜索方向数组定义
        direction_x1=mid_x(k):-1:1;
        direction_y1=mid_y(k);
        direction_x2=mid_x(k):1:m;
        direction_y2=mid_y(k);
        iteration_direction(1)={{[direction_x1,direction_x2];[direction_y1,direction_y2]}};
        direction_x1=mid_x(k);
        direction_y1=mid_y(k):-1:1;
        direction_x2=mid_x(k);
        direction_y2=mid_y(k):1:n;
        iteration_direction(2)={{[direction_x1,direction_x2];[direction_y1,direction_y2]}};
        direction_x1=mid_x(k):-1:1;
        direction_y1=mid_y(k):-1:1;
        direction_x2=mid_x(k):1:m;
        direction_y2=mid_y(k):1:n;
        iteration_direction(3)={{[direction_x1,direction_x2];[direction_y1,direction_y2]}};
        direction_x1=mid_x(k):-1:1;
        direction_y1=mid_y(k):1:n;
        direction_x2=mid_x(k):1:m;
        direction_y2=mid_y(k):-1:1;
        iteration_direction(4)={{[direction_x1,direction_x2];[direction_y1,direction_y2]}};
        msgx=inputdlg('iterative direction','Inf');
        direction_index=str2double(msgx{1});
        for i=iteration_direction{direction_index}{1}
            for j=iteration_direction{direction_index}{2}
                dfs(i,j,label);
                if flag==0
                    label=label-stried;
                    flag=1;
                end
            end
        end
    end
    close;
    %处理小于0的坐标
    img(img<0)=0;
	toc
    figure('name','标识结果')
    mesh(img);
    output_args=img;
end
