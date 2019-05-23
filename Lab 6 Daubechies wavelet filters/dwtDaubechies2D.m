function [b1,h1,v1,d1] = dwtDaubechies2D(s,Lp,Hp)

[r,j]=size(s);

 al = zeros(r, j/2);
 ah = zeros(r, j/2);
 
 b1=zeros(r/2, j/2);
 h1=zeros(r/2, j/2);
 v1=zeros(r/2, j/2);
 d1=zeros(r/2, j/2);

for i=1:r
    
[al(i,:),ah(i,:)]=discreteWaveletTransform(s(i,:),Lp,Hp);

end


for i=1:j/2
    
[b1(:,i),h1(:,i)]=discreteWaveletTransform(al(:,i),Lp,Hp);
[v1(:,i),d1(:,i)]=discreteWaveletTransform(ah(:,i),Lp,Hp);
end