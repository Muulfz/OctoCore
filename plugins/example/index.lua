---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Muulfz.
--- DateTime: 6/14/2021 9:53 PM
---

local pluginExample = {}

local testVariable = "OnLoad"

function pluginExample.OnLoad()
    testVariable = "OnLoad"
end

function pluginExample.OnStop()
    testVariable = "OnStop"
end

function pluginExample.OnRestart()

    testVariable = "OnRestart"
end


Citizen.CreateThread(function()
    print(testVariable)
end)
return pluginExample;