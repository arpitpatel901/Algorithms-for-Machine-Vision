%%Part 1
n= [0 0 1]';
theta_d=60;
T=[0 0 1]';
Pw=[0 0 0]';
Vw=[0 0 1]';
theta= theta_d*180/pi;
% R=[n(1)^2+(1-n(1)^2)*cos(theta_r) n(1)*n(2)*(1-cos(theta_r))-n(3)*sin(theta_r) n(1)*n(3)*(1-cos(theta_r))+n(2)*sin(theta_r);
%    n(1)*n(2)*(1-cos(theta_r))+n(3)*sin(theta) n(2)^2+(1-n(2)^2)*cos(theta_r) n(1)*n(3)*(1-cos(theta_r))-n(2)*sin(theta_r);
%    n(1)*n(3)*(1-cos(theta_r))+n(2)*sin(theta_r) n(2)*n(3)*(1-cos(theta_r))+n(2)*sin(theta_r) n(3)^2+(1-n(3)^2)*cos(theta_r)];
R = [n(1)^2+(1-n(1)^2)*cos(theta) n(1)*n(2)*(1-cos(theta))-n(3)*sin(theta) n(1)*n(3)*(1-cos(theta))+n(2)*sin(theta);
     n(1)*n(2)*(1-cos(theta))+n(3)*sin(theta) n(2)^2+(1-n(2)^2)*cos(theta) n(2)*n(3)*(1-cos(theta))-n(1)*sin(theta);
     n(1)*n(3)*(1-cos(theta))+n(2)*sin(theta) n(2)*n(3)*(1-cos(theta))+n(1)*sin(theta) n(3)^2+(1-n(3)^2)*cos(theta)];
Hwc=[R T;0 0 0 1];
Vc=R*Vw;
x=Hwc*[Pw;1];
Pc=x(1:end-1);
%%Part 2
n= [0.5 0.5 0.5]';
n=n/norm(n);
theta2_d=25;
T2=[-1 -2 -5]';
Pw2=[2 1 3]';
Vw2=[0.5 0.2 0.3]';
theta= theta2_d*180/pi;
R = [n(1)^2+(1-n(1)^2)*cos(theta) n(1)*n(2)*(1-cos(theta))-n(3)*sin(theta) n(1)*n(3)*(1-cos(theta))+n(2)*sin(theta);
     n(1)*n(2)*(1-cos(theta))+n(3)*sin(theta) n(2)^2+(1-n(2)^2)*cos(theta) n(2)*n(3)*(1-cos(theta))-n(1)*sin(theta);
     n(1)*n(3)*(1-cos(theta))+n(2)*sin(theta) n(2)*n(3)*(1-cos(theta))+n(1)*sin(theta) n(3)^2+(1-n(3)^2)*cos(theta)];
Hwc=[R T2;0 0 0 1];
Vc2=R*Vw2;
x2=Hwc*[Pw2;1];
Pc2=x2(1:end-1);