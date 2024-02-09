clear; close all;
p = 4;
[B, A] = butter(p, 2*pi*3000, 's')
poles = roots(A);
ang_poles = angle(poles).*(180/pi)
radii = abs(poles)./(2*pi)

figure
title('From Butter Function')
zplane(B, A)

figure
title('From Equation 6')
A1 = [1 1.4427e+04 3.5531e+08]
A2 = [1 3.4829e+04 3.5531e+08]
zplane([0 0 3.5531e+08], conv(A1, A2))

figure
f = logspace(0, 5, 500);
[H, w] = freqs(B, A, f);
semilogx(f, 20*log10(abs(H)))
xlabel('Frequency in Hz');
ylabel('Magnitude response in dB');