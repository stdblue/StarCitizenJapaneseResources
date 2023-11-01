###

include("global_manage.jl")

using Printf
using .global_manage

basefile = ARGS[1]

ini_io = open(basefile, "r")

if isopen(ini_io) == false
    println("Failed to open " * basefile)
    exit()
end

re = r"\~(\w+)\(\w+\)"

for buff in eachline(ini_io)
    keywords = split(buff, "="; limit=2)
    if length(keywords) == 2
        keyword = keywords[1]
        origintext = keywords[2]

        if occursin("~", origintext)
            println(buff)
        end
    else
        println(buff)
    end
end

close(ini_io)

