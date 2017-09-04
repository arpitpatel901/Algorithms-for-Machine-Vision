f= imread('headCT.bmp'); % Read image
b=ones(3);

%Dilation
figure
fdilate=imdilate(f,b);
imshow(fdilate)
title('Dilation')

%Erosion
figure
ferode=imerode(f,b);
imshow(ferode)
title('Erosion')

%Subtraction
fsub=fdilate-ferode;
figure
imshow(fsub)
title('Difference=Dilation- Erosion')