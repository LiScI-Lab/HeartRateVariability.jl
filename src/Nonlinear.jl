module Nonlinear

import StatsBase
import Statistics

#=
This function calculates the approximate entropy
:param n: the array that contains the NN-inetrvals
:param m: the embedding dimension, default=2
:param r: the tolerance, default=6
:return: the approximate entropy
=#
function apen(n,m,r)
    c1=get_apen_dist(n,m,r)
    c2=get_apen_dist(n,m+1,r)
    return log(c1/c2)
end # apen

#=
This function calculates the sample entropy
:param n: the array that contains the NN-inetrvals
:param m: the embedding dimension, default=2
:param r: the tolerance, default=6
:return: the sample entropy
=#
function sampen(n,m,r)
    c1=get_sampen_dist(n,m,r,1)
    c2=get_sampen_dist(n,m+1,r,0)
    return -log(c2/c1)
end # sampen

#=
This function creates a template of a given array over an embedding dimension
:param n: the array that contains the NN-inetrvals
:param m: the embedding dimension, default=2
:return template: the created template
=#
function get_template(n,m)
    template=[]
    for i in 1:length(n)-m+1
        push!(template,n[i:i+m-1])
    end
    return template
end # get_template

#=
This function calculates the distances for the approximate entropy
:param n: the array that contains the NN-inetrvals
:param m: the embedding dimension, default=2
:param r: the tolerance, default=6
:return: the distance for the approximate entropy
=#
function get_apen_dist(n,m,r)
    template=get_template(n,m)
    count=zeros(length(template))
    for i in 1:length(template)
        for j in i+1:length(template)
            if maximum(abs.(template[i].-template[j]))<=r
                count[i]+=1
                count[j]+=1
            end
        end
    end
    return sum(count./(length(n)-m+1))/(length(n)-m+1)
end # get_apen_dist

#=
This function calculates the distances for the sample entropy
:param n: the array that contains the NN-inetrvals
:param m: the embedding dimension, default=2
:param r: the tolerance, default=6
:param l: a value to limit the for-loops
:return: the distance for the sample entropy
=#
function get_sampen_dist(n,m,r,l)
    template=get_template(n,m)
    counts=[]
    count=0
    for i in 1:length(template)-l
        for j in 1:length(template)-l
            if maximum(abs.(template[i].-template[j]))>=r || i==j
                push!(counts,count)
                count=0
            else
                count+=1
            end
        end
    end
    return sum(counts)
end # get_sampen_dist

#=
This function calculates the renyi entropy of a given order
:param n: the array that contains the NN-inetrvals
:param a: the order of the renyi entropy
:return: the calculated renyi entropy
=#
function renyi(n,a)
    return StatsBase.renyientropy(n,a)
end # renyi

#=
This function calculates the hurst coefficient
It was inspired by the python hurst package by Dmitry A. Mottl (https://github.com/Mottl/hurst)
:param n: the array that contains the NN-inetrvals
:return H: the hurst coefficient
=#
function hurst(n)
    ws=Array(range(log10(10),stop=log10(length(n)),step=0.25))
    window=[]
    for x in ws
        push!(window,round(Int64,exp10(x),RoundDown))
    end
    if !(length(n) in window)
        push!(window,length(n))
        push!(ws,log10(length(n)))
    end
    RS=[]
    for w in window
        rs=[]
        for start in (range(0,stop=length(n),step=w))
            if (start+w)>length(n)
                break
            end
            RS_part= get_rs(n[start+1:start+w])
            if RS_part != 0
                push!(rs,RS_part)
            end
        end
        if length(rs)>0
            push!(RS,Statistics.mean(rs))
        end
    end
    A=Array{Float64}([ws ones(length(RS))])
    RSlog=[]
    for r in RS
        push!(RSlog,log10(r))
    end
    B=Array{Float64}(RSlog)
    H,c=A\B
    c=exp10(c)
    return H
end # hurst

#=
This function calculates the rescaled range of a time series
It was inspired by the python hurst package by Dmitry A. Mottl (https://github.com/Mottl/hurst)
:param n: the array that contains the NN-inetrvals
:return: the rescaled range
=#
function get_rs(n)
    incs=n[2:end].-n[1:end-1]
    mean_inc=(n[end]-n[1])/length(incs)
    deviations=incs.-mean_inc
    Z=cumsum(deviations)
    R=maximum(Z)-minimum(Z)
    S=Statistics.std(incs)
    if R==0 || S==0
        return 0
    else
        return R/S
    end
end # get_rs

end # module
