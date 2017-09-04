k=0.8;
theta=60;
theta_r= theta*180/pi;
Xd=6;
Yd=7;
Xc=0;
Yc=0;
X=[0 7 3];
Y=[0 4 8];


q1=k.*cos(theta_r);
q2=k.*sin(theta_r);
q3=Xc+Xd;
q4=Yc+Yd;
Q=[q1;q2;q3;q4];
Z=[];

for i= 1:size(X,2);
   A=[X(i) -Y(i) 1 0;Y(i) X(i) 0 1]; 
   z=A*Q;
   Z=[Z;z]; 
end
cols=length(Z)/2;
Z=reshape(Z,[2,cols]);
Z