module TimeDomain

import Statistics

#=
This function calculates the differences between the NN intervals
:param n: is the array that contains the NN-inetrvals
:return diff: is an array containing the differences
=#
function nn_diff(n)
    diff=[]
    i=1
    while i<length(n)
        push!(diff,abs(n[i+1]-n[i]))
        i+=1
    end
    return diff
end #nn_diff

#=
This function calculates the standard deviation of the NN intervals
:param n: is the array that contains the NN-inetrvals
:return: the standard deviation
=#
function sdnn(n)
    return Statistics.std(n)
end # sdnn

#=
This function calculates the root mean square of successive differences
:param diff: is the array containing the differences between the NN intervals
:return: the rmssd
=#
function rmssd(diff)
    return sqrt(Statistics.mean(diff.^2))
end # rmssd

#=
This function calculates the standard deviation of successive differences
:param diff: is the array containing the differences between the NN intervals
:return: the sdsd
=#
function sdsd(diff)
    return Statistics.std(diff)
end # sdsd

#=
This function calculates the percentage of successive NN intervals,
with an interval smaller than x ms
:param diff: is the array containing the differences between the NN intervals
:param x: is the number of miliseconds the intervals may differ
:return: the percentage of successive intervals with a difference < x ms
=#
function pnn(diff,x)
    return nn(diff,x)/(length(diff)+1)*100
end # pnn

#=
This function calculates the number of successive NN intervals,
with an interval smaller than x ms
:param diff: is the array containing the differences between the NN intervals
:param x: is the number of miliseconds the intervals may differ
:return: the number of successive intervals with a difference < x ms
=#
function nn(diff,x)
    count=0
    for d in diff
        if d>x
            count+=1
        end
    end
    return count
end # nn

#=
This function calculates the mean of the NN intervals
:param n: is the array that contains the NN-inetrvals
:return: the mean value
=#
function mean_nn(n)
    return Statistics.mean(n)
end # mean_nn

end # module
