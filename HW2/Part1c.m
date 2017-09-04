im= imread('HW2.png');
im= rgb2gray(im);
bwImg= im2bw(im,0.2);
bwImg= imcomplement(bwImg);
[B,L,N,A]= bwboundaries(bwImg,'noholes');
x=B{1}(:,2);
y=B{1}(:,1);
x=[x;x];
y=[y;y];
n=length(x);
s=linspace(-n/2,n/2,n);
sigma=5;
g0=1/sqrt(2*pi*sigma^2)*exp(-s.^2/(2*sigma^2));
g=[g0 g0]';
X=conv(x,g,'same');
X=X(1:round(end/2));
Y=conv(y,g,'same');
Y=Y(1:round(end/2));
Xd=diff(X);
Xdd=diff(Xd);
Yd=diff(Y);
Ydd=diff(Yd);
X_vec=[];
Y_vec=[];
for i=1:length(Xdd)
    X_vec=[X_vec X];
    Y_vec=[Y_vec Y];
    K(i)=abs(Xd(i)*Ydd(i))-(Xdd(i)*Yd(i));
end
hold on
plot(1:length(K(1:end/2)),K(1:end/2));
ylabel('curvature');
hold off
[peaks,locs]= findpeaks(K,'MinPeakDistance',50);
locs(1)=[];
locs(7)=[];
locs(6)=[];
figure 
imshow(bwImg)
hold on
plot( X_vec(locs),Y_vec(locs),'*');
title('Points detected')
hold off