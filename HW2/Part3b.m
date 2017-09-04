o= imread('Camera.png');
im= rgb2gray(o);
im = edge(im, 'log', [], 3);
[gx, gy] = imgradientxy(im);
[row,col]=size(gx);
A= zeros(500,500);%%make a bigger A

for i=1:size(im,1)
    for j=1:size(im,2)   
        y=i;
        x=j;
        if gx(i,j)~=0 || gy(i,j)~=0
            v=(x*gx(i,j)+y*gy(i,j))./(gx(i,j)^2 + gy(i,j)^2);
            x0=round(v*gx(i,j));
            y0=round(v*gy(i,j));
            A(x0+100,y0+100)=A(x0+100,y0+100)+1;
        end
        
    end
end
[pointx0,pointy0]=find(A==max(max(A)));
pointx0=pointx0 - 100;
pointy0=pointy0 - 100;

slope=-pointx0/pointy0;
b=pointy0-pointx0.*slope;
xx = 1:300;
yy=xx.*slope + b;
figure;
imshow(o);
hold on;
plot(xx,yy);
[pointx0,pointy0,slope,b]
