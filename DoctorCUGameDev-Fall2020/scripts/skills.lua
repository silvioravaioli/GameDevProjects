--diseases = {}

local skills = {}

function skills:draw()
    local tableX = 0.14 * screenHeight
    local tableY = 0.14 * screenWidth
    local dx = 260
    local dy = 80
	for x = 0, 3 do
		for y = 0, 6 do
			love.graphics.rectangle("line", tableX + x*dx, tableY + y*dy, dx, dy)
		end
    end
    
    local tableLabels = {[1] = "Current level", [2] = "Current accuracy", [3] = "Next level", [4] = ""}
    local testLabels = {[0] = "", [1] = "Test A", [2] = "Test B", [3] = "Test C", [4] = "Test D", [5] = "Test E", [6] = "Test F"}
	for x = 0, 4 do
        for y = 0, 6 do
            if x == 0 then
                local textWidth = font:getWidth(testLabels[y])
                local textHeight = font:getHeight(testLabels[y])
                love.graphics.print(testLabels[y], tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            elseif y == 0 then
                local textWidth = font:getWidth(tableLabels[x])
                local textHeight = font:getHeight(tableLabels[x])
                love.graphics.print(tableLabels[x], tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            elseif x == 1 then
                local text = tostring(treatment.accuracy_level[x])
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                love.graphics.print(text, tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            elseif x == 2 then
                local text = tostring(treatment.accuracy_prob[x])
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                love.graphics.print(text, tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            elseif x == 3 then
                local future_prob = treatment.accuracy_prob[x] + 0.05
                if future_prob > 1 then
                    future_prob = 1
                end
                local text = tostring(future_prob)
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                love.graphics.print(text, tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            elseif x == 4 then
                local textWidth = font:getWidth("+")
                local textHeight = font:getHeight("+")
                love.graphics.print("+", tableX + dx*0.2 - 1.25 * textWidth/2 + x*dx, tableY + dy/2 - 1.25 * textHeight/2 + y*dy, 0, 1.25)
            end
        end
    end
end


function skills:mousepressed(x,y)

end


return skills
