% MATLAB program to compute the DFT of x(t) = 3cos(2000*pi*t) + 5sin(6000*pi*t)

% Define parameters
Fs = 6000;  % Sampling frequency (samples per second)
T = 1/Fs;    % Sampling period (seconds per sample)
L = 1000;    % Length of signal (number of samples)
t = (0:L-1) * T;  % Time vector from 0 to (L-1)*T

% Define the continuous-time signal x(t)
x_t = 3*cos(2000*pi*t) + 5*sin(6000*pi*t);

% Compute the DFT using the fft() function
X_f = fft(x_t);

% Compute the two-sided spectrum and then the single-sided spectrum
P2 = abs(X_f / L);  % Two-sided spectrum
P1 = P2(1:L/2+1);   % Single-sided spectrum
P1(2:end-1) = 2*P1(2:end-1);  % Double the values except for the DC component

% Define the frequency domain (positive frequencies)
f = Fs * (0:(L/2)) / L;

% Plot the single-sided amplitude spectrum
plot(f, P1);
title('Single-Sided Amplitude Spectrum of x(t)');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
grid on;
