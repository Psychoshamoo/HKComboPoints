local FRAME_WIDTH = 200
local FRAME_HEIGHT = 60

local frame = CreateFrame("Frame", "HelloKittyComboPointFrame", UIParent)
frame.lastPoints = 0;

frame:SetWidth(FRAME_WIDTH)
frame:SetHeight(FRAME_HEIGHT)
frame:SetPoint("TOP", UIParent, "CENTER", 0, -150)

--[[
frame:EnableMouse(true)
frame:SetMovable(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

local background = frame:CreateTexture("HelloKittyComboPointFrameBackground", "BACKGROUND")
background:SetTexture(0, 0, 0, 1)
background:SetAllPoints()
]]--

frame:SetScript("OnUpdate", function(lastUpdate)
	local cp = GetComboPoints("player", "target")
	if cp ~= frame.lastPoints then
		frame.lastPoints = cp
		print(cp)
	end
end)

frame:Show()