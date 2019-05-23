function fig = plotfft(y, fs)

Y = fft(y);

f=((0:length(Y)-1)*fs)/length(Y);

absY=abs(Y);
phaseY=angle(Y);

fig=figure;
subplot(211);
plot(f,absY);
title('Amplitude spectrum');

subplot(212);
plot(f,unwrap(phaseY));
title('Phase spectrum');

end

