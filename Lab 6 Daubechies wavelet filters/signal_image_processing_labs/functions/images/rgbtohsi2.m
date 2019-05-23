function [hsi_img] = rgbtohsi2(rgb_img)
    % rgbtohsi: transform an rgb image to hsi
    [row, columns, depth] = size(rgb_img);
    if depth == 3
        rgb_img=double(rgb_img)/255;
        % obtain the colors
        r = rgb_img(:, :, 1);
        g = rgb_img(:, :, 2);
        b = rgb_img(:, :, 3);
        sum_rgb = sum(rgb_img, 3);
        % first compute the intensity
        % I = 1/3 * (r + g + b)
        i = sum_rgb./3 + 0.00000001;
        v1 = - (r/2) - (g/2) + b;
        v2 = sqrt(3)/2 * r - sqrt(3)/2 * g;
        s = sqrt(v1.^2 + v2.^2);
        h = atan2(v2,v1);
        % generation of the hsi image
        hsi_img = zeros(row, columns, depth);
        hsi_img(:, :, 1) = h;
        hsi_img(:, :, 2) = s;
        hsi_img(:, :, 3) = i;
    else
        % The image is not RGB
        hsi_img = rgb_img;
    end
end