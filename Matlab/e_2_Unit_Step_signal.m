
% Generating Unit Step Signal


% Parameters
fs = 10;                 % Sampling frequency (samples per second)
t = -1:1/fs:1;            % Time vector from -1 to 1 second, with fs points

% Generating Unit Step Signal
unit_step = t >= 0;       % Logical condition (1 for t >= 0, 0 for t < 0)

% Plotting the Unit Step Signal
stem(t, unit_step, 'r', 'LineWidth', 2);  % Use stem to visualize discrete values
title('Unit Step Signal');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-0.2 1.2]);         % Set y-axis limits to enhance visibility
grid on;                  % Add grid for better visualization