local end_screen = {}

function end_screen:draw()
	text1 = "CONGRATULATIONS! You have beaten the game!"
	text2 = "Patients encountered = "
	text3 = "Patients saved = "
	text4 = "Restart Game"
	startX = screenWidth*0.3
	startY = screenWidth*0.2
	setColorBlack()
	love.graphics.print(text1, startX, startY)
	love.graphics.print(text2, startX, startY + font:getHeight(text1) + 10)
	love.graphics.print(patients_encountered, startX + font:getWidth(text2), startY + font:getHeight(text1) + 10)
	love.graphics.print(text3, startX, startY + font:getHeight(text1) + 10 + font:getHeight(text2) + 10 )
	love.graphics.print(patients_saved_game, startX + font:getWidth(text3), startY + font:getHeight(text1) + 10 + font:getHeight(text2) + 10 )
	reset_button_X = screenWidth*0.4
	reset_button_Y = screenWidth*0.4
	button_width = font:getWidth(text4)
	button_height = font:getHeight(text4)
	setColorRed()
	love.graphics.rectangle('fill',reset_button_X, reset_button_Y, button_width, button_height)
	setColorBlack()
	love.graphics.print(text4, reset_button_X, reset_button_Y)
end

function end_screen:mousepressed(x,y)
	if x >= reset_button_X and x <= reset_button_X + button_width and y >= reset_button_Y and y <= reset_button_Y + button_height then
		love.load()
		--print("clicked")
	end
end
return end_screen
