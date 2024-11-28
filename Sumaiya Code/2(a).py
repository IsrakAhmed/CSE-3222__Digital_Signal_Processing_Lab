from sympy import symbols, simplify

# Define z as a symbol
z = symbols('z')

# Numerator: x[n] + (1/3) * x[n-1]
numerator = 1 + 1/3 * z**(-1)

# Denominator: 1 - (3/4) * z^(-1) + (1/8) * z^(-2)
denominator = 1 - (3/4) * z**(-1) + (1/8) * z**(-2)

# System function H(z)
H_z = numerator / denominator

# Simplify the expression
H_z_simplified = simplify(H_z)

# Print the system function H(z)
print("System Function H(z):")
print(H_z_simplified)