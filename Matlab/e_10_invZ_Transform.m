% MATLAB program to compute the inverse Z-transform

% Use the symbolic toolbox
syms z n

% Define the Z-domain function X(z)
X_z = z / (z - 0.5);  % Example Z-transform X(z)

% Compute the inverse Z-transform
x_n = iztrans(X_z, z, n);

% Display the Z-domain function and the inverse Z-transform
disp('The Z-domain function X(z) is: ');
disp(X_z);
disp('The inverse Z-transform x(n) is: ');
disp(x_n);

% Simplify the result if needed
x_n_simplified = simplify(x_n);
disp('The simplified inverse Z-transform x(n) is: ');
disp(x_n_simplified);
