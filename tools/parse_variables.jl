###

include("global_manage.jl")

using UUIDs
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

line_no = 1
for buff in eachline(ini_io)
    keywords = split(buff, "="; limit=2)
    if length(keywords) == 2 
        keyword = keywords[1]
        origintext = keywords[2]
        if occursin("~", origintext)
            local variables = Dict{String,String}();
            local matchcnt = 0
            local transline = origintext
            for m in eachmatch(re, origintext)
                matchcnt = matchcnt + 1
                varname = m.match
                varrep  = string(uuid4())
                variables[varrep] = varname
                transline = replace(transline, varname=>varrep)
#                println("\t$matchcnt\t$varname\t$(variables[varname])")
            end
            value = replace(transline, "\\n" => "\n")
            res = translate_deepL(value)
#            res = nothing
            if !isnothing(res)
                trans = res["translations"][1]
                resurrect = replace(trans["text"], "\n" => "\\n")
            else
                resurrect = replace(transline, "\n" => "\\n")
            end

            for (var, rep) in variables
#                println("Replace $var to $rep")
                resurrect = replace(resurrect, var=>rep)
            end

            print(keywords[1])
            print("=")
            println("$resurrect")

#            println("$line_no\t$transline")

        end
    else
#        println("$line_no\t$buff")
    end
    global line_no = line_no + 1
end

close(ini_io)

