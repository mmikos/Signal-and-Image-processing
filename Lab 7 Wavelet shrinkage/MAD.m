function [w_med] = MAD(v)
v_med=median(v);
N=length(v);
w=zeros(1,N);
for i=1:N
w(i)=abs(v(i)-v_med);
end
w_med=median(w);