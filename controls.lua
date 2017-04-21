require "helper"
require "state"

controls = {}

padding = 40
buttonSize = 80
maxProgress = 100

sound = love.audio.newSource("click.wav", "static")

function controls.load()
	controls.buttonOneWidth = buttonSize
	controls.buttonOneHeight = buttonSize
	controls.buttonOneX = padding
	controls.buttonOneY = love.graphics.getHeight() - controls.buttonOneHeight - padding
	controls.buttonOneColour = {224,142,121}

	controls.buttonTwoWidth = buttonSize
	controls.buttonTwoHeight = buttonSize
	controls.buttonTwoX = love.graphics.getWidth() - padding - controls.buttonTwoWidth
	controls.buttonTwoY = love.graphics.getHeight() - controls.buttonTwoHeight - padding
	controls.buttonTwoColour = {224,142,121}
	controls.lastButtonPressed = 0

	controls.startButtonWidth = buttonSize
	controls.startButtonHeight = buttonSize
	controls.startButtonX = love.graphics.getWidth()/2 - controls.startButtonWidth/2
	controls.startButtonY = love.graphics.getHeight()/2 - controls.startButtonHeight/2
	controls.startButtonColour = {224,142,121}

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
	if state.currentState == "endingState" and 
	(helper.isPointInRect(x, y, controls.startButtonX, controls.startButtonY, controls.startButtonWidth, controls.startButtonHeight)) then
	
		state.currentState = "firstReadyState"
		controls.load()
	elseif state.currentState == "firstEndingState" and
		(helper.isPointInRect(x, y, controls.startButtonX, controls.startButtonY, controls.startButtonWidth, controls.startButtonHeight)) then
		state.currentState = "secondReadyState"
		controls.playerProgress = 0
	elseif (helper.isPointInRect(x, y, controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) or 
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
	    
	    state.currentState = "firstEndingState"

	-- Running
	elseif state.currentState == "firstRunState" and helper.isPointInRect(x, y, controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) and 
		(controls.lastButtonPressed == 0 or controls.lastButtonPressed == 2) then
		controls.lastButtonPressed = 1
		controls.playerProgress = controls.playerProgress + 1
		state.currentState = "firstRunState"
		sound:stop()
		sound:setPitch(0.7)
		sound:play()
		print("State 3")
	elseif state.currentState == "firstRunState" and helper.isPointInRect(x, y, controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight) and 
		(controls.lastButtonPressed == 0 or controls.lastButtonPressed == 1) then
		controls.lastButtonPressed = 2
		controls.playerProgress = controls.playerProgress + 1
		state.currentState = "firstRunState"
		sound:stop()
		sound:setPitch(0.5)
		sound:play()
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
	    controls.playerTwoBestTime = timer.timeElapsed
	    print("Player two best time: " .. controls.playerTwoBestTime .. " in " .. timer.timeElapsed .. " seconds." )
	    state.currentState = "secondReadyState"
	    timer.startTime = nil
	    if controls.playerOneBestTime < controls.playerTwoBestTime then
	        print("Player 1 wins")
	    else 
	    	print("Player 2 wins")
	    end
		print("State 6")
		state.currentState = "endingState"
	-- Running
	elseif state.currentState == "secondRunState" and helper.isPointInRect(x, y, controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) and 
		(controls.lastButtonPressed == 0 or controls.lastButtonPressed == 2) then
		controls.lastButtonPressed = 1
		controls.playerProgress = controls.playerProgress + 1
		state.currentState = "secondRunState"
		sound:stop()
		sound:setPitch(0.7)
		sound:play()
		print("State 7")
	elseif state.currentState == "secondRunState" and helper.isPointInRect(x, y, controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight) and 
		(controls.lastButtonPressed == 0 or controls.lastButtonPressed == 1) then
		controls.lastButtonPressed = 2
		controls.playerProgress = controls.playerProgress + 1
		state.currentState = "secondRunState"
		sound:stop()
		sound:setPitch(0.5)
		sound:play()
		print("State 8")
	end

	
end

function controls.update()
end

function controls.draw()
	if state.currentState == "firstEndingState" or state.currentState == "endingState" then
	    love.graphics.setColor(controls.startButtonColour[1], controls.startButtonColour[2], controls.startButtonColour[3])
		love.graphics.rectangle("fill", controls.startButtonX, controls.startButtonY, controls.startButtonWidth, controls.startButtonHeight)
	else
		
		if controls.lastButtonPressed == 1 then
		    love.graphics.setColor(241,212,175)
		else
			love.graphics.setColor(controls.buttonOneColour[1], controls.buttonOneColour[2], controls.buttonOneColour[3])
		end
		love.graphics.rectangle("fill", controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight)
		if controls.lastButtonPressed == 2 then
			love.graphics.setColor(241,212,175)
		   
		else 
			love.graphics.setColor(controls.buttonTwoColour[1], controls.buttonTwoColour[2], controls.buttonTwoColour[3])
		end
		--love.graphics.setColor(controls.buttonTwoColour[1], controls.buttonTwoColour[2], controls.buttonTwoColour[3])
		love.graphics.rectangle("fill", controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight)
	end
end

function love.keypressed(key, unicode)
    if key == "left" then
    	controls.pressedButton(controls.buttonOneX + 10, controls.buttonOneY + 10)
    elseif key == "right" then
    	controls.pressedButton(controls.buttonTwoX + 10, controls.buttonTwoY + 10)
    elseif key == "up" then
    	controls.pressedButton(controls.startButtonX + 10, controls.startButtonY + 10)
    end
end

