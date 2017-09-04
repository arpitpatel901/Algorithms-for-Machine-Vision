A=.04;B=0;C=.01;D=-.04;E=-.01;F=-.11;
f=.1;
xc=1;yc=1;
syms a b g
S=solve(A+(2*D/f)*a+(F/f^2)*a^2  == C+(2*E/f)*b+(F/f^2)*b^2 ,...
    ((D/f)*b  + (E/f)*a + (F/f^2)*a*b == 0),...
     (A+(2*D/f)*a+(F/f^2)*a^2)*xc^2+(C+(2*E/f)*b+(F/f^2)*b^2)*yc^2+...
     ((D/f)*b  + (E/f)*a + 2*(F/f^2)*a*b)*xc*yc+2*(D/f*g+F/f^2*a*g)*xc+... 
     2*(E/f*g+F/f^2*a*g)*yc +F/f^2*g^2== 0 ,a,b,g );
[a]=double(S.a);
%alpha=.0268; 
alpha=-0.0995641;
[b]=double(S.b);
%beta=-.0039; 
 beta=-0.014321541;

%Initially Gamma =1
 r=1;
 g=1;
%Equation of plane
 zc=alpha*xc + beta*yc + r; 
%Equation of plane normal
Nc=1/sqrt(alpha^2+beta^2+1)*[alpha beta -1]' 
 %Circle Center
Ac=A+(2*D/f)*alpha+(F/f^2)*alpha^2;
Bc=-(D*f+F*alpha)*g/(f^2);
Cc=-(E*f+F*beta)*g/(f^2);
Dc=F/(f^2)*g^2;

g=1/sqrt((Bc^2+Cc^2-Ac*Dc)/(Ac^2))
%Oc=1/Ac*[Bc Cc r*Ac+alpha*Bc+beta*Cc]';
Ac=A+(2*D/f)*alpha+(F/f^2)*alpha^2;
Bc=-(D*f+F*alpha)*g/(f^2);
Cc=-(E*f+F*beta)*g/(f^2);
Dc=F/(f^2)*g^2;
Oc=1/Ac*[Bc Cc g*Ac+alpha*Bc+beta*Cc]'
