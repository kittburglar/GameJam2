require "helper"
require "state"
require "timer"
require "controls"

function love.load()
	love.window.setMode(414, 736)
	state.load()
	controls.load()
	timer.load()
end

function love.update()
	state.update()
	controls.update()
	timer.update()
end

function love.draw()
	state.draw()
	controls.draw()
	timer.draw()
end

function love.mousepressed(x, y, button)
	if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
 		controls.pressedButton(x, y)
	end
end