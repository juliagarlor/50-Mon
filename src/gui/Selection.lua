Selection = Class{}

function Selection:init(def)
self.items = def.items
self.x = def.x
self.y = def.y

self.height = def.height
self.width = def.width
self.font = def.font or gFonts['small']

self.gapHeight = self.height/#self.items

self.currentSelection = 1
self.selection = def.selection
end

function Selection:update(dt)
if love.keyboard.wasPressed('up') then
	if self.currentSelection == 1 then
		self.currentSelection = #self.items
	else
		self.currentSelection = self.currentSelection - 1
	end
	
	gSounds['blip']:stop()
	gSounds['blip']:play()
	
elseif love.keyboard.wasPressed('down') then
	if self.currentSelection == #self.items then
		self.currentSelection = 1
	else
		self.currentSelection = self.currentSelection + 1
	end
	
	gSounds['blip']:stop()
	gSounds['blip']:play()

elseif love.keyboard.wasPressed('return') and self.selection then
	self.items[self.currentSelection].onSelect()
	
	gSounds['blip']:stop()
	gSounds['blip']:play()
end
end

function Selection:render()
local currentY = self.y

for i = 1, #self.items do
	local paddedY = currentY + (self.gapHeight/2) - self.font:getHeight()/2
	
	if i == self.currentSelection and self.selection then
		love.graphics.draw(gTextures['cursor'], self.x - 8, paddedY)
	end
	
	love.graphics.printf(self.items[i].text, self.x, paddedY, self.width, 'center')
	
	currentY = currentY + self.gapHeight
end
end