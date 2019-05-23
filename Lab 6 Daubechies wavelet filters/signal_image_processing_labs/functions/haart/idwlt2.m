function [x] = idwlt2(blurry,horizontal,vertical,diagonal,Lo_R,Hi_R)
%IDWLT2 Inverse discrete wavelet transformation for 2D structures
    [r,c,~] = size(blurry);
    low_rec = zeros(r*2, c);
    high_rec = zeros(r*2, c);
    for i=1:c
        low_rec(:,i) = idwlt(blurry(:,i)',horizontal(:,i)',Lo_R,Hi_R)';
        high_rec(:,i) = idwlt(vertical(:,i)',diagonal(:,i)',Lo_R,Hi_R)';
    end
    x = zeros(r*2,c*2);
    for i=1:r*2
        x(i,:) = idwlt(low_rec(i,:),high_rec(i,:),Lo_R,Hi_R);
    end
end

