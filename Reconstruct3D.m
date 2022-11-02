function [X,Y,Z] = Reconstruct3D(data,i)
    % �Ǽ�����ά�ع� byˮ�� 2022.4.20
        [x,y,z]=getdata(data);
        [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%��ֵ
%         x=1:512;y=1:512;
%         xx=1:512;yy=1:512;
%         [X,Y]=meshgrid(xx,yy);
%         Z=ADB2(x,y,data,xx,yy);
%         figure(123);
%         mesh(X,Y,Z);
        figure(i+2),[C,H]=contour(X,Y,Z); %�ȸ���ͼ contourf(X,Y,Z)
        clabel(C,H)
        xlabel('X(pixel)')
        ylabel('Y(pixel)')
        zlabel('Phase(Rad)')
        title(' �Ǽ��߱�ע��� ')
        figure('name','transformer result'),surfc(X,Y,Z);%s��ά���棨ǳɫ��+�ȸ���
        shading flat% ƽ��ͼ��
        colorbar;
        xlabel('X(pixel)')
        ylabel('Y(pixel)')
        zlabel('Phase(Rad)')
        title('Our approach');
end

