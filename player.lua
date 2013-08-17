function Player()
  local player = {}

  function player:load(...)
		self.image = love.graphics.newImage('player1.png')

    self.speed = 2
    self.position = {
      x = 1,
      y = 1
    }
  end

  function player:update(dt)
    if love.keyboard.isDown('left') then
      self.position.x = self.position.x - self.speed
    elseif love.keyboard.isDown('right') then
      self.position.x = self.position.x + self.speed
    end
  end

  function player:draw(offset_x, offset_y)
    love.graphics.push()
      love.graphics.setColor(255, 255, 255)
      love.graphics.draw(
				self.image,
				self.position.x + offset_x,
				self.position.y + offset_y - self.image:getHeight()
			)
    love.graphics.pop()
  end

  function player:keypressed(key, unicode)
  end

  return player
end

