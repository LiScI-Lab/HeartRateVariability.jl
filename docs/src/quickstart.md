```@example 1
using HRV # hide
data = HRV.infile("e1034","atr")
data = HRV.ifile("e1304.txt")
```
```@example 1
td=HRV.time_domain(data)
```
```@example 1
fd=HRV.frequency(data)
```
```@example 1
nl=HRV.nonlinear(data)
```
```@example 1
g=HRV.geometric(data)
```
