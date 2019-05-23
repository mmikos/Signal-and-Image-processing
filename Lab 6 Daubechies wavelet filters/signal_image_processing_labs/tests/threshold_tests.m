addpath ../functions/
addpath ../functions/daubechies/
clear
s=1:32;
% for db4
db2_l = dbfilter(2);
db2_h=fliplr(db2_l).*[1 -1 1 -1];
% three steps decomposition
[a1,d1]=discreteWaveletTransform(s,db2_l,db2_h);
[a2,d2]=discreteWaveletTransform(a1,db2_l,db2_h);
[a3,d3]=discreteWaveletTransform(a2,db2_l,db2_h);
% calculate std and lambda
[std_val,lambda]=var_lambda_calculation(d1,length(d1)+length(d1)+length(d1));
% threshold function
decomposed_signal=[a3',d3',d2',d1'];
s1=threshold_function_book(decomposed_signal,lambda,3);
s2=threshold_function_book(decomposed_signal,lambda,3);
%compare with matlab
%s4=wthresh(decomposed_signal,'s',lambda);
% COMPARISON WITH ONLY DETAILS
s3=threshold_function_book([d3',d2',d1'],lambda,0);
s4=threshold_function_book([d3',d2',d1'],lambda,0);