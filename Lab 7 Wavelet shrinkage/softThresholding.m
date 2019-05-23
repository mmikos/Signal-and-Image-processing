function [s_lamb] = softThresholding(v,lambda)

N=length(v);
s_lamb=zeros(size(v));

for i=1:N
 if v(i)>lambda
    s_lamb(i)=v(i)-lambda;
 elseif v(i)<-lambda
    s_lamb(i)=v(i)+lambda;
 else 0;
    
 end  
end
%   

% function [s_lamb] = softThresholding(v,lambda)
% 
% N=length(v);
% s_lamb=zeros(size(v));
% 
% for t=1:N
%     s_lamb(t)=max((abs(v(t))-lambda),0)*sign(v(t));
% end
