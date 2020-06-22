module Input

#=
This function reads the data from a txt or csv file.
:param infile: the path of the file
:return: an array with the read data
=#
function read_txt(infile::String)
    a=read(open(infile,"r"),String)
    return parse.(Float64,filter!(e->e!="",split(a,r"[^\d.]")))
end # infile

#=
This function reads the data from a wfdb file.
:param record: the record name
:param annotator: the annotator of the record
:return: an array with the read data
=#
function read_wfdb(record::String,annotator::String)
    temp=string(record,"_temp.txt")
    run(pipeline(`ann2rr -r "$record" -a "$annotator" -i s -c`,stdout="$temp"))
    a=read_txt("$temp")
    run(`rm "$temp"`)
    return a*1000
end # infile

end # module
