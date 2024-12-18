import numpy as np
import matplotlib.pyplot as plt
import cmath as cm
import math

f1 = 4000
f2 = 8000
f3 = 16000

a1 = (10)**(10/20)
a2 = (10)**(20/20)
a3 = (10)**(40/20)


sample_limit = 1000
start = 0
end = 0.0005

x = np.linspace(start,end,sample_limit)
y = a1 * np.sin(2 * np.pi * x * f1) + a2 * np.sin(2 * np.pi * x * f2) + a3 * np.sin(2 * np.pi * x * f3)

plt.subplot(2,2,1)
plt.plot(x,y)
plt.title('Generated Original Signal')


# NQ RATE

nyquist_rate = f3 * 2
total_samples = nyquist_rate * (end - start)

#print(total_samples)

x_nq_rate = np.linspace(start, end, int(total_samples))
y_nq_rate = a1 * np.sin(2 * np.pi * x_nq_rate * f1) + a2 * np.sin(2 * np.pi * x_nq_rate * f2) + a3 * np.sin(2 * np.pi * x_nq_rate * f3)


plt.subplot(2,2,2)
plt.plot(x_nq_rate,y_nq_rate)
plt.title('Signal Sampled by Nyquist Rate')

#plt.show()
N = 8

dft = np.fft.fft(y)
#print(dft[0])
#print(dft[1])
#print(dft[2])
#print(dft[3])
#print(dft[4])
#print(dft[5])
#print(dft[6])
#print(dft[7])

dft_final = np.zeros(N, dtype=np.complex128) 

for m in range(N):
    for n in range(N):
        dft_final[m] += dft[n] * np.exp(-2j * np.pi * m * n / N)

#dft_magnitude = dft[0] + dft[1] + dft[2] + dft[3] + dft[4] + dft[5] + dft[6] + dft[7]


plt.subplot(2,2,3)
plt.stem(dft_final)
#plt.show()


phase = []
for i in dft_final:
    phase_temp = cm.phase(round(i.real) + round(i.imag) * 1j)
    phase.append(math.degrees(phase_temp))


plt.subplot(2,2,4)
plt.stem(phase)
plt.show()