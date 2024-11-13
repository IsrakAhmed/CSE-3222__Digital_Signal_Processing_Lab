clc

% MATLAB program to find the cross-correlation between two sequences

% Hardcoded sequences
x = [1, 2, 3, 4];  % First sequence x(n)
h = [1, 4, 2, 3];     % Second sequence h(n)

% Perform cross-correlation using the xcorr() function
r_xh = xcorr(x, h);

% Define the lags for plotting
lags = -(length(h)-1):(length(x)-1);

% Display the sequences and cross-correlation result
disp('The first sequence x(n) is: ');
disp(x);
disp('The second sequence h(n) is: ');
disp(h);
disp('The cross-correlation result r_xh(n) = xcorr(x(n), h(n)) is: ');
disp(r_xh);

% Plot the cross-correlation result
stem(lags, r_xh, 'filled');
title('Cross - correlation r_{xh}(n)');
xlabel('Lag');
ylabel('r_{xh}(n)');
grid on;

% Mark the point at lag 0 for clarity
hold on;
[~, lag0_idx] = max(lags == 0);
plot(0, r_xh(lag0_idx), 'ro', 'MarkerFaceColor', 'r');
text(0, r_xh(lag0_idx), ['\leftarrow Lag 0: ', num2str(r_xh(lag0_idx))], 'VerticalAlignment', 'bottom');
hold off;
