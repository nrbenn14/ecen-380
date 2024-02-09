%% Initial Recording - part 2

recObj = audiorecorder(96000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.');
recordblocking(recObj, 5); % Does the recording/sampling, for 5 seconds
disp('End of recording.');

%% Play audio - part 2

% play(recObj); % Plays back the recording
myRecording = getaudiodata(recObj); % Grab the sampled data from recObj
plot(myRecording);

%% Audioplayer work - part 3

player = audioplayer(myRecording, 96000); % 2nd param plays back at 96,000 samples/s
% playblocking(player); % Actually plays the sound in object player back

%% Manual impulse response - part 4

impulse_echo = zeros(192000,1);
impulse_echo(1) = 1; % A delta at the beginning of our impulse response
impulse_echo(48000) = 0.5; % A smaller (softer) one after 0.5 seconds (48,000 samples)
impulse_echo(96000) = 0.2;
player = audioplayer(impulse_echo, 96000);
% playblocking(player);

%% Convolved signals - part 5

myRecording_echo = conv(myRecording, impulse_echo); % This will be a bit slow...
player = audioplayer(myRecording_echo, 96000);
playblocking(player);

%% Various impulse responses - part 6

impulse_great_hall = audioread('great_hall.wav');
impulse_octagon = audioread('octagon.wav');
impulse_classroom = audioread('classroom.wav');

player = audioplayer(impulse_great_hall, 96000);
playblocking(player);
player = audioplayer(impulse_octagon, 96000);
playblocking(player);
player = audioplayer(impulse_classroom, 96000);
playblocking(player);

figure;
subplot(3,1,1);
plot(impulse_great_hall);
title('GREAT HALL IMPULSE');
subplot(3,1,2);
plot(impulse_octagon);
title('OCTAGON IMPULSE');
ylabel('INTENSITY');
subplot(3,1,3);
plot(impulse_classroom);
title('CLASSROOM IMPULSE');
xlabel('TIME (s)')

%% Task 1 Pass Off - part 7

disp('Record 5 seconds of audio.');
disp('Start speaking.')
recObj1 = audiorecorder(96000, 24, 1); % (sampling rate, bits/sample, channels)
recordblocking(recObj1, 5); % Does the recording/sampling, for 5 seconds
disp('Stop speaking.')

for irf = [impulse_great_hall, impulse_octagon, impulse_classroom] 
    out = conv(myObj1, irf);
    disp('Playing output');
    player = audioplayer(out, 96000);
    playblocking(player);
end

%% Own impulse response - part 8

recObj2 = audiorecorder(96000, 24, 1);
recordblocking(recObj2, 2);


%% Task 2

%% Part 2

% part b
recObj = audiorecorder(48000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.');
recordblocking(recObj, 9); % Does the recording/sampling, for 5 seconds
disp('End of recording.')
%%
% part c
play(recObj); % Plays back the recording
my48khzRecording = getaudiodata(recObj); % Grab the sampled data from recObj
plot(my48khzRecording);

%% part d

my8khzRecording = my48khzRecording(1:6:length(my48khzRecording));
my8khzobj = audioplayer(my8khzRecording, 8000);
play(my8khzobj);

%%  part e

fs = 8000; % sampling frequency
ww = -pi:0.0001:pi; % identify which frequencies to test
XX = freqz(my8khzRecording,1,ww); % calculate the frequency response
ff = ww*fs/(2*pi); % convert the frequency vector to Hz
figure
plot(ff,(20*log10(abs(XX)))); % plot the magnitude response in dB
title('15kHz Anti-Alias Filtered Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');


%% Part 5

% part a

recObj = audiorecorder(48000, 24, 1);
disp('Recording start');
recordblocking(recObj, 5);
disp('Recording end');

%%

play(recObj);

%%

my48khzRecording = getaudiodata(recObj); % Grab the sampled data from recObj
my8khzRecording = my48khzRecording(1:6:length(my48khzRecording));
my8khzobj = audioplayer(my8khzRecording, 8000);
play(my8khzobj);

%% part b

recObj = audiorecorder(8000, 24, 1);
disp('Recording start');
recordblocking(recObj, 5);
disp('Recording end');

%%

play(recObj); % Plays back the recording