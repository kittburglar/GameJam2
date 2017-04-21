require "helper"
require "timer"
require "controls"

function love.load()
	love.window.setMode(414, 736)
	controls.load()
	timer.load()
end

function love.update()
	controls.update()
	timer.update()
end

function love.draw()
	controls.draw()
	timer.draw()
end
