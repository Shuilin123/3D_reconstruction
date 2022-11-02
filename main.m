clc,clear,close all
threshold=30;
imgx=imread('./input/Result_fai_36_noise_nn_9.png');
img=Skeleton_Line_indentify(imgx,threshold,0.3);
Reconstruct3D(img,3);