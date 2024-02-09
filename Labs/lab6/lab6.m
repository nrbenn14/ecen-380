%% Task 2

%% Part 1
%% Subsection B
clear; close all;
N = 81; % total number of samples in the filter
L = (N-1)/2; % the filter will go from -L to L
n = (-L:L); % this is our sample index
f_corner = 4600; % corner frequency of our low-pass filter in Hz
f_s = 100000; % our sampling frequency in Hz
h_rect_FIR = 2*f_corner/f_s*sinc(n*2*f_corner/f_s); % truncated sinc
% IMPORTANT: in the code above we convert f corner from
% Hz to cycles/sample by dividing by f s
stem(n, h_rect_FIR);


ww = -pi:0.0001:pi;
XX = freqz(h_rect_FIR, 1, ww);
ff = ww*f_s/(2*pi);

figure
plot(ff, (20*log10(abs(XX))));
title('Frequency Response to Rect Low-Pass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([0, 10000]);

%% Subsection D

h1 = blackman(N).'.*h_rect_FIR;
H1 = freqz(h1, 1, ww);
h2 = chebwin(N).'.*h_rect_FIR;
H2 = freqz(h2, 1, ww);
h3 = hamming(N).'.*h_rect_FIR;
H3 = freqz(h3, 1, ww);

figure
hold on;
stem(n, h_rect_FIR)
stem(n, h1, 'r')
stem(n, h2, 'g')
stem(n, h3, 'k')
hold off;
legend('Rect Window', 'Blackman Window', 'Chebyshev Window', 'Hamming Window');

figure
hold on;
plot(ff, 20*log10(abs(XX)))
plot(ff, 20*log10(abs(H1)))
plot(ff, 20*log10(abs(H2)))
plot(ff, 20*log10(abs(H3)))
hold off;
xlabel('Frequency (cycles/sample)');
ylabel('Magnitude (dB)');
xlim([0, 10000]);
legend('Rect Window', 'Blackman Window', 'Chebyshev Window', 'Hamming Window');

%% Part 2
%% Subsection A

t = 0:1/100000:0.5;

sin1 = sin(4000*2*pi*t);
sin2 = sin(4600*2*pi*t);
sin3 = sin(6000*2*pi*t);
sin4 = sin(25000*2*pi*t);
sin5 = sin(40000*2*pi*t);

s1 = sin1 + sin2 + sin3 + sin4 + sin5;


%% Subsection B


freq = fft(s1);
freq = fftshift(freq);
freq = abs(freq);
freq = 20*log10(freq);
omega = linspace(-50000, 50000, 50001);

figure
plot(omega, freq);
xlim([0, 50000]);
ylim([-50, 100]);

%% Subsection C

a1 = filter(h1, 1, s1);
plot(t, a1)
