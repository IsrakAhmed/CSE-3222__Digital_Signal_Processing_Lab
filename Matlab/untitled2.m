
% Generate Unit Ramp Signal

% Parameters
t = 0:10;  % Time vector from 0 to 10 with a step size of 0.1

% Plot the unit ramp signal
figure;
stem(t, t, 'r', 'LineWidth', 2);
xlabel('Time (t)');
ylabel('Amplitude');
title('Unit Ramp Signal');
grid on;