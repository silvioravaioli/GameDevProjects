local test = {}

testing = {
	name = "Basic Test",            -- name of test
	grade = "S",                    -- indicates quality of test
	duration = 0,                   -- time required to run test
	icon = "assets/redOrb.jpg",    -- icon file
	symptoms = {}
}

function test:new(name, grade, duration, icon)
	setmetatable({}, test)
	self.name = name
	self.grade = grade
	self.duration = duration
	self.icon = icon

	return self
end

function test:toString()
	testStr = string.format("Test: %s\nGrade:: %s\nTime Required:%s\n", self.name, self.grade, self.duration)
	return testStr
end

function test:mousepressed(x, y)
	print('Mouse Pressed: coordinates:')
	print(x,y)
	print(hospital.patient)
end
	--print(ScaleX) -- you can print other stuff for debugging

	-- move to patient pages
	--for i = 1, #self.patientBoxes do
	--	xx = self.patientBoxes[i][1]
	--	yy = self.patientBoxes[i][2]
	--	if x >= xx and x <= xx + patientWidth and y >= yy and y <= yy + patientHeight then
	--		page = "TEST"
	--		currentPatient=i
	--	end
	--end


return test
