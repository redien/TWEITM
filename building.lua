
require 'floor'

function Building(number_of_floors)
	local building = {}
	local floors = {}
	local speed = 1.0

	local current_floor_offset_y, target_floor_offset_y, animation_offset_per_second
	
	function building:load(...)
		for i = 1, number_of_floors do
			local floor = Floor()
			floor:load(...)
			floors[#floors + 1] = floor
		end
		
		building.currentFloor = 0
		current_floor_offset_y = -number_of_floors * floors[1].height
		animation_offset_per_second = 0
	end

	function building:update(dt)
		current_floor_offset_y = current_floor_offset_y + dt * animation_offset_per_second
	end

	function building:draw(offset_x, offset_y)
		for i = 1, number_of_floors do
			floors[i]:draw(offset_x, offset_y + i * floors[1].height + current_floor_offset_y)
		end
	end
	
	function building:moveUp()
		building.currentFloor = building.currentFloor + 1
		target_floor_offset_y = -(number_of_floors - building.currentFloor) * floors[1].height
		animation_offset_per_second = speed * (target_floor_offset_y - current_floor_offset_y)
	end
	
	return building
end

