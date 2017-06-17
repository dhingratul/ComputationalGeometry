%% Image inpainting and Object removal
addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW2/Data');
tic;
WindowSize=11;
SampleImage=imread('T3.gif');
SampleImage=imresize(SampleImage,[50,50]);
Image=zeros(280,280);
[r,c]=size(SampleImage);
r=floor(r/2); r=r+70;
c=floor(c/2); c=c+70;
%Copy the texture in an empty image
for i=r:r+size(SampleImage,1)-1
    for j=c:c+size(SampleImage,2)-1
        Image(i,j)=SampleImage(i-(r-1),j-(c-1));
    end
end
% imshow(uint8(Image));
% OutImage=Synthesis(SampleImage,Image,WindowSize,0);
% imagesc(OutImage);
time=toc;
OutImage=GrowImage(SampleImage,Image,WindowSize);
%% Inpainting
Inpaint=imread('test_im1.bmp');
% OutImage=GrowImage(Inpaint,Inpaint,WindowSize);
OutImage=Synthesis(Inpaint,Inpaint,WindowSize);
%% Object Removal
ObjectRemoval=imread('test_im3.jpg');
ObjectRemoval=rgb2gray(ObjectRemoval);
I=roipoly(ObjectRemoval);
I2=~I;
ObjectRemoval2=immultiply(double(ObjectRemoval),double(I2));
imshow(uint8(ObjectRemoval2));
ObjectRemoval2=padarray(ObjectRemoval2,[50,50]);
% OutImage=TexTureSynThesis(ObjectRemoval,ObjectRemoval,WindowSize);
OutImage=GrowImage(ObjectRemoval,ObjectRemoval,WindowSize);

