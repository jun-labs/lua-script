describe("M module tests", function()
    local main = require("main")

    it("should return the minimum of two values", function()
        assert.are.equal(main.getMin(5, 10), 5)
        assert.are.equal(main.getMin(10, 5), 5)
        assert.are.equal(main.getMin(10, 10), 10)
    end)

    it("should correctly perform arithmetic operations", function()
        assert.are.equal(main.operate(5, 3, "+"), 8)
        assert.are.equal(main.operate(5, 3, "-"), 2)
        assert.are.equal(main.operate(5, 3, "*"), 15)
        assert.are.equal(main.operate(6, 3, "/"), 2)
    end)

    it("should raise error for invalid operations", function()
        assert.has_error(function()
            main.operate(5, 3, "^")
        end, "Invalid operation")
    end)

    it("should repeat input until non-empty", function()
        _G.io = { read = function()
            return "HELLO WORLD"
        end }
        assert.are.equal(main.repeatUntilNotEmpty(), "HELLO WORLD")
    end)

    it("should calculate the sum using while loop", function()
        assert.are.equal(sumWithWhile(1, 10), 55)
    end)

    it("should calculate the sum using for loop", function()
        assert.are.equal(main.sumWithFor(1, 10), 55)
        assert.are.equal(main.sumWithFor(1, 100), 5050)
    end)

    it("should calculate the sum with step using for loop", function()
        assert.are.equal(main.sumWithForAndStep(1, 10, 2), 25)
        assert.are.equal(main.sumWithForAndStep(2, 10, 3), 15)
    end)

    it("should correctly copy the table", function()
        local table = { a = 1, b = 2, c = 3 }
        local expected = { a = 1, b = 2, c = 3 }
        assert.are.same(main.copyTable(table), expected)
    end)

    it("should return the correct type", function()
        assert.are.equal(main.getType("A"), "string")
        assert.are.equal(main.getType(nil), "nil")
        assert.are.equal(main.getType(1), "number")
        assert.are.equal(main.getType(true), "boolean")
        assert.are.equal(main.getType({}), "table")
        assert.are.equal(main.getType(function()
        end), "function")
        assert.are.equal(main.getType(coroutine.create(function()
        end)), "thread")
    end)
end)
