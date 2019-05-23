function [image_out] = histogramequalization(image_in)

hg=histcounts(double(image_in(:)),-0.5:255.5);

T=cumsum(hg);
T=T/T(end);
image_out=zeros(size(image_in));
for cnt1=1:size(image_out,1)
    for cnt2=1:size(image_out,2)
        image_out(cnt1,cnt2)=256*T(image_in(cnt1,cnt2)+1);
    end
end

image_out=floor(image_out);
image_out=uint8(image_out);

%figure;

%subplot(2,4,1);
%imshow(image_in);

%subplot(2,4,2);
%histogram(double(image_out(:)),-0.5:255.5);axis([-0.5,255.5,0,7000]);axis off

%subplot(2,4,3);
%imshow(image_out);