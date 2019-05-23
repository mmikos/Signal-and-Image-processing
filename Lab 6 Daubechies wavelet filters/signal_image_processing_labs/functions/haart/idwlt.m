function [x_rec] = idwlt(a,b,Lo_R,Hi_R)
%IDWLT2 Inverse discrete wavelet transformation for 2D structures
%   Starting from the approximation and detail coefficients at level
%   j, cAj and cDj, the inverse discrete wavelet transform reconstructs 
%   cAj?1, inverting the decomposition step by inserting zeros and
%   convolving the results with the reconstruction filters.
    a_o = kron(a, [1,0]);
    b_o = kron(b, [1,0]);
    a_rec = filter(fliplr(Lo_R), 1, a_o);
    b_rec = filter(fliplr(Hi_R), 1, b_o);
    x_rec = a_rec + b_rec;
end

