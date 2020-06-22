module Geometric

import Plots
import Images

#=
This function creates a Poincaré plot
:param n: is the array that contains the NN-inetrvals
:return: a plot object
=#
function poincare(n)
    x=[]
    y=[]
    for i in 1:length(n)-1
        push!(x,n[i])
        push!(y,n[i+1])
    end
    p=Plots.scatter(x,y,xlabel="RRn",ylabel="RRn+1",legend=false);
    return p;
end # poincare

#=
This function creates a recurrence plot
:param n: is the array that contains the NN-inetrvals
:param e: the maximum distance between two intervals, default="mean" == the mean value of succsessive differences
:return: a plot object
=#
function recurrence(n,e)
    if e=="mean"
        diff=[]
        for i in 1:length(n)-1
            push!(diff,abs(n[i+1]-n[i]))
        end
        e=sum(diff)/length(diff)
    end
    x=zeros(length(n),length(n))
    for i in 1:length(n)
        for j in i:length(n)
            if sqrt((n[i]-n[j])^2)<=e
                x[i,j]=1
                x[j,i]=1
            end
        end
    end
    img=Images.Gray.(x)
    r=Plots.plot(img);
    return r;
end # recurrence

end # module
