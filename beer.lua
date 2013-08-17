
function Beer(x, y)
	local beer = {}
	local beer_image
	local taken = false
	local taken_sound
	
	function beer:load(...)
		beer_image = love.graphics.newImage('beer.png')
		taken_sound = love.audio.newSource("powerup.ogg", static)
	end

	function beer:update(dt, player, slowDownTime)
		if not taken and player.position.x > x - 6 and player.position.x < x + beer_image:getWidth() - 6 then
			taken = true
			taken_sound:play()
			slowDownTime()
		end
	end
	
	function beer:draw(offset_x, offset_y)
		if not taken then
			love.graphics.draw(beer_image, offset_x + x, offset_y + y)
		end
	end
	
	return beer
end

