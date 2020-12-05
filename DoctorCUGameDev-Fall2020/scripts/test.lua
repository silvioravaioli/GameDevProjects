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

	print('Run new test (patient number, test number)')
	print(patient_number)
	print(test_number)

	-- Consume a test
	testsAvailable = testsAvailable-1

	-- Retrieve parameters for the test
	true_symp = 1
	prob_symp = 0.4
	test_acc = 0.55
	-- These are used only for example
	--true_symp = patient.symptoms_true[i_test]		-- true value (0 or 1)
	--prob_symp = patient.symptoms_display[i_test]	-- displayed v (probability)
	--test_acc = test.accuracy[i_test]				-- accuracy of the test

	-- Random number generator, determines the sign of the test
	coin = math.random()
	print(coin)
	if coin < test_acc then	-- if accurate
		sign_test = true_symp
	else					-- if inaccurate
		sign_test = 1-true_symp
	end
	print(sign_test)

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

	-- Update displayed probability
	-- patient.symptoms_display[i_test] = new_prob
	print('Initial and updated probability')
	print(prob_symp)
	print(new_prob)

end

function test:mousepressed(x, y)	
	-- print coordinates
	print('Mouse Pressed: coordinates:')
	print(x,y)
	-- print patient information (debug)
	print(hospital.patient)

	for i = 1, 6 do
		cur_box = testIconBoxes[i]
		xx = cur_box[1]
		yy = cur_box[2]
		ww = cur_box[3]
		if x >= xx and x <= xx + ww and y >= yy and y <= yy + ww then
			if testsAvailable>0 then	
				test:runTest(1,i)
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
