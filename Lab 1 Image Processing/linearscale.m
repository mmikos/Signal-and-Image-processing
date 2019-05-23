function [I_out] = linearscale(I_in, I_min_out, I_max_out)

I_in=double(I_in);

 I_max_in=max(I_in(:));
 I_min_in=min(I_in(:));
%I_in=(I_in-I_min_in)/(I_max_in-I_min_in);
I_in2 = I_in;

% A=(1/(I_max_out-I_min_out));
% b=I_min_out;

I_out=zeros(size(I_in2));
for int1=1:(size(I_in2,1))
    for int2=1:(size(I_in2,2))
        I_in2(int1,int2)=(I_in2(int1,int2)-I_min_in)/(I_max_in-I_min_in);
       %I_in2(int1,int2)=I_in2(int1,int2)/I_max_in;
        if I_in2(int1,int2) <= I_min_out
            I_out(int1,int2) = 0;
        elseif I_in2(int1,int2) >= I_max_out
            I_out(int1,int2) = 1;
        else
           I_out(int1,int2)=(I_in2(int1,int2)-I_min_out)*(1/(I_max_out-I_min_out));
          %I_out(int1,int2)=A*I_in2(int1,int2)+b;
        end
    end
end
        
        
        
        
%intout=1:(size(I_out))

    %if int<I_min_in
    %    I_out=I_min_out;
    %end
 
    %if int<I_max_in
       
     %   I_out=I_max_out;
     %else
            
%end
%I_out=uint8(I_out)

%I_out=(I_min_out+I_max_out)+(I_max_out-I_min_out)*((2*I_in-(I_min_in+I_max_in))/(I_max_in-I_min_in))/2;

%I_out=a+(b-a)*I_out

%out(r,c) = a * in(r,c) + b;

%R = double(I_in(:, :, 1));
%G = double(I_in(:, :, 2));
%B = double(I_in(:, :, 3));

%magnitudeImage = sqrt(R.^2 + G.^2 + B.^2);

%normRed = R./ magnitudeImage;
%normGreen = G./ magnitudeImage;
%normBlue = B./ magnitudeImage;
