# API

# Data import

The following functions are used to import data. They return the read data in an array.

```@docs
infile
```
<div class="panel panel-info">
**Note**
{: .panel-heading}
<div class="panel-body">

In order to use the infile function for wfdb files, the wfdb library from Pysionet is required. See [Installation](src/installation.md) for more information.

</div>
</div>


# Analysis

The following functions are used to analyze the data using time series, frequency or nonlinear methods. Each of them returns a NamedTuple containing the results of the analysis.

```@docs
time_domain
frequency
nonlinear
geometric
```
