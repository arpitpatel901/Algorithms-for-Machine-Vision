X = [0 1 1 0 0 1 1 0];%%load data
Y = [0 0 1 1 0 0 1 1];
Z = [0 0 0 0 1 1 1 1];
W = ones(1,length(X));
XYZ = [X; Y; Z; W];
O = [0.5; 0.5; 1];
N = [0; 0; 1];
%%change to radians
Rx = 180*pi/180;
Ry1 = -30*pi/180;
Ry2 = 30*pi/180;
Rz = 0;
T = [0; 0; 0];
T1 = [2; 0.5; 8];
T2 = [-2; 0.5; 8];
f = 1.2;
%%define R matrices
Rmx = [1 0 0;
    0 cos(Rx) -sin(Rx);
    0 sin(Rx) cos(Rx)];
Rmy1 = [cos(Ry1) 0 sin(Ry1);
    0 1 0;
    -sin(Ry1) 0 cos(Ry1)];
Rmy2 = [cos(Ry2) 0 sin(Ry2);
    0 1 0;
    -sin(Ry2) 0 cos(Ry2)];
Hx1 = [Rmx T1; %%define H matrices
       0 0 0 1];
Hx2 = [Rmx T2; 
       0 0 0 1];
Hy1 = [Rmy1 T;
       0 0 0 1];
Hy2 = [Rmy2 T;
       0 0 0 1];
xyz1 = Hy1*Hx1*XYZ;
xyz2 = Hy2*Hx2*XYZ;
u1 = f.*xyz1(1,:)./xyz1(3,:);
v1 = f.*xyz1(2,:)./xyz1(3,:);
u1 = round(u1,6)
v1 = round(v1,6)
u2 = f.*xyz2(1,:)./xyz2(3,:);
v2 = f.*xyz2(2,:)./xyz2(3,:);
u2 = round(u2,6)
v2 = round(v2,6)
scatter(u1,v1)
hold on
xlabel('u1')
ylabel('v1')
figure
scatter(u2,v2)
hold on 
xlabel('u2')
ylabel('v2')
save('data.mat','u1','v1','u2','v2')



