module TimeDomain
    using Statistics

    function nn_diff(n)
        diff=[]
        i=1
        while i<length(n)
            push!(diff,abs(n[i+1]-n[i]))
            i+=1
        end
        return diff
    end

    function sdnn(n)
        return std(n)
    end

    function sdann(n)
    end

    function rmssd(diff)
        return sqrt(mean(diff.^2))
    end

    function sdsd(diff)
        return std(diff)
    end

    function pnn(diff,x)
        return nn(diff,x)/(length(diff)+1)*100
    end

    function nn(diff,x)
        count=0
        for d in diff
            if d>x
                count+=1
            end
        end
        return count
    end

    function mean_nn(n)
        return mean(n)
    end

end
