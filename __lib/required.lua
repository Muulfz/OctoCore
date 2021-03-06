---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Muulfz.
--- DateTime: 6/14/2021 9:49 PM
---
local currentResource = GetCurrentResourceName()

package = {}

package.loaded = {
    string = string,
    debug = debug,
    package = package,
    _G = _G,
    io = io,
    os = os,
    table = table,
    math = math,
    coroutine = coroutine,
}

package.config = [[
\
;
?
!
-
]]

loadfile = function(name)

    local code = LoadResourceFile(currentResource, name)

    if code == nil then
        return nil
    else
        return load(code)
    end

end

function require(name)
    return require_internal("__lib/", name)
end

function require_internal(folder, name, fileName)
    if package.loaded[name] ~= nil then
        return package.loaded[name]
    end

    local code = LoadResourceFile(currentResource, folder .. name)               -- folder/foo.bar

    if code == nil then
        code = LoadResourceFile(currentResource, folder .. name .. '.lua')         -- folder/foo.bar.lua
    end

    if code == nil then

        local path = string.gsub(name, '[\\.]', '/')
        code = LoadResourceFile(currentResource, folder .. path)             -- folder/foo/bar

        if code == nil and fileName then
            code = LoadResourceFile(currentResource, folder .. path .. '/' .. fileName )
        end

        if code == nil then
            code = LoadResourceFile(currentResource, folder .. path .. '/init.lua')  -- folder/foo/bar/init.lua
        end

        if code == nil then
            code = LoadResourceFile(currentResource, folder .. path .. '.lua')       -- folder/foo/bar.lua
        end

    end

    if code == nil then
        error('Module ' .. name .. ' not found')
        return nil
    end

    local stub = 'local __STUB = function(...)' .. "\n" .. code .. "\n" .. 'end' .. "\n" .. 'return __STUB(\'' .. name .. '\')'

    package.loaded[name] = load(stub)()

    return package.loaded[name]
end

function requirePlugin(name, filename)
    return require_internal("plugins/", name, filename)
end

function requireModule(name, fileName)
    return require_internal("modules/", name, fileName)
end