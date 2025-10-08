-- Main.lua - NgNhDuc Hub loader
-- Place at: https://raw.githubusercontent.com/<GITHUB_USERNAME>/NgNhDuc/refs/heads/main/Main.lua

local _ENV = (getgenv and getgenv()) or getrenv() or getfenv()
local CURRENT_VERSION = _ENV.Version or "V1"

local Versions = {
    V1 = "https://raw.githubusercontent.com/NgNhDuc/NgNhDuc/refs/heads/main/Version/V1.lua"
}

local url = Versions[CURRENT_VERSION]
if not url then
    warn("[NgNhDuc Hub] Invalid version: " .. tostring(CURRENT_VERSION))
    return
end

print("[NgNhDuc Hub] Loading version:", CURRENT_VERSION)

local ok, src = pcall(function() return game:HttpGet(url) end)
if not ok then
    warn("[NgNhDuc Hub] Failed to download version script:", src)
    return
end

local success, err = pcall(loadstring(src))
if not success then
    warn("[NgNhDuc Hub] Error running version script:", err)
else
    print("[NgNhDuc Hub] Version loaded successfully!")
end
