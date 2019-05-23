function [snr] = calculate_snr(good_signal,signal)
%CALCULATE_SNR calculation of the signal-to-noise ratio
%   SNR is a measure used in science and engineering 
%   that compares the level of a desired signal to 
%   the level of background noise. SNR is defined as 
%   the ratio of signal power to the noise power, often
%   expressed in decibels. A ratio higher than 1:1 
%   (greater than 0 dB) indicates more signal than noise.
    % check if the signals have the same size
    if length(good_signal)~=length(signal)
        error('The signal does not have the same size')
    end
    % e[i]=|x[i]-z[i]|
    e=abs(good_signal(:)-signal(:));
    sum_e=sum(power(e,2));
    sum_x=sum(power(good_signal,2));
    snr=10*log10(sum_x/sum_e);
end

