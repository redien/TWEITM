
function Floor()
	local floor = {}
	local background_image
	
	function floor:load(...)
		background_image = love.graphics.newImage("room-2.png")
		background_image:setFilter('linear', 'nearest')
		
		floor.height = background_image:getHeight()
	end

	function floor:update(dt)
		
	end
	
	function floor:draw(offset_x, offset_y)
		love.graphics.push()
			love.graphics.setColor(255, 255, 255)
			love.graphics.draw(background_image, offset_x, offset_y)
		love.graphics.pop()
	end
	
	return floor
end

