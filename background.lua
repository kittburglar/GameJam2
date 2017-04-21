background = {}

function background.load()
	
end

function background.update()
end

function background.draw()

	--Grass
	love.graphics.setColor(236,229,206)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), love.graphics.getHeight()/2)

	--Sky
	love.graphics.setColor(197,224,220)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight()/2)
end
