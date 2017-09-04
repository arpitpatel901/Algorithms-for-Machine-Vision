B= imread('nut_and_shell.png');
I= rgb2gray(B);

U1= im2bw(I,(20/255));
O1= im2bw(I,(130/255));
C1= im2bw(I,(50/255));

subplot(2,2,1);
imshow(U1);
title('Threshold = 20/255');
subplot(2,2,2);
imshow(O1);
title('Threshold = 130/255');

subplot(2,2,3);
imshow(C1);
title('Threshold = 50/255');

