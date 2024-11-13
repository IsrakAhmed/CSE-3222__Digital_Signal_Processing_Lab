fs = 60;          % Sampling frequency (below Nyquist rate)
t = 0:1/fs:1;     % Time vector
f = 30;           % Frequency of the signal (Hz)
x = sin(2 * pi * f * t);  % Original signal

% Plot original continuous-time signal
figure;
subplot(3,1,1);
plot(t, x);
title('Original Signal (Continuous)');
xlabel('Time (s)');
ylabel('Amplitude');

% Simulating aliasing by undersampling
fs_alias = 20;    % Sampling frequency below Nyquist (f/2)
t_alias = 0:1/fs_alias:1;
x_alias = sin(2 * pi * f * t_alias);

subplot(3,1,2);
plot(t_alias, x_alias);
title('Aliased Signal (Undersampled)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;


% Simulating aliasing by oversampling
fs_alias = 100;    % Sampling frequency below Nyquist (f/2)
t_alias = 0:1/fs_alias:1;
x_alias = sin(2 * pi * f * t_alias);

subplot(3,1,3);
plot(t_alias, x_alias);
title('Aliased Signal (Oversampled)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;