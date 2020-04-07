module HRV

include("TimeDomain.jl")

function time_domain(n)
    print(SDNN(n))
end

end # module
