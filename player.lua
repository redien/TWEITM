function Player()
  local player = {}
	local playerImages = {}

  function player:load(...)
		playerImages.default = love.graphics.newImage('player1.png')
		playerImages.ani_left = love.graphics.newImage('player_left.png')
		playerImages.ani_right = love.graphics.newImage('player_right.png')

		self.direction = 'right'
    self.speed = 2
    self.position = { x = 0, y = 0 }
		self.limit = { x = 0, y = 0 }
		self.size = { x = 24, y = 33 }

		self.animation = newAnimation(playerImages.ani_right, self.size.x, self.size.y, 0.1, 0)
		self.animation:stop()
  end

  function player:update(dt, freeze_controls)
		self.animation:update(dt)

		if not freeze_controls then
			if love.keyboard.isDown('left') and 0 < self.position.x then
			  self.position.x = self.position.x - self.speed
			elseif love.keyboard.isDown('right') and (self.limit.x - self.size.x) > self.position.x then
		  	self.position.x = self.position.x + self.speed
			end
		end
  end

  function player:draw(offset_x, offset_y)
    love.graphics.push()
			self.animation:draw(
				self.position.x + offset_x,
				self.position.y + offset_y + self.limit.y - self.size.y
			)
		love.graphics.pop()
  end

  function player:keypressed(key, unicode)
		if 'left' == key or 'up' == key then
			if 'left' ~= self.direction then
				self.animation = newAnimation(playerImages.ani_left, self.size.x, self.size.y, 0.1, 0)
			end
			self.animation:play()
			self.direction = 'left'
		elseif 'right' == key then
			if 'right' ~= self.direction then
				self.animation = newAnimation(playerImages.ani_right, self.size.x, self.size.y, 0.1, 0)
			end
			self.animation:play()
			self.direction = 'right'
		end
  end

	function player:keyreleased(key, unicode)
		self.animation:stop()
		self.animation:reset()
	end

	function player:setLimit(x, y)
		self.limit.x = x
		self.limit.y = y
	end

  return player
end

