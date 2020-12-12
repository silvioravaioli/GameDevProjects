-- load scripts
require('scripts.patients')
require('scripts.patientData')

disease_probability_matrix = require('files.disease_probability_matrix')
util = require('scripts.util')

local patientGen = {}

local function fillSymptoms(patient)
end


local function generatePerm()
	rand = math.floor(100*math.random())
end


function patientGen:generatePatient(patient_data)
	-- patient with additional data
	local patient = {
		name = patient_data.name,
		bio = patient_data.bio,
		exp = patient_data.exp,
		photo = patient_data.photo,
		possible_disease = patient_data.possible_disease,
		--- randomly draw from possible_disease
		disease = 1,
		symptoms = {0,0,0,0,0,0},
		symptoms_display = {0.4,0.4,0.4,0.4,0.4,0.4},
		treatment = -1
	}
	local disease_symptoms = disease_probability_matrix[patient.disease]
	for i = 1, #symptoms do
		local rand = math.random()
		if rand < disease_symptoms[i] then
			patient.symptoms[i] = 1
		else
			patient.symptoms[i] = 0
		end
	end
	random_indices = util.shuffle({1,2,3,4,5,6})
	for i = 1, patient_data.symptoms_revealed do
		local ind = random_indices[i]
		patient.symptoms_display[ind] = patient.symptoms[ind]
	end
	return patient
end

return patientGen