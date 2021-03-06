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


  status.lua
  lua-httpconsts
  
  Created by Masatoshi Teruya on 14/11/06.

--]]

local STATUS = {
    -- 1xx infromational
    ['Continue']                            = 100,
    ['Switching Protocols']                 = 101,
    -- WebDAV
    ['Processing']                          = 102,  -- WebDAV; RFC 2518
    -- /WebDAV
    
    -- 2xx successful
    ['OK']                                  = 200,
    ['Created']                             = 201,
    ['Accepted']                            = 202,
    ['Non-Authoritative Information']       = 203,  -- since HTTP/1.1
    ['No Content']                          = 204,
    ['Reset Content']                       = 205,
    ['Partial Content']                     = 206,
    -- WebDAV
    ['Multi-Status']                        = 207,  -- WebDAV; RFC 4918
    ['Already Reported']                    = 208,  -- WebDAV; RFC 5842
    -- /WebDAV
    ['IM Used']                             = 208,  -- RFC 3229
    
    -- 3xx redirect
    ['Multiple Choices']                    = 300,
    ['Moved Permanently']                   = 301,
    ['Found']                               = 302,
    ['See Other']                           = 303,  -- since HTTP/1.1
    ['Not Modified']                        = 304,
    ['Use Proxy']                           = 305,  -- since HTTP/1.1
    ['Temporary Redirect']                  = 307,  -- since HTTP/1.1
    ['Permanent Redirect']                  = 308,  -- Experimental; RFC 7238
    
    -- 4xx client error
    ['Bad Request']                         = 400,
    ['Unauthorized']                        = 401,
    ['Payment Required']                    = 402,
    ['Forbidden']                           = 403,
    ['Not Found']                           = 404,
    ['Method Not Allowed']                  = 405,
    ['Not Acceptable']                      = 406,
    ['Proxy Authentication Required']       = 407,
    ['Request Timeout']                     = 408,
    ['Conflict']                            = 409,
    ['Gone']                                = 410,
    ['Length Required']                     = 411,
    ['Precondition Failed']                 = 412,
    ['Request Entity Too Large']            = 413,
    ['Request-URI Too Long']                = 414,
    ['Unsupported Media Type']              = 415,
    ['Requested Range Not Satisfiable']     = 416,
    ['Expectation Failed']                  = 417,
    -- WebDAV
    ['Unprocessable Entity']                = 422,  -- WebDAV; RFC 4918
    ['Locked']                              = 423,  -- WebDAV; RFC 4918
    ['Failed Dependency']                   = 424,  -- WebDAV; RFC 4918
    -- /WebDAV
    ['Upgrade Required']                    = 426,  -- RFC 2817
    ['Precondition Required']               = 428,  -- RFC 6585
    ['Too Many Requests']                   = 429,  -- RFC 6585
    ['Request Header Fields Too Large']     = 431,  -- RFC 6585
    ['Unavailable For Legal Reasons']       = 451,  -- Internet draft
    
    -- 5xx server error
    ['Internal Server Error']               = 500,
    ['Not Implemented']                     = 501,
    ['Bad Gateway']                         = 502,
    ['Service Unavailable']                 = 503,
    ['Gateway Timeout']                     = 504,
    ['HTTP Version Not Supported']          = 505,
    ['Variant Also Negotiates']             = 506,  -- RFC 2295
    -- WebDAV
    ['Insufficient Storage']                = 507,  -- WebDAV; RFC 4918
    ['Loop Detected']                       = 508,  -- WebDAV; RFC 5842
    -- /WebDAV
    ['Not Extended']                        = 510,  -- RFC 2774
    ['Network Authentication Required']     = 511,  -- RFC 6585
};
local STATUS_LINE = {};
local STATUS_NAME = {};
local STATUS_CODE = {};
do
    local CONVERSION_TBL = { 
        [' '] = '_', 
        ['-'] = '_'
    };
    
	for k, v in pairs( STATUS ) do
        STATUS_LINE[tostring(v)] = k;
        -- convert
        -- lowercase to uppercase
        -- space and hyphen to underscore
        k = k:upper():gsub( '[- ]', CONVERSION_TBL );
        STATUS_NAME[k] = v;
		STATUS_CODE[tostring(v)] = k;
	end
end

local function noNewIndex()
    error('attempt to add new index');
end

local function getIndex( _, namecode )
    return STATUS_NAME[namecode] or STATUS_CODE[tostring(namecode)];
end

local CONSTANTS = setmetatable({},{
    __metatable = true,
    __newindex = noNewIndex,
    __index = getIndex
});

local function export( tbl )
    for k, v in pairs( STATUS_NAME ) do
        tbl[k] = v;
    end
end

local function toStatusLineName( code )
    return STATUS_LINE[tostring(code)];
end


return {
    consts = CONSTANTS,
    export = export,
    toStatusLineName = toStatusLineName
};
