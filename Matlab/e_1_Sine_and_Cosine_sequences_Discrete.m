clc
close all
clear

%   Experiment_1_Sine_and_Cosine_sequences_(Discrete)

fs = 10;            % Lower sampling frequency to visualize discrete points
t = 0:1/fs:1;        % Time vector from 0 to 1 second with fs points
f = 5;               % Frequency of the signal (Hz)
A = 2;               % Amplitude

sine_wave = A * sin(2 * pi * f * t);    % Generate sine wave
subplot(2,2,1)
stem(t, sine_wave);   % Stem Plot sine wave
title('Discrete Sine Waves');
xlabel('Time (s)');
ylabel('Amplitude');
grid ON

%hold on;              % Hold on to plot both signals on the same figure

cosine_wave = A * cos(2 * pi * f * t);  % Generate cosine wave
subplot(2,2,2)
stem(t, cosine_wave); % Stem Plot cosine wave
title('Discrete Cosine Waves');
xlabel('Time (s)');
ylabel('Amplitude');
grid ON


% Adding Name at the Bottom of the Figure
name = '2037820103 : Israk Ahmed';
x_pos = -0.2;         % X position (0 to 1, with 0 being left and 1 being right)
y_pos = -1.5;        % Y position, just below the plot area
text(x_pos, y_pos, name, 'Units', 'normalized', 'HorizontalAlignment', 'center');

%legend('Sine Wave', 'Cosine Wave');
%hold off;