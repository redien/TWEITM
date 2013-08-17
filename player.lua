function Player()
  local player = {}

  function player:load(...)
		self.image = love.graphics.newImage('player1.png')

    self.speed = 2
    self.position = {
      x = 0,
      y = 0
    }
		self.limit = {
			x = 0,
			y = 0
		}
  end

  function player:update(dt, freeze_controls)
  	if not freeze_controls then
		if love.keyboard.isDown('left') and 0 < self.position.x then
		  self.position.x = self.position.x - self.speed
		elseif love.keyboard.isDown('right') and (self.limit.x - self.image:getWidth()) > self.position.x then
		  self.position.x = self.position.x + self.speed
		end
	end
  end

  function player:draw(offset_x, offset_y)
    love.graphics.push()
      love.graphics.setColor(255, 255, 255)
      love.graphics.draw(
				self.image,
				self.position.x + offset_x,
				self.position.y + offset_y + self.limit.y - self.image:getHeight()
			)
    love.graphics.pop()
  end

  function player:keypressed(key, unicode)
  end

	function player:setLimit(x, y)
		self.limit.x = x
		self.limit.y = y
	end

  return player
end

