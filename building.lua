
require 'floor'

function Building(number_of_floors)
	local building = {}
	local floors = {}
	local speed = 1.0

	local current_floor_offset_y,
		  target_floor_offset_y,
		  animation_offset_per_second,
		  start_animation_offset_y
	
	local next_floor_sound
	
	function building:load(...)
		for i = 1, number_of_floors do
			local floor = Floor()
			floor:load(...)
			floors[#floors + 1] = floor
		end
		
		next_floor_sound = love.audio.newSource("next_floor.ogg", static)
		
		building.currentFloor = 0
		current_floor_offset_y = -number_of_floors * floors[1].height
		target_floor_offset_y = current_floor_offset_y
		animation_offset_per_second = 0
	end

	function building:update(dt, player)
		current_floor_offset_y = current_floor_offset_y + dt * animation_offset_per_second
		if current_floor_offset_y > target_floor_offset_y then
			current_floor_offset_y = target_floor_offset_y
			animation_offset_per_second = 0
		end
		
		if building.currentFloor < number_of_floors then
			floors[number_of_floors - building.currentFloor]:update(dt, player)
		end
	end

	function building:draw(offset_x, offset_y)
		for i = 1, number_of_floors do
			floors[i]:draw(offset_x, offset_y + i * floors[1].height + current_floor_offset_y)
		end
	end
	
	function building:moveUp()
		next_floor_sound:play()
		building.currentFloor = building.currentFloor + 1
		target_floor_offset_y = -(number_of_floors - building.currentFloor) * floors[1].height
		animation_offset_per_second = speed * (target_floor_offset_y - current_floor_offset_y)
		start_animation_offset_y = current_floor_offset_y
	end
	
	function building:canMoveUpAt(x, y)
		if building.currentFloor < number_of_floors and not self:isMoving() then
			return floors[number_of_floors - building.currentFloor]:canMoveUpAt(x, y)
		end
		
		return false
	end

	function building:isMoving()
		return target_floor_offset_y ~= current_floor_offset_y
	end
	
	function building:moveProgress()
		return math.abs(current_floor_offset_y - start_animation_offset_y) / (target_floor_offset_y - start_animation_offset_y)
	end
	
	function building:getLimit()
		return floors[1].width, floors[1].height
	end

	function building:getCurrentFloor()
		return building.currentFloor
	end
	
	return building
end

