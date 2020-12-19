local treatments = require('scripts.treatments')

local patients = {isTreating = false}
patients.treatmentBoxes = {}
patients.treatmentButton = {}

function patients:draw()
	patient = currentPatients[currentPatient]

	x = screenWidth/2 - centerUIWidth/2
	y = (lowerBound+upperBound)/2 - centerUIHeight/2
	scaleCenterX = centerUIWidth / centerRect:getWidth()
	scaleCenterY = centerUIHeight / centerRect:getHeight()
	setColorWhite()
	love.graphics.draw(centerRect, x, y, 0, scaleCenterX, scaleCenterY)

	local borderOffset = 50
	local textSpacing = 15		-- pixels between lines
	setFont(20)					-- set font size
	local currX = x + borderOffset
	local currY = y + borderOffset
	setColorBlack()

	fields = {
		"Name: "..patient.name,
		"EXP: +"..patient.exp,
		"Bio: "..patient.bio,
		"List of symptoms:",
		"Disease: "..patient.disease,
		"Symptoms: "..table.concat(patient.symptoms, ", "),
		"Displayed: "..table.concat(patient.symptoms_display, ", "),
		"Treatment: "..patient.treatment
	}

	-- print the patient summary
	for j = 1, #fields do
		love.graphics.print(fields[j], currX, currY)
		currY = currY + textHeight + textSpacing
	end

	--for i = 1, #patient.symptoms do
	--	symptom = patient.symptoms[i][1]
	--	--symptom_name = manual.symptoms[symptom]
	--	symptom_prob = patient.symptoms[i][2]
	--	love.graphics.print(symptom.." "..symptom_prob, currX, currY)
	--	currY = currY + textHeight + textSpacing
	--end

	-- draw doctor and patient
	doctorHeight = 0.75 * centerUIHeight
	doctorWidth = doctorHeight / ratio
	scale = doctorHeight / doctorImage:getHeight()
	
	doctorX = x/2 - doctorWidth/2
	doctorY = (lowerBound+upperBound)/2 - doctorHeight/2
	setColorWhite()
	love.graphics.draw(doctorImage, doctorX, doctorY, 0, scale, scale)

	patientX = x + centerUIWidth + x/2 - doctorWidth/2
	patientY = doctorY
	love.graphics.draw(love.graphics.newImage(patient.photo), patientX, patientY, 0, scale, scale)

	--draw treatment button and tests if applicable
	local rectTotal = centerUIHeight/(#treatments + 1)
	local treatmentX = x + centerUIHeight + x/8
	local treatmentY = y
	treatHeight = 0.75*rectTotal
	treatScale = treatHeight / rectangle_box_icons:getHeight()
	love.graphics.draw(rectangle_box_icons, treatmentX, treatmentY, 0, treatScale, treatScale)
	love.graphics.print("Assign Treatment", treatmentX + treatHeight/5, y + treatHeight/4)
	self.treatmentButton = {x=treatmentX, y=treatmentY, height=treatHeight, width=treatScale * rectangle_box_icons:getWidth()}
	if self.isTreating then
		self:drawTests(treatmentX, treatmentY, 0.75 * rectTotal, 0.25 * rectTotal)
	end
end

function patients:drawTests(x, y, squareSize, offset)
	local squareScale = squareSize / rectangle_box_icons:getHeight()
	for i = 1, #treatments do
		y = y + squareSize + offset
		self.treatmentBoxes[i] = {x = x, 
			y = y, 
			height = squareSize, 
			width = squareScale * rectangle_box_icons:getWidth()}
		love.graphics.draw(rectangle_box_icons, x, y, 0, squareScale, squareScale)

		love.graphics.print(treatments[i], x + squareSize/5, y + squareSize/4)
	end
end


function withinObj(x, y, range)
	if not range or not range.x then
		return false
	end
	if x >= range.x and x <= range.x + range.width
	  and y >= range.y and y <= range.y + range.height then
		return true
	end
	return false
end

function patients:mousepressed(x, y)
	if withinObj(x, y, self.treatmentButton) then
		self.isTreating = not self.isTreating
	end
	for i = 1, #treatments do
		if withinObj(x, y, self.treatmentBoxes[i]) then
			self:useTreatment(i)
		end
	end
end

function patients:useTreatment(treatmentIndex)
	patient = currentPatients[currentPatient]
	if patient.treatment==-1 then
		stage_num_patients_untreated = stage_num_patients_untreated-1
		print(stage_num_patients_untreated)
	end
	patient.treatment = treatmentIndex
end

--function patients:drawinfo(patient)
	--maybe set color	

return patients