module Frequency

using LombScargle
using Trapz

#=
This function calculates a lomb scargle transformation
:param n: is the array that contains the NN-inetrvals
:return: the result of the lomb scargle transformation
=#
function lomb_scargle(n::Array{Float64,1})
    t=cumsum(n).-n[1]
    t=t./1000
    plan=LombScargle.plan(t,n,normalization=:psd,minimum_frequency=0.003,maximum_frequency=0.4)
    return lombscargle(plan)
end # lomb_scargle


function get_power(freq,power,min,max)
    count=1
    index=[]
    for f in freq
        if f>=min && f<max
            push!(index,count)
        end
        count+=1
    end
    p=trapz(freq[index[1]:index[end]],power[index[1]:index[end]])
    return p
end # get_power

end # module
