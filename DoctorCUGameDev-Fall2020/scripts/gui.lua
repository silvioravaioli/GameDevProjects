util = require('scripts.util')

local gui = {}


-- DEFINE PROPORTIONS AND DRAW ELEMENTS ON THE GENERAL GUI
function gui:draw()
	-- TOP SIDE SCREEN
	stageBarWidth 		= 0.30 * screenWidth
	progressBarWidth 	= 0.30 * screenWidth
	--levelBarWidth 		= 0.12 * screenWidth -- UNUSED
	expBarWidth 		= 0.25 * screenWidth
	-- expBarWidth is not set because it varies for centering

	-- BOTTOM PART SCREEN
	testBarWidth = 0.5 * screenWidth
	topBarStartX = 0.07 * screenWidth

	gui:drawTopAndBottomDisplay()
end



function gui:drawTopAndBottomDisplay()
	testBarX = screenWidth * 0.5 - testBarWidth/2
	testBarY = screenHeight * (1 - screenOffsetFactor) - bottomBarHeight

	-- draw bottom UI first
	-- draw the test bar

	testBarXScale = testBarWidth / rectangle_box_icons:getWidth()
	testBarYScale = bottomBarHeight / rectangle_box_icons:getHeight()

	setColorWhite()
	love.graphics.draw(rectangle_box_icons, testBarX, testBarY, 0, testBarXScale, testBarYScale)
	
	-- draw the help and manual buttons
	x1 = testBarX - bottomBarHeight - (screenWidth * screenOffsetFactor)
	x2 = testBarX + testBarWidth + (screenWidth * screenOffsetFactor)
	x0 = x1 - bottomBarHeight - screenOffsetFactor * screenWidth

	-- draw outlines for tests
	offset = bottomBarHeight * 0.1
	
	squareWidth = (testBarWidth - offset) / numberOfTests - offset
	squareScale = squareWidth / square:getWidth()

	-- draw tests
	setFont(DEFAULT_FONT_SIZE)
	textWidth = font:getWidth("TEST N")
	testIconBoxes={}

	for i = 1, symptoms_unlocked do
		setColorWhite()
		xpos = testBarX + offset * i + squareWidth * (i - 1)
		ypos = testBarY + (bottomBarHeight - squareWidth)/2
		love.graphics.draw(icontest[i], xpos, ypos, 0, squareScale, squareScale)
		testIconBoxes[i] = {x = xpos, y = ypos, 
			width = icontest[i]:getWidth() * squareScale, height = icontest[i]:getHeight() * squareScale}
		if (util.withinObj(mouseX, mouseY, testIconBoxes[i])) then
			love.graphics.draw(icon_highlight, xpos, ypos, 0, squareScale, squareScale)
			setColorBlack()
			local font_width = love.graphics.getFont():getWidth(symptoms[i])
			local text_x = xpos
			text_x = text_x + icontest[i]:getWidth() * squareScale * 0.5
			text_x = text_x - font_width * 0.5
			local text_y = ypos - DEFAULT_FONT_SIZE * 1.5
			love.graphics.print(symptoms[i], text_x, text_y)
			setColorWhite()
		end
		-- print the test names
		--setColorBlack()
		--love.graphics.print("TEST " .. tostring(i),
		--	xpos+squareWidth/2-textWidth/2,
		--	ypos+squareWidth/2-textHeight/2)
	end

	-- large confirm button, display only if all the patients have been treated
	--if stage_num_patients_untreated==0 then
	confirmButton = {x = x0, y = testBarY, width = bottomBarHeight, height = bottomBarHeight}
	if stage_num_patients_untreated==0 then
			love.graphics.draw(icon_end_day, x0, testBarY, 0, scaleX, scaleX)
			if (util.withinObj(mouseX, mouseY, confirmButton)) then			
				love.graphics.draw(icon_highlight, x0, testBarY, 0, scaleX, scaleX)
			end
			--love.graphics.draw(rectangle_confirm, testBarX, testBarY, 0, testBarXScale, testBarYScale)
	end
	--rectangleConfirmButton = {testBarX, testBarY, testBarWidth, bottomBarHeight}



	setFont(DEFAULT_FONT_SIZE)

	setColorWhite()
	scaleX = bottomBarHeight / square:getWidth()
	
	-- MUSIC
	--love.graphics.draw(icon_music, x0, testBarY, 0, scaleX, scaleX)
	--musicButton = {x0, testBarY, bottomBarHeight}

	-- HELP
	love.graphics.draw(icon_help, x1, testBarY, 0, scaleX, scaleX)
	helpButton = {x = x1, y = testBarY, width = bottomBarHeight, height = bottomBarHeight}
	if (util.withinObj(mouseX, mouseY, helpButton)) then
		love.graphics.draw(icon_highlight, x1, testBarY, 0, scaleX, scaleX)
	end

	-- MANUAL
	love.graphics.draw(icon_manual, x2, testBarY, 0, scaleX, scaleX)
	manualButton = {x = x2, y = testBarY, width = bottomBarHeight, height = bottomBarHeight}
	if (util.withinObj(mouseX, mouseY, manualButton)) then
		love.graphics.draw(icon_highlight, x2, testBarY, 0, scaleX, scaleX)
	end



	-- CONFIRM button
	-- NOTE: this should be displayed only if all the patients received a treatment
