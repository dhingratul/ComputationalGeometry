function[Window]=GetNeighborhoodWindow(Pixel,WindowSize,Image)
r=Pixel(1,1);
c=Pixel(1,2);
Window=[];
    if(r~=1 && c~=1)
        w=floor(WindowSize/2);
        Window=Image(r-w:r+w,c-w:c+w);
    end
end