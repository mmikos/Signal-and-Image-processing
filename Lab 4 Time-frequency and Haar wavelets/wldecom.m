%% WLDECOM
%  Calculates the wavelet decomposition of the signal x for N scales using
%  low-pass filter c and high-pass filter d.
%  The output C is a vector of the form [a^{j-N},b^{j-N},...,b^{j-1}],
%  where a^{j-N} are the finest approximation coeficients, b^{j-1} are the
%  coarsest detail coefficients and a^j=x.
function C = wldecom(x,N,c,d)

C=[];
sig=x;

for i=1:N-1
    
    [a,b]=dwlt(sig,c,d);
    sig=a;
    C=[b C];
    
end

C=[a C];


%perform dwlt.m N-1 times 

%a,b and x is a and get a,b
 
%N-1 times last one save result of a (b saved at every step)