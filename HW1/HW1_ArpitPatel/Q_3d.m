B= imread('HeadCT.png');
O= rgb2gray(B);
i= [1 2];
m1=(6.*i(2))+1;
h1= fspecial('gaussian',[m1 m1],i(1)); 



h2= fspecial('gaussian',[m1 m1],i(2)); 
h3=h1-h2;
DOG=imfilter(B,h3);
imshow(DOG)

