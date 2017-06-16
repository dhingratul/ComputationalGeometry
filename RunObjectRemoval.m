%% Object Removal
% Implemented Efros and Leung’s approach, to implement object removal
clear all;close all;
% addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW2/Data');
WindowSize=5;
OriginalImage=imread('test_im3.jpg');
OriginalImage=rgb2gray(OriginalImage);
% ObjectRemoval=imresize(ObjectRemoval,[500,500]);
OriginalImage=double(OriginalImage);
OriginalImage=OriginalImage+0.01;
I=roipoly(uint8(OriginalImage));
I2=~I;
CroppedOut=immultiply(double(OriginalImage),double(I2));
imshow(uint8(CroppedOut));
CroppedOut=double(CroppedOut);
[r,c] = find(CroppedOut==0);
minr=min(r); minc=min(c);maxr=max(r); maxc=max(c);
NewImage=CroppedOut(minr:maxr,minc:maxc+20);
imshow(uint8(NewImage));
OutImage=Removal(OriginalImage,NewImage,WindowSize,1);
[r_new,c_new]=size(NewImage);
[r_out,c_out]=size(OutImage);
diffr=(r_out-r_new)/2;
diffc=(c_out-c_new)/2;
NewNewImage=(OutImage(diffr:(r_out-diffr)-1,diffc:(c_out-diffc)-1));
for i=minr:minr+size(NewNewImage,1)-1
    for j=minc:minc+size(NewNewImage,2)-1
        CroppedOut(i,j)=NewNewImage(i-minr +1,j-minc + 1);
    end
end
imshow(uint8(CroppedOut));