addpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW2/Data');
tic;
WindowSize=5;
SampleImage=imread('T5.gif');
Image=zeros(280,280);
[r,c]=size(SampleImage);
if(r>100 && c>100)
    SampleImage=imresize(SampleImage,[50,50]);
    SampleImage=double(SampleImage)+0.001;
else
SampleImage=imresize(SampleImage,[50,50]);
end
r=floor(r/2); r=r+70;
c=floor(c/2); c=c+70;
% Copy the texture in an empty image
for i=r:r+size(SampleImage,1)-1
    for j=c:c+size(SampleImage,2)-1
        Image(i,j)=SampleImage(i-(r-1),j-(c-1));
    end
end
%Set last parameter to 0 if you don't want the texture being displayed
SampleImage=double(SampleImage);
OutImage=Synthesize(SampleImage,Image,WindowSize,0); 
time=toc;
% OutImage=GrowImage(SampleImage,Image,WindowSize);