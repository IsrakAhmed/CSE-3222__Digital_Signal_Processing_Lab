from sympy import symbols, apart, simplify
import matplotlib.pyplot as plt

# Define symbolic variables
z = symbols('z')

# Define the system's numerator and denominator
numerator = 1 + (1/3) * z**(-1)
denominator = 1 - (3/4) * z**(-1) + (1/8) * z**(-2)

# System function H(z)
H_z = numerator / denominator

# Simplify H(z) (optional, for clarity)
H_z = simplify(H_z)

# Perform partial fraction expansion
H_z_partial = apart(H_z)

# Manually extract coefficients for impulse response
z1, z2 = 1/2, 1/4  # Roots of the denominator
A, B = 1.668, -0.58  # Coefficients found by partial fraction expansion

# Impulse response h[n] symbolic expression
h_n_expr = f"{A} * ({z1})**n - {B} * ({z2})**n, for n >= 0"

# Compute the impulse response numerically for n values
num_samples = 10
h_n_values = [A * (z1)**n - B * (z2)**n for n in range(num_samples)]

# Display results
print("System Function H(z):")
print(H_z)

print("\nPartial Fraction Expansion of H(z):")
print(H_z_partial)

print("\nImpulse Response h[n] (Symbolic):")
print(h_n_expr)

print("\nImpulse Response h[n] (Numerical):")
for n, h in enumerate(h_n_values):
    print(f"h[{n}] = {h}")

# Plot the impulse response
plt.figure(figsize=(8, 4))
plt.stem(range(num_samples), h_n_values)
plt.title('Impulse Response h[n]')
plt.xlabel('n')
plt.ylabel('h[n]')
plt.grid(True)
plt.show()