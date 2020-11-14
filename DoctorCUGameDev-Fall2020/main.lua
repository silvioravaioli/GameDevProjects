gui = require('scripts.gui')
tests = require('scripts.test')

love.graphics.setDefaultFilter("nearest")

function love.load()
	icon = love.graphics.newImage("graphics/redOrb.png")
	sampleTest = Test:new("SAMPLE", "S", 7, "graphics/redOrb.png")
	print(sampleTest)
end

function love.update(dt)

end

function love.draw()
	love.graphics.setBackgroundColor(1,1,1);
	gui.draw()
end
