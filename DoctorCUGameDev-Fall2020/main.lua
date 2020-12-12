-- main.lua -- MAIN FILE

-- load other scripts in th efolder
gui = require('scripts.gui')
test = require('scripts.test')
hospital = require('scripts.hospital')
patients = require('scripts.patients')
patientData = require('scripts.patientData')
manual = require('scripts.manual')
diseases = require('scripts.diseases')
symptoms = require('scripts.symptoms')
treatments = require('scripts.treatments')
stages = require('scripts.stages')

-- set filter 
love.graphics.setDefaultFilter("nearest")



-- FUNCTION LOAD
function love.load()
	page = "MAIN"

	-- load basic assets
	square 		= love.graphics.newImage("assets/bluesquare.png")

	squareBlue 	= love.graphics.newImage("assets/bluesquare.png")
	squareRed 	= love.graphics.newImage("assets/redsquare.png")
	squareYellow= love.graphics.newImage("assets/yellowsquare.png")
	squareGreen = love.graphics.newImage("assets/greensquare.png")

	rectangle 	= love.graphics.newImage("assets/bluerectangle.png")
	centerRect 	= love.graphics.newImage("assets/testMenu.png")

	-- load image icons
	icontest = {}
	icontest[1] = love.graphics.newImage("assets/Icons/test_1.png")
	icontest[2]	= love.graphics.newImage("assets/Icons/test_2.png")
	icontest[3]	= love.graphics.newImage("assets/Icons/test_3.png")
	icontest[4]	= love.graphics.newImage("assets/Icons/test_4.png")
	icontest[5]	= love.graphics.newImage("assets/Icons/test_5.png")
	icontest[6]	= love.graphics.newImage("assets/Icons/test_6.png")

	icon_close	= love.graphics.newImage("assets/Icons/icon_close.png")
	icon_music	= love.graphics.newImage("assets/Icons/icon_music.png")
	icon_help	= love.graphics.newImage("assets/Icons/icon_help.png")
	icon_manual	= love.graphics.newImage("assets/Icons/icon_manual.png")
	icon_hospital	= love.graphics.newImage("assets/Icons/icon_hospital.png")


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

	currentPatient = 1

	-- level data
	stage = 99
	testsAvailable = 10
	maxTests = 10
	level = 1
	experience = 0
	maxExperience = 5

	currStage = 0

	-- patients
	hospital:load(level, 6)
	patientsTable = patientData:getPatients()

end



-- FUNCTION UPDATE
function love.update(dt)

end



-- FUNCTION DRAW
function love.draw()
	-- gui:draw()
	-- hospital:draw()
	
	-- manual:draw()
	-- patients:draw({ name="Bob Ross", bio="Likes to paint", exp= 1, photo=love.graphics.newImage("assets/greenOrb.png"),symptoms={{1, 50},{2, 100}},})
	gui:draw()
	if page == "MAIN" then
		hospital:draw()
	elseif page == "TEST" then
		patients:draw()
	elseif page == "MANUAL" then
		manual:draw()
	end
end




-- FUNCTION MOUSEPRESSED
function love.mousepressed(x, y, button, isTouch)
	
	gui:mousepressed(x,y)
	
	if page == "MAIN" then
		hospital:mousepressed(x, y)
	end
	
	if page == "MANUAL" then
		manual:mousepressed(x,y)
	end

	if page== "TEST" then
		test:mousepressed(x, y)
	end

end



-- FUNCTION LOAD NEW STAGE INFO
function loadNewStageInfo(stage_num)
	if stage_num <= #stages then
		local stage_info = stages[stage_num]
	
		stage = stage_num
		testsAvailable = stage_info.tests_num
		maxTests = stage_info.tests_num

		-- patients
		hospital:load(level, stage_info.patients_num)
	end
end



-- FUNCTION SET FONT
function setFont(size)
	font = love.graphics.newFont("assets/nokiafc22.ttf", size)
	love.graphics.setFont(font)
	textHeight = font:getHeight()
	return font
end



-- FUNCTIONS FOR COLORS
function setColorBlue()
	love.graphics.setColor(0/255,191/255,255/255)
end
function setColorBlack()
	love.graphics.setColor(0,0,0)
end
function setColorWhite()
	love.graphics.setColor(1,1,1)
end







