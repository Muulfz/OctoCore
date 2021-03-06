---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Muulfz.
--- DateTime: 6/14/2021 11:54 PM
---
function table.maxn(t)
    local max = 0
    for k,v in pairs(t) do
        local n = tonumber(k)
        if n and n > max then max = n end
    end

    return max
end


local function wait(self)
    local rets = Citizen.Await(self.p)
    if not rets then
        rets = self.r
    end

    return table.unpack(rets, 1, table.maxn(rets))
end

local function areturn(self, ...)
    self.r = {...}
    self.p:resolve(self.r)
end

-- create an async returner
function async(func)
    print("test")
    if func then
        Citizen.CreateThreadNow(func)
    else
        return setmetatable({ wait = wait, p = promise.new() }, { __call = areturn })
    end
end
