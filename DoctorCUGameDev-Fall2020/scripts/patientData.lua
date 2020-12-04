local patientData = {}

function patientData:getPatients()
	local patients = {
		[1] = {
			name="Bob Ross",
			bio="Likes to paint",
			exp= 1,
			photo="assets/Characters/Icon_Patient1.jpeg",
			possible_disease={1,2,3,4,5,6,7,8},
			symptoms_revealed = 2
		},
		[2] = {
			name="Donald Trump",
			bio="Likes to play golf",
			exp= 2020,
			photo="assets/Characters/Icon_Patient2.jpeg",
			possible_disease={1,2,3,4,5,6,7,8},
			symptoms_revealed = 2
		},
		[3] = {
			name="Celine Dion",
			bio="Likes to sing",
			exp= 345,
			photo="assets/Characters/Icon_Patient3.jpeg",
			possible_disease={1,2,3,4,5,6,7,8},
			symptoms_revealed = 2
		},
		[4] = {
			name="Jane Doe",
			bio="Likes to swim",
			exp= 1,
			photo="assets/Characters/Icon_Patient4.jpeg",
			possible_disease={1,2,3,4,5,6,7,8},
			symptoms_revealed = 2
		},
		[5] = {
			name="Winnie the Pooh",
			bio="Likes to eat honey",
			exp= 1,
			photo="assets/Characters/Icon_Patient5.jpeg",
			possible_disease={1,2,3,4,5,6,7,8},
			symptoms_revealed = 2
		},
		[6] = {
			name="James Bond",
			bio="Likes to spy",
			exp= 1,
			photo="assets/Characters/Icon_Patient6.jpeg",
			possible_disease={1,2,3,4,5,6,7,8},
			symptoms_revealed = 2
		}
	}
	return patients
end

return patientData