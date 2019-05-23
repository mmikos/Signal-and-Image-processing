function [a, b] = dwlt(x,Lo_D,Hi_D)
    %% DWLT
    %  Calculates the wavelet transform of x with low-pass filter c and
    %  high-pass filter d. x is assumed to be divisible by 2.
    % x is the vector and c and d are the filters
    a_fil = filter(Lo_D, 1, x);
    b_fil = filter(Hi_D, 1, x);
    a = a_fil(2:2:length(a_fil));
    b = b_fil(2:2:length(b_fil));
end