local luaunit = require("luaunit")

TestStringLibrary = {}

function TestStringLibrary:testLen()
    luaunit.assertEquals(string.len("HELLO"), 5)
end

function TestStringLibrary:testRep()
    luaunit.assertEquals(string.rep("a", 3), "aaa")
end

function TestStringLibrary:testLowerUpper()
    luaunit.assertEquals(string.lower("HELLO"), "hello")
    luaunit.assertEquals(string.upper("lua"), "LUA")
end

function TestStringLibrary:testSub()
    luaunit.assertEquals(string.sub("Lua Programming", 1, 3), "Lua")
    luaunit.assertEquals(string.sub("Lua programming", -11, -1), "programming")
    luaunit.assertEquals(string.sub("[brackets]", 2, -2), "brackets")
end

function TestStringLibrary:testCharAndByte()
    luaunit.assertEquals(string.char(97), "a")
    luaunit.assertEquals(string.byte("abc", 1), 97)
    luaunit.assertEquals(string.byte("abc", -1), 99)
end

function TestStringLibrary:testFormat()
    luaunit.assertEquals(string.format("%.2f", 3.1435), "3.14")
    luaunit.assertEquals(string.format("%02d-%02d-%04d", 5, 11, 1991), "05-11-1991")
    luaunit.assertEquals(string.format("<%s>Hello<%s>", "h1", "/h1"), "<h1>Hello</h1>")
end

os.exit(luaunit.LuaUnit.run())
