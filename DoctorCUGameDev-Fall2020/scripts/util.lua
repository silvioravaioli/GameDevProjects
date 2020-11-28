local P = {}

function P.random(max_int)
	return math.floor(math.random(random)*maxVal)+1
end

function P.shuffle(arr,random)
	local shuffledArr = {}
	for i = 1, #arr do
		local index = util.random(#arr, random)
		while(shuffledArr[index]~=nil) do
			index = util.random(#arr, random)
		end
		shuffledArr[index] = arr[i]
	end
	return shuffledArr
end

util = P
return P