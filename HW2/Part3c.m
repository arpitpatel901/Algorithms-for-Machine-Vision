im = rgb2gray(imread('HW2.png'));
edgeImg = edge(im);
[gx,gy] = imgradientxy(edgeImg);
offset = 300;
accum = zeros(600,600,100);
for R = 1:100
    for x = 1:size(edgeImg,1)
        for y = 1:size(edgeImg,2)
            if (gx(x,y)~=0 || gy(x,y)~=0)
                
            xc = round(y - R*gx(x,y)/sqrt(gx(x,y)^2+gy(x,y)^2));
            yc = round(x - R*gy(x,y)/sqrt(gx(x,y)^2+gy(x,y)^2));
            
            accum(xc+offset,yc+offset,R) = accum(xc+offset,yc+offset,R) + 1;
            
            end
        end
    end
end
[~,index] = max(accum(:));
[maxx, maxy, maxr] = ind2sub(size(accum),index);
xc = maxx - offset;
yc = maxy - offset;
R = maxr;
th = 0:pi/50:2*pi;
x = R * cos(th) + xc;
y = R * sin(th) + yc;
figure 
imshow(edgeImg)
hold on
plot(x, y,'r');
title('Circle Detected')
hold off

