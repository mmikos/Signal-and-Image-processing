%% DWLT
%  Calculates the wavelet transform of x with low-pass filter c and
%  high-pass filter d. x is assumed to be divisible by 2.
function [a,b] = dwlt(x,c,d)

a=filter(c,1,x);
a=a(2:2:end);

b=filter(d,1,x);
b=b(2:2:end);


%H=zeros(s,s);
% 
% for i=1:s
%         H(i,i)=c(:,1);s
%         H(i,i+1)=c(:,2);
% end
