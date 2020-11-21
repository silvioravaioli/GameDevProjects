--diseases = {}

local manual = {
	page = 0,
}

manual.symptoms = {
	"runnynose",
	"fever",
	"headache",
	"weakness ",
	"trouble breathing",
	"bleeding",
	"weakness",
	"stomach pain",
	"cough",
	"vommiting",
}


manual.diseases = {
	"dis1",
	"dis2",
	"dis3",
	"dis4",
	"dis5",
	"dis6",
	"dis7",
	"dis8",
	"dis9",
	"dis10",
}

manual.treatments = {
	
}


--want to make sympotms gui
--ideas: map a specific symptom to an image, 
--probability, update probability, 
-- how likely you have the disease given the symptons :table (4 levels, very likely, not likely...)
-- start with just generic names (symptom a, disease b)

--each symptom associated with an index x, disease with an index y
--for manual, have table of contents page 0, then links to disease pages, and on each disease page have a list of diseases that are relavant
-- and probability of disease given symptom
--disease unlocked and symptoms unlocked variables

manual.diseaseGivenSymptoms = {}
function manual:setup()
	for x = 1, 10 do
		self.diseaseGivenSymptoms[x] = {}
	end

	for x = 1, 10 do
		for y = 1, 10 do
			if (x + y) % 10 == 0 then
				self.diseaseGivenSymptoms[x][y] = 1
			elseif (x + y) % 10 == 1 then
				self.diseaseGivenSymptoms[x][y] = 2
			elseif (x + y) % 10 == 2 then
				self.diseaseGivenSymptoms[x][y] = 3
			elseif (x + y) % 10 == 3 then
				self.diseaseGivenSymptoms[x][y] = 4
			else
				self.diseaseGivenSymptoms[x][y] = 0
			end
		end
	end
end 

function manual:draw(manual) --maybe should be called update
	if self.page == 0 then
		love.graphics.print("Doctor's Manual", 350, 10, 0, 2)
		for i = 1,  10 do
			love.graphics.print(self.diseases[i], 350, 50 + (40 * i), 0, 2)
		end
	else
		j = 0
		dis = self.diseases[self.page]
		love.graphics.print(dis, 200, 25, 0, 2)
		for i = 1, 10 do
			prob = self.diseaseGivenSymptoms[i][self.page]
			if prob > 0 then
				j = j + 1
				sympt = self.symptoms[i]
				love.graphics.print(sympt, 50, 50 + (40 * j), 0, 2)
				love.graphics.print(prob, 300,  50 + (40 * j), 0 , 2)
			end
		end
		love.graphics.print("back", 300, 450, 0 , 2) 
		--back button
	end
	--update
end

function manual:mousepressed(x,y)
	if manual.page == 0 then
		if x >= 350 and x <= 450 and y >= 90 and y <= 120 then
			manual.page = 1
		elseif x >= 350 and x <= 450 and y >= 130 and y <= 150 then
			manual.page = 2
		elseif x >= 350 and x <= 450 and y >= 170 and y <= 190 then
			manual.page = 3
		elseif x >= 350 and x <= 450 and y >= 210 and y <= 230 then
			manual.page = 4
		elseif x >= 350 and x <= 450 and y >= 250 and y <= 270 then
			manual.page = 5
		elseif x >= 350 and x <= 450 and y >= 290 and y <= 310 then
			manual.page = 6
		elseif x >= 350 and x <= 450 and y >= 330 and y <= 350 then
			manual.page = 7
		elseif x >= 350 and x <= 450 and y >= 370 and y <= 390 then
			manual.page = 8
		elseif x >= 350 and x <= 450 and y >= 410 and y <= 430 then
			manual.page = 9
		elseif x >= 350 and x <= 450 and y >= 450 and y <= 470 then
			manual.page = 10
		end


	else
		if x >= 300 and x <= 400 and y >= 450 and y <= 550 then
			manual.page = 0
		end
	end
	manual:draw(manual)
end


return manual









