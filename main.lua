require "helper"
require "controls"

function love.load()
	controls.load()
end

function love.update()
	controls.update()
end

function love.draw()
	controls.draw()
end
