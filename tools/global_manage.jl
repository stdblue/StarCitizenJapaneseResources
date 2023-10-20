###
# global.ini ファイルの管理ツール
#

module global_manage

export make_global_dictionary

function make_global_dictionary(filename)
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

end # module