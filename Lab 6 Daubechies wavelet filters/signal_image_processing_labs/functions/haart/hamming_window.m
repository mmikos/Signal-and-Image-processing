function [window] = hamming_window(window_lenght)
%HAMMING_WINDOW(N) returns the N-point symmetric Hamming window 
%in a column vector.
%   The following equation generates the coefficients of a Hamming window:
%   w(n)=0.54?0.46cos((2*?*n)/N), 0?n?N.
%   The window length L = N + 1.
    window = zeros(1, window_lenght);
    for n=0:window_lenght
        i = n + 1;
        window(i) = 0.54 - 0.46 * cos((2*pi*n)/(window_lenght-1));
    end
end

