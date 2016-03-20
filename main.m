addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW2/Data');
WindowSize=11;
SampleImage=imread('T1.gif');
SampleImage=imresize(SampleImage,[50,50]);
Image=zeros(200,200);
[r,c]=size(SampleImage);
r=floor(r/2); r=r+50;
c=floor(c/2); c=c+50;
%Copy the texture in an empty image
for i=r:r+size(SampleImage,1)-1
    for j=c:c+size(SampleImage,2)-1
        Image(i,j)=SampleImage(i-(r-1),j-(c-1));
    end
end
% imshow(uint8(Image));
% OutImage=TexTureSynThesis(SampleImage,Image,WindowSize);
OutImage=GrowImage(SampleImage,Image,WindowSize);
%% Object Removal
ObjectRemoval=imread('test_im3.jpg');
ObjectRemoval=rgb2gray(ObjectRemoval);
I=roipoly(ObjectRemoval);
I2=~I;
ObjectRemoval=immultiply(double(ObjectRemoval),double(I2));
imshow(uint8(ObjectRemoval));
ObjectRemoval=padarray(ObjectRemoval,[50,50]);
% OutImage=TexTureSynThesis(ObjectRemoval,ObjectRemoval,WindowSize);
OutImage=GrowImage(ObjectRemoval,ObjectRemoval,WindowSize);

