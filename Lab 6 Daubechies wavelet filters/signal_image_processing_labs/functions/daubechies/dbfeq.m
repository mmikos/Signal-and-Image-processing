function e=dbfeq(f),
%
% Function e=DBFEQ(f)
%
% Implements the 2n equations for the Daubechies filter of order n.
%
% The output e specifies the misfit (the error) in the 2n equations
% when the filter coefficients f are employed.


% The daubechies wavelet number is the number of coefficients devided by two
n=length(f)/2;
% Return a vector with the error considering the 2*n constraints
e=zeros(1, 2*n);

% (i) The first constraint is that the integral of the scaling function should equal 1
e(1) = abs(sum(f) - 1);

% (ii) The second constraint is that the integral of the wavelet function equals zero
for i = 1 : length(f) 
    w = (-1)^(i-1) * f(i);
    e(2) = e(2) + w;
end

e(2) = abs(e(2));

% (iii) double-shift orthogonality yields n-1 contraints
shift = 2;
error_pos = 3;
while shift < length(f)
    for index = shift : length(f) - 1 
        matlab_index = index + 1;
        res = f(matlab_index - shift) * f(matlab_index);
        e(error_pos) = e(error_pos) + res;
    end
    shift = shift + 2;
    error_pos = error_pos + 1;
end

% (iv) The remaining n-1 constraints put as many zeros at z=-1 as possible, taking into 
%      account that (ii) already enforces the first zero
for i=1:n-1
    for j = i+1 : 2*n
        c = 1;
        g = j-1;
        for k = 1 : i
            c = c*g;
            g = g-1;
        end
        e(n+1+i) = e(n+1+i)+c*f(j)*(-1)^j;
    end
end

% The constraint violations are now in the vector e

% End of function DBFEQ.

return;

% -----------------------------------------------------------------