%% Task 3
%% Part 1

f_players = [1471, 1724, 2000, 2273, 2632, 2941, 3333, 3571, 3846, 4167];
% Player center frequencies in Hz
f_s = 10000; % sampling frequency (remember we have decimated)
BW = 50; % Full bandwidth of filters in Hz

b = zeros(11,10);
a = b;
H = [];

f_axis = linspace(1000, 4500, 2000);
hold on;

for c = 1:10
    f_lower = f_players(c) - BW/2;
    f_upper = f_players(c) + BW/2;
    [b(:, c), a(:, c)] = butter(5, [f_lower*2/f_s, f_upper*2/f_s]);
    Hi = freqz(b(:, c), a(:, c), f_axis, f_s);
    H = [H; Hi];
    plot(f_axis, abs(H(c, :)));
end

hold off;

%% Part 4

load("lab6_data_sets.mat");

y = zeros(2000, 10);
for x = [x_easy1 x_easy2 x_easy3 x_easy4 x_easy5 ...
     x_hard1 x_hard2 x_hard3 x_hard4 x_hard5]
    for i = 1:10
        y(:, i) = filter(b(:, i), a(:, i), x);
    end

    E = sum(abs(y).^2, 1);
    figure
    bar(1:10, E)
    varAsString = @(var) inputname(1);
    title(varAsString(x))
end


