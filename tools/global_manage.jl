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
        keywords = split(buff, "\t")
        if length(keywords) > 2
            cnt = length(keywords[3])
            if cnt > 0
                println(keywords[1] * "=" * keywords[2])
                heads[keywords[1]] = keywords[2]
            end
        end
    end
    close(ini_io)

    return heads
end

end # module