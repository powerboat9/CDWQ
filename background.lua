local env = {
    CDWQ = {
        start = function(file)
            return coroutine.yield("CDWQ", "START", file)
        end,
        save = function(file)
            return coroutine.yield("CDWQ", "SAVE", file)
        end,
        off = function()
            return coroutine.yield("CDWQ", "OFF")
        end,
        unbind = function()
            return coroutine.yield("CDWQ", "UNBIND")
        end
    }
}
setmetatable(env, {__index = _G})
        
local shell = coroutine.create(loadstring("rom/programs/shell", env))

local startData = false
local sFuncts = {
    START = function(file)
        if file then
            if not fs.exists(file) then return false end
            local handle = fs.open(file, "r")
            local readData = handle.readAll()
            handle.close()
            startData = textutils.unserialize(readData)
        else
            startData = {}
        end
        return true
    end,
    

local shellFilter = false
local lastData = {}
while true do
    local yieldData = {coroutine.resume(shell, table.unpack(lastData))}
    if yieldData[1] == "CDWQ" then
        if sFuncts[yieldData[3]] then
            lastData = {sFuncts[yieldData[3]]()}
            table.insert("CDWQ_OK", 1)
        else
            lastData = {"CDWQ", "Invalid Function"}
        end
    else
        shellFilter = yieldData[1]
