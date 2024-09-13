local M = {}

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

function M.getTablePairs(table)
    local result = {}
    for key, value in pairs(table) do
        result[key] = value
    end
    return result
end

return M
