--diseases = {}

local stage_evaluation = {}


-- DRAW
function stage_evaluation:draw()

    -- set size of the table
    local dx0 = 400
    local dx = 260
    local dy = 80
    local tableX = screenWidth/2 - 2 * dx
    local tableY = 0.07 * screenWidth
	for x = 0, 3 do
		for y = 0, stage_num_patients_total_old do
            if x==0 then
    			love.graphics.rectangle("line", tableX + x*dx, tableY + y*dy, dx0, dy)
            else
                love.graphics.rectangle("line", tableX + (x-1)*dx+dx0, tableY + y*dy, dx, dy)
            end
		end
    end
    
    -- headers for the table (row 1)
    local tableLabels = {[0] = "Patients",[1] = "Treatment", [2] = "Cured?", [3] = "Points"}

    -- fill the table, one cell at the time
	for y = 0, stage_num_patients_total_old do
        for x = 0, 3 do

            -- header
            if y == 0 then
                local textWidth = font:getWidth(tableLabels[x])
                local textHeight = font:getHeight(tableLabels[x])
                local Xcoordinates = tableX + dx/2 - 0.75 * textWidth/2 + x*dx
                if x>0 then
                    Xcoordinates = Xcoordinates+140
                end
                love.graphics.print(tableLabels[x], Xcoordinates, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)


            -- patient: name
            elseif x == 0 then
                if stage_evaluation_cured[y]==1 then
                    setColorGreen()
                else
                    setColorRed()
                end
                local text = tostring(stage_evaluation_names[y])
                local textWidth = font:getWidth(tableLabels[x])
                local textHeight = font:getHeight(tableLabels[x])
                local Xcoordinates = tableX + dx/3 - 0.75 * textWidth/2 + x*dx
                love.graphics.print(text, Xcoordinates, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            -- patient: treatment
            elseif x == 1 then
                local text = tostring(treatments[stage_evaluation_treatments[y]])
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                local Xcoordinates = tableX + dx/2 - 0.75 * textWidth/2 + x*dx +140
                love.graphics.print(text, Xcoordinates, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            -- patient: cured?
            elseif x == 2 then
                if stage_evaluation_cured[y]==1 then
                    text = tostring("YES")
                else
                    text = tostring("NO")
                end
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                local Xcoordinates = tableX + dx/2 - 0.75 * textWidth/2 + x*dx +140
                love.graphics.print(text, Xcoordinates, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
            -- patient: points
            elseif x == 3 then
                local text = tostring(stage_evaluation_points[y])
                local textWidth = font:getWidth(text)
                local textHeight = font:getHeight(text)
                local Xcoordinates = tableX + dx/2 - 0.75 * textWidth/2 + x*dx +140
                love.graphics.print(text, Xcoordinates, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
                setColorBlack()
            end
        end
    end

    -- Display the outcome message
    y=stage_num_patients_total_old+1
    x=0
    local textWidth = font:getWidth(tableLabels[x])
    local textHeight = font:getHeight(tableLabels[x])
    if level_pass==1 then
        setColorGreen()
        text = "GOOD JOB! You are ready for the NEXT DAY"
    else
        setColorRed()
        text = "OH NO! Better REPEAT THE DAY... and read more carefully the manual!"
    end
    love.graphics.print(text, tableX + dx/2 - 0.75 * textWidth/2 + x*dx, tableY + dy/2 - 0.75 * textHeight/2 + y*dy, 0, 0.75)
    setColorBlack()

end


function stage_evaluation:mousepressed(x,y)

end


return stage_evaluation
