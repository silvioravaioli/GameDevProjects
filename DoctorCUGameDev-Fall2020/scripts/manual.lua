--diseases = {}

local manual = {
	page = 0,
}


-- manual.symptoms = {
-- 	"runnynose",
-- 	"fever",
-- 	"headache",
-- 	"weakness ",
-- 	"trouble breathing",
-- 	"bleeding",
-- 	"weakness",
-- 	"stomach pain",
-- 	"cough",
-- 	"vommiting",
-- }


-- manual.diseases = {
-- 	"dis1",
-- 	"dis2",
-- 	"dis3",
-- 	"dis4",
-- 	"dis5",
-- 	"dis6",
-- 	"dis7",
-- 	"dis8",
-- 	"dis9",
-- 	"dis10",
-- }

manual.treatments = {
	
}

manual.probstoWords = {
	[0.0] = "never",
	[0.2] = "rarely",
	[0.4] = "sometimes",
	[0.8] = "very often",
	[1.0] = "always"
}


manual.contentsBoxes = {}


--want to make symptoms gui
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
	xstart = 350
	-- for x = 1, 10 do
	-- 	self.diseaseGivenSymptoms[x] = {}
	-- end

	-- for x = 1, 10 do
	-- 	for y = 1, 10 do
	-- 		if (x + y) % 10 == 0 then
	-- 			self.diseaseGivenSymptoms[x][y] = 1
	-- 		elseif (x + y) % 10 == 1 then
	-- 			self.diseaseGivenSymptoms[x][y] = 2
	-- 		elseif (x + y) % 10 == 2 then
	-- 			self.diseaseGivenSymptoms[x][y] = 3
	-- 		elseif (x + y) % 10 == 3 then
	-- 			self.diseaseGivenSymptoms[x][y] = 4
	-- 		else
	-- 			self.diseaseGivenSymptoms[x][y] = 0
	-- 		end
	-- 	end
	-- end
	for i = 1,  #diseases do
		self.contentsBoxes[i] = {screenWidth/2 - 50, 140 + (55 * i), 0, 1.4}
			--love.graphics.print(self.diseases[i], 350, 50 + (40 * i), 0, 2)
	end

end 



function manual:draw()
	if self.page == 0 then
		love.graphics.print("Doctor's Manual", xstart + 50, 100, 0, 2)
		for i = 1,  #diseases do
			setColorBlue()
			love.graphics.rectangle("fill", self.contentsBoxes[i][1], self.contentsBoxes[i][2], 40, 30)
			setColorBlack()
			love.graphics.print(diseases[i]["name"], self.contentsBoxes[i][1], self.contentsBoxes[i][2], self.contentsBoxes[i][3], self.contentsBoxes[i][4])
		end
	else
		j = 0
		dis = diseases[self.page]
		love.graphics.print(dis["name"], screenWidth/2 - 150, 150, 0, 2)
		for i = 1, #dis["symptoms"] do
			prob = dis["symptoms"][i]
			j = j + 1
			sympt = symptoms[i]
			love.graphics.print(sympt, 450, 125 + (50 * (i + 1)), 0, 1)
			love.graphics.print(self.probstoWords[prob], 800,  125 + (50 * (i + 1)), 0 , 1)
		end
		love.graphics.print("back", screenWidth/2, 550, 0 , 2) 
		--back button
	end
	--update
end



function manual:mousepressed(x,y)
	if manual.page == 0 then
		for i = 1, #diseases do
			xx = self.contentsBoxes[i][1]
			yy = self.contentsBoxes[i][2]
			if x >= xx and x <= xx + 400 and y >= yy and y <= yy + 50 then
				manual.page = i
			end
		end
	else
		if x >= screenWidth/2 - 50 and x <= screenWidth/2 + 200 and y >= 550 and y <= 650 then
			manual.page = 0
		end
	end
end


return manual
