function Player()
  local player = {}
  local delta = 0

  function player:load(...)
    self.speed = 50
    self.position = {
      x = 1,
      y = 1
    }
  end

  function player:update(dt)
    if delta < (1 / self.speed) then
      delta = delta + dt
    end

    if love.keyboard.isDown('left') then
      self.position.x = self.position.x - 1
    elseif love.keyboard.isDown('right') then
      self.position.x = self.position.x + 1
    end

    delta = 0
  end

  function player:draw(offset_x, offset_y)
    love.graphics.push()
      love.graphics.setColor(0, 255, 255)
      love.graphics.rectangle("fill", self.position.x * 10 + offset_x, self.position.y * 10 + offset_y, 10, 10)
    love.graphics.pop()
  end

  function player:keypressed(key, unicode)
  end

  return player
end

