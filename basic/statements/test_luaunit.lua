local luaunit = require("luaunit")
local main = require("main")

TestResult = {}

function TestResult:testSumWithFor()
    luaunit.assertEquals(main.sumWithFor(1, 10), 55)
    luaunit.assertEquals(main.sumWithFor(1, 100), 5050)
end

function TestResult:testSumWithForAndStep()
    luaunit.assertEquals(main.sumWithForAndStep(1, 10, 2), 25)
    luaunit.assertEquals(main.sumWithForAndStep(2, 10, 3), 15)
end

TestPairs = {}

function TestPairs:testTablePairs()
    local table = { a = 1, b = 2, c = 3 }
    local expected = { a = 1, b = 2, c = 3 }
    luaunit.assertEquals(main.getTablePairs(table), expected)
end

os.exit(luaunit.LuaUnit.run())