--	x_center = screenWidth * 0.5 - bottomBarHeight/2/1.5
--	y_confirm = screenHeight * (1 - screenOffsetFactor) - 2*bottomBarHeight
--	love.graphics.draw(icon_end_day, x_center, y_confirm, 0, scaleX/1.5, scaleX/1.5)
--	love.graphics.draw(icon_end_day, x0, testBarY, 0, scaleX, scaleX)
--	confirmButton = {x_center, y_confirm, bottomBarHeight/1.5}
--	confirmButton = {x0, testBarY, bottomBarHeight}

--	testBarX = screenWidth * 0.5 - testBarWidth/2
--	testBarY = screenHeight * (1 - screenOffsetFactor) - bottomBarHeight


	-- Add text to UI
	--setColorBlack()
	--textWidth = font:getWidth("HELP")
	--love.graphics.print("HELP",
	--	x1 + bottomBarHeight/2 - textWidth/2,
	--	testBarY + bottomBarHeight/2 - textHeight/2)

	--textWidth = font:getWidth("MANUAL")
	--love.graphics.print("MANUAL",
	--	x2 + bottomBarHeight/2 - textWidth/2,
	--	testBarY + bottomBarHeight/2 - textHeight/2)
	
	-- draw top bars: stage, progress, level, experience





	-- STAGE (DAY) AND GOAL
	setColorLightBlue()
	stageBarX = topBarStartX
--	love.graphics.rectangle("fill", stageBarX, screenOffsetFactor * screenHeight,
--		stageBarWidth, topBarHeight)
--	setColorBlack()
--	love.graphics.rectangle("line", stageBarX, screenOffsetFactor * screenHeight, 
--		stageBarWidth, topBarHeight)
	--
	testBarXScale = stageBarWidth / rectangle_box_icons:getWidth()
	testBarYScale = topBarHeight / rectangle_box_icons:getHeight()
	setColorWhite()
	love.graphics.draw(rectangle_box_icons, stageBarX, screenOffsetFactor * screenHeight, 0,  testBarXScale, testBarYScale)
--	setColorWhite()
--	love.graphics.draw(rectangle_box_icons, testBarX, testBarY, 0, testBarXScale, testBarYScale)


--	stageString = "Day "..tostring(stage)
	if patients_goal==1 then
		stageString = "Day "..tostring(stage).." - Goal: "..tostring(patients_goal).." patient"
	else
		stageString = "Day "..tostring(stage).." - Goal: "..tostring(patients_goal).." patients"
	end
	textWidth = font:getWidth(stageString)
	love.graphics.print(stageString,
		stageBarX + stageBarWidth/2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)



	-- PROGRESS (TESTS AVAILABLE)
--	setColorLightBlue()
	progressBarX = stageBarX + stageBarWidth + screenOffsetFactor * screenWidth
--	love.graphics.rectangle("fill", progressBarX,
--		screenOffsetFactor * screenHeight, progressBarWidth,
--		topBarHeight)

--	setColorBlack()
--	love.graphics.rectangle("line", progressBarX,
--		screenOffsetFactor * screenHeight, progressBarWidth,
--		topBarHeight)

	testBarXScale = progressBarWidth / rectangle_box_icons:getWidth()
	testBarYScale = topBarHeight / rectangle_box_icons:getHeight()
	setColorWhite()
	love.graphics.draw(rectangle_box_icons, progressBarX, screenOffsetFactor * screenHeight, 0,  testBarXScale, testBarYScale)


	--progressString = "Progress: "..tostring(testsAvailable).."/"..tostring(maxTests).." Tests Available"
	progressString = tostring(testsAvailable).."/"..tostring(maxTests).." Tests Available"
	textWidth = font:getWidth(progressString)

	love.graphics.print(progressString, progressBarX + progressBarWidth / 2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 -textHeight/2)

	levelBarX = progressBarX + progressBarWidth + screenOffsetFactor * screenWidth

--	setColorLightBlue()
--	love.graphics.rectangle("fill", levelBarX, screenOffsetFactor * screenHeight,
--		levelBarWidth, topBarHeight)

