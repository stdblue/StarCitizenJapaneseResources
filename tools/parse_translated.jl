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
        keywords = split(buff, "\t")
        num = length(keywords)
        if num > 2
            cnt = length(keywords[3])
            if cnt > 0
                println(keywords[1] * "=" * keywords[2])
#               println(keywords[3] * " [ $cnt ]: " * keywords[1] * "=" * keywords[2])
#               println(keywords[3] * " [ $num ]: $buff")
                heads[keywords[1]] = keywords[2]
            end
        end
    end
    close(ini_io)

    return heads
end

dicts = filter_translated(ARGS[1])

exit
