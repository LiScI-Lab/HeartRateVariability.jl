module Frequency

import LombScargle
import Trapz

#=
This function calculates a lomb scargle transformation
:param n: is the array that contains the NN-inetrvals
:return: the result of the lomb scargle transformation
=#
function lomb_scargle(n)
    t=cumsum(n).-n[1]
    t=t./1000
    plan=LombScargle.plan(t,n,normalization=:psd,minimum_frequency=0.003,maximum_frequency=0.4)
    return LombScargle.lombscargle(plan)
end # lomb_scargle

#=
This function calculates the power of a frequency band between two given frequencys
:param freq: The frequency of a lomb scargle transformation
:param power: The power of a lomb scargle transformation
:param min: The minimum value of the frequency band to be calculated
:param max: The maximum value of the frequency band to be calculated
:return p: The power of the frequency band
=#
function get_power(freq,power,min,max)
    count=1
    index=[]
    for f in freq
        if f>=min && f<max
            push!(index,count)
        end
        count+=1
    end
    p=Trapz.trapz(freq[index[1]:index[end]],power[index[1]:index[end]])
    return p
end # get_power

end # module
