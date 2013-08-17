
function Floor()
	local floor = {}
	local background_image, elevator_door_image, stairs_image
	local door_x, door_y, door_width
	
	function floor:load(...)
		background_image = love.graphics.newImage("bigroom.png")
		
		floor.height = background_image:getHeight()
		floor.width = background_image:getWidth()

		floor.hasElevatorDoor = true
		if floor.hasElevatorDoor then
			elevator_door_image = love.graphics.newImage("elevatordoor.png")
		
			door_width = elevator_door_image:getWidth()
			door_x = (floor.width - door_width)
			door_y = (floor.height - 32)
		end
		
		floor.hasStairs = true
		if floor.hasStairs then
			stairs_image = love.graphics.newImage("elevatordoor.png")
			
		end
	end

	function floor:update(dt)
		
	end
	
	function floor:draw(offset_x, offset_y)
		love.graphics.push()
			love.graphics.setColor(255, 255, 255)
			love.graphics.draw(background_image, offset_x, offset_y)
			if floor.hasElevatorDoor then
				love.graphics.draw(elevator_door_image, offset_x + door_x, offset_y + door_y)
			end

			if floor.hasStairs then
				love.graphics.draw(stairs_image, offset_x + 0, offset_y + 0)
			end
		love.graphics.pop()
	end

	function floor:canMoveUpAt(x, y)
		if floor.hasElevatorDoor then
			if x > door_x - 6 and x < door_x + door_width - 6 then
				return true
			end
		end
		
		return false
	end
	
	return floor
end

