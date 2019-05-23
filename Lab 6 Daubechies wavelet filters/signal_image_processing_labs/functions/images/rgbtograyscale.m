function gray_image = rgbtograyscale(rgb_image)
    depth = size(rgb_image, 3);
    if depth == 3
        % The image have three colors, posible RGB
        red_color = rgb_image(:, :, 1);
        green_color = rgb_image(:, :, 2);
        blue_color = rgb_image(:, :, 3);
        weigthed_sum = 0.2989 * red_color ...
            + 0.5870 * green_color ...
            + 0.1140 * blue_color;
        gray_image = uint8(weigthed_sum * 255);
    else
        % The image is not rgb
        gray_image = rgb_image;
    end
end