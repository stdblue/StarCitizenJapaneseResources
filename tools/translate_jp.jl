using HTTP
using JSON3
using Printf

function deepL_translate(value)
    deepLurl = "https://api.deepl.com/v2/translate"
    authKey = "<NEED TO GET YOUR AUTH KEY>"
    
#    params = Dict( "auth_key" => authKey, "source_lang" => "EN", "target_lang" => "JA", "text" => value)
#    res = HTTP.get(deepLurl; require_ssl_verification = false, query = params)
    params = @sprintf("auth_key=%s&source_lang=EN&target_lang=JA&text=%s", authKey, value)
    res = HTTP.request("POST", deepLurl, ["Content-type" => "application/x-www-form-urlencoded"], params)
    if res.status != 200
        println("Invalit result status code : " + res.status)
        return nothing
    end

    result = JSON3.read(String(res.body))
    return result
end

#println(@sprintf("ARGS = %d", length(ARGS)))

for (index, arg) in enumerate(ARGS)
    ini_io = open(arg, "r")

    if isopen(ini_io) == false
        println("Failed to open " * target_file)
        exit()
    end

    for buff in eachline(ini_io)
        keywords = split(buff, "="; limit=2)
        if length(keywords) == 2
            value = replace(keywords[2], "\\n" => "\n")
            res = deepL_translate(value)
            if res !== nothing
                trans = res["translations"][1]
                resurrect = replace(trans["text"], "\n" => "\\n")
                print(keywords[1])
    #            print("\t")
    #            print(keywords[2])
                print("=")
                println(resurrect)
            else
                print(keywords[1])
                print("=")
                println("%TRANSLATION ERROR%")
            end
        else
            print("Failed to match line : " * buff)
        end
        sleep(0.5)
    end

    close(ini_io)
end
