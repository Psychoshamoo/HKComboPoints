local FRAME_WIDTH = 200
local FRAME_HEIGHT = 40

local frame = CreateFrame("Frame", "HelloKittyComboPointFrame", UIParent)
frame.lastPoints = 0;

for i = 1, 5 do
	local childFrame = CreateFrame("Frame", "HelloKittyComboPoint"..i, frame)
	childFrame:SetWidth(FRAME_HEIGHT)
	childFrame:SetHeight(FRAME_HEIGHT)
	childFrame:SetPoint("TOPLEFT", (i - 1) * FRAME_HEIGHT, 0)

	local background = childFrame:CreateTexture("HelloKittyComboPoint"..i.."Background", "BACKGROUND")
	background:SetTexture(1, 1, 1, 0.25)
	background:SetAllPoints()
	childFrame:Hide()
end

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

frame:SetScript("OnUpdate", function(self, elapsed)
	local cp = GetComboPoints("player", "target")
	if cp ~= self.lastPoints then
		self.lastPoints = cp

		local points = { self:GetChildren() }
		local i = 1;
		for _, child in ipairs(points) do
			if i <= cp then
				child:Show()
			else
				child:Hide()
			end
			i = i + 1
		end
	end
end)

frame:Show()