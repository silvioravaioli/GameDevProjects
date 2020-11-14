gui = require('scripts.gui')
tests = require('scripts.test')
hospital = require('scripts.hospital')
patients = require('scripts.patients')

love.graphics.setDefaultFilter("nearest")

function love.load()
	icon = love.graphics.newImage("assets/redOrb.png")
	sampleTest = Test:new("SAMPLE", "S", 7, "assets/redOrb.png")
	print(sampleTest:toString())
	hospital:load()
	icon = love.graphics.newImage("assets/redOrb.png")
end

function love.update(dt)

end

function love.draw()
	love.graphics.setBackgroundColor(1,1,1);
	gui:draw()
	hospital:draw()
	patients:draw({name="Bob Ross",bio="Likes to paint"})
end
