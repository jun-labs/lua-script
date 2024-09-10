local luaunit = require("luaunit")
local main = require("main")

TestVariables = {}

function TestVariables:testNumber()
    luaunit.assertEquals(main.number, 10)
end

function TestVariables:testText()
    luaunit.assertEquals(main.text, "HELLO WORLD")
end

function TestVariables:testBoolean()
    luaunit.assertTrue(main.flag)
end

function TestVariables:testNilValue()
    luaunit.assertIsNil(main.noValue)
end

function TestVariables:testPiValue()
    luaunit.assertEquals(main.pi, 3.141592)
end

function TestVariables:testTable()
    luaunit.assertEquals(main.person.name, "John")
    luaunit.assertEquals(main.person.age, 30)
end

function TestVariables:testArray()
    for i, value in ipairs(main.array) do
        luaunit.assertEquals(main.array[i], value)
    end
end

os.exit(luaunit.LuaUnit.run())
