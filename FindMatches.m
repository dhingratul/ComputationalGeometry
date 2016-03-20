function[BestMatches,SSD]=FindMatches(Template,SampleImage, WindowSize)
ErrThreshold = 0.1; Sigma = WindowSize/6.4;
validMask=logical(Template);
gaussMask = fspecial('gaussian',WindowSize, Sigma);
totalWeight = sum(sum(gaussMask(validMask)));
sz=floor(WindowSize/2);
SSD=inf(size(SampleImage));
for i=sz+1:size(SampleImage,1)-sz-1
    for j=sz+1:size(SampleImage,2)-sz-1
        SSD(i,j)=0;
        for ii=-sz:sz
            for jj=-sz:sz
                
                dist=(Template(ii+sz+1,jj+sz+1)-SampleImage(i-ii,j-jj))^2;
                SSD(i,j) = SSD(i,j) + double(dist)*double(validMask(ii+sz+1,jj+sz+1))*double(gaussMask(ii+sz+1,jj+sz+1));
            end
        end
        SSD(i,j) = SSD(i,j) / totalWeight;
%         if(SSD(i,j) <= min(SSD)*(1+ErrThreshold))
%             BestMatches=[BestMatches;SampleImage(i,j)];
%         end
    end
end
BestMatches=[];
minSSD=min(min(SSD));
box=SSD<= (1 + ErrThreshold)*minSSD;

for i=1:size(box,1)
    for j=1:size(box,2)
        if(box(i,j)==1)
            BestMatches=[BestMatches; i j SSD(i,j)];
        end
    end
end
BestMatches=BestMatches(randperm(size(BestMatches,1)),:);
[val idx]=sort(BestMatches(:,3));
BestMatches=BestMatches(idx,:);
end