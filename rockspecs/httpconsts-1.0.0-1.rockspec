package = "httpconsts"
version = "1.0.0-1"
source = {
    url = "git://github.com/mah0x211/lua-httpconsts.git",
    tag = "v1.0.0"
}
description = {
    summary = "HTTP method names and status code constants module",
    homepage = "https://github.com/mah0x211/lua-httpconsts", 
    license = "MIT/X11",
    maintainer = "Masatoshi Teruya"
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {
        httpconsts = "httpconsts.lua",
        ["httpconsts.method"] = "lib/method.lua",
        ["httpconsts.status"] = "lib/status.lua",
    }
}

