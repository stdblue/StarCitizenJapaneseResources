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
# println("Dictinary reserved $count")

ini_io = open(basefile, "r")

if isopen(ini_io) == false
    println("Failed to open " * basefile)
    exit()
end

re = r"(\~\w+\([\w+|\|]+\))"

variables = Dict{String,String}();

line_no = 1
for buff in eachline(ini_io)
    keywords = split(buff, "="; limit=2)
    if length(keywords) == 2 
        keyword = keywords[1]
        origintext = keywords[2]
        if occursin("~", origintext)
            local matchcnt = 0
            local transline = origintext
            for m in eachmatch(re, origintext)
                matchcnt = matchcnt + 1
                varname = m.match
                varrep  = rename_variables(varname)
                variables[varrep] = varname
                transline = replace(transline, varname=>varrep)
#                println("\t$matchcnt\t$varname\t$(variables[varname])")
            end

            println("$line_no\t$transline")

        end
    else
#        println("$line_no\t$buff")
    end
    global line_no = line_no + 1
end

close(ini_io)

