function [ output_args ] = Skeleton_Line_indentify( input_args,threshold ,bw_threshold)
% �Ǽ��߽��б�ʶ byˮ�� 2022.5.20
% ����������ͼ�����Ϊ��ͨ����������С��ֵ
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
    figure('name','��ֵ�����ͼ');
    imshow(image);
    %% ��ɢ���˲�
    image=bwareaopen(image,threshold);
%     label=0.5*pi;
    %% �Ǽ��߽߱�����
    image=skeleton_line_repair(image);
    stried=0.5*pi;
    flag=1;
    [m,n]=size(image);
    img=zeros(m,n);
    figure('name','�Ǽ���ͼ');
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
        %% �����������鶨��
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
    %����С��0������
    img(img<0)=0;
	toc
    figure('name','��ʶ���')
    mesh(img);
    output_args=img;
end
