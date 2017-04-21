require "helper"
require "state"

controls = {}

padding = 40
buttonSize = 80
maxProgress = 20

function controls.load()
	 
	controls.buttonOneWidth = buttonSize
	controls.buttonOneHeight = buttonSize
	controls.buttonOneX = padding
	controls.buttonOneY = love.graphics.getHeight() - controls.buttonOneHeight - padding
	controls.buttonOneColour = {119,79,56}

	
	controls.buttonTwoWidth = buttonSize
	controls.buttonTwoHeight = buttonSize
	controls.buttonTwoX = love.graphics.getWidth() - padding - controls.buttonTwoWidth
	controls.buttonTwoY = love.graphics.getHeight() - controls.buttonTwoHeight - padding
	controls.buttonTwoColour = {119,79,56}
	controls.lastButtonPressed = 0

	controls.playerOneBestTime = 0
	controls.playerTwoBestTime = 0
	controls.playerProgress = 0

	controls.playerTurn = 1
	controls.firstButtonPressed = true
end

function controls.reset()
	controls.lastButtonPressed = 0

	controls.playerOneBestTime = 0
	controls.playerTwoBestTime = 0
	controls.playerProgress = 0

	controls.playerTurn = 1
	controls.firstButtonPressed = true
end

function controls.pressedButton(x, y)
	
	if (helper.isPointInRect(x, y, controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) or 
		helper.isPointInRect(x, y, controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight)) and 
		state.currentState == "firstReadyState" then
		print("State 1")
	    timer.start()
	    state.currentState = "firstRunState"
	
	-- Ending Run
	elseif state.currentState == "firstRunState" and controls.playerProgress >= maxProgress then
		print("State 2")
	    controls.playerOneBestTime = timer.timeElapsed
	    print("Player one best time: " .. controls.playerOneBestTime .. " in " .. timer.timeElapsed .. " seconds." )
	    timer.startTime = nil
	    timer.timeElapsed = nil
	    controls.playerProgress = 0
	    state.currentState = "secondReadyState"

	-- Running
	elseif state.currentState == "firstRunState" and helper.isPointInRect(x, y, controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) and 
		(controls.lastButtonPressed == 0 or controls.lastButtonPressed == 2) then
		controls.lastButtonPressed = 1
		controls.playerProgress = controls.playerProgress + 1
		state.currentState = "firstRunState"
		print("State 3")
	elseif state.currentState == "firstRunState" and helper.isPointInRect(x, y, controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight) and 
		(controls.lastButtonPressed == 0 or controls.lastButtonPressed == 1) then
		controls.lastButtonPressed = 2
		controls.playerProgress = controls.playerProgress + 1
		state.currentState = "firstRunState"
		print("State 4")
	--Will refactor later lol (second player)

	-- Begin run
	elseif (helper.isPointInRect(x, y, controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) or 
		helper.isPointInRect(x, y, controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight)) and 
		state.currentState == "secondReadyState" then
	    timer.start()
	    print("State 5")
	    state.currentState = "secondRunState"
	-- Ending Run
	elseif state.currentState == "secondRunState" and controls.playerProgress >= maxProgress then
	    controls.playerTwoBestTime = controls.playerProgress
	    print("Player two best time: " .. controls.playerTwoBestTime .. " in " .. timer.timeElapsed .. " seconds." )
	    state.currentState = "secondReadyState"
	    timer.startTime = nil
	    if controls.playerOneBestTime < controls.playerTwoBestTime then
	        print("Player 1 wins")
	    else 
	    	print("Player 2 wins")
	    end
		print("State 6")
		state.currentState = "firstReadyState"
		controls.load()
	-- Running
	elseif helper.isPointInRect(x, y, controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) and 
		(controls.lastButtonPressed == 0 or controls.lastButtonPressed == 2) then
		controls.lastButtonPressed = 1
		controls.playerProgress = controls.playerProgress + 1
		state.currentState = "secondRunState"
		print("State 7")
	elseif helper.isPointInRect(x, y, controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight) and 
		(controls.lastButtonPressed == 0 or controls.lastButtonPressed == 1) then
		controls.lastButtonPressed = 2
		controls.playerProgress = controls.playerProgress + 1
		state.currentState = "secondRunState"
		print("State 8")
	end

	
end

function controls.update()
end

function controls.draw()
	love.graphics.setColor(controls.buttonOneColour[1], controls.buttonOneColour[2], controls.buttonOneColour[3])
	love.graphics.rectangle("fill", controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight)
	love.graphics.setColor(controls.buttonTwoColour[1], controls.buttonTwoColour[2], controls.buttonTwoColour[3])
	love.graphics.rectangle("fill", controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight)
end

function love.keypressed(key, unicode)
    if key == "left" then
    	controls.pressedButton(controls.buttonOneX + 10, controls.buttonOneY + 10)
    elseif key == "right" then
    	controls.pressedButton(controls.buttonTwoX + 10, controls.buttonTwoY + 10)
    end
end

