function C = wldecom(x,N,Lo_D,Hi_D)
%WLDECOM: recursive dwlt call
%  Calculates the wavelet decomposition of the signal x for N scales using
%  low-pass filter c and high-pass filter d.
%  The output C is a vector of the form [a^{j-N},b^{j-N},...,b^{j-1}],
%  where a^{j-N} are the finest approximation coeficients, b^{j-1} are the
%  coarsest detail coefficients and a^j=x.
    C = [];
    a = x;
    for i = 1 : N
      [a, b] = dwlt(a, Lo_D, Hi_D);
      C = [b C];
    end
    C = [a C];
end