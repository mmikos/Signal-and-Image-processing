function [X] = idwlt(a,b,c,d)

a_u=kron(a,[1 0]);
b_u=kron(b,[1 0]);

a_r=filter(fliplr(c),1,a_u);
b_r=filter(fliplr(d),1,b_u);
X=a_r+b_r;


end

