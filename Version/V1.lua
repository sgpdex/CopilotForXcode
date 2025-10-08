--============================--
--      🌟 NgNhDuc Hub 🌟
--============================--
-- Author: NgNhDuc
-- Based on Xeter Hub by TlDinhKhoi
--============================--

local _ENV = (getgenv and getgenv()) or getrenv() or getfenv()

local CURRENT_VERSION = _ENV.Version or "V1"
local Versions = {
    V1 = "https://raw.githubusercontent.com/sgpdex/NgNhDuc/main/Version/V1.lua"
}

local url = Versions[CURRENT_VERSION]
if not url then
    warn("[NgNhDuc Hub] Phiên bản không hợp lệ: " .. tostring(CURRENT_VERSION))
    return
end

print("[NgNhDuc Hub] Đang tải phiên bản: " .. CURRENT_VERSION .. " ...")

local ok, src = pcall(function()
    return game:HttpGet(url)
end)

if not ok then
    warn("[NgNhDuc Hub] Không thể tải URL: " .. tostring(src))
    return
end

local success, err = pcall(loadstring(src))
if not success then
    warn("[NgNhDuc Hub] Lỗi khi chạy script V1: " .. tostring(err))
else
    print("[✅] NgNhDuc Hub đã khởi động thành công!")
end
