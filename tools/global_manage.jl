###
# global.ini ファイルの管理ツール
#

module global_manage

# 翻訳APIに必要なモジュール
using HTTP
using JSON3
using Printf

export make_global_dictionary, rename_variables, translate_deepL

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

function rename_variables(varname)
    varup = replace(uppercase(varname), "~"=>"", "("=>"_", ")"=>"_", "|"=>"_")
end

function translate_deepL(value)

    ### DeepL Free API
    deepLurl = "https://api-free.deepl.com/v2/translate"
    authKey = "<SET YOUR TOKEN>"
    
    ### DeepL Pro API
    #deepLurl = "https://api.deepl.com/v2/translate"
    #authKey = "<SET YOUR TOKEN>"

    #    params = Dict( "auth_key" => authKey, "source_lang" => "EN", "target_lang" => "JA", "text" => value)
#    res = HTTP.get(deepLurl; require_ssl_verification = false, query = params)
    params = @sprintf("auth_key=%s&source_lang=EN&target_lang=JA&text=%s&tag_handling=xml&ignore_tags=x", authKey, value)
    res = HTTP.request("POST", deepLurl, ["Content-type" => "application/x-www-form-urlencoded"], params)
    if res.status != 200
        println("Invalit result status code : " + res.status)
        return nothing
    end

    result = JSON3.read(String(res.body))
    return result
end

end # module