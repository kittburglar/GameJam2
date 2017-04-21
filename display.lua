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
	love.graphics.setColor(119,79,56)
	if state.currentState == "firstReadyState" then
	    love.graphics.printf(string.format("%s", string.format("Player 1 \n\nGet Ready To Run", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	    
	elseif state.currentState == "firstRunState" and controls.lastButtonPressed == 1 then
		love.graphics.setColor(255, 255, 255)
	    love.graphics.draw(leftFootImage, love.graphics.getWidth()/2 - leftFootImage:getWidth()/2, love.graphics.getHeight()/2 - leftFootImage:getHeight()/2)
	    love.graphics.setColor(119,79,56)
	    love.graphics.printf(string.format("%s", string.format("Right", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "firstRunState" and controls.lastButtonPressed == 2 then
		love.graphics.setColor(255, 255, 255)
	    love.graphics.draw(rightFootImage, love.graphics.getWidth()/2 - leftFootImage:getWidth()/2, love.graphics.getHeight()/2 - leftFootImage:getHeight()/2)
	    love.graphics.setColor(119,79,56)
	    love.graphics.printf(string.format("%s", string.format("Left", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "secondReadyState" then
	    love.graphics.printf(string.format("%s", string.format("Player 2 \n\nGet Ready To Run", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "secondRunState" and controls.lastButtonPressed == 1 then
		love.graphics.setColor(255, 255, 255)
	    love.graphics.draw(leftFootImage, love.graphics.getWidth()/2 - leftFootImage:getWidth()/2, love.graphics.getHeight()/2 - leftFootImage:getHeight()/2)
	    love.graphics.setColor(119,79,56)
	    love.graphics.printf(string.format("%s", string.format("Right", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "secondRunState" and controls.lastButtonPressed == 2 then
		love.graphics.setColor(255, 255, 255)
	    love.graphics.draw(rightFootImage, love.graphics.getWidth()/2 - leftFootImage:getWidth()/2, love.graphics.getHeight()/2 - leftFootImage:getHeight()/2)
	    love.graphics.setColor(119,79,56)
	    love.graphics.printf(string.format("%s", string.format("Left", timer.timeElapsed)), 0, love.graphics.getHeight()/4, w, "center")
	elseif state.currentState == "endingState" then

		if controls.playerOneBestTime < controls.playerTwoBestTime then
			love.graphics.printf(string.format("Player 1 Wins\nP1 %.3f\nP2 %.3f", controls.playerOneBestTime, controls.playerTwoBestTime), 0, love.graphics.getHeight()/4, w, "center")
		else
			love.graphics.printf(string.format("Player 2 Wins\nP1 %.3f\nP2 %.3f", controls.playerOneBestTime, controls.playerTwoBestTime), 0, love.graphics.getHeight()/4, w, "center")
		end
	elseif state.currentState == "firstEndingState" then
		love.graphics.printf(string.format("%s", string.format("Player 1 \n\nGood Run\n\nP1 %.3f", controls.playerOneBestTime)), 0, love.graphics.getHeight()/4 - 20, w, "center")
	end
	love.graphics.setColor(255, 255, 255)
end