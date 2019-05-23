function [low_pass,high_pass] = generate_db_filters(vanishing_moments)
%GENERATE_DB_FILTERS generates the low pass and high pass filter for the
%desired length
%   The length is refired as the number of vanishing moments
%   In general the Daubechies wavelets are chosen to have the highest 
%   number A of vanishing moments, (this does not imply the best 
%   smoothness) for given support width 2A - 1.[1] There are two
%   naming schemes in use, DN using the length or number of
%   taps, and dbA referring to the number of vanishing moments. 
%   So D4 and db2 are the same wavelet transform.
    low_pass=dbfilter(vanishing_moments);
    high_pass=fliplr(low_pass);
    for i=1:length(high_pass)
        if mod(i,2)==0
            high_pass(i)=high_pass(i)*-1;
        end
    end
end

