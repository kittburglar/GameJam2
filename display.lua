require "state"
require "controls"

display = {}

function display.load()
	leftFootImage = love.graphics.newImage("left.png")
	rightFootImage = love.graphics.newImage("right.png")
end

function display.update()
	
end

function display.draw()
	--print("Current state is: " .. state.currentState)
	if state.currentState == "firstReadyState" then
		love.graphics.setColor(119,79,56)
	    love.graphics.printf(string.format("%s", string.format("Player 1 Start Running", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	    love.graphics.setColor(255, 255, 255)
	elseif state.currentState == "firstRunState" and controls.lastButtonPressed == 1 then
	    love.graphics.draw(leftFootImage, love.graphics.getWidth()/2 - leftFootImage:getWidth()/2, love.graphics.getHeight()/2 - leftFootImage:getHeight()/2)
	    love.graphics.printf(string.format("%s", string.format("Right", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "firstRunState" and controls.lastButtonPressed == 2 then
	    love.graphics.draw(rightFootImage, love.graphics.getWidth()/2 - leftFootImage:getWidth()/2, love.graphics.getHeight()/2 - leftFootImage:getHeight()/2)
	    love.graphics.printf(string.format("%s", string.format("Left", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "secondReadyState" then
		love.graphics.setColor(119,79,56)
	    love.graphics.printf(string.format("%s", string.format("Player 2 Start Running", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	    love.graphics.setColor(255, 255, 255)
	elseif state.currentState == "secondRunState" and controls.lastButtonPressed == 1 then
	    love.graphics.draw(leftFootImage, love.graphics.getWidth()/2 - leftFootImage:getWidth()/2, love.graphics.getHeight()/2 - leftFootImage:getHeight()/2)
	    love.graphics.printf(string.format("%s", string.format("Right", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "secondRunState" and controls.lastButtonPressed == 2 then
	    love.graphics.draw(rightFootImage, love.graphics.getWidth()/2 - leftFootImage:getWidth()/2, love.graphics.getHeight()/2 - leftFootImage:getHeight()/2)
	    love.graphics.printf(string.format("%s", string.format("Left", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "endingState" then
		if controls.playerOneBestTime < controls.playerTwoBestTime then
			love.graphics.printf("Player 1 Wins", 0, love.graphics.getHeight()/4, w, "center")
		else
			love.graphics.printf("Player 2 Wins", 0, love.graphics.getHeight()/4, w, "center")
		end
	end
end