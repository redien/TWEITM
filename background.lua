
function Background()
	local background = {}
	local background_image,
				comet_image,
				comet_scale,
				comet_speed

	function background:load(...)
		background_image = love.graphics.newImage("gfx/Background.png")
		comet_image = love.graphics.newImage("gfx/comet.png")
		comet_scale = 1
		comet_speed = 0.0025
	end

	function background:update(dt)
		comet_scale = comet_scale + (dt * comet_speed)
	end

	function background:draw(offset_x, offset_y)
		love.graphics.draw(background_image)
		love.graphics.push()
			love.graphics.setColor(255, 255, 255)
			love.graphics.scale(comet_scale, comet_scale)
			love.graphics.draw(comet_image, 5, 15)
		love.graphics.pop()
	end

	return background
end

