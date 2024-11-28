% Define parameters
fs_nyquist = 32000;  % Sampling frequency for Nyquist rate (twice the 16 kHz)
t = 0:1/fs_nyquist:0.05;  % Time vector for 1000 samples

% Amplitudes in dB
A1 = 10^(10/20);  % 10 dB
A2 = 10^(20/20);  % 20 dB
A3 = 10^(40/20);  % 40 dB

% Frequencies in Hz
f1 = 4000;   % 4 kHz
f2 = 8000;   % 8 kHz
f3 = 16000;  % 16 kHz

% Generate composite signal
signal = A1 * cos(2 * pi * f1 * t) + A2 * cos(2 * pi * f2 * t) + A3 * cos(2 * pi * f3 * t);

% Create the figure for subplots
figure;

% Plot the original signal
subplot(4, 1, 1);
plot(t, signal);
title('Original Composite Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Sampling the signal at Nyquist rate
fs_standard = 32000;  % Nyquist rate
n_standard = 0:1/fs_standard:0.05;
sampled_signal = A1 * cos(2 * pi * f1 * n_standard) + A2 * cos(2 * pi * f2 * n_standard) + A3 * cos(2 * pi * f3 * n_standard);

% Plot sampled signal at Nyquist rate
subplot(4, 1, 2);
stem(n_standard, sampled_signal);
title('Sampled Signal at Nyquist Rate');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Undersampling (below Nyquist)
fs_under = 16000;  % Below Nyquist rate
n_under = 0:1/fs_under:0.05;
undersampled_signal = A1 * cos(2 * pi * f1 * n_under) + A2 * cos(2 * pi * f2 * n_under) + A3 * cos(2 * pi * f3 * n_under);

% Plot undersampled signal (Aliasing occurs)
subplot(4, 1, 3);
stem(n_under, undersampled_signal);
title('Undersampled Signal (Aliasing)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Oversampling (above Nyquist rate)
fs_over = 64000;  % Higher than Nyquist
n_over = 0:1/fs_over:0.05;
oversampled_signal = A1 * cos(2 * pi * f1 * n_over) + A2 * cos(2 * pi * f2 * n_over) + A3 * cos(2 * pi * f3 * n_over);

% Plot oversampled signal
subplot(4, 1, 4);
stem(n_over, oversampled_signal);
title('Oversampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Adjust layout for better visualization
tight_layout();
