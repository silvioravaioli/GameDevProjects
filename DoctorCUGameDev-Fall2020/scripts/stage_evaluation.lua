--diseases = {}

local stage_evaluation = {}


-- DRAW
function stage_evaluation:draw()

    -- set size of the table
    local tableX = 0.14 * screenHeight
    local tableY = 0.14 * screenWidth
    local dx = 260
    local dy = 80
	for x = 0, 3 do
		for y = 0, 6 do
			love.graphics.rectangle("line", tableX + x*dx, tableY + y*dy, dx, dy)
		end
    end
    
    -- headers for the table (row 1)
    local tableLabels = {[0] = "Patients",[1] = "Treatment", [2] = "Cured?", [3] = "Points"}

    -- fill the table, one cell at the time
	for y = 0, 6 do
        for x = 0, 3 do

            -- header
            if y == 0 then
                local textWidth = font:getWidth(tableLabels[x])
                local textHeight = font:getHeight(tableLabels[x])
                love.graphics.print(tableLabels[x], tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)


            -- patient: name
            elseif x == 0 then
                local text = tostring(stage_evaluation_names[y])
                local textWidth = font:getWidth(tableLabels[x])
                local textHeight = font:getHeight(tableLabels[x])
                love.graphics.print(text, tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            -- patient: treatment
            elseif x == 1 then
                local text = tostring(stage_evaluation_treatments[y])
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                love.graphics.print(text, tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            -- patient: cured?
            elseif x == 2 then
                local text = tostring(stage_evaluation_cured[y])
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                love.graphics.print(text, tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            -- patient: points
            elseif x == 3 then
                local text = tostring(stage_evaluation_points[y])
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                love.graphics.print(text, tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            end
        end
    end
end


function stage_evaluation:mousepressed(x,y)

end


return stage_evaluation
