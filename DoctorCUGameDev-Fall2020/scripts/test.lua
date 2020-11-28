local tests = {}

Test = {
	name = "Basic Test",            -- name of test
	grade = "S",                    -- indicates quality of test
	duration = 0,                   -- time required to run test
	icon = "assets/redOrb.jpg",    -- icon file
	symptoms = {}
}

function Test:new(name, grade, duration, icon)
	setmetatable({}, test)
	self.name = name
	self.grade = grade
	self.duration = duration
	self.icon = icon

	return self
end

function Test:toString()
	testStr = string.format("Test: %s\nGrade:: %s\nTime Required:%s\n", self.name, self.grade, self.duration)
	return testStr
end





return tests
