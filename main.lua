require "helper"
require "background"
require "state"
require "timer"
require "controls"
require "display"

function love.load()
	love.window.setMode(414, 736)
	state.load()
	background.load()
	controls.load()
	timer.load()
	display.load()
	font = love.graphics.setNewFont("8-bit-wonder.ttf", 30)
end

function love.update()
	state.update()
	background.update()
	controls.update()
	timer.update()
	display.update()
end

function love.draw()
	state.draw()
	background.draw()
	controls.draw()
	timer.draw()
	display.draw()
end

function love.mousepressed(x, y, button)
	if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
 		controls.pressedButton(x, y)
	end
end