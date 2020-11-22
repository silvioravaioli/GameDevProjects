local patients = {}

local testPatient = {
	name="Bob Ross",
	bio="Likes to paint",
	exp= 1,
	photo=love.graphics.newImage("assets/Characters/Icon_Patient1.jpeg"),
	symptoms={
		{1, 50},
		{2, 100}
	},
}

function patients:draw(patient)
	patient = testPatient
	x = screenWidth/2 - centerUIWidth/2
	y = (lowerBound+upperBound)/2 - centerUIHeight/2
	scaleCenterX = centerUIWidth / centerRect:getWidth()
	scaleCenterY = centerUIHeight / centerRect:getHeight()
	setColorWhite()
	love.graphics.draw(centerRect, x, y, 0, scaleCenterX, scaleCenterY)

	-- love.graphics.rectangle("fill", 150, 100, 300, 500)
	-- love.graphics.setColor(0,0,0,255)
	-- love.graphics.print(patient.name, 200, 110, 0, 4)
	-- love.graphics.print(patient.exp, 200, 160, 0 ,2)
	-- love.graphics.print(patient.bio, 200, 190, 0 ,2)
	-- love.graphics.print("List of symptoms", 200, 230, 0 ,2)
	-- for i = 1, #patient.symptoms do
	-- 	love.graphics.setColor(0,0,0,255)
	-- 	symptom = patient.symptoms[i][1]
	-- 	--symptom_name = manual.symptoms[symptom]
	-- 	symptom_prob = patient.symptoms[i][2]
	-- 	love.graphics.print(symptom, 220, 240 + (40 * i), 0, 2)
	-- 	love.graphics.print(symptom_prob, 250, 240 + (40 * i), 0, 2)
	-- 	love.graphics.setColor(1,1,1)
	-- end
	
end

--function patients:drawinfo(patient)
	--maybe set color
	

return patients