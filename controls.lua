require "helper"

controls = {}

padding = 40
buttonSize = 80
maxProgress = 5

function controls.load()
	 
	controls.buttonOneWidth = buttonSize
	controls.buttonOneHeight = buttonSize
	controls.buttonOneX = padding
	controls.buttonOneY = love.graphics.getHeight() - controls.buttonOneHeight - padding
	controls.buttonOneColour = {255, 0, 0}

	
	controls.buttonTwoWidth = buttonSize
	controls.buttonTwoHeight = buttonSize
	controls.buttonTwoX = love.graphics.getWidth() - padding - controls.buttonTwoWidth
	controls.buttonTwoY = love.graphics.getHeight() - controls.buttonTwoHeight - padding
	controls.buttonTwoColour = {0, 255, 0}
	controls.lastButtonPressed = 0

	controls.playerOneMaxProgress = 0
	controls.playerProgress = 0

	controls.playerTurn = 1
	controls.firstButtonPressed = true
end

function controls.update()
	if love.mouse.isDown(1) then
		if controls.firstButtonPressed == true then
		    timer.start()
		end
		if helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) and (controls.lastButtonPressed == 0 or controls.lastButtonPressed == 2) then
			print("Pressing button 1")
			controls.lastButtonPressed = 1
			controls.playerProgress = controls.playerProgress + 1
			controls.firstButtonPressed = false
		elseif helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight) and (controls.lastButtonPressed == 0 or controls.lastButtonPressed == 1) then
			print("Pressing button 2")
			controls.lastButtonPressed = 2
			controls.playerProgress = controls.playerProgress + 1
			controls.firstButtonPressed = false
		end

		

		if controls.playerTurn == 1 and controls.playerProgress >= maxProgress then
		    controls.playerOneMaxProgress = controls.playerProgress
		    print("Number of steps: " .. controls.playerOneMaxProgress .. " in " .. timer.timeElapsed .. " seconds." )
		end
	end
end

function controls.draw()
	love.graphics.setColor(controls.buttonOneColour[1], controls.buttonOneColour[2], controls.buttonOneColour[3])
	love.graphics.rectangle("fill", controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight)
	love.graphics.setColor(controls.buttonTwoColour[1], controls.buttonTwoColour[2], controls.buttonTwoColour[3])
	love.graphics.rectangle("fill", controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight)
end

