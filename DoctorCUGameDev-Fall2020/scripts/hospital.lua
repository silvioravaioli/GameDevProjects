local hospital = {}

hospital.patients = {}

function hospital:load()
	self.background = love.graphics.newImage("assets/redOrb.png");
	self.patients[1] = love.graphics.newImage("assets/redOrb.png");
	self.patients[2] = love.graphics.newImage("assets/blueOrb.png");
	self.patients[3] = love.graphics.newImage("assets/greenOrb.png");
	-- for patient in hospital.patients do
	-- 	patient:load()
	-- end
end

function hospital:draw()
	for i = 1, #self.patients do
		local patient = self.patients[i]
		love.graphics.draw(patient, 100+patient:getWidth()*2*(i - 1), 500, 0, 1, 1)
	end
	-- love.graphics.draw()
end

return hospital