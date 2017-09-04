clear;
load('NN_weights.mat');
test_data
test1=test1(:);
test2=test2(:);
test3=test3(:);
test4=test4(:);

Ij=test1;
Oj=h(Ij);
Ip=Wpj*Oj;
Op=h(Ip);
Iq=Wqp*Op;
Oq1=h(Iq)

Ij=test2;
Oj=h(Ij);
Ip=Wpj*Oj;
Op=h(Ip);
Iq=Wqp*Op;
Oq2=h(Iq)

Ij=test3;
Oj=h(Ij);
Ip=Wpj*Oj;
Op=h(Ip);
Iq=Wqp*Op;
Oq3=h(Iq)

Ij=test4;
Oj=h(Ij);
Ip=Wpj*Oj;
Op=h(Ip);
Iq=Wqp*Op;
Oq4=h(Iq)