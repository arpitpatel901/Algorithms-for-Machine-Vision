B= imread('nut_and_shell.png');
I= rgb2gray(B);

U1= im2bw(I,(20/255));
O1= im2bw(I,(130/255));
C1= im2bw(I,(50/255));

L = bwlabel(~C1);
 s = regionprops(L,'Area', 'centroid');
 centroids = cat(1, s.Centroid);
 area = cat(1, s.Area);
 imshow(C1)
 hold on
 plot(centroids(1,1), centroids(1,2), 'x');
 plot(centroids(2,1), centroids(2,2), '+');
 hA= sprintf('Area of hex is %0.2d',area(1));
 sA= sprintf('Area of shell is %0.2d',area(2));
 legend('centroid of nut','centroid of shell');
 
 hold off