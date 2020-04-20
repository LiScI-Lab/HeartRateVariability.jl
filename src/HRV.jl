module HRV

include("TimeDomain.jl")
include("Input.jl")

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
