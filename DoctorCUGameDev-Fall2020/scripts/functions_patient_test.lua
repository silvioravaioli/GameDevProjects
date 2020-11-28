local patients = {}


-- EXAMPLE OF INFORMATION FOR A PATIENT [THEY WILL BE EXTRACTED FROM THE STAGE FILE]
local testPatient = {
	name="Bob Ross",				-- read patient info from stage file
	bio="Likes to paint",
	exp= 1,
	photo=love.graphics.newImage("assets/greenOrb.png"),

	disease = 1, 					-- ID of the disease, read from stage file
	symptoms_disease = {1,0,0.2,0.8,0.4,0.4},	-- symptom probability given the disease, from disease table
	symptoms_revealed = 2,			-- number of symptoms revealed at the beginning of the stage, from stage file

	symptoms_prior = 0.4,			-- initial uncertainty before running any test

	symptoms_true = {0,0,0,0,0,0}, 			-- initialize everything at 0, run function generate_symptom to fill
	symptoms_display = 0.4*{1,1,1,1,1,1}, 	-- initialize everything at 0.4, run function generate_symptom to fill

	treatment = -1,				-- initialize the treatment at -1 (until a real treatment is assigned)
}


-- EXAMPLE OF INFORMATION ABOUT TEST ACCURACY
local test = {

	accuracy={0.7, 0.8, 0.75, 0.7, 0.9, 0.7 },

}


-- GENERATE SYMPTOMS AT THE BEGINNING OF THE STAGE
function patients:generate_symptom(patient)

	-- generate the true vector of symptoms (not displayed)
	for i = 1, #patient.symptoms_true do
		-- retrieve the probability of having the symptom 
		prob_disease = patient.symptoms_disease[i]
		-- randomly assign the symptom (yes or no)
		-- replace rand with a random variable
		if rand<prob_disease then
			patient.symptoms_true = 1
		else
			patient.symptoms_true = 0
		end
	end

	-- randomly reveal N symptoms
	n_symptoms_revealed = patient.symptoms_revealed
	vector_symptoms = randperm(1:6)
	for i = 1, n_symptoms_revealed do
		j = vector_symptoms[i]
		patient.symptoms_display[j] = patient.symptoms_true[j]
	end
	
end


-- RUN A TEST X ON PATIENT Y
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


-- SCORING SYSTEM END OF LEVEL
function patients:end_stage_score(patient)

	new_experience = 0			-- amount of experience collected
	count_saved = 0				-- number of patients saved

	for i = 1, #patient do

		-- initialize every patient as sick
		dummy_cured = 0
		
		-- compare disease and treatment
		cur_disease = patient[i].disease
		cur_treatment = patient[i].treatment
		if cur_disease == cur_treatment	then		-- cure if the correct medicine is used
			dummy_cured = 1
		end
		if cur_treatment == 0 then					-- use chamomile, some fixed chance of curing
			if rand < 0.3 then						-- generate a random variable, uniform 0-1
				dummy_cured = 1
			end
		end

		-- add points if cured 
		if dummy_cured == 1 then
			count_saved += 1
			new_experience += patient[i].exp
		end

	end

end



return patients