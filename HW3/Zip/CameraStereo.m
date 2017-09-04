Wc=[0 0 0 0 0 0 0 0 0 0;2 1 0 -1 -2 0 0 0 0 0;0 0 0 0 0 2 1 0 -1 -2];
theta=180*pi/180;
f=1.2;
T=[2 3 8];
CameraModel(Wc,theta,f,T);
data=load('camera_calibration_data.mat');
Xw_1=data.Xw;
Yw_1=data.Yw;
u_1=data.u;
v_1=data.v;

Wc=[0 0 0 0 0 0 0 0 0 0;2 1 0 -1 -2 0 0 0 0 0;0 0 0 0 0 2 1 0 -1 -2];
theta=180*pi/180;
f=1.2;
T=[-2 3 8];
CameraModel(Wc,theta,f,T);
data=load('camera_calibration_data.mat');
Xw_2=data.Xw;
Yw_2=data.Yw;
u_2=data.u;
v_2=data.v;

d=u_1-u_2;
b=4;
Z=b*1.2./d;
figure;plot(u_1,v_1,'r*');
figure;plot(u_2,v_2,'g*');



