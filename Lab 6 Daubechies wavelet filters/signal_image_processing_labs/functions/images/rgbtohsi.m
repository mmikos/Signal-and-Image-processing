function [hsi_img] = rgbtohsi(rgb_img)
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
        % second obtain the saturation
        % s = 1 - (3/r+g+b) * (min(r, g, b))
        s = 1-(3./sum_rgb).*min(rgb_img, [], 3);
        % Third we get the hue
        % h = cos^(-1)[(((r-g)+(r-b))/2)/((r-g)^2 + (r-b)*(g-b))^-1/2]
        r_minus_g = r-g;
        r_minus_b = r-b;
        g_minus_b = g-b;
        h_num = (r_minus_g + r_minus_b)/2;
        h_denom = (r_minus_g.^2 + r_minus_b .* g_minus_b).^0.5;
        h = acos(h_num ./ (h_denom + 0.000000001));
        % hue is h if b >= g but 360-h if b>g
        if b > g
            h = 360 - h;
        end
        % normalize h
        h = h/360;
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