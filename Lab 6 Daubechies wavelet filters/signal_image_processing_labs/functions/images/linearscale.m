function [I_out] = linearscale(I_in, I_min_out, I_max_out)
    % We use the values of I_min_out and I_max_out to clip the values 
    % that goes out of the range
    % Extract the size of the image
    [rows, columns] = size(I_in);
    % Preallocate the returned image
    I_out = zeros(rows, columns);
    % Set intensity between 0 and 1
    normalized_image = double(I_in) / 255;
    for i = 1 : rows
        for j = 1 : columns
            intensity_val = normalized_image(i, j);
            % clip is lower than the limit
            if intensity_val < I_min_out
                I_out(i, j) = I_min_out;
            % clip is greater than the limit
            elseif intensity_val > I_max_out
                I_out(i, j) = I_max_out;
            else
                I_out(i, j) = intensity_val;
            end
        end
    end
end