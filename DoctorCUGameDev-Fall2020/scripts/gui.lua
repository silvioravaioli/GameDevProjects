local gui = {}


function gui:draw()
	stageBarWidth = 0.1 * screenWidth
	progressBarWidth = 0.4 * screenWidth
	levelBarWidth = 0.12 * screenWidth
	-- expBarWidth is not set because it varies for centering
	testBarWidth = 0.5 * screenWidth
	topBarStartX = 0.1 * screenWidth

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
	setFont(25)
	textWidth = font:getWidth("TEST N")
	testIconBoxes={}

	for i = 1, numberOfTests do
		setColorWhite()
		xpos = testBarX + offset * i + squareWidth * (i - 1)
		ypos = testBarY + (bottomBarHeight - squareWidth)/2
		love.graphics.draw(icontest[i], xpos, ypos, 0, squareScale, squareScale)
		testIconBoxes[i] = {xpos, ypos, square:getWidth()}
		-- print the test names
		--setColorBlack()
		--love.graphics.print("TEST " .. tostring(i),
		--	xpos+squareWidth/2-textWidth/2,
		--	ypos+squareWidth/2-textHeight/2)
	end

	-- large confirm button, display only if all the patients have been treated
	--if stage_num_patients_untreated==0 then
	if stage_num_patients_untreated==0 then
		love.graphics.draw(rectangle_confirm, testBarX, testBarY, 0, testBarXScale, testBarYScale)
	end
	rectangleConfirmButton = {testBarX, testBarY, testBarWidth, bottomBarHeight}



	setFont(defaultFontSize)

	setColorWhite()
	scaleX = bottomBarHeight / square:getWidth()
	
	-- MUSIC
	love.graphics.draw(icon_music, x0, testBarY, 0, scaleX, scaleX)
	musicButton = {x0, testBarY, bottomBarHeight}

	-- HELP
	love.graphics.draw(icon_help, x1, testBarY, 0, scaleX, scaleX)
	helpButton = {x1, testBarY, bottomBarHeight}

	-- MANUAL
	love.graphics.draw(icon_manual, x2, testBarY, 0, scaleX, scaleX)
	manualButton = {x2, testBarY, bottomBarHeight}




	-- CONFIRM button
	-- NOTE: this should be displayed only if all the patients received a treatment
--	x_center = screenWidth * 0.5 - bottomBarHeight/2/1.5
--	y_confirm = screenHeight * (1 - screenOffsetFactor) - 2*bottomBarHeight
--	love.graphics.draw(icon_end_day, x_center, y_confirm, 0, scaleX/1.5, scaleX/1.5)
	love.graphics.draw(icon_end_day, x0, testBarY, 0, scaleX, scaleX)
--	confirmButton = {x_center, y_confirm, bottomBarHeight/1.5}
	confirmButton = {x0, testBarY, bottomBarHeight}

