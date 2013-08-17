
function Background()
	local background = {}
	local background_image, comet_image

	function background:load(...)
		background_image = love.graphics.newImage("Background.png")
		comet_image = love.graphics.newImage("comet.png")
	end

	function background:update(dt)

	end

	function background:draw(offset_x, offset_y)
		love.graphics.draw(background_image)
		love.graphics.draw(comet_image, 20, 10)
	end

	return background
end

