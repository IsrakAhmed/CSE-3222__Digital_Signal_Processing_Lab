clc
close all
clear

% MATLAB program to find the convolution between two hardcoded sequences

x = [1, 2, 3, 4];  % First sequence x(n)
h = [1, 1, -1, 1];     % Second sequence h(n)

% Perform convolution using the conv() function
y = conv(x, h);

% Display the result
disp('The first sequence x(n) is: ');
disp(x);
disp('The second sequence h(n) is: ');
disp(h);
disp('The convolution result y(n) = conv(x(n), h(n)) is: ');
disp(y);

% Plot the sequences and convolution result
subplot(3,1,1);
stem(x, 'filled');
title('First Sequence x(n)');
xlabel('n');
ylabel('x(n)');

subplot(3,1,2);
stem(h, 'filled');
title('Second Sequence h(n)');
xlabel('n');
ylabel('h(n)');

subplot(3,1,3);
stem(y, 'filled');
title('Convolution Result y(n)');
xlabel('n');
ylabel('y(n)');