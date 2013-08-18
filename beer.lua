
function Beer(x, y)
	local beer = {}
	local beer_image
	local taken = false
	local taken_sound
	
	function beer:load(...)
		if math.random(2) == 1 then
			beer_image = love.graphics.newImage('gfx/beer.png')
		else
			beer_image = love.graphics.newImage('gfx/coffee.png')
		end
		taken_sound = love.audio.newSource("sfx/powerup.ogg", static)
	end

	local float_offset_y = 0.0
	local time = 0.0
	function beer:update(dt, player, slowDownTime, isCurrentFloor)
		time = time + dt
		
		float_offset_y = math.sin(time * 4) * 3
		
		if not taken and isCurrentFloor and player.position.x > x - 6 and player.position.x < x + beer_image:getWidth() - 6 then
			taken = true
			taken_sound:play()
			slowDownTime()
		end
	end
	
	function beer:draw(offset_x, offset_y)
		if not taken then
			love.graphics.draw(beer_image, offset_x + x, offset_y + y + float_offset_y)
		end
	end
	
	return beer
end

