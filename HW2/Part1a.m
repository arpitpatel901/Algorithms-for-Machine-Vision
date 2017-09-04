
im= imread('HW2.png');
im= rgb2gray(im);
im = edge(im, 'canny', [0.1 0.2], 2);
[row,col]=size(im);
A=zeros(row,col);
s = regionprops(im,'Area', 'centroid');
centroids = cat(1, s.Centroid);

reference= centroids;
yc=reference(1,1);
xc=reference(1,2);
hold on
r=[];
X=[];
Y=[];
for x =1:row
    for y=1:col
          if im(x,y)==1
              X=[X x];
              Y=[Y y];
          rho = ((x-xc).^2 + (y-yc).^2).^0.5;
          theta= atan2((y-yc),(x-xc)); %%flip to get six points
          r=[r rho];
          plot(theta,rho,'+');
          end
    end
end
xlabel('Theta- in radians');
ylabel('Distance- in pixels');
hold off

[peaks,locs]= findpeaks(r,'MinPeakDistance',100);
locs(6)=[];
locs(3)=[];
figure 
imshow(im)
hold on
plot( Y(locs),X(locs),'*');
title('Points detected')
hold off

%based on visual analysis of the plot
%the corners for the image are
% 
% x,y= -1.21,93.45
% x,y= -0.3943,97.45
% x,y=  0.4751,84.31
% x,y=  -0.2168,58.4
% x,y= 0.9967,75.55