function [b,h,v,d] = hvd_threshold(threshold,b,h,v,d)
%HVD_THRESHOLD: automatic thresholding function for edge detection
%   Information about the edges in an image is contained in V, H, and D. 
%   Mallat and Hwang [56] have shown that a maximum of the modulus of the
%   wavelet transform can be used to detect "irregular structures" 
%   — in particular, the modulus of the highpass portions of the wavelet
%   transformation can be used to detect edges in images.
%   Steps:
%   1. Pick a tolerance a > 0 that will determine the stopping criteria 
%      for the process.
%   2. Set t1 to be the average of the largest and smallest values in S.
%   3. Divide the values of S into two sets S1 and S2. The values in S1 
%      are all smaller than t1 and the values in S2 are greater 
%      than or equal to t1
%   4. Compute the means s1 for S1 and s2 for S2 and take t2 =1/2(s1 + s2)
%   5. Repeat steps 3 and 4 replacing t1 with the new tolerance obtained 
%      from step 4. Continue until |tn-1 - tn| < a.
    s = reshape(abs([h,v,d]),1,[]);
    max_s = max(s(:));
    min_s = min(s(:));
    t = mean([max_s,min_s]);
    t_1 = 0;
    while threshold < abs(t_1-t)
        s1 = s(s<t);
        s2 = s(s>=t);
        t_1 = t;
        t = (mean(s1)+mean(s2))/2;
    end
    h(h<t)=0;
    v(v<t)=0;
    d(d<t)=0;
    [r,c,~] = size(b);
    b = zeros(r,c);
end