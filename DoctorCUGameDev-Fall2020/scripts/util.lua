local P = {}

-- function P.random(max_int)
-- 	return math.floor(math.random()*max_int)+1
-- end

function P.shuffle(arr)
	local shuffledArr = {}
	for i = 1, #arr do
		local index = math.random(#arr)
		while(shuffledArr[index]~=nil) do
			index = math.random(#arr)
		end
		shuffledArr[index] = arr[i]
	end
	return shuffledArr
end


function P.withinObj(x, y, range)
	if not range or not range.x then
		return false
	end
	if x >= range.x and x <= range.x + range.width
	  and y >= range.y and y <= range.y + range.height then
		return true
	end
	return false
end

util = P
return P