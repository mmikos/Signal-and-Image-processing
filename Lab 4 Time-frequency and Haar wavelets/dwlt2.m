
function [b1,h1,v1,d1] = dwlt2(x,c,d)

[r,co]=size(x);

al=zeros(size(x));
ah=zeros(size(x));
b1=zeros(size(x));
h1=zeros(size(x));
v1=zeros(size(x));
d1=zeros(size(x));

for i=1:r
    
al(i,:)=filter(c,1,x(i,:));
ah(i,:)=filter(d,1,x(i,:));
end

for j=1:co
    
b1(:,j)=filter(c,1,al(:,j));
h1(:,j)=filter(d,1,al(:,j));
v1(:,j)=filter(c,1,ah(:,j));
d1(:,j)=filter(d,1,ah(:,j));

end

v1=v1(2:2:end,2:2:end);
d1=d1(2:2:end,2:2:end);
b1=b1(2:2:end,2:2:end);
h1=h1(2:2:end,2:2:end);
% 
% function [blurry,horizontal,vertical,diagonal] = dwlt2(x,Lo_D,Hi_D)
% %DWLT2 Haar wavelet transformation for 2D structures:
% %   x is your image, and Lo_D and Hi_D are your low-pass and high-pass 
% %   filters you want to apply to the image.  blurry is the low-passed 
% %   version of the image, where the horizontal and vertical directions are
% %   low-passed, horizontal is where the vertical direction is low-passed 
% %   and the horizontal direction is high-passed, vertical is the vertical 
% %   direction is high-passed and the horizontal direction is low-passed,
% %   and diagonal is where both directions are high-passed.  
% %   As such horizontal, vertical and diagonal are the detail coefficients 
% %   while blurry contains the structure.
%     [r,c,~] = size(x);
%     row_low = zeros(r, c/2);
%     row_high = zeros(r, c/2);
%     % First we pass the low and high filter in all the rows
%     for i=1:r
%         [row_low(i,:), row_high(i,:)] = dwlt(x(i,:), Lo_D, Hi_D);
%     end
%     % Second we process the columns of the low pass for the rows
%     % Third we process the columns of the high pass filter
%     blurry = zeros(r/2, c/2);
%     horizontal = zeros(r/2, c/2);
%     vertical = zeros(r/2, c/2);
%     diagonal = zeros(r/2, c/2);
%     % As filter works for any orientation it is okay, but careful with the
%     % inverse
%     for i=1:c/2
%         [blurry(:,i), horizontal(:,i)] = dwlt(row_low(:,i), Lo_D, Hi_D);
%         [vertical(:,i), diagonal(:,i)] = dwlt(row_high(:,i), Lo_D, Hi_D);
%     end
% end
