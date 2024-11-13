
% Generate exponential signal



% Parameters
t = 0:1:10;  % Time vector from 0 to 10 with a step size of 0.1
alpha = 0.9;   % Exponential growth/decay rate (positive for growth, negative for decay)

% Generate exponential signal
exp_signal = exp(alpha * t);

% Plot the exponential signal
figure;
stem(t, exp_signal, 'r', 'LineWidth', 2);
xlabel('Time (t)');
ylabel('Amplitude');
title('Exponential Signal');
grid on;