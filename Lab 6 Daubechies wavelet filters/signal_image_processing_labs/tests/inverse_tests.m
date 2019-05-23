addpath ../functions/daubechies/
clear
s=1:128;
for i=1:4
    [db_l,db_h]=generate_db_filters(i);
    [a,d]=discreteWaveletTransform(s,db_l,db_h);
    x=inverseDiscreteWaveletTransform(a,d,db_l,db_h);
    result=s==int16(x');
    for t=1:length(result)
        if result(t)~=1
            error('Wrong inverse for %i', i)
        end
    end
end
% [am,dm]=dwt(s,'db3');
% rsm=idwt(am,dm,'db3');
