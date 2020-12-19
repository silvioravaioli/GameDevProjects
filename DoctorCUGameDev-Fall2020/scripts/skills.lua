--diseases = {}

local skills = {}

function skills:draw()
    tableX = 0.14 * screenHeight
    tableY = 0.14 * screenWidth
    dx = 256
    dy = 64
	for x = 0, 3 do
		for y = 0, 6 do
			love.graphics.rectangle("line", tableX + x*dx, tableY + y*dy, dx, dy)
		end
	end
end



function skills:mousepressed(x,y)
	for x = 0, 3 do
        for y = 0, 
    end
end


return skills
