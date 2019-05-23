function [modified_image] = histogramequalization(img_to_equalize)
    % Obtain the size of the image
    [rows, columns, ~] = size(img_to_equalize);
    % Count the number of pixels for each bin
    bins = histcounts(double(img_to_equalize(:)), 256);
    % Cumulative sum of the bin count
    cumulative = cumsum(bins);
    % Get the probability of each bin
    cumulative_probability = cumulative/cumulative(end);
    equalized_img = zeros(size(img_to_equalize));
    for cnt1 = 1 : rows
        for cnt2 = 1 : columns
            equalized_img(cnt1, cnt2) = 256 * ... 
                cumulative_probability(img_to_equalize(cnt1, cnt2) + 1);
        end
    end
    modified_image = uint8(floor(equalized_img));
end