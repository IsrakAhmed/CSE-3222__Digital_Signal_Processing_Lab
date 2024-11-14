clc
close all
clear


% MATLAB program to compute the Z-transform of a given sequence

% Use the symbolic toolbox
syms n z

% Define the discrete-time sequence x(n)
x_n = (0.5)^n;  % Example sequence x(n) = (0.5)^n

% Compute the Z-transform using ztrans()
X_z = ztrans(x_n, n, z);

% Display the sequence and its Z-transform
disp('The sequence x(n) is: ');
disp(x_n);
disp('The Z-transform X(z) is: ');
disp(X_z);

% Simplify the result if needed
X_z_simplified = simplify(X_z);
disp('The simplified Z-transform X(z) is: ');
disp(X_z_simplified);
