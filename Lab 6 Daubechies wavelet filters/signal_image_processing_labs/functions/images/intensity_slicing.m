function [sliced_image] = intensity_slicing(image, low_threshold, ...
    high_threshold)
    % INTENSITY THRESHOLD SLICING
    % This functions takes an image and the lower and upper bound for the
    % intensity threshold and generates a binary image
    [row, columns, channels] = size(image);
    % Pre allocate a variable to store the result image
    sliced_image = zeros(row, columns, channels);
    for z = 1 : channels
        for i = 1 : row
            for j = 1 : columns
                % if the current pixel of original image is in the specfied
                % range then make it 1 (white) in the result image
                if (low_threshold < image(i, j, z) && ...
                        image(i, j, z) < high_threshold)
                    sliced_image(i, j, z) = 1;
                % otherwise store value 0 (black) in the result image 
                else
                    sliced_image(i, j, z) = 0;
                end
            end
        end
    end
    sliced_image = logical(sliced_image);
end

