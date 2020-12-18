local patients = {}


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
end


--function patients:drawinfo(patient)
	--maybe set color	

return patients