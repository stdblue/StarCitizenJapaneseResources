###
# global.ini ファイルのバージョン差分を取得します。
# 
#

include("global_args.jl")
include("global_manage.jl")

using global_args
using global_manage
using Printf

init_args(ARGS)

oldfile = ARGS[1]
newfile = ARGS[2]

oldver = make_global_dictionary(ARGS[1])

ini_io = open(newfile, "r")

if isopen(ini_io) == false
    println("Failed to open " * basefile)
    exit()
end

for buff in eachline(ini_io)
    keywords = split(buff, "="; limit=2)
    if length(keywords) < 2
        continue
    end

    if haskey(dictres, keywords[1])
        keyword = keywords[1]
        origintext = keywords[2]
        textline = dictres[keyword]

        if occursin("~", origintext)
            println(buff)
        else
            println("$keyword=$textline")
        end
    else
        println("NEW KEY STRING : $buff")
    end
end

close(ini_io)

exit
