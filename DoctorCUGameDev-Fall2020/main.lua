gui = require('scripts.gui')
tests = require('scripts.test')
hospital = require('scripts.hospital')
patients = require('scripts.patients')

love.graphics.setDefaultFilter("nearest")

function love.load()
	-- drawing the UI elements
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()
	screenOffsetFactor = 0.01
	numberOfTests = 6
	-- load all the image assets
	square = love.graphics.newImage("assets/bluesquare.png")
	rectangle = love.graphics.newImage("assets/bluerectangle.png")
	lineWidth = 5
	love.graphics.setLineWidth(lineWidth)

	-- hospital:load()
	love.graphics.setBackgroundColor(1,1,1);
	font = setFont(30)

	textHeight = font:getHeight()

	-- level data
	stage = 99
	testsAvailable = 10
	maxTests = 10
	level = 99
	experience = 123
	maxExperience = 999

end

function love.update(dt)

end

function love.draw()
	-- gui:draw()
	-- hospital:draw()
	-- patients:draw({name="Bob Ross",bio="Likes to paint"})
	drawTopAndBottomDisplay()
	
end


function love.mousepressed(x, y, button, isTouch)
	hospital:mousepressed(x, y)
end

function setFont(size)
	font = love.graphics.newFont("assets/nokiafc22.ttf", size)
	love.graphics.setFont(font)
	return font
end

function drawTopAndBottomDisplay()
	topBarHeight = 0.07 * screenHeight
	stageBarWidth = 0.1 * screenWidth
	progressBarWidth = 0.4 * screenWidth
	levelBarWidth = 0.12 * screenWidth
	-- expBarWidth is not set because it varies for centering
	testBarWidth = 0.5 * screenWidth
	bottomBarHeight = 0.15 * screenHeight
	topBarStartX = 0.1 * screenWidth

	testBarX = screenWidth * 0.5 - testBarWidth/2
	testBarY = screenHeight * (1 - screenOffsetFactor) - bottomBarHeight

	-- draw bottom UI first
	-- draw the test bar

	testBarXScale = testBarWidth / rectangle:getWidth()
	testBarYScale = bottomBarHeight / rectangle:getHeight()

	setColorWhite()
	love.graphics.draw(rectangle, testBarX, testBarY, 0, testBarXScale, testBarYScale)
	
	-- draw the help and manual buttons
	x1 = testBarX - bottomBarHeight - (screenWidth * screenOffsetFactor)
	x2 = testBarX + testBarWidth + (screenWidth * screenOffsetFactor)

	-- draw outlines for tests
	offset = bottomBarHeight * 0.1
	
	squareWidth = (testBarWidth - offset) / numberOfTests - offset
	squareScale = squareWidth / square:getWidth()
	-- draw tests

	textWidth = font:getWidth("TEST N")

	for i = 1, numberOfTests do
		setColorWhite()
		xpos = testBarX + offset * i + squareWidth * (i - 1)
		ypos = testBarY + (bottomBarHeight - squareWidth)/2
		love.graphics.draw(square, xpos, ypos, 0, squareScale, squareScale)

		-- print the test names
		setColorBlack()
		love.graphics.print("TEST" .. tostring(i),
			xpos+squareWidth/2-textWidth/2,
			ypos+squareWidth/2-textHeight/2,
			0, 1, 1)
	end

	setColorWhite()
	
	scaleX = bottomBarHeight / square:getWidth()
	love.graphics.draw(square, x1, testBarY, 0, scaleX, scaleX)
	love.graphics.draw(square, x2, testBarY, 0, scaleX, scaleX)

	-- Add text to UI
	setColorBlack()
	textWidth = font:getWidth("HELP")
	love.graphics.print("HELP",
		x1 + bottomBarHeight/2 - textWidth/2,
		testBarY + bottomBarHeight/2 - textHeight/2,
		0, 1, 1)

	textWidth = font:getWidth("MANUAL")
	love.graphics.print("MANUAL",
		x2 + bottomBarHeight/2 - textWidth/2,
		testBarY + bottomBarHeight/2 - textHeight/2,
		0, 1, 1)
	
	-- draw top bars: stage, progress, level, experience
	setColorBlue()
	stageBarX = topBarStartX
	love.graphics.rectangle("fill", stageBarX, screenOffsetFactor * screenHeight,
		stageBarWidth, topBarHeight)
	setColorBlack()
	love.graphics.rectangle("line", stageBarX, screenOffsetFactor * screenHeight, 
		stageBarWidth, topBarHeight)

	stageString = "Stage "..tostring(stage)
	textWidth = font:getWidth(stageString)
	love.graphics.print(stageString,
		stageBarX + stageBarWidth/2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)

	-- progress bar
	setColorBlue()
	progressBarX = stageBarX + stageBarWidth + screenOffsetFactor * screenWidth
	love.graphics.rectangle("fill", progressBarX,
		screenOffsetFactor * screenHeight, progressBarWidth,
		topBarHeight)

	setColorBlack()
	love.graphics.rectangle("line", progressBarX,
		screenOffsetFactor * screenHeight, progressBarWidth,
		topBarHeight)

	progressString = "Progress: "..tostring(testsAvailable).."/"..tostring(maxTests).." Tests Available"
	textWidth = font:getWidth(progressString)

	love.graphics.print(progressString, progressBarX + progressBarWidth / 2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 -textHeight/2)

	levelBarX = progressBarX + progressBarWidth + screenOffsetFactor * screenWidth

	setColorBlue()
	love.graphics.rectangle("fill", levelBarX, screenOffsetFactor * screenHeight,
		levelBarWidth, topBarHeight)

	setColorBlack()
	love.graphics.rectangle("line", levelBarX, screenOffsetFactor * screenHeight,
		levelBarWidth, topBarHeight)

	levelString = "Level "..tostring(level)
	textWidth = font:getWidth(levelString)
	love.graphics.print(levelString,
		levelBarX + levelBarWidth/2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)

	expBarX = levelBarX + levelBarWidth + screenOffsetFactor * screenWidth
	expBarWidth = screenWidth - topBarStartX - expBarX
	setColorBlue()
	love.graphics.rectangle("fill", expBarX, screenOffsetFactor * screenHeight,
		expBarWidth, topBarHeight)

	setColorBlack()
	love.graphics.rectangle("line", expBarX, screenOffsetFactor * screenHeight,
		expBarWidth, topBarHeight)

	expString = " EXP: "..tostring(experience).."/"..tostring(maxExperience)
	textWidth = font:getWidth(expString)

	love.graphics.print(expString,
		expBarX + expBarWidth/2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)

end

function setColorBlue()
	love.graphics.setColor(0/255,191/255,255/255)
end

function setColorBlack()
	love.graphics.setColor(0,0,0)
end

function setColorWhite()
	love.graphics.setColor(1,1,1)
end