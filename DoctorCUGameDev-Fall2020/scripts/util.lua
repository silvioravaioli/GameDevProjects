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

util = P
return P