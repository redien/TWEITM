
function Background()
	local background = {}
	local background_image

	function background:load(...)
		background_image = love.graphics.newImage("Background.png")
	end

	function background:update(dt)

	end

	function background:draw(offset_x, offset_y)
		love.graphics.draw(background_image)
	end

	return background
end

