patient_generator = require('scripts.generate_patient')
patientData = require('scripts.patientData')

local hospital = {}

hospital.patientBoxes = {}

function hospital:load(stage)
	-- clear bounding boxes and current patients
	self.patientBoxes = {}
	currentPatients = {}

	i = 1
	for _,patientID in pairs(stages[stage].patient_ids) do
		local patient_data = patientData[patientID]
		currentPatients[i] = patient_generator:generatePatient(patient_data)
		i = i + 1
	end

	xOffset = screenOffsetFactor * screenWidth
	yOffset = screenOffsetFactor * screenHeight
	-- determine where to draw
	upperBound = topBarHeight + 2 * yOffset
	lowerBound = screenHeight - bottomBarHeight - 2 * yOffset

	ratio = doctorImage:getHeight() / doctorImage:getWidth()
	patientWidth = screenWidth/(#currentPatients+1) - 2 * xOffset

	heightLimit = lowerBound - upperBound

	if ratio * patientWidth > heightLimit then
		patientWidth = heightLimit / ratio
	end
	patientHeight = ratio * patientWidth

	mainX = screenWidth/2 - ((#currentPatients + 2) * xOffset + (#currentPatients + 1) * patientWidth)/2
	mainY = (lowerBound + upperBound)/2 - patientHeight/2

	for i = 1, #currentPatients do
		self.patientBoxes[i] = {mainX + (patientWidth + xOffset) * i, mainY}
	end
end



function hospital:draw()
	setColorWhite()
	currently_testing = false
	love.graphics.draw(doctorImage, mainX, mainY, 0, xScale, yScale)
	for i = 1, #currentPatients do
		local patientSprite = love.graphics.newImage(currentPatients[i].photo)
		xScale = patientWidth/patientSprite:getWidth()
		yScale = patientHeight/patientSprite:getHeight()
		love.graphics.draw(patientSprite, self.patientBoxes[i][1], self.patientBoxes[i][2], 0, xScale, yScale)
	end
end



function hospital:mousepressed(x, y)
	--print('Mouse Pressed: coordinates:')
	--print(x,y)
	--print(ScaleX) -- you can print other stuff for debugging

	-- move to patient pages
	for i = 1, #self.patientBoxes do
		xx = self.patientBoxes[i][1]
		yy = self.patientBoxes[i][2]
		if x >= xx and x <= xx + patientWidth and y >= yy and y <= yy + patientHeight then
			currentPatient=i
			if 1 then -- REPLACE with if test>0
				page = "TEST"
			else
				page = "TEST"
			end
		end
	end
end

return hospital