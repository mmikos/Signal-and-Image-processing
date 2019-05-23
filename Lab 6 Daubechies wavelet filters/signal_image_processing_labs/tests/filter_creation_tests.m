addpath ../functions/daubechies/
clear
s=1:8;
% for db6
db3_l=dbfilter(3);
db3_h=fliplr(db3_l).*[1 -1 1 -1 1 -1];
[l3,h3]=generate_db_filters(3);
comp_l=db3_l==l3;
comp_h=db3_h==h3;
for i=1:length(comp_l)
    if comp_l(i)~=1 || comp_h(i)~=1
        error('The function is not working')
    end
end
% for db4
db2_l = dbfilter(2);
db2_h=fliplr(db2_l).*[1 -1 1 -1];
[l2,h2]=generate_db_filters(2);
comp_l=db2_l==l2;
comp_h=db2_h==h2;
for i=1:length(comp_l)
    if comp_l(i)~=1 || comp_h(i)~=1
        error('The function is not working')
    end
end
% [am,dm]=dwt(s,'db3');
% rsm=idwt(am,dm,'db3');
