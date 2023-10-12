###

using Printf

function read_dictfile(filename)
    heads = Dict{String, String}();
    ini_io = open(filename, "r")

    if isopen(ini_io) == false
        println("Failed to open " * target_file)
        exit()
    end

    for buff in eachline(ini_io)
        keywords = split(buff, "="; limit=2)
        if length(keywords) == 2
#            println(keywords[1])
            heads[keywords[1]] = keywords[2]
        end
    end
    close(ini_io)

    return heads
end

basefile = ARGS[1]

resources = length(ARGS) - 1
#println("Resource files $resources")

dictres = Dict{String, String}();

for i=2:length(ARGS)
    dictfile = read_dictfile(ARGS[i])
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

for buff in eachline(ini_io)
    keywords = split(buff, "="; limit=2)
    if length(keywords) == 2 && haskey(dictres, keywords[1])
        keyword = keywords[1]
        textline = dictres[keyword]
        println("$keyword=$textline")
    else
        println(buff)
    end
end

close(ini_io)

