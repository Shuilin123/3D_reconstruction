function [x,y,z] = getdata(I)
% ��ͼ�����ݽ���ת�� byˮ�� 2022.4.20
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
        % ������̫����в���
        n=length(x);
        x=point(1:2:n,1);
        y=point(1:2:n,2);
        z=z(1,1:2:n);
    end
end

