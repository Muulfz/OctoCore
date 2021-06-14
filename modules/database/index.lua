---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Muulfz.
--- DateTime: 6/14/2021 9:41 PM
---
---

local dump = require("dump");

local API = exports["ghmattimysql"]

local function on_init(cfg)
    -- no init (external connection)
    return API ~= nil
end

local db = {}

function db.execute(query, params, mode)
    local _params = {}
    _params._ = true -- force as dictionary

    local r = async()

    API:execute(query, _params, function(data)
        r(data.affectedRows or 0)
    end)

    return r:wait()
end

return db;