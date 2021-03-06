data=load('hand_eye_data.mat');
Hc1=data.Hc1;
Hc2=data.Hc2;
Hc3=data.Hc3;
Hg12=data.Hg12;
Hg23=data.Hg23;

Hc12=Hc2*inv(Hc1);
Hc23=Hc3*inv(Hc2);

%R12 T12 from Hc12
R12=Hc12(1:3,1:3);
T12=Hc12(1:3,4);

%R23 T23 from Hc23
R23=Hc23(1:3,1:3);
T23=Hc23(1:3,4);

%2%Calculate n and theta
%For Rc12
r11=R12(1,1);r12=R12(1,2);r13=R12(1,3);
r21=R12(2,1);r22=R12(2,2);r23=R12(2,3);
r31=R12(3,1);r32=R12(3,2);r33=R12(3,3);
thetaR12=acosd((r11+r22+r33-1)/2);
n_R12=[r32-r23;r13-r31;r21-r12]*1/(2*sind(thetaR12));

%For Rc23
r11=R23(1,1);r12=R23(1,2);r13=R23(1,3);
r21=R23(2,1);r22=R23(2,2);r23=R23(2,3);
r31=R23(3,1);r32=R23(3,2);r33=R23(3,3);
thetaR23=acosd((r11+r22+r33-1)/2);
n_R23=[r32-r23;r13-r31;r21-r12]*1/(2*sind(thetaR23));

%Calculate Pc 
Pc12=2*sind(thetaR12/2)*n_R12;
Pc23=2*sind(thetaR23/2)*n_R23;

%Calculating Pg12
Rg12=Hg12(1:3,1:3);
Tg12=Hg12(1:3,4);
r11=Rg12(1,1);r12=Rg12(1,2);r13=Rg12(1,3);
r21=Rg12(2,1);r22=Rg12(2,2);r23=Rg12(2,3);
r31=Rg12(3,1);r32=Rg12(3,2);r33=Rg12(3,3);
thetaRg12=acosd((r11+r22+r33-1)/2);
n_Rg12=[r32-r23;r13-r31;r21-r12]*1/(2*sind(thetaRg12));
Pg12=2*sind(thetaRg12/2)*n_Rg12;

%Calculate Pg23
Rg23=Hg23(1:3,1:3);
Tg23=Hg23(1:3,4);
r11=Rg23(1,1);r12=Rg23(1,2);r13=Rg23(1,3);
r21=Rg23(2,1);r22=Rg23(2,2);r23=Rg23(2,3);
r31=Rg23(3,1);r32=Rg23(3,2);r33=Rg23(3,3);
thetaRg23=acosd((r11+r22+r33-1)/2);
n_Rg23=[r32-r23;r13-r31;r21-r12]*1/(2*sind(thetaRg23));
Pg23=2*sind(thetaRg23/2)*n_Rg23;

%Check%%%%%
P=Pc23;
P_skew=[0 -Pc23(3) Pc23(2);Pc23(3) 0 -Pc23(1);-Pc23(2) Pc23(1) 0];
alpha=sqrt(4-norm(P)^2);
Rcheck=(1-norm(P)^2/2)*eye(3)+1/2*(P*P'+alpha*P_skew);

%%%%%%%%%%%%%%%%%3%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate Pcg
A1=Pg12+Pc12;
A2=Pg23+Pc23;
skewA1=[0 -A1(3) A1(2);A1(3) 0 -A1(1);-A1(2) A1(1) 0];
skewA2=[0 -A2(3) A2(2);A2(3) 0 -A2(1);-A2(2) A2(1) 0];
A=[skewA1;skewA2];
B=[(Pg12-Pc12);(Pg23-Pc23)];
PcgP=pinv(A)*B;
Pcg=(2*PcgP)/sqrt(1+norm(PcgP)^2);
%Calculate Rcg
alpha=sqrt(4-norm(Pcg)^2);
Pcg_skew=[0 -Pcg(3) Pcg(2);Pcg(3) 0 -Pcg(1);-Pcg(2) Pcg(1) 0];
Rcg=(1-norm(Pcg)^2/2)*eye(3)+1/2*(Pcg*Pcg'+alpha*Pcg_skew);
%Calculate T
Tcg=pinv(Rg12-eye(3))*(Rcg*T12-Tg12);