--	testBarX = screenWidth * 0.5 - testBarWidth/2
--	testBarY = screenHeight * (1 - screenOffsetFactor) - bottomBarHeight


	-- Add text to UI
	setColorBlack()
	--textWidth = font:getWidth("HELP")
	--love.graphics.print("HELP",
	--	x1 + bottomBarHeight/2 - textWidth/2,
	--	testBarY + bottomBarHeight/2 - textHeight/2)

	--textWidth = font:getWidth("MANUAL")
	--love.graphics.print("MANUAL",
	--	x2 + bottomBarHeight/2 - textWidth/2,
	--	testBarY + bottomBarHeight/2 - textHeight/2)
	
	-- draw top bars: stage, progress, level, experience
	setColorBlue()
	stageBarX = topBarStartX
	love.graphics.rectangle("fill", stageBarX, screenOffsetFactor * screenHeight,
		stageBarWidth, topBarHeight)
	setColorBlack()
	love.graphics.rectangle("line", stageBarX, screenOffsetFactor * screenHeight, 
		stageBarWidth, topBarHeight)

	stageString = "Stage "..tostring(stage)
	textWidth = font:getWidth(stageString)
	love.graphics.print(stageString,
		stageBarX + stageBarWidth/2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)

	-- progress bar
	setColorBlue()
	progressBarX = stageBarX + stageBarWidth + screenOffsetFactor * screenWidth
	love.graphics.rectangle("fill", progressBarX,
		screenOffsetFactor * screenHeight, progressBarWidth,
		topBarHeight)

	setColorBlack()
	love.graphics.rectangle("line", progressBarX,
		screenOffsetFactor * screenHeight, progressBarWidth,
		topBarHeight)

	progressString = "Progress: "..tostring(testsAvailable).."/"..tostring(maxTests).." Tests Available"
	textWidth = font:getWidth(progressString)

	love.graphics.print(progressString, progressBarX + progressBarWidth / 2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 -textHeight/2)

	levelBarX = progressBarX + progressBarWidth + screenOffsetFactor * screenWidth

	setColorBlue()
	love.graphics.rectangle("fill", levelBarX, screenOffsetFactor * screenHeight,
		levelBarWidth, topBarHeight)

	setColorBlack()
	love.graphics.rectangle("line", levelBarX, screenOffsetFactor * screenHeight,
		levelBarWidth, topBarHeight)

	levelString = "Level "..tostring(level)
	textWidth = font:getWidth(levelString)
	love.graphics.print(levelString,
		levelBarX + levelBarWidth/2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)

	expBarX = levelBarX + levelBarWidth + screenOffsetFactor * screenWidth
	expBarWidth = screenWidth - topBarStartX - expBarX
	setColorBlue()
	love.graphics.rectangle("fill", expBarX, screenOffsetFactor * screenHeight,
		expBarWidth, topBarHeight)

	setColorBlack()
	love.graphics.rectangle("line", expBarX, screenOffsetFactor * screenHeight,
		expBarWidth, topBarHeight)

	expString = " EXP: "..tostring(experience).."/"..tostring(maxExperience)
	textWidth = font:getWidth(expString)

	love.graphics.print(expString,
		expBarX + expBarWidth/2 - textWidth/2,
		screenOffsetFactor * screenHeight + topBarHeight/2 - textHeight/2)

	-- draw return button
	returnX = x2 + bottomBarHeight + screenOffsetFactor * screenWidth
	setColorWhite()
	love.graphics.draw(icon_hospital, returnX, testBarY, 0, scaleX, scaleX)
	returnButton = {returnX, testBarY, square:getWidth()}

	setColorBlack()
	--textWidth = font:getWidth("Go Back")
	--love.graphics.print("Go Back",
	--	returnX + bottomBarHeight/2 - textWidth/2,
	--	testBarY + bottomBarHeight/2 - textHeight/2)
end



function gui:mousepressed(x,y)
	if x >= returnX and x <= returnX + bottomBarHeight and y >= testBarY and y <= testBarY + bottomBarHeight then
		page = "MAIN"
	end
	-- move to manual page
	xx = manualButton[1]
	yy = manualButton[2]
	ww = manualButton[3]
	if x >= xx and x <= xx + ww and y >= yy and y <= yy + ww then
		page = "MANUAL"
	end	

	-- move to next stage using the tick button - for testing purposes, will change later
	if x >= confirmButton[1] and x <= confirmButton[1] + confirmButton[3] and y >= confirmButton[2] and y <= confirmButton[2] + confirmButton[3] then
		stage = stage + 1
		loadNewStage(stage)
		page = "MAIN"
	end	
	-- move to next stage using the large confirm button (only if all patients have been treated)
	if stage_num_patients_untreated==0 and x >= rectangleConfirmButton[1] and x <= rectangleConfirmButton[1] + rectangleConfirmButton[3] and y >= rectangleConfirmButton[2] and y <= rectangleConfirmButton[2] + rectangleConfirmButton[4] then
		stage = stage + 1
		loadNewStage(stage)
		page = "MAIN"
	end	

end

return gui