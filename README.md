# lua-httpconsts

HTTP method names and status code constants module.

## Installation

```sh
luarocks install --from=http://mah0x211.github.io/rocks/ httpconsts
```

or 

```sh
git clone https://github.com/mah0x211/lua-httpconsts.git
cd lua-httpconsts
luarocks make
```

## HTTP Method Module

**Supported Method Names**

- OPTIONS
- GET
- HEAD
- POST
- PUT
- DELETE
- TRACE
- CONNECT
- PATCH

**Usage**
```
local Method = require('httpconsts.method');

print( Method.consts.GET ); -- 'GET'
print( Method.consts.get ); -- 'GET'

-- export uppercase method name to global table
Method.export( _G );
print( GET ); -- 'GET'
print( get ); -- nil
```

## HTTP Status Module

**Supported HTTP Status Code**

- 100 CONTINUE
- 101 SWITCHING_PROTOCOLS
- 102 PROCESSING
- 200 OK
- 201 CREATED
- 202 ACCEPTED
- 203 NON_AUTHORITATIVE_INFORMATION
- 204 NO_CONTENT
- 205 RESET_CONTENT
- 206 PARTIAL_CONTENT
- 207 MULTI_STATUS
- 208 IM_USED
- 208 ALREADY_REPORTED
- 300 MULTIPLE_CHOICES
- 301 MOVED_PERMANENTLY
- 302 FOUND
- 303 SEE_OTHER
- 304 NOT_MODIFIED
- 305 USE_PROXY
- 307 TEMPORARY_REDIRECT
- 308 PERMANENT_REDIRECT
- 400 BAD_REQUEST
- 401 UNAUTHORIZED
- 402 PAYMENT_REQUIRED
- 403 FORBIDDEN
- 404 NOT_FOUND
- 405 METHOD_NOT_ALLOWED
- 406 NOT_ACCEPTABLE
- 407 PROXY_AUTHENTICATION_REQUIRED
- 408 REQUEST_TIMEOUT
- 409 CONFLICT
- 410 GONE
- 411 LENGTH_REQUIRED
- 412 PRECONDITION_FAILED
- 413 REQUEST_ENTITY_TOO_LARGE
- 414 REQUEST_URI_TOO_LONG
- 415 UNSUPPORTED_MEDIA_TYPE
- 416 REQUESTED_RANGE_NOT_SATISFIABLE
- 417 EXPECTATION_FAILED
- 422 UNPROCESSABLE_ENTITY
- 423 LOCKED
- 424 FAILED_DEPENDENCY
- 426 UPGRADE_REQUIRED
- 428 PRECONDITION_REQUIRED
- 429 TOO_MANY_REQUESTS
- 431 REQUEST_HEADER_FIELDS_TOO_LARGE
- 451 UNAVAILABLE_FOR_LEGAL_REASONS
- 500 INTERNAL_SERVER_ERROR
- 501 NOT_IMPLEMENTED
- 502 BAD_GATEWAY
- 503 SERVICE_UNAVAILABLE
- 504 GATEWAY_TIMEOUT
- 505 HTTP_VERSION_NOT_SUPPORTED
- 506 VARIANT_ALSO_NEGOTIATES
- 507 INSUFFICIENT_STORAGE
- 508 LOOP_DETECTED
- 510 NOT_EXTENDED
- 511 NETWORK_AUTHENTICATION_REQUIRED

**Usage**

```
local Status = require('httpconsts.status');

print( Status.consts.OK ); -- 200
print( Status.consts[200] ); -- 'OK'

-- export status name to global table
Status.export( _G );
print( OK ); -- 200
```

### toStatusLineName( statusCode )

returns a status line string correspond to the status code.

**Parameters**
- statusCode: status code number

**Returns**
1. string or nil

**Usage **
```
local Status = require('httpconsts.status');
print( Status.toStatusLineName( 414 ) ); -- 'Request-URI Too Long'
```

## Utility Function

`httpconsts.export` function can export both of method-names and status-code.

**Usage**
```
local HttpConsts = require('httpconsts');
HttpConsts.export( _G );

print( GET ); -- 'GET'
print( OK ); -- 200
```

