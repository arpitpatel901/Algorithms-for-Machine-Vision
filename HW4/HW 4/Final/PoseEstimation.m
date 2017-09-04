X = [0 1 1 0 0 1 1 0];
Y = [0 0 1 1 0 0 1 1];
Z = [0 0 0 0 1 1 1 1];
W = ones(1,length(X));
O = [0.5; 0.5; 1; 1];
N = [0; 0; 1];
Rx = 180*pi/180;
Ry = -30*pi/180;
Rz = 0;
T1 = [2; 0.5; 8];
T = [0; 0; 0];
f = 1.2;
%%Rotation Matrices
Rmx = [1 0 0;
    0 cos(Rx) -sin(Rx);
    0 sin(Rx) cos(Rx)];

Rmy = [cos(Ry) 0 sin(Ry);
       0 1 0;
      -sin(Ry) 0 cos(Ry)];

Hx = [Rmx T1;
      0 0 0 1];

Hy = [Rmy T;
      0 0 0 1];
XYZ = [X; Y; Z; W];
xyz1 = Hy*Hx*XYZ;
u = f.*xyz1(1,:)./xyz1(3,:);
v = f.*xyz1(2,:)./xyz1(3,:);
u = round(u,6);
v = round(v,6);
o = Hy*Hx*O;
n = Rmy*Rmx*N; 
M = [];
for a = 1:length(X)
    
    Mt = [f*X(a), f*Y(a), f*Z(a), 0, 0, 0, -u(a)*X(a), - u(a)*Y(a), - u(a)*Z(a), f, 0, -u(a);
        0, 0, 0, f*X(a), f*Y(a), f*Z(a), -v(a)*X(a), - v(a)*Y(a), - v(a)*Z(a), 0, f, -v(a)];
    
    M = [M; Mt];
    
end

Q = [N(1) N(2) N(3) 0 0 0 0 0 0 0 0 0;
    0 0 0 N(1) N(2) N(3) 0 0 0 0 0 0;
    0 0 0 0 0 0 N(1) N(2) N(3) 0 0 0;
    O(1) O(2) O(3) 0 0 0 0 0 0 1 0 0;
    0 0 0 O(1) O(2) O(3) 0 0 0 0 1 0;
    0 0 0 0 0 0 O(1) O(2) O(3) 0 0 1];

Qpr = [n(1) 0 0 n(2) 0 0 n(3) 0 0 0 0 0;
       0 n(1) 0 0 n(2) 0 0 n(3) 0 0 0 0;
       0 0 n(1) 0 0 n(2) 0 0 n(3) 0 0 0];
   
W = [M; Q; Qpr];
b = [zeros(1,16) n(1) n(2) n(3) o(1) o(2) o(3) N(1) N(2) N(3)]';

V = pinv(W)*b;

R = [V(1) V(2) V(3)
    V(4) V(5) V(6)
    V(7) V(8) V(9)]

T = [V(10); V(11); V(12)]


