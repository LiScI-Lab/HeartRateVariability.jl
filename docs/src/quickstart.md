# Quickstart

## Data import

The data can be read from a wfdb file using the infile function. Therefore, the name and the annotator of the record are passed to the function. For the record "e1034.atr" with the header "e1304.hea" the name to be passed is "e1034" and the annotator is "atr".

    data = HRV.infile("e1304","atr")

Additionally, txt or csv files can be read in by passing the path of the file as a parameter.

```@example 1
using HRV #hide
data = HRV.infile("e1304.txt")
```

## Analysis

To analyze the read-in data, the array with the data is passed to the respective analysis function. The results are returned in a NamedTuple.

### Time-Domain Analysis

```@example 1
td = HRV.time_domain(data)
```

### Frequency-Domain Analysis

```@example 1
fd = HRV.frequency(data)
```

### Nonlinear Analysis

```@example 1
nl = HRV.nonlinear(data)
```

### Geometric Analysis

```@example 1
g = HRV.geometric(data)
```

The different results in the NamedTuple can be output individually by calling the result name.

```@example 1
g.poincare
```
```@example 1
g.recurrence
```
