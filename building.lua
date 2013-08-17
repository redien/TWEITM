
require 'floor'

function Building(number_of_floors)
	local building = {}
	local floors = {}
	
	function building:load(...)
		for i = 1, number_of_floors do
			local floor = Floor()
			floor:load(...)
			floors[#floors + 1] = floor
		end
		
		building.currentFloor = 0
	end

	function building:update(dt)
		
	end

	function building:draw(offset_x, offset_y)
		local current_floor_offset_y = -number_of_floors * floors[1].height
		
		for i = 1, number_of_floors do
			floors[i]:draw(offset_x, offset_y + i * floors[1].height + current_floor_offset_y)
		end
	end
	
	return building
end

