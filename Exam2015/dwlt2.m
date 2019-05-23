
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
