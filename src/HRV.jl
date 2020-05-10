module HRV

include("TimeDomain.jl")
include("Input.jl")
include("Frequency.jl")

function frequency(n::Array{Float64,1})
    ls=Frequency.lomb_scargle(n)
    vlf=Frequency.get_power(ls.freq,ls.power,0.003,0.04)
    lf=Frequency.get_power(ls.freq,ls.power,0.04,0.15)
    hf=Frequency.get_power(ls.freq,ls.power,0.15,0.4)
    tp=vlf+lf+hf
    println("VLF: ",vlf)
    println("LF: ",lf)
    println("HF: ",hf)
    println("Total Power: ",tp)
end


function time_domain(n::Array,s::String="all")
    diff=TimeDomain.nn_diff(n)
    println("Mean: ",TimeDomain.mean_nn(n))
    println("SDNN: ",TimeDomain.sdnn(n))
    println("RMSSD: ",TimeDomain.rmssd(diff))
    println("SDSD: ",TimeDomain.sdsd(diff))
    println("NN50: ",TimeDomain.nn(diff,50))
    println("pNN50: ",TimeDomain.pnn(diff,50))
    println("NN20: ",TimeDomain.nn(diff,20))
    println("pNN20: ",TimeDomain.pnn(diff,20))
end

function time_domain(n::Array,s::Array)
    print("test")
end

function infile(file::String)
    return Input.read_txt(file)
end

function infile(record::String,annotator::String)
    return Input.read_wfdb(record,annotator)
end

end # module
