B= imread('nut_and_shell.png');
I= rgb2gray(B);


C1= im2bw(I,(50/255));

L = bwlabel(C1);
%  s = regionprops(L,'Area', 'centroid');
%  centroids = cat(1, s.Centroid);
%  imshow(C1)
%  hold on
%  %centroids= centroids((2:3),:);
%  plot(centroids(:,1), centroids(:,2), 'b*');
%  hold off
 
E = bwboundaries(L);

a1=E(1);
b1=a1{:,1};

a2=E(2);
b2=a2{:,1};

a3=E(3);
b3=a3{:,1};

a4=E(4);
b4=a4{:,1};

a5=E(5);
b5=a5{:,1};

imshow(B)
hold on

%plot(b1(:,2),b1(:,1));
%plot(b2(:,2),b2(:,1));
%plot(b3(:,2),b3(:,1));
plot(b4(:,2),b4(:,1));
plot(b5(:,2),b5(:,1));
hold off