function [x,y,z] = getdata(I)
% 将图像数据进行转换 by水林 2022.4.20
    [m,n]=size(I);
    point=[];
    x=[];
    y=[];
    z=[];
    for i=m:-1:1
        for j=1:n
            if I(i,j)~=0
               z=[z,I(i,j)];
               point=[point;[i,j]];
            end
        end
    end
    x=point(:,1);
    y=point(:,2);
    if length(x)>10000
        % 数据量太大进行采样
        n=length(x);
        x=point(1:2:n,1);
        y=point(1:2:n,2);
        z=z(1,1:2:n);
    end
end

