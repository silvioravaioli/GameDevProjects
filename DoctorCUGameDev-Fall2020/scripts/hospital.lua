local hospital = {}

hospital.patients = {}
hospital.patientBoxes = {}
hospital.doctor = {}

function hospital:load(lvl, num_patients)
	self.doctor[1] = love.graphics.newImage("assets/Characters/Icon_Doctor.jpeg");
	self.patients = {}
	if lvl == 1 then
		for i = 1, num_patients do -- TODO: level-specific characters
			self.patients[i] = love.graphics.newImage("assets/Characters/Icon_Patient"..tostring(i)..".jpeg");
		end
	end

	xOffset = screenOffsetFactor * screenWidth
	yOffset = screenOffsetFactor * screenHeight
	-- determine where to draw
	upperBound = topBarHeight + 2 * yOffset
	lowerBound = screenHeight - bottomBarHeight - 2 * yOffset

	ratio = self.doctor[1]:getHeight() / self.doctor[1]:getWidth()
	patientWidth = screenWidth/(#self.patients+1) - 2 * xOffset

	heightLimit = lowerBound - upperBound

	if ratio * patientWidth > heightLimit then
		patientWidth = heightLimit / ratio
	end
	patientHeight = ratio * patientWidth

	mainX = screenWidth/2 - ((#self.patients + 2) * xOffset + (#self.patients + 1) * patientWidth)/2
	mainY = (lowerBound + upperBound)/2 - patientHeight/2

	for i = 1, #self.patients do
		self.patientBoxes[i] = {mainX + (patientWidth + xOffset) * i, mainY}
	end
end

function hospital:draw()
	setColorWhite()
	love.graphics.draw(self.doctor[1], mainX, mainY, 0, xScale, yScale)
	for i = 1, #self.patients do
		local patientSprite = self.patients[i]
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
			page = "TEST"
			currentPatient=i
		end
	end
end

return hospital