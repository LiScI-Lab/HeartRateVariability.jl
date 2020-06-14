module HRV

include("TimeDomain.jl")
include("Input.jl")
include("Frequency.jl")
include("Nonlinear.jl")
include("Geometric.jl")

"""
    geometric(n,e="mean")

Arguments:
- n: the array that contains the NN-inetrvals
- e: the maximum distance between two intervals

Results:
- pincare: the Poincaré plot
- recurrence: the recurrence plot
"""
function geometric(n::Array{Float64,1},e="mean")
    return (poincare=Geometric.poincare(n),recurrence=Geometric.recurrence(n,e))
end

"""
    nonlinear(n,m=2,r=6)

Arguments:
- n: the array that contains the NN-inetrvals
- m: the embedding dimension, default=2
- r: the tolerance, default=6

Results:
- apen: the approximate entropy
- sampen: the sample entropy
- hurst: the hurst exponent
- renyi0, renyi1, renyi2: the Rényi entropy of order 0,1 and 2
"""
function nonlinear(n::Array{Float64,1},m::Int64=2,r::Number=6)
    return (apen=Nonlinear.apen(n,m,r), sampen=Nonlinear.sampen(n,m,r),
            hurst=Nonlinear.hurst(n), renyi0=Nonlinear.renyi(n,0),
            renyi1=Nonlinear.renyi(n,1), renyi2=Nonlinear.renyi(n,2))
end # nonlinear

"""
    frequency(n)

Arguments:
- n: the array that contains the NN-inetrvals

Results:
- vlf: the very low-frequency power
- lf: the low-frequency power
- hf: the high-frequency power
- lfhf_ratio: the lf/hf ratio
- tp: the total power
"""
function frequency(n::Array{Float64,1})
    ls=Frequency.lomb_scargle(n)
    vlf=Frequency.get_power(ls.freq,ls.power,0.003,0.04)
    lf=Frequency.get_power(ls.freq,ls.power,0.04,0.15)
    hf=Frequency.get_power(ls.freq,ls.power,0.15,0.4)
    tp=vlf+lf+hf
    return (vlf=vlf, lf=lf, hf=hf, lfhf_ratio=lf/hf, tp=tp)
end # frequency

"""
    time_domain(n)

Arguments:
- n: the array that contains the NN-inetrvals

Results:
- mean: the mean value
- sdnn: the standard deviation
- rmssd: the root mean square of successive differences
- sdsd: the standard deviation of successive differences
- nn50: the number of successive NN intervals with an interval smaller than 50 ms
- pnn50: the percentage of successive NN intervals with an interval smaller than 50 ms
- nn20: the number of successive NN intervals with an interval smaller than 20 ms
- pnn20: the percentage of successive NN intervals with an interval smaller than 20 ms
- rRR: the percentage of relative RR intervals
"""
function time_domain(n::Array{Float64,1})
    diff=TimeDomain.nn_diff(n)
    return (mean=TimeDomain.mean_nn(n),sdnn=TimeDomain.sdnn(n),
            rmssd=TimeDomain.rmssd(diff), sdsd=TimeDomain.sdsd(diff),
            nn50=TimeDomain.nn(diff,50), pnn50=TimeDomain.pnn(diff,50),
            nn20=TimeDomain.nn(diff,20), pnn20=TimeDomain.pnn(diff,20),
            rRR=TimeDomain.rRR(n))
end # time_domain

"""
    infile(file)

This function reads the data from a txt or csv file.

Arguments:
- file: is the path of the input file

"""
function infile(file::String)
    return Input.read_txt(file)
end # infile

"""
    infile(record,annotator)

This function reads the data from a wbdb file.

Arguments:
- record: is the name of the record
- annotator: is the annotator of the record
"""
function infile(record::String,annotator::String)
    return Input.read_wfdb(record,annotator)
end # infile

export nonlinear, frequency, time_domain, infile
end # module
