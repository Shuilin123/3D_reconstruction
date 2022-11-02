function [X,Y,Z] = Reconstruct3D(data,i)
    % 骨架线三维重构 by水林 2022.4.20
        [x,y,z]=getdata(data);
        [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值
%         x=1:512;y=1:512;
%         xx=1:512;yy=1:512;
%         [X,Y]=meshgrid(xx,yy);
%         Z=ADB2(x,y,data,xx,yy);
%         figure(123);
%         mesh(X,Y,Z);
        figure(i+2),[C,H]=contour(X,Y,Z); %等高线图 contourf(X,Y,Z)
        clabel(C,H)
        xlabel('X(pixel)')
        ylabel('Y(pixel)')
        zlabel('Phase(Rad)')
        title(' 骨架线标注结果 ')
        figure('name','transformer result'),surfc(X,Y,Z);%s三维曲面（浅色）+等高线
        shading flat% 平滑图像
        colorbar;
        xlabel('X(pixel)')
        ylabel('Y(pixel)')
        zlabel('Phase(Rad)')
        title('Our approach');
end

