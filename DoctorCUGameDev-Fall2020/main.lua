gui = require('gui')

love.graphics.setDefaultFilter("nearest")

function love.load()
	icon = love.graphics.newImage("redOrb.png")
end

function love.update(dt)

end

function love.draw()
	love.graphics.setBackgroundColor(1,1,1);
	love.graphics.draw(icon, 50, 50, 0, 1, 1, 0)
	gui.draw()
end
