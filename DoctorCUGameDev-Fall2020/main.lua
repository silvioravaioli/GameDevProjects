gui = require('scripts.gui')
tests = require('scripts.test')
hospital = require('scripts.hospital')

love.graphics.setDefaultFilter("nearest")

function love.load()
	icon = love.graphics.newImage("graphics/redOrb.png")
	sampleTest = Test:new("SAMPLE", "S", 7, "graphics/redOrb.png")
	print(sampleTest)
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
