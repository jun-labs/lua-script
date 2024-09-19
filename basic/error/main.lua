local M = {}

local function errorHandler(err)
    return { message = err, code = 400 }
end

function M.divideSafely(x, y)
    if y == 0 then
        return nil, "Division by zero"
    end
    return x / y, nil
end

function M.divideWithAssert(x, y)
    assert(y ~= 0, "Division by zero")
    return x / y
end

function M.divideWithCustomError(x, y)
    if y == 0 then
        error("Division by zero", 2)
    end
    return x / y
end

function M.divideWithPCall(x, y)
    local status, result = pcall(function()
        if y == 0 then
            error("Division by zero")
        end
        return x / y
    end)
    if status then
        return result
    end
    return result
end

function M.divideWithXPCall(x, y)
    local status, result = xpcall(function()
        if y == 0 then
            error("Division by zero")
        end
        return x / y
    end, errorHandler)
    if status then
        return result
    end
    return result
end

function M.divideWithCoroutine(x, y)
    local co = coroutine.create(function()
        if y == 0 then
            coroutine.yield("Division by zero")
        end
        return x / y
    end)

    local status, result = coroutine.resume(co)
    if not status then
        return "Division by zero"
    end
    return result
end

return M
