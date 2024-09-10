describe("variables tests", function()
    local main = require("main")

    it("should reference the global variable 'a'", function()
        assert.are.equal(10, _G.a)
    end)

    it("should have the correct number", function()
        assert.are.equal(main.number, 10)
    end)

    it("should have the correct text", function()
        assert.are.equal(main.text, "HELLO WORLD")
    end)

    it("should have a true flag", function()
        assert.is_true(main.flag)
    end)

    it("should have a nil value", function()
        assert.is_nil(main.noValue)
    end)

    it("should have the correct pi value", function()
        assert.are.near(main.pi, 3.14159, 0.00001)
    end)

    for idx, value in ipairs(main.array) do
        it("should have correct array value at index" .. idx, function()
            assert.are.equal(main.array[idx], value)
        end)
    end
end)
