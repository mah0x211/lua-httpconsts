--[[
  
  Copyright (C) 2014 Masatoshi Teruya
 
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.


  lib/method.lua
  lua-httpconsts
  
  Created by Masatoshi Teruya on 14/11/06.

--]]

local METHOD = {
    OPTIONS = 'OPTIONS',
    GET     = 'GET',
    HEAD    = 'HEAD',
    POST    = 'POST',
    PUT     = 'PUT',
    DELETE  = 'DELETE',
    TRACE   = 'TRACE',
    CONNECT = 'CONNECT',
    PATCH   = 'PATCH'
};

local function noNewIndex()
    error('attempt to add new index');
end

local function getIndex( _, name )
    return METHOD[name];
end

local CONSTANTS = setmetatable({},{
    __metatable = true,
    __newindex = noNewIndex,
    __index = getIndex
});

local function export( tbl )
    for k, v in pairs( METHOD ) do
        tbl[k] = v;
    end
end

return {
    consts = CONSTANTS,
    export = export
};
