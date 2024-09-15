local redis = require("redis")
local M = {}

function M.create_client()
    local host = "127.0.0.1"
    local port = 6379
    local client, err = redis.connect(host, port)
    if not client then
        error("Failed to connect to Redis: " .. tostring(err))
    end
    return client
end

-- String
function M.set_string(client, key, value)
    client:set(key, value)
end

function M.get_string(client, key)
    return client:get(key)
end

-- Hash
function M.set_hash(client, key, field, value)
    client:hset(key, field, value)
end

function M.get_hash(client, key, field)
    return client:hget(key, field)
end

function M.get_all_hash(client, key)
    return client:hgetall(key)
end

-- List
function M.push_list(client, key, value)
    client:rpush(key, value)
end

function M.push_list_left(client, key, value)
    client:lpush(key, value)
end

function M.get_list(client, key)
    return client:lrange(key, 0, -1)
end

function M.pop_list_left(client, key)
    return client:lpop(key)
end

function M.pop_list_right(client, key)
    return client:rpop(key)
end

-- Set
function M.add_set(client, key, value)
    client:sadd(key, value)
end

function M.get_set(client, key)
    return client:smembers(key)
end

function M.is_member_of_set(client, key, value)
    return client:sismember(key, value)
end

function M.remove_from_set(client, key, value)
    return client:srem(key, value)
end

-- Sorted Set
function M.add_sorted_set(client, key, score, value)
    client:zadd(key, score, value)
end

function M.get_sorted_set(client, key)
    return client:zrange(key, 0, -1, "WITHSCORES")
end

function M.get_sorted_set_within_range(client, key, min_score, max_score)
    return client:zrangebyscore(key, min_score, max_score, "WITHSCORES")
end

-- Bitmap
function M.set_bit(client, key, offset, value)
    client:setbit(key, offset, value)
end

function M.get_bit(client, key, offset)
    return client:getbit(key, offset)
end

function M.count_bits(client, key, start_index, end_index)
    local script = "return redis.call('bitcount', KEYS[1], ARGV[1], ARGV[2])"
    return client:eval(script, 1, key, start_index, end_index)
end

function M.bitfield_operations(client, key, ...)
    local script = "return redis.call('bitfield', KEYS[1], unpack(ARGV))"
    return client:eval(script, 1, key, ...)
end

return M
