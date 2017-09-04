im= imread('HW2.png');
im= rgb2gray(im);

bwImg=im2bw(im,0.2);
bwImg=imcomplement(bwImg);

[B,L,N,A]= bwboundaries(bwImg);
xall=B{1}(:,1);
yall=B{1}(:,2);
X=[xall;xall]';
Y=[yall;yall]';
n=15;
D=[];
hold on
for i=1:(size(X,2)/2)
    X0=X(i+n);
    X1=X(i);
    X2=X(i+2*n);
    Y0=Y(i+n);
    Y1=Y(i);
    Y2=Y(i+2*n);
     d= abs(((Y2-Y1)*X0 - (X2-X1)*Y0 +X2*Y1- Y2*X1)/((Y2-Y1)^2+(X2-X1)^2)^0.5);
    D=[D d];
end
hold on
plot(1:size(X,2)/2,D);
ylabel('median length')
hold off

[peaks,locs]= findpeaks(D,'MinPeakDistance',50);
locs(1)=[];
locs= locs+n;
figure 
imshow(im)
hold on
plot( yall(locs),xall(locs),'*');
title('Points detected')
hold off