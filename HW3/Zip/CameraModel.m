function []=  CameraModel(Wc,theta,f,T)
% Wc=[2 1 0 -1 -2 0 0 0 0 0;0 0 0 0 0 2 1 0 -1 -2;0 0 0 0 0 0 0 0 0 0];
% theta=120*pi/180;
% f=1.2;
% T=[2 3 8];
Wc = [Wc; ones(1,length(Wc))];
Rx=[1 0 0;0 cos(theta) -sin(theta);0 sin(theta) cos(theta)];
Hwc=[Rx T';0 0 0 1];
Cc=Hwc*Wc;
u=f.* (Cc(1,:)./Cc(3,:));
u=round(u,6);
v=f.* (Cc(2,:)./Cc(3,:));
v=round(v,6);
Xw=Wc(1,:);
Yw=Wc(2,:);
save('camera_calibration_data.mat','Xw','Yw','u','v');
end
