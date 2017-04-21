timer = {}

function timer.load()
	w = love.graphics.getWidth()
end

function timer.update()
	if timer.startTime then 
	    timer.timeElapsed = love.timer.getTime() - timer.startTime
	end
end

function timer.draw()
	love.graphics.setColor(119,79,56)
	if timer.timeElapsed then
	    love.graphics.printf(string.format("%s", string.format("%.3f", timer.timeElapsed)), 0, 30, w, "center")
	end
	love.graphics.setColor(255, 255, 255)
end

function timer.start()
	timer.startTime = love.timer.getTime()
end