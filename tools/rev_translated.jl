###

using Printf

function filter_translated(filename)
    heads = Dict{String, String}();
    ini_io = open(filename, "r")

    if isopen(ini_io) == false
        println("Failed to open " * target_file)
        exit()
    end

    for buff in eachline(ini_io)
        if occursin("=", buff)
            buff = replace(buff, "="=>"\t", count=1)
            println(buff)
        end
    end
    close(ini_io)

    return heads
end

dicts = filter_translated(ARGS[1])

exit
