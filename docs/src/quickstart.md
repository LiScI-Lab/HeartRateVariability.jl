# Quickstart

## Data import

The data can be read from a wfdb file using the infile function. Therefore, the name and the annotator of the record are passed to the function. For the record "e1034.atr" with the header "e1304.hea" the name to be passed is "e1034" and the annotator is "atr".

    data = HeartRateVariability.infile("e1304","atr")

Additionally, txt or csv files can be read in by passing the path of the file as a parameter.

```@example 1
using HeartRateVariability #hide
data = HeartRateVariability.infile("e1304.txt")
```

## Analysis

To analyze the read-in data, the array with the data is passed to the respective analysis function. The results are returned in a NamedTuple.

### Time-Domain Analysis

```@example 1
td = HeartRateVariability.time_domain(data)
```

### Frequency-Domain Analysis

```@example 1
fd = HeartRateVariability.frequency(data)
```

### Nonlinear Analysis

```@example 1
nl = HeartRateVariability.nonlinear(data)
```

### Geometric Analysis

```@example 1
g = HeartRateVariability.geometric(data)
```

The different results in the NamedTuple can be output individually by calling the result name.

```@example 1
g.poincare
```
```@example 1
g.recurrence
```

The data used in this example is from the European ST-T Database[^1] and was found on [Physionet](https://physionet.org/content/edb/1.0.0/)[^2].

[^1]: Taddei A, Distante G, Emdin M, Pisani P, Moody GB, Zeelenberg C, Marchesi C. The European ST-T Database: standard for evaluating systems for the analysis of ST-T changes in ambulatory electrocardiography. European Heart Journal 13: 1164-1172 (1992).
[^2]: Goldberger, A., Amaral, L., Glass, L., Hausdorff, J., Ivanov, P. C., Mark, R., ... & Stanley, H. E. (2000). PhysioBank, PhysioToolkit, and PhysioNet: Components of a new research resource for complex physiologic signals. Circulation [Online]. 101 (23), pp. e215–e220.
