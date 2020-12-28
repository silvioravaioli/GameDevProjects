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



function test:runTest(patient_number,test_number)

	--print('Run new test on the patient')
	--print(patient.disease)
	--print('Run new test (patient number, test number)')
	--print(patient_number)
	--print(test_number)

	-- Consume a test
	testsAvailable = testsAvailable-1

	-- Retrieve parameters for the test
	true_symp = patient.symptoms[test_number]
	prob_symp = patient.symptoms_display[test_number]
	test_acc = treatment.accuracy_prob[test_number]
	--test_acc = test.accuracy[i_test]				-- accuracy of the test

	--print('Patient information')
	--print(true_symp)
	--print(prob_symp)

	-- Random number generator, determines the sign of the test
	coin = math.random()
	--print(coin)
	if coin < test_acc then	-- if accurate
		sign_test = true_symp
	else					-- if inaccurate
		sign_test = 1-true_symp
	end
	--print(sign_test)

	-- Bayesian updating!
	if sign_test == 1 then
		p1 = test_acc*prob_symp
		p2 = (1-test_acc)*(1-prob_symp)
		new_prob = p1/(p1+p2)
	else
		p1 = (1-test_acc)*prob_symp
		p2 = test_acc*(1-prob_symp)
		new_prob = p1/(p1+p2)
	end
	new_prob = math.floor(new_prob * 1000) / 1000

	-- Update displayed probability
	-- print('Initial and updated probability')
	-- print(prob_symp)
	-- print(new_prob)
	patient.symptoms_display[test_number] = new_prob

end



function test:mousepressed(x, y)	
	-- print coordinates
	--print('Mouse Pressed: coordinates:')
	--print(x,y)

	for i = 1, symptoms_unlocked do
		cur_box = testIconBoxes[i]
		xx = cur_box[1]
		yy = cur_box[2]
		ww = cur_box[3]
		if x >= xx and x <= xx + ww and y >= yy and y <= yy + ww then
			if testsAvailable>0 then	
				test:runTest(currentPatient,i)
			end
		end
	end
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
