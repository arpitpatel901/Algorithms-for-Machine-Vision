X=[2 6 8 5 -3];
Y=[0 2 6 8 5];
xt=[2.28 10.621 9.545];
yt=[16.28 10.318 15.576];
t12=((xt(1)-xt(2))^2+(yt(1)-yt(2))^2)^0.5;
t13=((xt(1)-xt(3))^2+(yt(1)-yt(3))^2)^0.5;
t32=((xt(3)-xt(2))^2+(yt(3)-yt(2))^2)^0.5;
t=[t12 t13 t32];
A1=[xt(1) -yt(1) 1 0;yt(1) xt(1) 0 1];
A2=[xt(2) -yt(2) 1 0;yt(2) xt(2) 0 1];
A3=[xt(3) -yt(3) 1 0;yt(3) xt(3) 0 1];
A=[A1;A2;A3];
E=1000;
for i=1:size(X,2)
    for j=1:size(X,2)
        for k=1:size(X,2)
            if i==j | j==k | k==i
                break
            end
            P0=[X(i);Y(i)];
            P1=[X(j);Y(j)];
            P2=[X(k);Y(k)];
            Z=[P0;P1;P2];
            Q=pinv(A'*A)*A'*Z;
            theta=atan(Q(2)/Q(1));
            scale=(Q(1)^2+Q(2)^2)^0.5;
            Xd=Q(3);
            Yd=Q(4);       
            z=A*Q;
            P0=[z(1);z(2)];
            P1=[z(3);z(4)];
            P2=[z(5);z(6)];    
            D12=norm(P0-P1);
            D13=norm(P0-P2);
            D32=norm(P2-P1);
            D=[D12 D13 D32];
            e=norm(D-t);
            if e<E
                E=e;
                final=[i j k];
            end
        end
    end
end