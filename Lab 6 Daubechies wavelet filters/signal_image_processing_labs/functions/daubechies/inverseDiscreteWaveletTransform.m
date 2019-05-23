function [x] = inverseDiscreteWaveletTransform(a,d,Lp,Hp)
    % first we have to do the upsampling
    a = kron(a, [1;0]);
    d = kron(d, [1;0]);
    % then we have to add the padding
    n=length(Lp);
    if(n~=length(Hp))
        error('Low-pass and high-pass filter should have the same length');
    end
    if(floor(n/2)<(n/2))
        error('Filter lengths should be even');
    end
    wrap=n/2-1;
    a=[a(length(a)-wrap:end,:);a;a(1:wrap,:)];
    d=[d(length(d)-wrap:end,:);d;d(1:wrap,:)];
    a=sqrt(2)*filter(Lp,1,a);
    d=sqrt(2)*filter(Hp,1,d);
    x=a+d;
    % remove the shit added by the filter
    x=x(2*(wrap+1):end);
end