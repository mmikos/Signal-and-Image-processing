function [rec_image] = invDaubechies2D(b,h,v,d,Lp,Hp)

% n=length(Lp);
% wrap=n/2-1;
% 
% b_u=kron(b,[1 0; 0 1]);
% h_u=kron(h,[1 0; 0 1]);
% v_u=kron(v,[1 0; 0 1]);
% d_u=kron(d,[1 0; 0 1]);
% 
% b_p=[b_u(length(b_u)-wrap:end,:);b_u;b_u(1:wrap,:)];
% h_p=[h_u(length(h_u)-wrap:end,:);h_u;h_u(1:wrap,:)];
% v_p=[v_u(length(v_u)-wrap:end,:);v_u;v_u(1:wrap,:)];
% d_p=[d_u(length(d_u)-wrap:end,:);d_u;d_u(1:wrap,:)];
% 
% b_r=sqrt(2)*filter(Lp,1,b_p);
% h_r=sqrt(2)*filter(Hp,1,h_p);
% v_r=sqrt(2)*filter(Lp,1,v_p);
% d_r=sqrt(2)*filter(Hp,1,d_p);
%X=b_r+h_r+v_r+d_r;

[row,column]=size(b);

rec_image=zeros(2*row,2*column);

Lp_blur_horizontal=zeros(2*row,column);
Hp_vertical_diagonal=zeros(2*row,column);

for i=1:column
    Lp_blur_horizontal(:,i)=invDaubechies1D(b(:,i),h(:,i),Lp,Hp);
    Hp_vertical_diagonal(:,i)=invDaubechies1D(v(:,i),d(:,i),Lp,Hp);
end

for j=1:2*row
    rec_image(j,:)=invDaubechies1D(Lp_blur_horizontal(j,:)',Hp_vertical_diagonal(j,:)',Lp,Hp)';
end


%X=X(2*(wrap+1):end);

