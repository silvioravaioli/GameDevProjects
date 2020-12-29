diseases = require('scripts.diseases')

local manual = {
	page = 0,
}

manual.probstoWords = {
	[0.0] = "never",
	[0.2] = "rarely",
	[0.5] = "sometimes",
	[0.8] = "often",
	[1.0] = "always"
}


manual.contentsBoxes = {}
manualX = 0
manualY = 0
manualbackbuttonheight = 0


--want to make symptoms gui
--ideas: map a specific symptom to an image, 
--probability, update probability, 
-- how likely you have the disease given the symptons :table (4 levels, very likely, not likely...)
-- start with just generic names (symptom a, disease b)

--each symptom associated with an index x, disease with an index y
--for manual, have table of contents page 0, then links to disease pages, and on each disease page have a list of diseases that are relavant
-- and probability of disease given symptom
--disease unlocked and symptoms unlocked variables

function manual:setup()
	local manualRatio =  manual_background:getWidth()/manual_background:getHeight()
	-- constrain the height
	local small_offset = screenHeight * 0.05
	local manual_height = screenHeight - bottomBarHeight - topBarHeight - small_offset
	local manual_width = manualRatio * manual_height
	-- center the manual
	self.manualX = screenWidth/2 - manual_width/2
	self.manualY = (topBarHeight + screenHeight - bottomBarHeight)/2 - manual_height/2
	local manual_scale = manual_height / manual_background:getHeight()

	-- bounding boxes for clicking diseases
	for i = 1, #diseases do
		if i < 5 then
			self.contentsBoxes[i] = {
			self.manualX + 3*small_offset,
			self.manualY + small_offset + (2*font:getHeight()*i), 
			0,1,
			font:getWidth(diseases[i]["name"])
		}
		else
			self.contentsBoxes[i] = {
				screenWidth/2 + 2*small_offset,
				self.manualY + small_offset + (2*font:getHeight()*(i-4)),
				0, 1,
				font:getWidth(diseases[i]["name"])
			}
		end
	end
	self.manualbackbuttonheight = self.manualY + manual_height - font:getHeight("X") - small_offset
end

function manual:draw()
	setColorWhite()
	local manualRatio =  manual_background:getWidth()/manual_background:getHeight()
	-- constrain the height
	small_offset = screenHeight * 0.05
	local manual_height = screenHeight - bottomBarHeight - topBarHeight - small_offset
	local manual_width = manualRatio * manual_height
	-- center the manual
	local manualX = screenWidth/2 - manual_width/2
	local manualY = (topBarHeight + screenHeight - bottomBarHeight)/2 - manual_height/2
	local manual_scale = manual_height / manual_background:getHeight()

	love.graphics.draw(manual_background, manualX, manualY, 0, manual_scale, manual_scale)

	setColorBlack()
	if self.page == 0 then
		setColorBlack()
		setFont(LARGER_FONT_SIZE)
		local textwidth = font:getWidth("Doctor's Manual")
		love.graphics.print("Doctor's Manual", screenWidth/2-textwidth/2, topBarHeight + small_offset, 0, 1)
		setFont(DEFAULT_FONT_SIZE)
		for i = 1, diseases_unlocked do
			love.graphics.print(diseases[i]["name"], self.contentsBoxes[i][1], self.contentsBoxes[i][2], self.contentsBoxes[i][3], self.contentsBoxes[i][4])
		end
	else

		local j = 0
		local dis = diseases[self.page]
		setFont(LARGER_FONT_SIZE)
		local textwidth = font:getWidth(dis["name"])
		local textHeight = font:getHeight(dis["name"])
		love.graphics.print(dis["name"], screenWidth/2 - textwidth/2, topBarHeight + small_offset, 0, 1)
		setFont(DEFAULT_FONT_SIZE)
		for i = 1, symptoms_unlocked do
			prob = dis["symptoms"][i]
			j = j + 1
			sympt = symptoms[i]
			local currHeight = small_offset + textHeight + (1.2*small_offset*(i+1))
			love.graphics.print(sympt, manualX + 2 * small_offset, currHeight, 0, 1)
			love.graphics.print(self.probstoWords[prob], screenWidth/2 + 2*small_offset, currHeight, 0, 1)
		end
		local bottomY = small_offset + textHeight + (1.2*small_offset*(#dis["symptoms"]+3))
		love.graphics.print("Treatment:", manualX + 2 * small_offset, bottomY, 0, 1)
		love.graphics.print(treatments[dis["treatment"][1]], screenWidth/2 + 2*small_offset, bottomY, 0, 1)
		--back button
		setColorRed()
		backX = manualX + manual_width - font:getWidth("GO BACK") - small_offset
		love.graphics.print("GO BACK", backX, self.manualbackbuttonheight, 0 , 1)
		setColorBlack()
		
	end
	--update
end



function manual:mousepressed(x,y)
	if #self.contentsBoxes == 0 then
		return
	end
	if manual.page == 0 then
		for i = 1, diseases_unlocked do
			xx = self.contentsBoxes[i][1]
			yy = self.contentsBoxes[i][2]
			ww = self.contentsBoxes[i][5]
			if x >= xx and x <= xx + ww and y >= yy and y <= yy + font:getHeight("X") then
				manual.page = i
			end
		end
	else
		local w = font:getWidth("GO BACK")
		local h = font:getHeight("G")
		if x >= backX and x <= backX + w and y >= self.manualbackbuttonheight and y <= self.manualbackbuttonheight + h then
			manual.page = 0
		end
	end
end


return manual
