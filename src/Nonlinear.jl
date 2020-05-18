module Nonlinear

using StatsBase

function apen(n,m,r)
    c1=get_apen_dist(n,m,r)
    c2=get_apen_dist(n,m+1,r)
    return log(c1/c2)
end

function sampen(n,m,r)
    c1=get_sampen_dist(n,m,r,0)
    c2=get_sampen_dist(n,m+1,r,1)
    return -log(c2/c1)
end

function get_template(n,m)
    template=[]
    i=1
    while i<=length(n)-m+1
        push!(template,n[i:i+m-1])
        i+=1
    end
    return template
end

function get_apen_dist(n,m,r)
    template=get_template(n,m)
    count=zeros(length(template))
    idx=1
    for p in template
        j=idx+1
        while j<=length(template)
            if maximum(abs.(p.-template[j]))<=r
                count[idx]+=1
                count[j]+=1
            end
            j+=1
        end
        idx+=1
    end
    return sum(count./(length(n)-m+1))/(length(n)-m+1)
end

function get_sampen_dist(n,m,r,l)
    template=get_template(n,m)
    counts=[]
    count=0
    i=1
    while i<length(template)+l
        j=1
        while j<length(template)+l
            if maximum(abs.(template[i].-template[j]))>=r || i==j
                push!(counts,count)
                count=0
            else
                count+=1
            end
            j+=1
        end
        i+=1
    end
    return sum(counts)
end

function renyi(n,a)
    return renyientropy(n,a)
end # renyi

end
