describe("Lua string library tests", function()
    it("should get the correct string length", function()
        assert.are.equal(string.len("hello"), 5)
    end)

    it("should repeat the string correctly", function()
        assert.are.equal(string.rep("a", 3), "aaa")
    end)

    it("should convert to lower case", function()
        assert.are.equal(string.lower("HELLO"), "hello")
    end)

    it("should convert to upper case", function()
        assert.are.equal(string.upper("hello"), "HELLO")
    end)

    it("should extract substring", function()
        assert.are.equal(string.sub("aaa", 1, 2), "aa")
    end)

    it("should extract substring using negative indices", function()
        assert.are.equal(string.sub("abc", -3, -1), "abc")
    end)

    it("should extract substring using negative indices", function()
        assert.are.equal(string.sub("abc", -1, -3), "")
    end)

    it("should extract only the last character with -1, -1", function()
        assert.are.equal(string.sub("abc", -1, -1), "c")
    end)

    it("should convert character to ASCII and back", function()
        assert.are.equal(string.char(97), "a")
        assert.are.equal(string.byte("abc", 1), 97)
        assert.are.equal(string.byte("abc", -1), 99)
    end)

    it("should format string correctly", function()
        assert.are.equal(string.format("%.2f", 3.14159), "3.14")
    end)

    it("should format date correctly", function()
        local formattedDate = string.format("%02d-%02d-%04d", 5, 11, 1990)
        assert.are.equal(formattedDate, "05-11-1990")
    end)
end)
