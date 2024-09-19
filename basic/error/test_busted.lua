describe("Error module tests", function()
    local M = require("main")

    it("should divide safely without error", function()
        local result, err = M.divideSafely(10, 2)
        assert.are.equal(result, 5)
        assert.is_nil(err)
    end)

    it("should handle division by zero safely", function()
        local result, err = M.divideSafely(10, 0)
        assert.is_nil(result)
        assert.are.equal(err, "Division by zero")
    end)

    it("should divide using assert", function()
        local result = M.divideWithAssert(10, 2)
        assert.are.equal(result, 5)
    end)

    it("should raise error on division by zero with assert", function()
        assert.has_error(function()
            M.divideWithAssert(10, 0)
        end, "Division by zero")
    end)

    it("should divide with pcall successfully", function()
        local result = M.divideWithPCall(10, 2)
        assert.are.equal(result, 5)
    end)

    it("should catch division by zero with pcall", function()
        local result = M.divideWithPCall(10, 0)
        assert.are.equal(result:match("Division by zero"), "Division by zero")
    end)

    it("should divide with xpcall successfully", function()
        local result = M.divideWithXPCall(10, 2)
        assert.are.equal(result, 5)
    end)

    it("should handle division by zero with custom error handler in xpcall", function()
        local result = M.divideWithXPCall(10, 0)
        assert.are.equal(result.message:match("Division by zero"), "Division by zero")
        assert.are.equal(result.code, 400)
    end)

    it("should divide with coroutine successfully", function()
        local result = M.divideWithCoroutine(10, 2)
        assert.are.equal(result, 5)
    end)

    it("should handle division by zero with coroutine", function()
        local result = M.divideWithCoroutine(10, 0)
        assert.are.equal(result, "Division by zero")
    end)
end)
