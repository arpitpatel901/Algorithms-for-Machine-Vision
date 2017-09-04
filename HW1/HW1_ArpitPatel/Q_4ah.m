B = imread('nut_and_shell.png');
O =rgb2gray(B);
%imshow(O)
imhist(O)
H= histeq(O);
imshow(H);