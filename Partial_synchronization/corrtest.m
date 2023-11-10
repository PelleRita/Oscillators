%Testing the correlations between ring oscillator waveforms

clear all; close all;

load C1unsync_novarcap_2.dat
load C2unsync_novarcap_2.dat
load C1middle_2.dat
load C2middle_2.dat
load C1sync_2.dat
load C2sync_2.dat

C1u = C1unsync_novarcap_2(:,2);
C1ut = C1unsync_novarcap_2(:,1);
C2u = C2unsync_novarcap_2(:,2);
C2ut = C2unsync_novarcap_2(:,1);

C1m = C1middle_2(:,2);
C1mt = C1middle_2(:,1);
C2m = C2middle_2(:,2);
C2mt = C2middle_2(:,1);

C1s = C1sync_2(:,2);
C1st = C1sync_2(:,1);
C2s = C2sync_2(:,2);
C2st = C2sync_2(:,1);

%% Waveform
figure;
subplot(311)
plot(C1ut,C1u,C2ut,C2u);
xlabel('Time [s]');
ylabel('Voltage [V]');
title('Unsynchronized waveforms');
subplot(312)
plot(C1mt,C1m,C2mt,C2m);
xlabel('Time [s]');
ylabel('Voltage [V]');
title('Partially synchronized waveforms');
subplot(313)
plot(C1st,C1s,C2st,C2s);
xlabel('Time [s]');
ylabel('Voltage [V]');
title('Synchronized waveforms');


%% Frequency
%Now it calculates the instantenous frequencies

[C1utf, C1uf ] = instfreq_zerocross(C1ut, C1u);
[C2utf, C2uf ] = instfreq_zerocross(C2ut, C2u);

[C1mtf, C1mf ] = instfreq_zerocross(C1mt, C1m);
[C2mtf, C2mf ] = instfreq_zerocross(C2mt, C2m);

[C1stf, C1sf ] = instfreq_zerocross(C1st, C1s);
[C2stf, C2sf ] = instfreq_zerocross(C2st, C2s);

figure;
subplot(311)
plot(C1utf,C1uf,C2utf,C2uf);
xlabel('Time [s]');
ylabel('Frequency [Hz]');
title('Unsynchronized frequencies');
subplot(312)
plot(C1mtf,C1mf,C2mtf,C2mf);
xlabel('Time [s]');
ylabel('Frequency [Hz]');
title('Partially synchronized fequencies');
subplot(313)
plot(C1stf,C1sf,C2stf,C2sf);
xlabel('Time [s]');
ylabel('Frequency [Hz]');
title('Synchronized frequencies');


%% FFT
[C1u_FFTabs C1u_FFTphase C1u_fvec] = simple_fft(C1ut, C1u);
[C2u_FFTabs C2u_FFTphase C2u_fvec] = simple_fft(C2ut, C2u);

[C1m_FFTabs C1m_FFTphase C1m_fvec] = simple_fft(C1mt, C1m);
[C2m_FFTabs C2m_FFTphase C2m_fvec] = simple_fft(C2mt, C2m);

[C1s_FFTabs C1s_FFTphase C1s_fvec] = simple_fft(C1st, C1s);
[C2s_FFTabs C2s_FFTphase C2s_fvec] = simple_fft(C2st, C2s);


figure;
subplot(311)
plot(C1u_fvec,C1u_FFTabs,C2u_fvec,C2u_FFTabs);
xlabel('Frequency [Hz]');
ylabel('Amplitude');
title('Unsynchronized spectrum');
subplot(312)
plot(C1m_fvec,C1m_FFTabs,C2m_fvec,C2m_FFTabs);
xlabel('Frequency [Hz]');
ylabel('Amplitude');
title('Partially synchronized spectrum');
subplot(313)
plot(C1s_fvec,C1s_FFTabs,C2s_fvec,C2s_FFTabs);
xlabel('Frequency [Hz]');
ylabel('Amplitude');
title('Synchronized spectrum');

%% waveform and frequency
figure; 
hold on;

