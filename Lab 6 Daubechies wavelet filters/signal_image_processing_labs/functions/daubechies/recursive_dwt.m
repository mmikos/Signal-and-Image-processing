function [c,indexs] = recursive_dwt(x,N,Lo_D, Hi_D)
% recursive_dwt: recursive call to discreteWaveletTransformation
%   This method will return an array 'c' with the different values for the
%   transformation in the next form: [aN,bN,bN-1,...,b1]. Also it will
%   return a vector l with the index each detail 'b' starts.
    c=[];
    indexs=zeros(1,N);
    lenghts=zeros(1,N);
    a=x;
    % make the transformation the required times
    for i=1:N
      [a,b]=discreteWaveletTransform(a,Lo_D,Hi_D);
      lenghts(i)=length(b');
      c=[b' c];
    end
    % add the approximation coefficient
    c=[a' c];
    % calculate the lenght of the vector C to rest the lenghts of the
    % details coefficients and have the index of their start
    transform_lenght=length(c);
    for i=1:length(lenghts)
        transform_lenght=transform_lenght-lenghts(i);
        indexs(i)=transform_lenght+1;
    end
end
