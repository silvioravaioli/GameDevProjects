local diseases = {
-- symptoms is a vector of probabilities for each symptom
	[1] = {
		name="Typhoid",
		symptoms={1.0, 0.0, 0.2, 0.8, 0.4, 0.4},
		treatment={1}
	},
	[2] = {
		name="Flu",
		symptoms={0.2, 1.0, 0.0, 0.8, 0.4, 0.4},
		treatment={2}
	},
	[3] = {
		name="Smallpox",
		symptoms={0.0, 0.2, 1.0, 0.4, 0.4, 0.8},
		treatment={3}
	},
	[4] = {
		name="Leprosy",
		symptoms={0.8, 0.4, 0.4, 0.0, 1.0, 0.2},
		treatment={4}
	},
	[5] = {
		name="Hay Fever",
		symptoms={0.8, 0.2, 0.4, 0.4, 0.0, 1.0},
		treatment={5}
	},
	[6] = {
		name="Scabies",
		symptoms={0.2, 0.4, 0.8, 1.0, 0.0, 0.4},
		treatment={6}
	},
	[7] = {
		name="Bubonic plague",
		symptoms={0.4, 0.8, 0.0, 0.2, 0.4, 0.8},
		treatment={7}
	},
	[8] = {
		name="Tapeworm",
		symptoms={0.4, 0.4, 0.8, 0.2, 0.8, 0.0},
		treatment={8}
	}
}

return diseases