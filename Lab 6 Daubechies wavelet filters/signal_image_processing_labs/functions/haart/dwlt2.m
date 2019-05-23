function [blurry,horizontal,vertical,diagonal] = dwlt2(x,Lo_D,Hi_D)
%DWLT2 Haar wavelet transformation for 2D structures:
%   x is your image, and Lo_D and Hi_D are your low-pass and high-pass 
%   filters you want to apply to the image.  blurry is the low-passed 
%   version of the image, where the horizontal and vertical directions are
%   low-passed, horizontal is where the vertical direction is low-passed 
%   and the horizontal direction is high-passed, vertical is the vertical 
%   direction is high-passed and the horizontal direction is low-passed,
%   and diagonal is where both directions are high-passed.  
%   As such horizontal, vertical and diagonal are the detail coefficients 
%   while blurry contains the structure.
    [r,c,~] = size(x);
    row_low = zeros(r, c/2);
    row_high = zeros(r, c/2);
    % First we pass the low and high filter in all the rows
    for i=1:r
        [row_low(i,:), row_high(i,:)] = dwlt(x(i,:), Lo_D, Hi_D);
    end
    % Second we process the columns of the low pass for the rows
    % Third we process the columns of the high pass filter
    blurry = zeros(r/2, c/2);
    horizontal = zeros(r/2, c/2);
    vertical = zeros(r/2, c/2);
    diagonal = zeros(r/2, c/2);
    % As filter works for any orientation it is okay, but careful with the
    % inverse
    for i=1:c/2
        [blurry(:,i), horizontal(:,i)] = dwlt(row_low(:,i), Lo_D, Hi_D);
        [vertical(:,i), diagonal(:,i)] = dwlt(row_high(:,i), Lo_D, Hi_D);
    end
end