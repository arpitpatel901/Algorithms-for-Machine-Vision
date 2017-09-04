load('data.mat')

f = 1.2;
Rx = 180*pi/180;
Ry1 = -30*pi/180;
Ry2 = 30*pi/180;
T1 = [2; 0.5; 8];
T2 = [-2; 0.5; 8];
%%get rotation matrices
Rmx = [1 0 0;
    0 cos(Rx) -sin(Rx);
    0 sin(Rx) cos(Rx)];

Rmy1 = [cos(Ry1) 0 sin(Ry1);
    0 1 0;
    -sin(Ry1) 0 cos(Ry1)];

Rmy2 = [cos(Ry2) 0 sin(Ry2);
    0 1 0;
    -sin(Ry2) 0 cos(Ry2)];
R1 = Rmy1*Rmx;
R2 = Rmy2*Rmx;
R1 = [Rmx T1];
R2 = [Rmx T2];
Rt1 = Rmy1*R1;
Rt2 = Rmy2*R2;
A = [f 0 0; 0 f 0; 0 0 1];
P1 = A*Rt1;
P2 = A*Rt2;

for num = 1:8

u = u1(num);
v = v1(num);

skm1 = [0 -1 v;
        1 0 -u;
       -v u 0];
   
u = u2(num);
v = v2(num);
 
skm2 = [0 -1 v;
        1 0 -u;
        -v u 0];
     
B = [skm1*P1;
   skm2*P2];

XYZ(1:3,num) = pinv(B(:,1:3))*-B(:,4);

end
XYZ