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
		"Displayed: "..table.concat(patient.symptoms_display, ", ")
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
	local rectTotal = centerUIHeight/(#treatments)
	local treatmentX = x + centerUIHeight + x/8
	local treatmentY = y
	treatHeight = 0.75*rectTotal
	treatScale = treatHeight / rectangle:getHeight()
	love.graphics.draw(rectangle, treatmentX, treatmentY, 0, treatScale, treatScale)
	self.treatmentButton = {x=treatmentX, y=treatmentY, height=treatHeight, width=treatScale * rectangle:getWidth()}
	if self.isTreating then
		self:drawTests(treatmentX, treatmentY, 0.75 * rectTotal, 0.25 * rectTotal)
	end
end

function patients:drawTests(x, y, squareSize, offset)
	local squareScale = squareSize / rectangle:getHeight()
	for i = 1, #treatments do
		self.treatmentBoxes[i] = {x = x, 
			y = y + (squareSize + offset) * (i-1) + offset, 
			height = squareSize, 
			width = squareScale * rectangle:getWidth()}
		love.graphics.draw(rectangle, x, y + (squareSize + offset) * (i-1) + offset, 0, squareScale, squareScale)
	end
end


function withinObj(x, y, range)
	if not range.x then
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
end

--function patients:drawinfo(patient)
	--maybe set color	

return patients