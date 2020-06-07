# Introduction

# Time-Domain Analysis

The time-domain analysis contains the following analysis methods:

- Mean: This is the mean value of the RR intervals. It is calculated by summing all NN intervals and then dividing by their number. [Read more](https://en.wikipedia.org/wiki/Mean#Arithmetic_mean_(AM))

- SDNN: This is the standard deviation of the NN intervals. [Read more](https://en.wikipedia.org/wiki/Heart_rate_variability#Time-domain_methods[36])

- RMSSD: This is the root mean square of the differences between successive NN intervals. [Read more](https://en.wikipedia.org/wiki/Heart_rate_variability#Time-domain_methods[36])

- SDSD: This is the standard deviation of the differences between successive NN intervals. [Read more](https://en.wikipedia.org/wiki/Heart_rate_variability#Time-domain_methods[36])

- NN20/NN50: This is the number of pairs of successive NN intervals that differ by more than 20ms/50ms. [Read more](https://en.wikipedia.org/wiki/Heart_rate_variability#Time-domain_methods[36])

- pNN20/pNN50: This is the percentage of pairs of successive NN intervals that differ by more than 20ms/50ms. [Read more](https://en.wikipedia.org/wiki/Heart_rate_variability#Time-domain_methods[36])

- rRR: The relative RR intervals are calculated using the equation
```math
for i=2...n

rr _{i} := \frac{2*(RR_{i}-RR_{i-1})}{RR_{i}+RR_{i-1}}

where n is the number of RR intervals.
```
  where n is the number of RR intervals.
  The HRV is measured by the median of the euclidean distances of the relative RR intervals to the average of the relative RR intervals. [Read more](https://marcusvollmer.github.io/HRV/files/paper_method.pdf)

# Frequency-Domain Analysis

Frequency domain analysis uses a Lomb Scargle Transformation to determine the power spectral density of each frequency domain. The frequency bands are defined as follows:

- VLF: very low frequency, from 0.003 to 0.04 Hz

- LF: low frequency, from 0.04 to 0.15 Hz

- HF: high frequency, from 0.15 to 0.4 Hz

- LF/HF: The ratio of LF and HF

- Total Power: The sum of VLF, LF and HF

[Read more](https://en.wikipedia.org/wiki/Heart_rate_variability#Frequency-domain_methods[36])

# Nonlinear Analysis

- Approximate entropy:

- Sample entropy:

- Hurst exponent:

- Rényi entropy:
