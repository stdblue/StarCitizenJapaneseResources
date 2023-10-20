###
# global.ini ファイルのバージョン差分を取得します。
# 
#

include("global_args.jl")
include("global_manage.jl")

using .global_args
using .global_manage
using Printf

init_args(ARGS)

oldfile = get_file(1)
newfile = get_file(2)

# 旧バージョンの global.ini をライブラリに追加
oldver = make_global_dictionary(oldfile)
#println("OLD Resource  : " * string(length(oldver)))

# 新バージョンのファイルをオープン
ini_io = open(newfile, "r")
if isopen(ini_io) == false
    println("Failed to open " * basefile)
    exit()
end

#=
println("Show DIFF  : " * string(hasdiff_arg()))
println("Show NEW   : " * string(isnew_arg()))
println("Show HEADER: " * string(isnew_headers_arg()))
println("Show DEL   : " * string(isdeleted_arg()))
=#

for buff in eachline(ini_io)
    keywords = split(buff, "="; limit=2)
    if length(keywords) < 2
        continue
    end

    keyword = keywords[1]
    origintext = keywords[2]
#    println("$keyword\t$origintext")

    # 既存キーであるかどうかを確認
    if haskey(oldver, keyword)
#        println("$buff")
        # 新規のみ出力が指定されている場合は次へ
        if !hasdiff_arg()
            continue
        end

        # 既存のキーの場合
        textline = oldver[keyword]

        # 内容に変更があるかどうかをチェック
        if origintext != textline
            # 違いがある場合出力
            println("DIFF\t$buff")
        end
    else
        # 差分のみ出力が指定されている場合は次へ
        if !isnew_arg() && !isnew_headers_arg()
            continue
        end

#        println(buff)

        # 新規キーの場合
        if isnew_arg()
            # キー出力指定ならそのまま出力
            println("NEW\t$buff")
        elseif isnew_headers_arg()
            # ヘッダーのみ指定の場合はヘッダーのみ
            println("NEW\t$keyword")
        end
    end
end

close(ini_io)

exit
