
clear;
load('ronald.mat');

Lp=dbfilter(3);
%*sqrt(2);
Hp=fliplr(Lp).*[1 -1 1 -1 1 -1];


n=length(Lp);
wrap=n/2-1;

%[b, h, v, d]=dwt2(ronald,'db1')

[b1, h1, v1, d1]=dwtDaubechies2D(ronald,Lp,Hp);
[b2, h2, v2, d2]=dwtDaubechies2D(b1,Lp,Hp);

figure
imagesc([b1 v1;h1 d1]);
axis image

b11=invDaubechies2D(b2,h2,v2,d2,Lp,Hp);
X=invDaubechies2D(b11,h1,v1,d1,Lp,Hp);

figure
imagesc(X);
colormap gray
axis image