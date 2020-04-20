module Input

function read_txt(infile::String)
    a=read(open(infile,"r"),String)
    return parse.(Float64,filter!(e->e!="",split(a,r"[^\d.]")))
end

function read_wfdb(record::String,annotator::String)
    run(pipeline(`ann2rr -r "$record" -a "$annotator" -i s -c`,stdout="temp_rr.txt"))
    a=read_txt("temp_rr.txt")
    run(`rm "temp_rr.txt"`)
    return a*1000
end

end
