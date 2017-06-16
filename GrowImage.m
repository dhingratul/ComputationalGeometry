%% Synthesize texture
% Implemented Efros and Leung’s approach, to synthesize a 200x200 pixel
% image for given image with varying WindowSize parameter.
% Input: SampleTexture, Image
% Output: Synthesize image
function[Image]= GrowImage(SampleImage,Image,WindowSize,DrawTexture)
MaxErrThreshold = 0.3;
[r,c] = size(SampleImage);
while(~min(any(Image)))
    progress = 0;
    [PixelList]=GetUnfilledNeighbors(Image);
    for j=1:size(PixelList,1)
        Template = GetNeighborhoodWindow(PixelList(j,:),WindowSize,Image);
        if(~isempty(Template))
            [BestMatches]=FindMatches(Template,SampleImage, WindowSize);
            
            BestMatch = BestMatches(1 + (floor(rand(1)) .* length(BestMatches))); %pick from random indices in BestMatches vec
            
            Image(PixelList(j,1),PixelList(j,2)) = SampleImage(BestMatches(1,1),BestMatches(1,2)); %replace pixel coordinates' values with BestMatch pixel value
            progress = 1;
            %% Draw figure
            if DrawTexture==1
                imagesc(Image);
                axis image; colormap gray;
                drawnow;
            end
        end
    end
end