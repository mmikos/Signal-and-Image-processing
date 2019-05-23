function [tau1] = thresholding(alfa,h,v,d)

%alfa=1.0;

S=abs([v(:);h(:);d(:)]);
stop=0;
tau1=(min(S)*max(S))/2;
while(stop==1)
    S1=S(S<tau1);
    S2=S(S>=tau1);
    tau2=(mean(S1)+mean(S2))/2;
    if (abs(tau2-tau1)<alfa)
        stop=1;
    end
    tau1=tau2;
end

end

