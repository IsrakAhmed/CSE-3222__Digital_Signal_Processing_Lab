% MATLAB program to compute the DFT of a sequence

% Hardcoded sequence
x = [1, 2, 3, 4];  % Example sequence x(n)

% Length of the sequence
N = length(x);

% Compute the DFT using the built-in fft() function
X_fft = fft(x);

% Display the sequence and the DFT result
disp('The sequence x(n) is: ');
disp(x);
disp('The DFT of the sequence using fft() is: ');
disp(X_fft);

% Compute the DFT manually (for understanding)
X_manual = zeros(1, N);  % Initialize the DFT result
for k = 0:N-1
    for n = 0:N-1
        X_manual(k+1) = X_manual(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
    end
end

% Display the manually calculated DFT
disp('The DFT of the sequence computed manually is: ');
disp(X_manual);

% Plot the magnitude of the DFT results
subplot(2, 1, 1);
stem(0:N-1, abs(X_fft), 'filled');
title('DFT Magnitude using fft()');
xlabel('Frequency index k');
ylabel('|X(k)|');

subplot(2, 1, 2);
stem(0:N-1, abs(X_manual), 'filled');
title('DFT Magnitude computed manually');
xlabel('Frequency index k');
ylabel('|X(k)|');
