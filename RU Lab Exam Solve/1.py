import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import dlti, dlsim

# Question 1: Signal Generation and Sampling
# Parameters
frequencies = [4000, 8000, 16000]  # Hz
decibels = [10, 20, 40]            # dB
num_samples = 1000
sample_rate = 48000  # Standard audio sampling rate in Hz
t = np.arange(num_samples) / sample_rate  # Time vector

# Generate the composite signal
signal = np.zeros(num_samples)
for f, dB in zip(frequencies, decibels):
    amplitude = 10 ** (dB / 20)
    signal += amplitude * np.sin(2 * np.pi * f * t)

# Plot the original signal
plt.figure(figsize=(12, 6))
plt.plot(t, signal)
plt.title("Original Composite Signal")
plt.xlabel("Time (s)")
plt.ylabel("Amplitude")
plt.grid()
plt.show()

# Nyquist Rate and Sampling
nyquist_rate = 2 * max(frequencies)  # Nyquist rate
standard_sampling_rate = nyquist_rate
undersampling_rate = nyquist_rate // 2  # Below Nyquist rate
oversampling_rate = nyquist_rate * 2   # Above Nyquist rate

# Sampling
standard_samples = signal[::int(sample_rate / standard_sampling_rate)]
undersampled_signal = signal[::int(sample_rate / undersampling_rate)]
oversampled_signal = signal[::int(sample_rate / oversampling_rate)]

# Plot sampled signals
plt.figure(figsize=(15, 10))
plt.subplot(4, 1, 1)
plt.plot(t, signal)
plt.title("Original Signal")
plt.grid()

plt.subplot(4, 1, 2)
plt.stem(np.linspace(0, 1, len(standard_samples)), standard_samples, linefmt='C1-', basefmt='C1-')
plt.title("Standard Sampling (Nyquist Rate)")
plt.grid()

plt.subplot(4, 1, 3)
plt.stem(np.linspace(0, 1, len(undersampled_signal)), undersampled_signal, linefmt='C2-', basefmt='C2-')
plt.title("Under-Sampling (Aliasing Visible)")
plt.grid()

plt.subplot(4, 1, 4)
plt.stem(np.linspace(0, 1, len(oversampled_signal)), oversampled_signal, linefmt='C3-', basefmt='C3-')
plt.title("Over-Sampling")
plt.grid()

plt.tight_layout()
plt.show()

# Question 2: LTI System Analysis
# Difference equation: y[n] = (3/4)y[n-1] - (1/8)y[n-2] + x[n] + (1/3)x[n-1]
# Coefficients for y[n] (output) and x[n] (input)
a = [1, -3/4, 1/8]  # Coefficients for past outputs
b = [1, 1/3]        # Coefficients for current and past inputs

# Impulse response
system = dlti(b, a)  # Define the LTI system
t, h = system.impulse(n=20)  # Compute impulse response for 20 samples

# Plot impulse response
plt.figure(figsize=(10, 5))
plt.stem(t, h, use_line_collection=True)
plt.title("Impulse Response of the System")
plt.xlabel("n")
plt.ylabel("h[n]")
plt.grid()
plt.show()

# System Function H(z) (Theoretical)
from sympy.abc import z
from sympy import simplify, collect

H_z = simplify(collect((b[0] + b[1] * z**-1) / (a[0] + a[1] * z**-1 + a[2] * z**-2), z))
print(f"H(z): {H_z}")
