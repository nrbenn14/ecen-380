% B6-2 
A = [1 1 1 1;
     1 1 1 -1;
     1 1 -1 -1;
     1 -1 -1 -1];
B = [4; 2; 0; -2];
X = linsolve(A,B);

% B6-3
C = [1 1 1 1;
     1 -2 3 0;
     1 0 -1 7;
     0 -2 3 -4];
D = [1; 2; 3; 4];
Y = linsolve(C,D);

% B6-4
E = [(cos(3*1.8799)) (sin(3*1.8799));
     (cos(3*0.3091)) (sin(3*0.3091))];
F = [5; 0];
Z = linsolve(E,F);

% B6-5
x = [1 3;
     -2 4];
y = [-5;
     2];
z = [0 1;
     -1 0];

fa = transpose(y).*y;
fb = y.*transpose(y);
fc = x.*y;
fd = transpose(x).*y;
fe = transpose(y).*x;
ff = x.*z;
fg = z.*x.*z;
fh = transpose(x)-z;

% Task 1, Part 4

f = zeros(1, 10);
for k = 1:10
    if k == 1
        f(k) = 0;
    elseif k == 2
        f(k) = 1;
    elseif k == 3
        f(k) = 2;
    else 
        f(k) = f(k-1) + f(k-2) + f(k-3);
    end
end
disp(f);


% Task 2

% Sound Production

% Part 1
t = 0:(1/16000):5;

% Part 2
s1 = cos(2*pi*400*t);

% Part 3
%soundsc(s1, 16000)

% Part 4
audiowrite('sound1.wav', s1, 16000)

% Part 6
audiowrite('sound2.wav', s1, 48000)

% Part 1a
midC = cos(2*pi*440*t);
highC = cos(2*pi*1320*t);

cChord = (highC + midC)/2;
%soundsc(midC, highC, 16000);
audiowrite('cOctave.wav', cChord, 16000)

% Part 2a

%%% Never Gonna Give You Up, Rick Astley

Ts = 1/16000; % sample time

beatps = 114/60; % Allegre con brio = 94 beats per minute, this is beats/s
% frequencies (cycles/s) for music tones
G = 392;
Eflat = 311.127;
F = 349.23;
D = 293.66;
C = 261.63;
A = 440;
C5 = 523.25;
B4 = 466.16;

% whole note = 4 beats
T1 = 4/beatps;
% half note = 2 beats
T2 = 2/beatps;
% quarter note = 1 beat
T4 = 1/beatps;
% eighth note = 1/2 beat
T8 = 0.5/beatps;
% dotted quarter
T3 = 1.5/beatps;
T16 = .25/beatps;
% cut short each note by 1/32 of a beat to give the illusion of
% consecutive notes
Tspace = 1/32/beatps;
s = [cos(2*pi*F*(0:Ts:T3-Tspace-Ts)) zeros(size(0:Ts:Tspace-Ts)) ...
cos(2*pi*G*(0:Ts:T3-Tspace-Ts)) zeros(size(0:Ts:Tspace-Ts))...
cos(2*pi*C*(0:Ts:T4-Tspace-Ts)) zeros(size(0:Ts:Tspace-Ts))...
cos(2*pi*G*(0:Ts:T3-Tspace-Ts)) ...
zeros(size(0:Ts:Tspace-Ts)) ...
cos(2*pi*A*(0:Ts:T3-Tspace-Ts)) zeros(size(0:Ts:Tspace-Ts)) ...
cos(2*pi*C5*(0:Ts:T16-Tspace-Ts)) zeros(size(0:Ts:Tspace-Ts)) ...
cos(2*pi*B4*(0:Ts:T16-Tspace-Ts)) zeros(size(0:Ts:Tspace-Ts)) ...
cos(2*pi*A*(0:Ts:T8-Tspace-Ts))];
soundsc(s,1/Ts);


% Audio Sampling and Playback

myRec = audiorecorder(48000, 24, 1);
record(myRec);
pause(5);
%print("Finishing recording")
stop(myRec);
%play(myRec)

%getaudiodata(myRec);
x = getaudiodata(myRec);
%y = 0:(1/(length(x))):5;
%plot(x)
%myPlr = audioplayer(x, 48000, 24);
%play(myPlr)
%audioplayer(myRec);



