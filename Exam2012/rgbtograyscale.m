function [grayimage_out] = rgbtograyscale(rgbimage_in)

R=rgbimage_in(:,:,1);
G=rgbimage_in(:,:,2);
B=rgbimage_in(:,:,3);

grayimage_out(:,:,1) = 0.2989 * R + 0.5870 * G + 0.1140 * B;
grayimage_out(:,:,2)=grayimage_out(:,:,1);
grayimage_out(:,:,3)=grayimage_out(:,:,1);