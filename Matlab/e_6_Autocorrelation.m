% MATLAB program to find the autocorrelation of a hardcoded sequence

% Hardcoded sequence
x = [1, 2, 3, 4];  % Example sequence x(n)

% Perform autocorrelation using the xcorr() function
r_xx = xcorr(x);

% Display the result
disp('The sequence x(n) is: ');
disp(x);
disp('The autocorrelation result r_xx(n) = xcorr(x(n)) is: ');
disp(r_xx);

% Plot the sequence and autocorrelation result
subplot(2,1,1);
stem(x, 'filled');
title('Original Sequence x(n)');
xlabel('n');
ylabel('x(n)');

subplot(2,1,2);
stem(r_xx, 'filled');
title('Autocorrelation r_xx(n)');
xlabel('Lag');
ylabel('r_xx(n)');
