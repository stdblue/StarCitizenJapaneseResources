###
#
#

using Printf

module global_args

export init_args, show_help, get_file, isdeleted_arg, isnew_arg, isnew_headers_arg, hasdiff_arg, show_arg

# 引数管理構造体
mutable struct Argument

    _args
    _options

    _is_deleted::Bool
    _is_new::Bool
    _is_new_headers::Bool
    _has_diff::Bool

end # Argument

# 内部オブジェクト生成
# 変数初期化
const Arg = Argument([], Dict{String,String}(), false, true, false, true)

# 引数初期化
function init_args(arguments)

#    println("$arguments")
    # 引数のパース
    re = r"^\-+.+"
    for arg in arguments
        m = match(re, arg)
        if isnothing(m)
            # オプション指定ではないので、引数に格納
#            println("Not match")
            push!(Arg._args, arg)
        else
#            println("Option match: $arg")
            # - で始まるものは引数コマンドとして判別
            if occursin("--help", arg) || "-h" == arg
                show_help()
                exit()
            elseif occursin("--deleted", arg) || "-d" == arg
                Arg._is_deleted = true
                Arg._is_new = false
                Arg._is_new_headers = false
                Arg._has_diff = false
            elseif occursin("--diff", arg) || "-f" == arg
                Arg._is_deleted = false
                Arg._is_new = false
                Arg._is_new_headers = false
                Arg._has_diff = true
            elseif occursin("--new-headers", arg) || "-nh" == arg
                Arg._is_deleted = false
                Arg._is_new = false
                Arg._is_new_headers = true
                Arg._has_diff = false
            elseif occursin("--new", arg) || "-n" == arg
                Arg._is_deleted = false
                Arg._is_new = true
                Arg._is_new_headers = false
                Arg._has_diff = false
            end
        end # if
    end # for

    if length(Arg._args) != 2
        show_help()
        exit()
    end # if
end # init_args

#
function get_file(n::Number)
    if n > 0 && n <= length(Arg._args)
        return Arg._args[n]
    end
    return nothing
end # get_file

function show_arg()
    for arg in Arg._args
        println("$arg")
    end # for
end # show_arg

#
function isdeleted_arg()
    return Arg._is_deleted
end # isdeleted_arg

#
function isnew_arg()
    return Arg._is_new
end # isnew_arg

#
function isnew_headers_arg()
    return Arg._is_new_headers
end # isnew_headers_arg

#
function hasdiff_arg()
    return Arg._has_diff
end # hasdiff_arg

# 
function show_help()
    println("Usage : julia diff_global.jl [--deleted] [--new] [--new-headers] [--help] OLD_global.ini NEW_global.ini")
end # show_init

end # module
