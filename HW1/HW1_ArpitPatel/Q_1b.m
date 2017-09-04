lam =3; %%change it to 5,10
s= linspace(-1,+1,10);

y=@(x) (1/pi)*(acos(x))+((lam).^2*acos((1-x)/((lam.^2)-1-x)).^0.5)-(x.*(1-x).^0.5)-(x.*(1+x).^0.5);

Y= y(s);

plot(s,Y,'bo');

hold on

lam = 5;
y_2= @(x) (1/pi)*(acos(x))+((lam).^2*acos((1-x)/((lam.^2)-1-x)).^0.5)-(x.*(1-x).^0.5)-(x.*(1+x).^0.5);
Y_2=y_2(s);
plot(s,Y_2,'ro');

lam = 10;
y_3 =@(x) (1/pi)*(acos(x))+((lam).^2*acos((1-x)/((lam.^2)-1-x)).^0.5)-(x.*(1-x).^0.5)-(x.*(1+x).^0.5);
Y_2=y_3(s);
plot(s,Y_2,'go');

legend('lamda=3','lamda=5','lamda=10')
xlabel('S')


