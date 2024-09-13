
<br/>

<div align="center">

<img src="./images/lua.png" width="150" height="150" alt="Lua Image">

<br/>
<br/>

Learning Lua

[![Release](https://img.shields.io/badge/-🔵_Lua-blue)](https://www.lua.org/) [![Release](https://img.shields.io/badge/-📚_Documentation-brightgreen)](https://www.lua.org/docs.html) <br/>
[![Release](https://img.shields.io/badge/🎉_Busted-lightblue)](https://github.com/lunarmodules/busted)
[![Release](https://img.shields.io/badge/%E2%9C%A8%20LuaUnit-yellow)](https://www.tutorialspoint.com/lua/index.htm) [![Release](https://img.shields.io/badge/📌_Lua_Style_Guide-gray)](https://github.com/luarocks/lua-style-guide) <br/>
</div>

<br/><br/>

# Install

Before learning Lua, please make sure to correctly install the following modules. (For Mac with AMD chip)

```shell
$ brew install lua                 # Lua
$ brew install luarocks            # LuaRocks
$ luarocks install luaunit         # LuaUnit
$ luarocks install busted          # Busted
$ luarocks install redis-lua       # Redis Lua
```

<br/><br/><br/><br/>

Before running the program, please execute the following Docker Compose command and ensure that the required port 6379
is not already in use to avoid any conflicts.

```yaml
version: "3.8"
services:
  redis:
    image: redis:latest
    ports:
      - "6379:6379"
```

```shell
$ docker-compose up -d
```

<br/><br/><br/><br/>

# Run

To run the tests, navigate to the folder where your test file is located, and then enter the following command.

```shell
$ pwd                                   # 1. Current directory
/lua-script/basic

$ ls                                    # 2. Check directories
chunk    string_library

$ cd string_library                     # 3. Navigate to target directory

$ lua test_luaunit.lua                  # 4. Execute test(luaunit)
......
Ran 6 tests in 0.000 seconds, 
6 successes, 0 failures OK

$ busted test_busted.lua                # 5. Execute test(busted)
●●●●●●●●●●●
11 successes / 0 failures / 0 errors / 0 pending : 0.005014 seconds
```
