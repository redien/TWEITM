
require 'beer'

function Floor()
	local floor = {}
	local background_image, elevator_door_image, stairs_image
	local door_x, door_y, door_width
	
	local beers = {}
	
	function floor:load(...)
		local index = math.random(5)
		local files = {'Wallpaper.png','Wallpaper2.png','Wallpaper3.png','Wallpaper4.png','Wallpaper5.png'}
		background_image = love.graphics.newImage(files[index])
		
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

		if math.random(3) == 1 then		
			local beer = Beer(math.random(self.width - 50), self.height - 42)
			beer:load(...)
			beers[#beers + 1] = beer
		end
	end

	function floor:update(dt, player, slowDownTime, isCurrentFloor)
		for _, beer in pairs(beers) do
			beer:update(dt, player, slowDownTime, isCurrentFloor)
		end
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
			
			for _, beer in pairs(beers) do
				beer:draw(offset_x, offset_y)
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
			if x > 130 and x < 170 then
				return true, 155, 25	
			end
		end
		
		return false
	end
	
	return floor
end

