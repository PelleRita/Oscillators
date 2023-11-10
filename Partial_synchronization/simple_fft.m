%This makes a simple fourier transform

function [FFTabs FFTphase fvec] = simple_fft(t,signal)

% 
% t=linspace(0,1.0E-7,10000);
% signal = sin(2*pi*10.0E+9*t) + 0.01*rand(size(t));

dt = min(diff(t));

tvec = min(t):dt:max(t);
signalvec = interp1(t,signal,tvec);
signalvec = signalvec - mean(signalvec);

fsample = 1/dt;

NFFT = 2^nextpow2(length(signalvec));
Y = fft(signalvec,NFFT)/length(signalvec);

fvec = fsample/2*linspace(0,1,NFFT/2+1);

FFTabs = 2.0*abs(Y(1:NFFT/2+1));
FFTphase = 2.0*angle(Y(1:NFFT/2+1));



% figure;
% plot(fvec,FFTabs)
% title('Single-Sided Amplitude Spectrum')
% legend('Mx(1)');
% xlabel('Frequency (Hz)')
% ylabel('|Y(f)|');
