
function Floor()
	local floor = {}
	local background_image, elevator_door_image, stairs_image
	local door_x, door_y, door_width
	
	function floor:load(...)
		background_image = love.graphics.newImage("bigroom.png")
		
		self.height = background_image:getHeight()
		self.width = background_image:getWidth()

		self.hasElevatorDoor = (math.random(0, 1) == 1)
		if self.hasElevatorDoor then
			elevator_door_image = love.graphics.newImage("elevatordoor.png")

			door_width = elevator_door_image:getWidth()
			door_x = (floor.width - door_width)
			door_y = (floor.height - 32)
		end
		
		self.hasStairs = (math.random(0, 1) == 1) or (not self.hasElevatorDoor)
		
		if self.hasStairs then
			stairs_image = love.graphics.newImage("sep.stairs.png")
		end
	end

	function floor:update(dt)
		
	end
	
	function floor:draw(offset_x, offset_y)
		love.graphics.push()
			love.graphics.setColor(255, 255, 255)
			love.graphics.draw(background_image, offset_x, offset_y)

			if self.hasElevatorDoor then
				love.graphics.draw(elevator_door_image, offset_x + door_x, offset_y + door_y)
			end

			if self.hasStairs then
				love.graphics.draw(stairs_image, offset_x + 20, offset_y - 2)
			end
		love.graphics.pop()
	end

	function floor:canMoveUpAt(x, y)
		if self.hasElevatorDoor then
			if x > door_x - 6 and x < door_x + door_width - 6 then
				return true, door_x + 2, door_x + 2
			end
		end
		
		if self.hasStairs then
			if x > 140 and x < 170 then
				return true, 155, 25	
			end
		end
		
		return false
	end
	
	return floor
end

