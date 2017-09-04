
%Initialize Weights
%Layer Q
pnum=49;
jnum=49;
qnum=4;
Wqp=randn(qnum,pnum);%%4 X 49
Wpj=randn(pnum,jnum); %%49 X 49(should be 4 X 49 for the test data)
%%%%%%%%%%%%%%Load Training%%%%%%%%%%%%%%
training_data;
training_1a=training_1a(:);
training_1b=training_1b(:);
training_1c=training_1c(:);
training_1d=training_1d(:);
training_2a=training_2a(:);
training_2b=training_2b(:);
training_2c=training_2c(:);
training_2d=training_2d(:);
training_3a=training_3a(:);
training_3b=training_3b(:);
training_3c=training_3c(:);
training_3d=training_3d(:);
training_4a=training_4a(:);
training_4b=training_4b(:);
training_4c=training_4c(:);
training_4d=training_4d(:);
Input1=[training_1a training_1b training_1c training_1d];
Input2=[training_2a training_2b training_2c training_2d];
Input3=[training_3a training_3b training_3c training_3d];
Input4=[training_4a training_4b training_4c training_4d];
Input=[Input1 Input2 Input3 Input4];
h=@(I) 1./(1+exp(-I));
k=0;
alpha=1;Eth=1e-4;kmax=1000;
Es=100;
R=[1 0 0 0;1 0 0 0;1 0 0 0;1 0 0 0;...
    0 1 0 0;0 1 0 0;0 1 0 0;0 1 0 0;...
    0 0 1 0;0 0 1 0;0 0 1 0;0 0 1 0;...
    0 0 0 1;0 0 0 1;0 0 0 1;0 0 0 1]; %%4X4
Error=zeros(1,1000);
while Es > Eth && k <= kmax
    Es=0;
    k=k+1;
    TSN=16;
    for i=1:TSN
        %%%%%%%%%%%%Forward Step%%%%%%%%% 
        Ij=Input(:,i);
        Oj=h(Ij);
        Ip=Wpj*Oj;
        Op=h(Ip);
        Iq=Wqp*Op; %%49*4
        Oq=h(Iq);

        deltaQ=(R(i,:)'-Oq).*(h(Iq).*(1-h(Iq)));
        deltaP=h(Ip)'.*(1-h(Ip))'.*(deltaQ'*Wqp);
        
        Wqp=Wqp+deltaQ*Op';
        Wpj=Wpj+deltaP'*Oj';
        Es=.5*sum((R(i,:)'-Oq).^2);        
    end
    Error(k)=Es; 
end

plot(Error);xlabel('Number of Epochs');ylabel('Error');
save('NN_weights.mat')