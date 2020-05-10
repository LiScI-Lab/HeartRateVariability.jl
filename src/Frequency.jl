module Frequency

using LombScargle
using Trapz

function lomb_scargle(a::Array{Float64,1})
    t=cumsum(a).-a[1]
    plan=LombScargle.plan(t,a,minimum_frequency=0.03,maximum_frequency=0.4)
    return lombscargle(plan)
end

function get_power(freq,power,min,max)
    count=1
    index=[]
    for f in freq
        if f>=min && f<=max
            push!(index,count)
        end
        count+=1
    end
    p=trapz(freq[index[1]:index[end]],power[index[1]:index[end]])
    return p
end
end
