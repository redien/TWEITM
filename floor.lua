
function Floor()
	local floor = {}
	local background_image
	local elevator_door_image
	
	function floor:load(...)
		background_image = love.graphics.newImage("room-2.png")
		background_image:setFilter('linear', 'nearest')
		
		floor.height = background_image:getHeight()
		floor.width = background_image:getWidth()

		floor.hasElevatorDoor = true
		if floor.hasElevatorDoor then
			elevator_door_image = love.graphics.newImage("elevatordoor.png")
		end
	end

	function floor:update(dt)
		
	end
	
	function floor:draw(offset_x, offset_y)
		love.graphics.push()
			love.graphics.setColor(255, 255, 255)
			love.graphics.draw(background_image, offset_x, offset_y)
			if floor.hasElevatorDoor then
				love.graphics.draw(elevator_door_image, offset_x + (floor.width - 13), offset_y + (floor.height - 32))
			end
		love.graphics.pop()
	end
		
	function floor:canMoveUpAt(x, y)
		if x > floor.width - (13 + 6) and x < floor.width - 6 then
			return true
		end
		
		return false
	end
	
	return floor
end

