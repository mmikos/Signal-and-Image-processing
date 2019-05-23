function w = ham(N)

% if N==k/2
%     M = N/2;
% else M = (N+1)/2;
% end

M=ceil(N/2);

w=zeros(1,length(0:M));

M=floor(M);
for n=0:M-1

w(n+1)=0.54-0.46*cos((2*pi*n)/(N-1));

end

for n=M-1:N-1

w(n+1)=0.54-0.46*cos((2*pi*n)/(N-1));

end

w=w';