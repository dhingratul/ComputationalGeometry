function [PixelList]=GetUnfilledNeighbors(Image)

mask = logical(Image); 
se = strel('square',3); %Structuring Element
border= imdilate(mask,se) - mask; %obtain dilation and subtract to obtain unfilled neighbors
[r,c] = find(border); %get coordinate values
PixelList=[r c];