state = {}

local states = {["firstReadyState"] = "firstReadyState", ["firstRunState"] = "firstRunState", ["firstEndingState"] = "firstEndingState", ["secondReadyState"] = "secondReadyState", ["secondRunState"] = "secondRunState", ["endingState"] = "endingState"}

function state.load()
	state.currentState = states["firstReadyState"]
end

function state.update()
end

function state.draw()	
end