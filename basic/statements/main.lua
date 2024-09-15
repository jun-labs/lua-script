local M = {}

function M.classifyAge(age)
    if age < 0 then
        goto error_label
    end

    if age < 13 then
        return "child"
    elseif age >= 13 and age < 20 then
        return "teenager"
    elseif age >= 20 and age < 65 then
        return "adult"
    else
        return "senior"
    end

    :: error_label ::
    return "Invalid age"
end

function M.getMin(x, y)
    if (x < y) then
        return x
    else
        return y
    end
end

function M.operate(x, y, op)
    if op == "+" then
        return x + y
    elseif op == "-" then
        return x - y
    elseif op == "*" then
        return x * y
    elseif op == "/" then
        return x / y
    else
        error("Invalid operation")
    end
end

function M.repeatUntilNotEmpty()
    local line
    repeat
        line = io.read()
    until line ~= ""
    return line
end

function M.repeatUntilNotEmptyControlStructures()
    local line
    :: repeat_start ::
    repeat
        line = io.read()
    until line ~= ""
    return line
end

function sumWithWhile(start, _end)
    local sum = 0
    while (start <= _end) do
        sum = sum + start
        start = start + 1
    end
    return sum
end

function M.sumWithWhileControlStructures(start, _end)
    local sum = 0
    :: while_loop_start ::
    while (start <= _end) do
        sum = sum + start
        start = start + 1
    end
    return sum
end

function M.sumWithFor(start, _end)
    local sum = 0
    for number = start, _end do
        sum = sum + number
    end
    return sum
end

function M.sumWithForAndStep(start, _end, step)
    local sum = 0
    for number = start, _end, step do
        sum = sum + number
    end
    return sum
end

function M.copyTable(table)
    local result = {}
    for key, value in pairs(table) do
        result[key] = value
    end
    return result
end

function M.getType(value)
    return type(value)
end

return M
