%% Example 1 signal

%  Let us create a signal that is 10 seconds long and sampled at 100 Hz

fs=100;

Ts=1/fs;

t=0:Ts:10;

% The signal starts with oscillating at 10 Hz and then at 40 Hz. 

%

% Note that

% the sampling frequency is 100 Hz, hence according to the Nyquist theory,

% I shouldn't put anything in above 100/2=50 Hz.

%

x1=[cos(2*pi*10*t(1:floor(length(t)/2))) cos(2*pi*40*t(floor(length(t)/2)+1:end))];

% Let's plot this signal

figure(1)

plot(t,x1);title('time series signal 1');xlabel('time (s)')

%

%% Fourier transform signal 1

% Let us first see what the Fourier transform does with it

% Do the Fast Fourier transform

X1=fft(x1);

% Define the frequencies

f=linspace(0,fs,length(X1)+1);f(end)=[];

% plot the fft

figure(2);

subplot(2,1,1);

plot(f,abs(X1));title('magnitude spectrum signal 1');xlabel('frequency (Hz)')

subplot(2,1,2);

plot(f,angle(X1));title('phase spectrum signal 1');xlabel('frequency (Hz)')

 

%% Effect of nonstationarity signal 1

% When we zoom in on the frequency band of interest we see some strange

% behavior

figure(3);

plot(f,abs(X1));axis([0,50,0,300]);title('magnitude spectrum signal 1 zoomed');xlabel('frequency (Hz)')

% observe that we get a lot of leackage and oscillations whereas we put in

% two pure frequencies. This is since each of these frequencies just lives

% on one part of the signal. hence this is a nonstationary signal and one

% of the assumptions of the Fourier transform has been violated.

% Furthermore we can't relate the frequencies to time here.

 

%% Spectrogram signal 1

% Now let's make a spectrogram

figure(4)

spectrogram(x1,64,60,[],fs,'yaxis');title('spectrogram signal 1')

% Now you can withness the frequency change for signal 1

 

%% Example 2 signal

%  Let us create a signal that contains a chirp; i.e. a froequency that is

%  modulated over time according to some polynomial

fs=100;

Ts=1/fs;

t=0:Ts:10;

% Create the quadratic chirp 

x2 = chirp(t,0,8,30,'quadratic'); %start at frequency 0Hz and after 8 seconds it is at frequency 30 Hz

% Let's plot this signal

figure(5)

plot(t,x2);title('time series signal 2');xlabel('time (s)')

 

%% FFT signal 2

% Let us first see what the Fourier transform does with it

% Do the Fast Fourier transform

X2=fft(x2);

% Define the frequencies

f=linspace(0,fs,length(X2)+1);f(end)=[];

% plot the fft

figure(6);

subplot(2,1,1);

plot(f,abs(X2));title('magnitude spectrum signal 2');xlabel('frequency (Hz)')

subplot(2,1,2);

plot(f,angle(X2));title('phase spectrum signal 2');xlabel('frequency (Hz)')

% It should be clear by now that the Fourier spectrum is even a bigger mess

% because of the nonstationarisies. It doesn't make sense

 

%% Spectrogram signal 2

% Now let's make a spectrogram

figure(7)

spectrogram(x2,64,60,[],fs,'yaxis');title('spectrogram signal 2')

% Now you can withness the frequency change for signal 2

% Can you indeed see that the signal starts at 0Hz and after 8 seconds is

% at 30Hz? And that the modulation of frequencies is quadratic?
