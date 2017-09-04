B= imread('HeadCT.png');
O= rgb2gray(B);
[Gy, Gx] = imgradientxy(O);
Gx = edge(Gx, 'sobel');
Gy = edge(Gy, 'sobel');

Ge= imgradient(O);
G =edge(Ge,'sobel');

subplot(1,3,1);
imshow(Gx);
title('Gx');

subplot(1,3,2);
imshow(Gy);
title('Gy');

subplot(1,3,3);
imshow(G);
title('G');