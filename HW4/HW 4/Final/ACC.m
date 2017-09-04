img = imread('fanbone.bmp'); % Read image
img=im2double(img);
imgNorm=img/256;
R = img(:,:,1); % Red channel
G = img(:,:,2); % Green channel
B = img(:,:,3); % Blue channel

sigc=1;
sigs=10;
n=5;

Gc=fspecial('gaussian',n,sigc);
Gs=fspecial('gaussian',n,sigs);
DoG=Gc-Gs;

h=imfilter(R,DoG)+imfilter(2*R-G,Gs);
figure
title('Fanbone DoG')
subplot(1,3,1)
imshow(img)

subplot(1,3,2)
imshow(h)
e=im2bw(h,.85);
subplot(1,3,3)
imshow(e)