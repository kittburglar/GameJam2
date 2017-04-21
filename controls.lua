require "helper"

controls = {}

function controls.load()
	controls.buttonOneX = 10
	controls.buttonOneY = 10
	controls.buttonOneWidth = 40
	controls.buttonOneHeight = 40
	controls.buttonOneColour = {255, 0, 0}

	controls.buttonTwoX = controls.buttonOneX + controls.buttonOneWidth + 10
	controls.buttonTwoY = 10
	controls.buttonTwoWidth = 40
	controls.buttonTwoHeight = 40
	controls.buttonTwoColour = {0, 255, 0}
end

function controls.update()
	if love.mouse.isDown(1) then
		if helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight) then
			print("Pressing button 1")
		elseif helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight) then
			print("Pressing button 2")
		end
	end
end

function controls.draw()
	love.graphics.setColor(controls.buttonOneColour[1], controls.buttonOneColour[2], controls.buttonOneColour[3])
	love.graphics.rectangle("fill", controls.buttonOneX, controls.buttonOneY, controls.buttonOneWidth, controls.buttonOneHeight)
	love.graphics.setColor(controls.buttonTwoColour[1], controls.buttonTwoColour[2], controls.buttonTwoColour[3])
	love.graphics.rectangle("fill", controls.buttonTwoX, controls.buttonTwoY, controls.buttonTwoWidth, controls.buttonTwoHeight)
end

