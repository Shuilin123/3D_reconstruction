function [ output_args ] = skeleton_line_repair( input_args )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [first,endx]=find(input_args(512,:)==1);
    [ms,ns]=size(endx);
    if ns==2
        input_args(512,endx(1):endx(2))=1;
    end
    
    [first,endx]=find(input_args(1,:)==1);
    [ms,ns]=size(endx);
    if ns==2
        input_args(1,endx(1):endx(2))=1;
    end
    
    [first,endx]=find(input_args(:,512)==1);
    [ms,ns]=size(endx);
    if ns==2
        input_args(endx(1):endx(2),512)=1;
    end
    
    [first,endx]=find(input_args(:,1)==1);
    [ms,ns]=size(endx);
    if ns==2
        input_args(endx(1):endx(2),1)=1;
    end
    output_args=input_args;
end

