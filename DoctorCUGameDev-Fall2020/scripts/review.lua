util = require('scripts.util')

local review = {}

function review:open()
	page = "REVIEW"
end

function review:draw()
	local x = screenWidth/2 - centerUIWidth/2
	local y = (lowerBound+upperBound)/2 - centerUIWidth/2
	local continueScale = (x/5)/rectangle:getWidth()
	love.graphics.draw(rectangle, x, y, 0, continueScale, continueScale)
	self.continueButton = {x = x, y = y, 
	  width = continueScale * rectangle:getWidth(), height = continueScale * rectangle:getHeight()}
end

function review:mousepressed(x, y)
	if util.withinObj(x, y, self.continueButton) then	
		stage = stage + 1
		loadNewStage(stage)
		page = "MAIN"
	end
end

return review