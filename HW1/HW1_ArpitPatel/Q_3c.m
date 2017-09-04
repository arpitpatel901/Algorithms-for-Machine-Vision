O= imread('salt_and_pepper_checker.png');
i= [1 2 5];
subplot(2,2,1)
imshow(O);
title('Orignal')

for j=1:length(i)
    m=(6.*i(j))+1;
h = fspecial('gaussian',[m m],i(j)); 
f= imfilter(O,h);
subplot(2,2,j+1);
imshow(f);
mm= sprintf('Sigma = %d', i(j));
title(mm)
        
end  