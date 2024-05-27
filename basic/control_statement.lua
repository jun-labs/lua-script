-- 조건문 
local x = 10
if x > 0 then
    print("TRUE")
elseif x < -1 then
    print("FALSE")
else 
    print("?")
end

-- 반복문 
-- while

local i = 1
while i<=10 do
    print(i)
    i = i + 1
end

-- for
for x = 1, 10 do
    print(x)
end

-- repeat
local y = 1
repeat
    print(y)
    y = y + 1
until y > 5
