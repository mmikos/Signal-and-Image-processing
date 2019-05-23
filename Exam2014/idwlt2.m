function [X] = idwlt2(b1,h1,v1,d1,c,d)

b1_u=kron(b1,[1 0; 0 1]);
h1_u=kron(h1,[1 0; 0 1]);
v1_u=kron(v1,[1 0; 0 1]);
d1_u=kron(d1,[1 0; 0 1]);

b1_r=filter(fliplr(c),1,b1_u);
h1_r=filter(fliplr(d),1,h1_u);
v1_r=filter(fliplr(c),1,v1_u);
d1_r=filter(fliplr(d),1,d1_u);

X=b1_r+h1_r+v1_r+d1_r;


end