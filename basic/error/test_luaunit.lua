local luaunit = require("luaunit")
local main = require("main")

TestDivision = {}

function TestDivision:testDivideSafely()
    local result, err = main.divideSafely(10, 2)
    luaunit.assertEquals(result, 5)
    luaunit.assertIsNil(err)

    result, err = main.divideSafely(10, 0)
    luaunit.assertIsNil(result)
    luaunit.assertEquals(err, "Division by zero")
end

function TestDivision:testDivisionByZeroPCall()
    local result = main.divideWithPCall(10, 2)
    luaunit.assertEquals(result, 5)

    result = main.divideWithPCall(10, 0)
    luaunit.assertStrContains(result, "Division by zero")
end

function TestDivision:testDivisionByZeroAndErrorHandler()
    local result = main.divideWithXPCall(10, 0)
    luaunit.assertStrContains(result.message, "Division by zero")
    luaunit.assertEquals(result.code, 400)
end

function TestDivision:testDivisionWithAssert()
    local result = main.divideWithAssert(10, 2)
    luaunit.assertEquals(result, 5)

    luaunit.assertErrorMsgContains("Division by zero", main.divideWithAssert, 10, 0)
end

function TestDivision:testDivisionWithCoroutine()
    local result = main.divideWithCoroutine(10, 2)
    luaunit.assertEquals(result, 5)

    result = main.divideWithCoroutine(10, 0)
    luaunit.assertStrContains(result, "Division by zero")
end

os.exit(luaunit.LuaUnit.run())
