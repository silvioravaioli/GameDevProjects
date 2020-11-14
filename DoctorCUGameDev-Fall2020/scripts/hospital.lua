local hospital = {}

hospital.patients = {}

function hospital:load()
	hospital.background = love.graphics.newImage("assets/redOrb.png");
	hospital.patients[1] = love.graphics.newImage("assets/redOrb.png");
	hospital.patients[2] = love.graphics.newImage("assets/redOrb.png");
	hospital.patients[3] = love.graphics.newImage("assets/redOrb.png");
	-- for patient in hospital.patients do
	-- 	patient:load()
	-- end
end

function hospital:draw()
	-- love.graphics.draw()
end

return hospital