-- main.lua -- MAIN FILE

-- load other scripts in the folder
gui = require('scripts.gui')
test = require('scripts.test')
hospital = require('scripts.hospital')
patients = require('scripts.patients')
manual = require('scripts.manual')
diseases = require('scripts.diseases')
symptoms = require('scripts.symptoms')
treatments = require('scripts.treatments')
stages = require('scripts.stages')
skills = require('scripts.skills')
help = require('scripts.help')
stage_evaluation = require('scripts.stage_evaluation')

-- set filter 
love.graphics.setDefaultFilter("nearest")



-- FUNCTION LOAD
function love.load()
	page = "MAIN"
	DEFAULT_FONT = "assets/nokiafc22.ttf"
	DEFAULT_FONT_SIZE = 30
	SMALLER_FONT_SIZE = 20
	EVEN_SMALLER_FONT_SIZE = 18
	LARGER_FONT_SIZE = 40
	math.randomseed(os.time())
	
	-- load image assets
	square 		= love.graphics.newImage("assets/bluesquare.png")

	squareBlue 	= love.graphics.newImage("assets/bluesquare.png")
	squareRed 	= love.graphics.newImage("assets/redsquare.png")
	squareYellow= love.graphics.newImage("assets/yellowsquare.png")
	squareGreen = love.graphics.newImage("assets/greensquare.png")

	rectangle_box_icons = love.graphics.newImage("assets/bluerectangle.png")
	rectangle_confirm 	= love.graphics.newImage("assets/bluerectangle_confirm.png")
	centerRect 	= love.graphics.newImage("assets/testMenu.png")

	doctorImage = love.graphics.newImage("assets/Characters/Icon_Doctor.jpeg");

	instructions = {}
    instructions[1] = love.graphics.newImage("assets/Instructions/Instructions1.jpeg")
    instructions[2] = love.graphics.newImage("assets/Instructions/Instructions2.jpeg")
    instructions[3] = love.graphics.newImage("assets/Instructions/Instructions3.jpeg")
    instructions[4] = love.graphics.newImage("assets/Instructions/Instructions4.jpeg")

	-- load image icons
	icontest = {}
	icontest[1] = love.graphics.newImage("assets/Icons/test_1.png")
	icontest[2]	= love.graphics.newImage("assets/Icons/test_2.png")
	icontest[3]	= love.graphics.newImage("assets/Icons/test_3.png")
	icontest[4]	= love.graphics.newImage("assets/Icons/test_4.png")
	icontest[5]	= love.graphics.newImage("assets/Icons/test_5.png")
	icontest[6]	= love.graphics.newImage("assets/Icons/test_6.png")

	--icon_music	= love.graphics.newImage("assets/Icons/icon_music.png")
	icon_help	= love.graphics.newImage("assets/Icons/icon_help.png")
	icon_manual	= love.graphics.newImage("assets/Icons/icon_manual.png")
	icon_hospital=love.graphics.newImage("assets/Icons/icon_hospital.png")

	manual_background = love.graphics.newImage("assets/BackgroundManual.jpeg")

	icon_end_day= love.graphics.newImage("assets/Icons/icon_end_day.png")
	icon_close	= love.graphics.newImage("assets/Icons/icon_close.png")

	-- drawing the UI elements
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()
	screenOffsetFactor = 0.01
	topBarHeight = 0.07 * screenHeight
	bottomBarHeight = 0.15 * screenHeight

	centerUIWidth = 0.3 * screenWidth
	centerUIHeight = centerRect:getHeight()/centerRect:getWidth() * centerUIWidth

	numberOfTests = 6
	
	lineWidth = 5
	love.graphics.setLineWidth(lineWidth)

	love.graphics.setBackgroundColor(1,1,1);
	font = setFont(DEFAULT_FONT_SIZE)
	textHeight = font:getHeight()

	currentPatient = 1

	-- default stage data
	stage = 1
	testsAvailable = 8
	maxTests = 8
	diseases_unlocked = 3
	symptoms_unlocked = 3

	-- these should vary based on progress in the game
	level = 1
	max_level = 13
	experience = 0
	max_experience = {[1] = 10, [2] = 20, [3] = 30, [4] = 50, [5] = 70, [6] = 100, [7] = 130, [8] = 170, [9] = 210, [10] = 260, [11] = 310, [12] = 370, [13] = -1}
	skill_points = 0
	skill_points_gained = {[2] = 3, [3] = 3, [4] = 2, [5] = 2, [6] = 1, [7] = 1, [8] = 1, [9] = 1, [10] = 1, [11] = 1, [12] = 1, [13] = 1}

	-- THIS IS A TABLE STORING THE TREATMENT ACCURACY
	treatment = {}
	treatment.accuracy_level={}
	treatment.accuracy_prob={}
	-- initialize level and accuracy of each test
	for i = 1, 6 do
		treatment.accuracy_level[i]=1
		treatment.accuracy_prob[i]=0.75
	end
	-- THIS IS A TABLE STORING THE CURRENT PATIENTS FOR THE STAGE
	-- THIS IS UPDATED WHEN A NEW STAGE IS LOADED
	currentPatients = {}

	-- page num and graphics for help page
	help_page = 1
	max_help_page = 4

	-- Variables used to evaluate stages
	stage_evaluation_names 		= {}
	stage_evaluation_treatments	= {}
	stage_evaluation_cured 		= {}
	stage_evaluation_points 	= {}
	stage_evaluation_disease 	= {}
	tot_cured = 0
	tot_experience = 0
	stage_num_patients_total_old = 1
	patients_goal = 0

	loadNewStage(stage)

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
	if page == "MAIN" then
		hospital:draw()
	elseif page == "TEST" then
		patients:draw()
	elseif page == "MANUAL" then
		manual:draw()
	elseif page == "SKILLS" then
		skills:draw()
	elseif page == "HELP" then
		help:draw()
	elseif page == "STAGE_EVALUATION" then
		stage_evaluation:draw()
	end
	gui:draw()
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
		patients:mousepressed(x, y)
	end

	if page == "SKILLS" then
		skills:mousepressed(x, y)
	end

	if page == "HELP" then
		help:mousepressed(x, y)
	end
	
	if page == "STAGE_EVALUATION" then
		stage_evaluation:mousepressed(x, y)
	end

