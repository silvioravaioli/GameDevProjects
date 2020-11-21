gui = require('scripts.gui')
tests = require('scripts.test')
hospital = require('scripts.hospital')
patients = require('scripts.patients')
manual = require('scripts.manual')

love.graphics.setDefaultFilter("nearest")

function love.load()
	-- drawing the UI elements
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()
	screenOffsetFactor = 0.02
	numberOfTests = 6
	manual:setup()
	-- load all the image assets

	-- hospital:load()
	love.graphics.setBackgroundColor(1,1,1);
end

function love.update(dt)

end

function love.draw()
	-- gui:draw()
	-- hospital:draw()
	
	-- manual:draw()
	-- patients:draw({ name="Bob Ross", bio="Likes to paint", exp= 1, photo=love.graphics.newImage("assets/greenOrb.png"),symptoms={{1, 50},{2, 100}},})
	drawTopAndBottomDisplay()

end


function love.mousepressed(x, y, button, isTouch)
	hospital:mousepressed(x, y)
	--manual:mousepressed(x,y)
end


function drawTopAndBottomDisplay()
	-- light blue
	love.graphics.setColor(176/255, 224/255, 230/255)

	topBarHeight = 0.07
	stageBarWidth = 0.15
	progressBarWidth = 0.35
	experienceBarWidth = 0.15
	testBarWidth = 0.5
	bottomBarHeight = 0.15

	testBarX = screenWidth * (0.5 - testBarWidth/2)
	testBarY = screenHeight * (1 - bottomBarHeight -  screenOffsetFactor)

	-- draw bottom UI first
	-- draw the test bar
	bottomHeight = bottomBarHeight * screenHeight
	love.graphics.rectangle("fill", testBarX, testBarY, screenWidth * testBarWidth, bottomHeight)
	-- draw the help and manual buttons
	x1 = testBarX - screenHeight * bottomBarHeight - (screenWidth * screenOffsetFactor)
	x2 = testBarX + screenWidth * testBarWidth + (screenWidth * screenOffsetFactor)
	love.graphics.rectangle("fill", x1, testBarY, bottomHeight, bottomHeight)
	love.graphics.rectangle("fill", x2, testBarY, bottomHeight, bottomHeight)

	-- draw top UI: stage, progress, experience
	love.graphics.rectangle("fill", x1, screenOffsetFactor * screenHeight, 
		stageBarWidth*screenWidth, topBarHeight * screenHeight)
	-- centered progress bar
	love.graphics.rectangle("fill", (0.5 - progressBarWidth/2) * screenWidth,
		screenOffsetFactor * screenHeight, progressBarWidth * screenWidth,
		topBarHeight * screenHeight)

	expBarXEnd = x2 + bottomHeight
	expBarXBegin = expBarXEnd - experienceBarWidth * screenWidth
	love.graphics.rectangle("fill", expBarXBegin, screenOffsetFactor * screenHeight,
		experienceBarWidth * screenWidth, topBarHeight * screenHeight)

	-- draw outlines for tests
	love.graphics.setColor(0,0,0)
	offset = bottomHeight * 0.1
	
	squareWidth = (screenWidth * testBarWidth - offset) / numberOfTests - offset

	for i = 1, numberOfTests do
		xpos = testBarX + offset * i + squareWidth * (i - 1)
		ypos = testBarY + (bottomHeight - squareWidth)/2
		love.graphics.rectangle("line", xpos, ypos, squareWidth, squareWidth)
	end
end