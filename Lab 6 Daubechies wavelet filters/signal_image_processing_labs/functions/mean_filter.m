function [filter] = mean_filter(lenght, height)
%mean_filter: Creates a mean filter with the specified size
%   The moving average filter is a simple Low Pass 
%   FIR (Finite Impulse Response) filter
%   commonly used for smoothing an array of sampled data/signal. 
%   It takes L samples of input at a time and takes the average of those 
%   L-samples and produces a single output point. It is a very 
%   simple LPF (Low Pass Filter) structure that comes handy for 
%   scientists and engineers to filter unwanted noisy component 
%   from the intended data. As the filter length increases 
%   (the parameter L) the smoothness of the output increases,
%   whereas the sharp transitions in the data are made increasingly
%   blunt. This implies that this filter has excellent time domain
%   response but a poor frequency response.
    filter = ones(height,lenght).*(1/(lenght*height));
end

