gui = require('scripts.gui')
hospital = require('scripts.hospital')

love.graphics.setDefaultFilter("nearest")

function love.load()
	hospital:load()
	icon = love.graphics.newImage("assets/redOrb.png")
end

function love.update(dt)

end

function love.draw()
	love.graphics.setBackgroundColor(1,1,1);
	gui:draw()
	hospital:draw()
end
