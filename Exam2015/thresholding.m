function [tau] = thresholding(alfa,h,v,d)

%alfa=1.0;

S=abs([v(:);h(:);d(:)]);
st=0;
tau=(min(S)*max(S))/2;
while(st==1)
    S1=S(S<tau);
    S2=S(S>=tau);
    tau_new=(mean(S1)+mean(S2))/2;
    if (abs(tau_new-tau)<alfa)
        st=1;
    end
    tau=tau_new;
end

end

