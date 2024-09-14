local luaunit = require("luaunit")
local main = require("main")

TestMin = {}
function TestMin:testGetMin()
    luaunit.assertEquals(main.getMin(5, 10), 5)
    luaunit.assertEquals(main.getMin(10, 5), 5)
    luaunit.assertEquals(main.getMin(10, 10), 10)
end

TestOperate = {}
function TestOperate:testOperate()
    luaunit.assertEquals(main.operate(5, 3, "+"), 8)
    luaunit.assertEquals(main.operate(5, 3, "-"), 2)
    luaunit.assertEquals(main.operate(5, 3, "*"), 15)
    luaunit.assertEquals(main.operate(6, 3, "/"), 2)
    luaunit.assertError(main.operate, 5, 3, "^")
end

TestResult = {}
function TestResult:testSumWithFor()
    luaunit.assertEquals(main.sumWithFor(1, 10), 55)
    luaunit.assertEquals(main.sumWithFor(1, 100), 5050)
end

function TestResult:testSumWithForAndStep()
    luaunit.assertEquals(main.sumWithForAndStep(1, 10, 2), 25)
    luaunit.assertEquals(main.sumWithForAndStep(2, 10, 3), 15)
end

TestRepeatUntilNotEmpty = {}
function TestRepeatUntilNotEmpty:testRepeatUntilNotEmpty()
    luaunit.assertNotNil(main.repeatUntilNotEmpty)
end

TestPairs = {}
function TestPairs:testTablePairs()
    local table = { a = 1, b = 2, c = 3 }
    local expected = { a = 1, b = 2, c = 3 }
    luaunit.assertEquals(main.copyTable(table), expected)
end

TestTypes = {}
function TestTypes:testType()
    local string = "A"
    luaunit.assertEquals(main.getType(string), "string")

    local _nil = nil
    luaunit.assertEquals(main.getType(_nil), "nil")

    local number = 1
    luaunit.assertEquals(main.getType(number), "number")

    local boolean = true
    luaunit.assertEquals(main.getType(boolean), "boolean")

    local table = {}
    luaunit.assertEquals(main.getType(table), "table")

    local func = function()
    end
    luaunit.assertEquals(main.getType(func), "function")

    local thread = coroutine.create(function()
    end)
    luaunit.assertEquals(main.getType(thread), "thread")
end

os.exit(luaunit.LuaUnit.run())