--	setColorBlack()
--	love.graphics.rectangle("line", levelBarX, screenOffsetFactor * screenHeight,
--		levelBarWidth, topBarHeight)

	--levelString = "Level "..tostring(level)
	--textWidth = font:getWidth(levelString)
--	love.graphics.print(levelString,
--		levelBarX + levelBarWidth/2 - textWidth/2,
--		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)

	--expBarX = levelBarX + levelBarWidth + screenOffsetFactor * screenWidth
	expBarX = progressBarX + progressBarWidth + screenOffsetFactor * screenWidth
	--expBarWidth = screenWidth - topBarStartX - expBarX
--	setColorLightBlue()
--	love.graphics.rectangle("fill", expBarX, screenOffsetFactor * screenHeight,
--		expBarWidth, topBarHeight)

--	setColorBlack()
--	love.graphics.rectangle("line", expBarX, screenOffsetFactor * screenHeight,
--		expBarWidth, topBarHeight)

	testBarXScale = expBarWidth / rectangle_box_icons:getWidth()
	testBarYScale = topBarHeight / rectangle_box_icons:getHeight()
	setColorWhite()
	love.graphics.draw(rectangle_box_icons, expBarX, screenOffsetFactor * screenHeight, 0,  testBarXScale, testBarYScale)


	if level < max_level then
		maxExpStr = tostring(max_experience[level])
	else
		maxExpStr = "-"
	end
	--expString = " EXP: "..tostring(experience).."/"..maxExpStr
	expString = "Lv "..tostring(level).." - EXP "..tostring(experience).."/"..maxExpStr
	textWidth = font:getWidth(expString)

	love.graphics.print(expString,
		expBarX + expBarWidth/2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)

	-- draw return button
	returnX = x2 + bottomBarHeight + screenOffsetFactor * screenWidth
	setColorWhite()
	local hospital_loc = {x = returnX, y = testBarY, 
		width = icon_hospital:getWidth() * scaleX, height = icon_hospital:getHeight() * scaleX}
	love.graphics.draw(icon_hospital, returnX, testBarY, 0, scaleX, scaleX)
	if (util.withinObj(mouseX, mouseY, hospital_loc)) then
		love.graphics.draw(icon_highlight, returnX, testBarY, 0, scaleX, scaleX)
	end
	returnButton = {returnX, testBarY, square:getWidth()}

	setColorBlack()
	--textWidth = font:getWidth("Go Back")
	--love.graphics.print("Go Back",
	--	returnX + bottomBarHeight/2 - textWidth/2,
	--	testBarY + bottomBarHeight/2 - textHeight/2)
end



function gui:mousepressed(x,y)
	if x >= returnX and x <= returnX + bottomBarHeight and y >= testBarY and y <= testBarY + bottomBarHeight then
		if skill_points>0 then
			page = "SKILLS"
		elseif page == "MANUAL" and currently_testing then
			page = "TEST"
		else
			page = "MAIN"
		end
	end
	-- move to manual page
	if util.withinObj(x, y, manualButton) then
		if page == "TEST" then
			currently_testing = true
		end
		page = "MANUAL"
		
	end	

	-- move to skill points page (for testing - should add own button later)
	xx = expBarX
	yy = screenOffsetFactor * screenHeight
	dx = expBarWidth
	dy = topBarHeight
	if x >= xx and x <= xx + dx and y >= yy and y <= yy + dy then
		page = "SKILLS"
	end

	-- increment xp by 11 - for testing purposes, need to remove later
	--xx = levelBarX
	--yy = screenOffsetFactor * screenHeight
	--dx = levelBarWidth
	--dy = topBarHeight
	--if x >= xx and x <= xx + dx and y >= yy and y <= yy + dy then
	--	incrementExp(11)
	--end

	-- move to help page
	if util.withinObj(x, y, helpButton) then
		page = "HELP"
	end	

	-- move to next stage using the tick button - for testing purposes, will change later
	if stage_num_patients_untreated==0 and util.withinObj(x, y, confirmButton) then
		if trigger_end then
			page = "END_SCREEN"
			--print("triggered")
		else
			--print("also")
			evaluateStage()
			if stage == 8 then
				page = "END_SCREEN"
			else
				page = "STAGE_EVALUATION"
			end
		end 
		--page = "MAIN"
	end	
	-- move to next stage using the large confirm button (only if all patients have been treated)
	--if stage_num_patients_untreated==0 and x >= rectangleConfirmButton[1] and x <= rectangleConfirmButton[1] + rectangleConfirmButton[3] and y >= rectangleConfirmButton[2] and y <= rectangleConfirmButton[2] + rectangleConfirmButton[4] then
	--	stage = stage + 1
	--	loadNewStage(stage)
	--	page = "MAIN"
	--end	

end

return gui