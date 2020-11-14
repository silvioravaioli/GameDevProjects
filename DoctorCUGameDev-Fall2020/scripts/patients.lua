local patients = {}

local testPatient = {
	name="Bob Ross",
	bio="Likes to paint",
	photo=love.graphics.newImage("assets/greenOrb.png"),
	symptoms={},
}

function patients:draw(patient)
	love.graphics.setColor(0,0,0,255)
	love.graphics.print(patient.name .. '\n' .. patient.bio, 400, 300)
	love.graphics.setColor(1,1,1)
end

return patients