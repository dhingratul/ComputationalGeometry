%% Image Inpaint
% Implemented Efros and Leung’s approach for image inpainting

% clear all;close all;
% addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW2/Data');
tic;
WindowSize=11;
Image=imread('test_im1.bmp');
Image=double(Image);
OutImage=Inpaint(Image,Image,WindowSize,0);
time=toc;