module Geometric

import Plots
import Images

function poincare(n)
    x=[]
    y=[]
    for i in 1:length(n)-1
        push!(x,n[i])
        push!(y,n[i+1])
    end
    p=Plots.scatter(x,y);
    return p;
end # poincare

function recurrence(n,e)
    x=zeros(length(n),length(n))
    for i in 1:length(n)
        for j in i:length(n)
            if sqrt((n[i]-n[j])^2)<=50
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