end

-- right now used for testing purposes
function love.keypressed(key, isrepeat)
	if key == "space" then
		loadNewStage(stage+1)
		--print('This function has been disabled')
	elseif key == "backspace" then
		loadNewStage(stage-1)
		--print('This function has been disabled')
	end
end

-- FUNCTION LOAD NEW STAGE
function loadNewStage(stage_num)
	if stage_num >= 1 and stage_num <= #stages then
		local stage_info = stages[stage_num]
		-- stage info
		stage 						= stage_num
		testsAvailable 				= stage_info.tests_num
		maxTests 					= stage_info.tests_num
		diseases_unlocked 			= stage_info.diseases_unlocked
		symptoms_unlocked 			= stage_info.symptoms_unlocked
		-- number of patients
		stage_num_patients_total 	= stage_info.patients_count
		stage_num_patients_untreated= stage_info.patients_count
		patients_goal				= stage_info.patients_goal
		-- load patients
		hospital:load(stage_num)
	end
end


-- FUNCTION EVALUATE STAGE
function evaluateStage()

	-- initialize the variables
	stage_evaluation_names 		= {[1]= "name_1",[2]="",[3]="",[4]="",[5]="",[6]=""}
	stage_evaluation_treatments = {[1]= "treat1",[2]="",[3]="",[4]="",[5]="",[6]=""}
	stage_evaluation_cured 		= {[1]= "cured1",[2]="",[3]="",[4]="",[5]="",[6]=""}
	stage_evaluation_points 	= {[1]= "point1",[2]="",[3]="",[4]="",[5]="",[6]=""}
	tot_cured = 0
	tot_experience = 0
	stage_num_patients_total_old=stage_num_patients_total

	-- fill with the information for all the patients
	for i_patient = 1,stage_num_patients_total do
		local patient = currentPatients[i_patient]
		stage_evaluation_names[i_patient] 		= patient.name
		stage_evaluation_treatments[i_patient] = patient.treatment
		stage_evaluation_disease[i_patient] 	= patient.disease
		if patient.treatment==patient.disease then
			stage_evaluation_cured[i_patient] 		= 1
			tot_cured = tot_cured+1
			stage_evaluation_points[i_patient] 	= patient.exp
			tot_experience = tot_experience+patient.exp
		else
			stage_evaluation_cured[i_patient] 		= 0
			stage_evaluation_points[i_patient] 	= 0
		end	
	end
	print('Total patients cured')
	print(tot_cured)
	print('Total experience received')
	print(tot_experience)

	-- determine if you passed the level
	if tot_cured>=patients_goal then
		level_pass = 1
		incrementExp(tot_experience)
		stage = stage + 1
		loadNewStage(stage)
	else
		level_pass = 0
		loadNewStage(stage)

	end

end


-- FUNCTION SET FONT
function setFont(size)
	font = love.graphics.newFont(DEFAULT_FONT, size)
	love.graphics.setFont(font)
	textHeight = font:getHeight()
	return font
end



-- FUNCTIONS FOR COLORS
function setColorBlue()
	love.graphics.setColor(0,0,1)
end
function setColorBlack()
	love.graphics.setColor(0,0,0)
end
function setColorWhite()
	love.graphics.setColor(1,1,1)
end
function setColorRed()
	love.graphics.setColor(1,0,0)
end
function setColorLightBlue()
	love.graphics.setColor(0,191/255,1)
end
