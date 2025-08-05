###

include("global_manage.jl")

using Printf
using .global_manage

basefile = ARGS[1]

resources = length(ARGS) - 1
#println("Resource files $resources")

dictres = Dict{String, String}();

for i=2:length(ARGS)
    dictfile = make_global_dictionary(ARGS[i])
    dictcount = length(dictfile)

#    println("Resource values $dictcount")
    merge!(dictres, dictfile)
end

count = length(dictres)
#println("Dictinary reserved $count")

ini_io = open(basefile, "r")

if isopen(ini_io) == false
    println("Failed to open " * basefile)
    exit()
end

re = r"\~(\w+)\(\w+\)"

with_no = 0
linecnt = 0
for buff in eachline(ini_io)
    # BOM 対応
    if occursin(r"^\uFEFF", buff)
        buff = replace(buff, r"^\uFEFF" => "")
    end

    global linecnt += 1
    keywords = split(buff, "="; limit=2)
#    println("Split count : %d", length(keywords))
    if length(keywords) == 2 && haskey(dictres, keywords[1])
        keyword = keywords[1]
        origintext = keywords[2]
        textline = dictres[keyword]

#        if occursin("~", origintext)
#            println(buff)
#        else
            if with_no == 1
                println("$keyword=__ $linecnt __ $textline")
            else
                println("$keyword=$textline")
            end
#        end
    else
#        println("Keyword [ %s ] not matched.", keywords[1] )
        println(buff)
    end
end

close(ini_io)