yyaxis left
plot(C1mt,C1m, 'c-');
hold on;
plot(C2mt,C2m, 'b-');
ylabel('Voltage [V]');

yyaxis right
plot(C1mtf,C1mf, 'k-' , 'LineWidth', 1.2);
hold on;
plot(C2mtf,C2mf, 'r-' ,'LineWidth', 1.2);
legend('Waveform 1', 'Waveform 2', 'Frequency of the waveform 1', 'Frequency of the waveform 2')
xlabel('Time (s)')
ylabel('Frequency [Hz]');

%% Frequency compare
load C1middle_33.dat
load C2middle_33.dat
load C1middle_32.dat
load C2middle_32.dat
load C1middle_31.dat
load C2middle_31.dat

C1_31m = C1middle_31(:,2);
C1_31mt = C1middle_31(:,1);
C2_31m = C2middle_31(:,2);
C2_31mt = C2middle_31(:,1);
C1_32m = C1middle_32(:,2);
C1_32mt = C1middle_32(:,1);
C2_32m = C2middle_32(:,2);
C2_32mt = C2middle_32(:,1);
C1_33m = C1middle_33(:,2);
C1_33mt = C1middle_33(:,1);
C2_33m = C2middle_33(:,2);
C2_33mt = C2middle_33(:,1);

[C1_31mtf, C1_31mf ] = instfreq_zerocross(C1_31mt, C1_31m);
[C2_31mtf, C2_31mf ] = instfreq_zerocross(C2_31mt, C2_31m);

[C1_32mtf, C1_32mf ] = instfreq_zerocross(C1_32mt, C1_32m);
[C2_32mtf, C2_32mf ] = instfreq_zerocross(C2_32mt, C2_32m);

[C1_33mtf, C1_33mf ] = instfreq_zerocross(C1_33mt, C1_33m);
[C2_33mtf, C2_33mf ] = instfreq_zerocross(C2_33mt, C2_33m);

figure;
subplot(311)
plot(C1_31mtf,C1_31mf,C2_31mtf,C2_31mf);
xlabel('Time [s]');
ylabel('Frequency [Hz]');
title('Partially synchronized fequencies 1'); % it happens to be synchronized
subplot(312)
plot(C1_32mtf,C1_32mf,C2_32mtf,C2_32mf);
xlabel('Time [s]');
ylabel('Frequency [Hz]');
title('Partially synchronized fequencies 2');
subplot(313)
plot(C1_33mtf,C1_33mf,C2_33mtf,C2_33mf);
xlabel('Time [s]');
ylabel('Frequency [Hz]');
title('Partially synchronized fequencies 3');

%% FFT for requency compare
[C1m_31FFTabs C1m_31FFTphase C1m_31fvec] = simple_fft(C1_31mt, C1_31m);
[C2m_31FFTabs C2m_31FFTphase C2m_31fvec] = simple_fft(C2_31mt, C2_31m);

[C1m_32FFTabs C1m_32FFTphase C1m_32fvec] = simple_fft(C1_32mt, C1_32m);
[C2m_32FFTabs C2m_32FFTphase C2m_32fvec] = simple_fft(C2_32mt, C2_32m);

[C1m_33FFTabs C1m_33FFTphase C1m_33fvec] = simple_fft(C1_33mt, C1_33m);
[C2m_33FFTabs C2m_33FFTphase C2m_33fvec] = simple_fft(C2_33mt, C2_33m);


figure;
subplot(311)
plot(C1m_31fvec,C1m_31FFTabs,C2m_31fvec,C2m_31FFTabs);
xlabel('Frequency [Hz]');
ylabel('Amplitude');
title('Partially synced spectrum 1');
subplot(312)
plot(C1m_32fvec,C1m_32FFTabs,C2m_32fvec,C2m_32FFTabs);
xlabel('Frequency [Hz]');
ylabel('Amplitude');
title('Partially synced spectrum 2');
subplot(313)
plot(C1m_33fvec,C1m_33FFTabs,C2m_33fvec,C2m_33FFTabs);
xlabel('Frequency [Hz]');
ylabel('Amplitude');
title('Synced spectrum 3');
