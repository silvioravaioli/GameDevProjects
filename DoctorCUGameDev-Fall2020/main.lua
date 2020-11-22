gui = require('scripts.gui')
tests = require('scripts.test')
hospital = require('scripts.hospital')
patients = require('scripts.patients')
manual = require('scripts.manual')

love.graphics.setDefaultFilter("nearest")

function love.load()
	page = "MAIN"

	-- load image assets
	square = love.graphics.newImage("assets/bluesquare.png")
	rectangle = love.graphics.newImage("assets/bluerectangle.png")
	centerRect = love.graphics.newImage("assets/testMenu.png")

	-- drawing the UI elements
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()
	screenOffsetFactor = 0.01
	topBarHeight = 0.07 * screenHeight
	bottomBarHeight = 0.15 * screenHeight

	centerUIWidth = 0.3 * screenWidth
	centerUIHeight = centerRect:getHeight()/centerRect:getWidth() * centerUIWidth

	numberOfTests = 6
	manual:setup()
	
	lineWidth = 5
	love.graphics.setLineWidth(lineWidth)

	love.graphics.setBackgroundColor(1,1,1);
	defaultFontSize = 30
	font = setFont(defaultFontSize)
	textHeight = font:getHeight()

	currentPatient = {}

	-- level data
	stage = 99
	testsAvailable = 10
	maxTests = 10
	level = 1
	experience = 0
	maxExperience = 5

	-- patients
	numPatients = 6
	hospital:load(level)

end

function love.update(dt)

end

function love.draw()
	-- gui:draw()
	-- hospital:draw()
	
	-- manual:draw()
	-- patients:draw({ name="Bob Ross", bio="Likes to paint", exp= 1, photo=love.graphics.newImage("assets/greenOrb.png"),symptoms={{1, 50},{2, 100}},})
	gui:draw()
	if page == "MAIN" then
		hospital:draw()
	elseif page == "TEST" then
		patients.draw()
	end
end


function love.mousepressed(x, y, button, isTouch)
	hospital:mousepressed(x, y)
	--manual:mousepressed(x,y)
end

function setFont(size)
	font = love.graphics.newFont("assets/nokiafc22.ttf", size)
	love.graphics.setFont(font)
	return font
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