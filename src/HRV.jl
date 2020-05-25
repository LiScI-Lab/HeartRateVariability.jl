module HRV

include("TimeDomain.jl")
include("Input.jl")
include("Frequency.jl")
include("Nonlinear.jl")

"""
This function calculates the nonlinear analysis methods and prints the results

Arguments:
- n : is the array that contains the NN-inetrvals
- m : is the embedding dimension, default=2
- r : is the tolerance, default=6
"""
function nonlinear(n::Array{Float64,1},m::Int64=2,r::Number=6)
    println("ApEn: ",Nonlinear.apen(n,m,r))
    println("SampEn: ",Nonlinear.sampen(n,m,r))
    println("Hurst-Exponent: ",Nonlinear.hurst(n))
    println("Renyi 0: ",Nonlinear.renyi(n,0))
    println("Renyi 1: ",Nonlinear.renyi(n,1))
    println("Renyi 2: ",Nonlinear.renyi(n,2))
end # nonlinear

"""
This function calculates the frequency analysis methods and prints the results
:param n: is the array that contains the NN-inetrvals
"""
function frequency(n::Array{Float64,1})
    ls=Frequency.lomb_scargle(n)
    vlf=Frequency.get_power(ls.freq,ls.power,0.003,0.04)
    lf=Frequency.get_power(ls.freq,ls.power,0.04,0.15)
    hf=Frequency.get_power(ls.freq,ls.power,0.15,0.4)
    tp=vlf+lf+hf
    println("VLF: ",vlf)
    println("LF: ",lf)
    println("HF: ",hf)
    println("LF/HF: ",lf/hf)
    println("Total Power: ",tp)
end # frequency

"""
This function calculates the time domain analysis methods and prints the results
:param n: is the array that contains the NN-inetrvals
"""
function time_domain(n::Array{Float64,1})
    diff=TimeDomain.nn_diff(n)
    return (mean=TimeDomain.mean_nn(n),sdnn=TimeDomain.sdnn(n),
            rmssd=TimeDomain.rmssd(diff), sdsd=TimeDomain.sdsd(diff),
            nn50=TimeDomain.nn(diff,50), pnn50=TimeDomain.pnn(diff,50),
            nn20=TimeDomain.nn(diff,20), pnn20=TimeDomain.pnn(diff,20))
end # time_domain

"""
This function reads a file (txt or csv) and saves the data in an array
:param file: is the location of the input file
:return: an array containing the NN intervals
"""
function infile(file::String)
    return Input.read_txt(file)
end # infile

"""
This function reads a wfdb file and saves the data in an array
:param record: is the name of the record
:param annotator: is the annotator of the record
:return: an array containing the NN intervals
"""
function infile(record::String,annotator::String)
    return Input.read_wfdb(record,annotator)
end # infile

export nonlinear, frequency, time_domain, infile
end # module
