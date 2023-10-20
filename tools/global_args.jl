###
#
#

module global_args

export init_args

# 引数管理構造体
struct Argument

    _args = []
    _options = Dict{String, String}();

end # Argument

# 
function init_args(arguments::String[])
    # 引数のパース
    re = r"^\-*(\w+)"
    for arg in arguments
        m = match(re, arg)
        if isnothing(m)
        else
        end # if
    end # for
end # init_args

# 
function show_init()
end # show_init

end # module
