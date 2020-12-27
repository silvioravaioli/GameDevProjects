local patientData = {
	[1] = {
		name="Bob Ross",
		bio="Likes to paint",
		exp= 50,
		photo="assets/Characters/Icon_Patient1.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},
	[2] = {
		name="Donald Trump",
		bio="Likes to play golf",
		exp= 20,
		photo="assets/Characters/Icon_Patient2.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},
	[3] = {
		name="Celine Dion",
		bio="Likes to sing",
		exp= 15,
		photo="assets/Characters/Icon_Patient3.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},
	[4] = {
		name="Jane Doe",
		bio="Likes to swim",
		exp= 5,
		photo="assets/Characters/Icon_Patient4.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},
	[5] = {
		name="Winnie the Pooh",
		bio="Likes to eat honey",
		exp= 60,
		photo="assets/Characters/Icon_Patient5.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},
	[6] = {
		name="James Bond",
		bio="Likes to spy",
		exp= 7,
		photo="assets/Characters/Icon_Patient6.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},


	-- DAY 1
	[11] = {
		name="Bob Ross",
		bio="Likes to paint",
		exp= 10,
		photo="assets/Characters/Icon_Patient1.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 0
	},


	-- DAY 2
	[21] = {
		name="Donald Trump",
		bio="Likes to play golf",
		exp= 20,
		photo="assets/Characters/Icon_Patient2.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 0
	},
	[22] = {
		name="Celine Dion",
		bio="Likes to sing",
		exp= 5,
		photo="assets/Characters/Icon_Patient3.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 0
	},


	-- DAY 3
	[31] = {
		name="Jane Doe",
		bio="Likes to swim",
		exp= 15,
		photo="assets/Characters/Icon_Patient4.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},
	[32] = {
		name="Winnie the Pooh",
		bio="Likes to eat honey",
		exp= 60,
		photo="assets/Characters/Icon_Patient5.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 0
	},
	[33] = {
		name="James Bond",
		bio="Likes to spy",
		exp= 7,
		photo="assets/Characters/Icon_Patient6.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 3
	},


	-- DAY 4
	[41] = {
		name="Bob Ross",
		bio="Likes to paint",
		exp= 10,
		photo="assets/Characters/Icon_Patient1.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},
	[42] = {
		name="Donald Trump",
		bio="Likes to play golf",
		exp= 1,
		photo="assets/Characters/Icon_Patient2.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 6
	},
	[43] = {
		name="Celine Dion",
		bio="Likes to sing",
		exp= 88,
		photo="assets/Characters/Icon_Patient3.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 0
	},
	[44] = {
		name="Jane Doe",
		bio="Likes to swim",
		exp= 5,
		photo="assets/Characters/Icon_Patient4.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},


	-- DAY 5
	[51] = {
		name="Winnie the Pooh",
		bio="Likes to eat honey",
		exp= 10,
		photo="assets/Characters/Icon_Patient5.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 3
	},
	[52] = {
		name="James Bond",
		bio="Likes to spy",
		exp= 70,
		photo="assets/Characters/Icon_Patient6.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 0
	},
	[53] = {
		name="Bob Ross",
		bio="Likes to paint",
		exp= 5,
		photo="assets/Characters/Icon_Patient1.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 4
	},
	[54] = {
		name="Donald Trump",
		bio="Likes to play golf",
		exp= 30,
		photo="assets/Characters/Icon_Patient2.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 1
	},
	[55] = {
		name="Celine Dion",
		bio="Likes to sing",
		exp= 15,
		photo="assets/Characters/Icon_Patient3.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},


	-- DAY 6
	[61] = {
		name="Jane Doe",
		bio="Likes to swim",
		exp= 40,
		photo="assets/Characters/Icon_Patient4.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 2
	},
	[62] = {
		name="Winnie the Pooh",
		bio="Likes to eat honey",
		exp= 4,
		photo="assets/Characters/Icon_Patient5.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 4
	},
	[63] = {
		name="James Bond",
		bio="Likes to spy",
		exp= 77,
		photo="assets/Characters/Icon_Patient6.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 1
	},
	[64] = {
		name="Bob Ross",
		bio="Likes to paint",
		exp= 20,
		photo="assets/Characters/Icon_Patient1.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 3
	},
	[65] = {
		name="Donald Trump",
		bio="Likes to play golf",
		exp= 1,
		photo="assets/Characters/Icon_Patient2.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 6
	},
	[66] = {
		name="Celine Dion",
		bio="Likes to sing",
		exp= 99,
		photo="assets/Characters/Icon_Patient3.jpeg",
		possible_disease={1,2,3,4,5,6,7,8},
		symptoms_revealed = 0
	}






}

return patientData