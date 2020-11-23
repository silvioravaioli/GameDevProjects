local patientData = {}

function patientData:getPatients()
	local patients = {
		[1] = {
			name="Bob Ross",
			bio="Likes to paint",
			exp= 1,
			photo="assets/Characters/Icon_Patient1.jpeg",
			symptoms={
				{1, 50},
				{2, 100}
			}
		},
		[2] = {
			name="Donald Trump",
			bio="Likes to play golf",
			exp= 2020,
			photo="assets/Characters/Icon_Patient2.jpeg",
			symptoms={
				{1, 50},
				{2, 100}
			}
		},
		[3] = {
			name="Celine Dion",
			bio="Likes to sing",
			exp= 345,
			photo="assets/Characters/Icon_Patient3.jpeg",
			symptoms={
				{1, 50},
				{2, 100}
			}
		},
		[4] = {
			name="Jane Doe",
			bio="Likes to swim",
			exp= 1,
			photo="assets/Characters/Icon_Patient4.jpeg",
			symptoms={
				{1, 50},
				{2, 100}
			}
		},
		[5] = {
			name="Winnie the Pooh",
			bio="Likes to eat honey",
			exp= 1,
			photo="assets/Characters/Icon_Patient5.jpeg",
			symptoms={
				{1, 50},
				{2, 100}
			}
		},
		[6] = {
			name="James Bond",
			bio="Likes to spy",
			exp= 1,
			photo="assets/Characters/Icon_Patient6.jpeg",
			symptoms={
				{1, 50},
				{2, 100}
			}
		}
	}
	return patients
end

return patientData