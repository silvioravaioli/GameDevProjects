disease_probability_matrix = {
{1.0,	0.0,	0.2,	0.8,	0.4,	0.4},
{0.2,	1.0,	0.0,	0.8,	0.4,	0.4},
{0.0,	0.2,	1.0,	0.4,	0.4,	0.8},
{0.8,	0.4,	0.4,	0.0,	1.0,	0.2},
{0.8,	0.2,	0.4,	0.4,	0.0,	1.0},
{0.2,	0.4,	0.8,	1.0,	0.0,	0.4},
{0.4,	0.8,	0.0,	0.2,	0.4,	0.8},
{0.4,	0.4,	0.8,	0.2,	0.8,	0.0},
}

return disease_probability_matrix

-- Table of disaese-symptoms probabilities
-- Each row is a disease (1 to 8)
-- Each column is a symptom (1 to 6)
-- Each cell is the probability of the symptom, conditional on having the disease