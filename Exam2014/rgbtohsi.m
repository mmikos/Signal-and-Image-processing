
%function [HSI_out]=rgbtohsi(RGB_in)
function [H,S,I]=rgbtohsi(RGB_in)

RGB_in = im2double(RGB_in);

r = RGB_in(:,:,1);
g = RGB_in(:,:,2);
b = RGB_in(:,:,3);

I=(r + g + b)/3;

v1=(-1/2*r-1/2*g+b);
v2=(sqrt(3)/2*r-sqrt(3)/2*g);

S=sqrt(v1.^2+v2.^2);

H=atan2(v2,v1);

%HSI_out=cat(3,H,S,I);


% imRED = reshape(im(:,1), nr, nc);
% imGREEN = reshape(im(:,2), nr, nc);
% imBLUE = reshape(im(:,3), nr, nc);

% RGB=[r(:),g(:),b(:)];
% RGB=transpose(RGB);


%C=[1/3,1/3,1/3;-1/2,-1/2,1;sqrt(3)/2,-sqrt(3)/2,0];
%V=C*RGB;
