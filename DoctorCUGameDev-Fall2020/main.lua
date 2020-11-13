gui = require('scripts.gui')

love.graphics.setDefaultFilter("nearest")

function love.load()
	icon = love.graphics.newImage("redOrb.png")
end

function love.update(dt)

end

function love.draw()
	love.graphics.setBackgroundColor(1,1,1);
	gui.draw()
end
