local CDWQPass = {} --So that

local env = {
    CDWQ = {
        start = function(file)
            coroutine.yield("CDWQ", "START", file)
        end,
        save = function(file)
            coroutine.yield("CDWQ", "SAVE", file)
        end,
        off = function()
            coroutine.yield("CDWQ", "OFF")
        end,
        unbind = function()
            coroutine.yield("CDWQ", "UNBIND")
        end
    }
}
setmetatable(env, {__index = _G})
        
local shell = coroutine.create(loadstring("rom/programs/shell", env))

while true do
    local yieldData = {coroutine.resume(shell)}
    if yieldData[1] == "CDWQ
    
