
function Floor()
	local floor = {}
	local background_image
	
	function floor:load(...)
		background_image = love.graphics.newImage("room-2.png")
		background_image:setFilter('linear', 'nearest')
	end

	function floor:update(dt)
		
	end
	
	function floor:draw(offset_x, offset_y)
		love.graphics.draw(background_image, offset_x, offset_y, 0, 2, 2)
	end
	
	return floor
end

