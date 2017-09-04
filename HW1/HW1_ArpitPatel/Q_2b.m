v1= [124 127 128 130 132 132 129 129];
v2= [125 123 125 125 128 131 130 130];
v3= [129 127 123 124 125 126 128 128];
v4= [129 127 124 121 122 122 126 126];
v5= [131 129 126 122 119 119 121 124];
v6= [128 127 127 124 121 118 118 117];

v=[v1;v2;v3;v4;v5;v6];

mask1 = v==117;
v(mask1) = 5;

mask1 = v==118;
v(mask1) = 16;

mask1 = v==119;
v(mask1) = 27;

mask1 = v==120;
v(mask1) = 27;

mask1 = v==121;
v(mask1) = 43;

mask1 = v==122;
v(mask1) = 58;

mask1 = v==123;
v(mask1) = 69;

mask1 = v==124;
v(mask1) = 96;

mask1 = v==125;
v(mask1) = 117;

mask1 = v==126;
v(mask1) = 138;

mask1 = v==127;
v(mask1) = 165;

mask1 = v==128;
v(mask1) = 191;

mask1 = v==129;
v(mask1) = 218;

mask1 = v==130;
v(mask1) = 234;

mask1 = v==131;
v(mask1) = 244;

mask1 = v==132;
v(mask1) = 245;




sum(sum(v==132))

O= imread('EyeBall.png');
imshow(O)
imhist(O)
H= histeq(O);
imshow(H);
imhist(H);