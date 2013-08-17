
require 'floor'

local floor = Floor()

local offsetX = love.graphics.getWidth() / 2 - 200
local offsetY = 100

function love.load(...)
	floor:load(...)
end

function love.update(dt)
	floor:update(dt)
end

function love.draw()
	floor:draw(offsetX, offsetY)
end

function love.focus(focused)

end

function love.quit()

end

function love.keypressed(key, unicode)

end

function love.keyreleased(key, unicode)

end

function love.mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)

end

function love.joystickpressed(joystick, button)

end

function love.joystickreleased(joystick, button)

end

