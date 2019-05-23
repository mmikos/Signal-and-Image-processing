function [signal_dec] = threshold_function_teacher(signal_dec,lambda,N)
%threshold_function_book wavelet soft threshold function
%   The soft thresholding is also called wavelet shrinkage, 
%   as values for both positive and negative coefficients are being
%   "shrinked" towards zero, in contrary to hard thresholding which 
%   either keeps or removes values of coefficients.
%   In case of image de-noising, you are not working strictly on
%   "intensity values", but wavelet coefficients.
%
%   The third parameters is the size of the aproximation size included in
%   the vector c=[an,bn,bn-1,...,b1]. To be able of separating the
%   aproximation from the details
    aprox=[];
    if aprox_size~=0
        % N different from 0 means that the approximation is included in
        % the signal
        aprox=signal_dec(1:aprox_size);
        details=signal_dec(aprox_size+1:length(signal_dec));
    else
        % 0 when only the detail coefficient is introduced
        details=signal_dec;
    end
    details_th=abs(details)-lambda;
    details_th(details_th<0)=0;
    details_th=details_th.*sign(details);
    % add the approximation if exist
    signal_dec=[aprox,details_th];
end

