function [ output_args ] = dfs(x,y,count)
%用深度优先搜索求连通区域 by水林 2022.5.20
    global image;
    global img;
    global flag;
    [m,n]=size(img);
    direction=[[-1,0];[1,0];[0,1];[0,-1];[-1,-1];[1,1];[-1,1];[1,-1]];
    if(img(x,y)==0&&image(x,y)==1)
        flag=0;
        img(x,y)=count;
    else
        return
    end
    for k=1:8
        xpos=x+direction(k,1);
        ypos=y+direction(k,2);
        if((xpos>0&&xpos<=m)&&(ypos>0&&ypos<=n))
             dfs(xpos,ypos,count);
        end
    end
    output_args=img;
end

