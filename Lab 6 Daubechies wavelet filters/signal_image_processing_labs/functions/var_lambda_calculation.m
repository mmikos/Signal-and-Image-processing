function [std_val,lambda_val]=var_lambda_calculation(d1,details_lenght)
%VAR_LAMBDA_CALCULATION calculation the standard deviation and lambda
%   This function estimates the variance with the first detail coefficient
%   and from it and the total lenght of all the details coefficients it
%   calculates lambda needed to perform the soft thresholding
%   variance -> formula (9.10) in book
%   lambda -> formula (9.9) in book
    mad=median(abs(d1-median(d1)));
    std_val=mad/0.6745;
    lambda_val=std_val*sqrt(2*log(details_lenght));
end

