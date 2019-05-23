
function [X] = invDaubechies1D(a,d,Lp,Hp)

a=a(:);
d=d(:);
% Ensure periodic extension
n=length(Lp);
wrap=n/2-1;

a_u=kron(a,[1;0]);
d_u=kron(d,[1;0]);

a_p=[a_u(length(a_u)-wrap:end,:);a_u;a_u(1:wrap,:)];
d_p=[d_u(length(d_u)-wrap:end,:);d_u;d_u(1:wrap,:)];


a_r=sqrt(2)*filter(Lp,1,a_p);
d_r=sqrt(2)*filter(Hp,1,d_p);


X=a_r+d_r;
%X=[X(length(X)-2*wrap:end,:)];
X=X(2*(wrap+1):end);

% Low-pass filtering
%a = sqrt(2)*filter(fliplr(Lp),1,p);
% Downsampling
%a = a(2*(wrap+1):2:end,:);
%a=a';      
% High-pass filtering
%d = sqrt(2)*filter(fliplr(Hp),1,p);
% Downsampling
%d = d(2*(wrap+1):2:end,:);
%d=d';