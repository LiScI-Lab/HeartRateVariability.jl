module HRV

include("TimeDomain.jl")
include("Input.jl")
include("Frequency.jl")
include("Nonlinear.jl")

"""
    nonlinear(n,m=2,r=6)

This function calculates the nonlinear analysis methods and returns the results.

Arguments:
- n : is the array that contains the NN-inetrvals
- m : is the embedding dimension, default=2
- r : is the tolerance, default=6
"""
function nonlinear(n::Array{Float64,1},m::Int64=2,r::Number=6)
    return (apen=Nonlinear.apen(n,m,r), sampen=Nonlinear.sampen(n,m,r),
            hurst=Nonlinear.hurst(n), renyi0=Nonlinear.renyi(n,0),
            renyi1=Nonlinear.renyi(n,1), renyi2=Nonlinear.renyi(n,2))
end # nonlinear

"""
    frequency(n)

This function calculates the frequency analysis methods and returns the results.

Arguments:
- n : is the array that contains the NN-inetrvals
"""
function frequency(n::Array{Float64,1})
    ls=Frequency.lomb_scargle(n)
    vlf=Frequency.get_power(ls.freq,ls.power,0.003,0.04)
    lf=Frequency.get_power(ls.freq,ls.power,0.04,0.15)
    hf=Frequency.get_power(ls.freq,ls.power,0.15,0.4)
    tp=vlf+lf+hf
    return (vlf=vlf, lf=lf, hf=hf, lf_hf_ratio=lf/hf, tp=tp)
end # frequency

"""
    time_domain(n)

This function calculates the time domain analysis methods and returns the results.

Arguments:
- n : is the array that contains the NN-inetrvals
"""
function time_domain(n::Array{Float64,1})
    diff=TimeDomain.nn_diff(n)
    return (mean=TimeDomain.mean_nn(n),sdnn=TimeDomain.sdnn(n),
            rmssd=TimeDomain.rmssd(diff), sdsd=TimeDomain.sdsd(diff),
            nn50=TimeDomain.nn(diff,50), pnn50=TimeDomain.pnn(diff,50),
            nn20=TimeDomain.nn(diff,20), pnn20=TimeDomain.pnn(diff,20))
end # time_domain

"""
    infile(file)

This function reads a file (txt or csv) and saves the data in an array.

Arguments:
- file : is the path of the input file

"""
function infile(file::String)
    return Input.read_txt(file)
end # infile

"""
    infile(record,annotator)

This function reads a wfdb file and saves the data in an array.

Arguments:
- record : is the name of the record
- annotator : is the annotator of the record
"""
function infile(record::String,annotator::String)
    return Input.read_wfdb(record,annotator)
end # infile

export nonlinear, frequency, time_domain, infile
end # module
