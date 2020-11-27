local tests = {}

Test = {
	name = "Basic Test",            -- name of test
	grade = "S",                    -- indicates quality of test
	duration = 0,                   -- time required to run test
	icon = "assets/redOrb.jpg",    -- icon file
	symptoms = {}
}

function Test:new(name, grade, duration, icon)
	setmetatable({}, test)
	self.name = name
	self.grade = grade
	self.duration = duration
	self.icon = icon

	return self
end

function Test:toString()
	testStr = string.format("Test: %s\nGrade:: %s\nTime Required:%s\n", self.name, self.grade, self.duration)
	return testStr
end



-- CLICK ON THE TEST ICON TO RUN THE TEST
function Test:mousepressed(x, y)
	if testsAvailable > 0 then
		for i = 1, numberOfTests do
			xx = self.patientBoxes[i][1]
			yy = self.patientBoxes[i][2]
			if x >= xx and x <= xx + patientWidth and y >= yy and y <= yy + patientHeight then
				testsAvailable = testsAvailable-1
				--Test_Calculation
			end
		end
	end
end


-- RUN THE TEST UPDATING PROBABILITIES FOR THE SYMPTOMS (UP OR DOWN)
function patients:run_test(patient,test,i_test)

	-- retrieve information about the test
	true_symp = patient.symptoms_true[i_test]		-- true value (0 or 1)
	prob_symp = patient.symptoms_display[i_test]	-- displayed v (probability)
	test_acc = test.accuracy[i_test]				-- accuracy of the test

	-- run the test
	if rand < test_acc then	-- if accurate
		sign_test = true_symp
	else					-- if inaccurate
		sign_test = 1-true_symp
	end

	-- update probability using Bayes rule
	if sign_test = 1 then
		p1 = test_acc*prob_symp
		p2 = (1-test_acc)*(1-prob_symp)
		new_prob = p1/(p1+p2)
	else
		p1 = (1-test_acc)*prob_symp
		p2 = test_acc*(1-prob_symp)
		new_prob = p1/(p1+p2)
	end
	patient.symptoms_display[i_test] = new_prob

end




return tests
