# API

# Data import

The following functions are used to import data. They return the read data in an array.

```@docs
infile
```

!!! note

  In order to use the infile function for wfdb files, the wfdb library from Pysionet is required. See [Installation](installation) for more information.



# Analysis

The following functions are used to analyze the data using time series, frequency or nonlinear methods. Each of them returns a NamedTuple containing the results of the analysis.

```@docs
time_domain
frequency
nonlinear
geometric
```
