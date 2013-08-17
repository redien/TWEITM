require 'building'
require 'player'

local app = {
	version = 0.1,
	showdebug = false,
	showhelp = false
}

local building = Building(10)
local player = Player()

local offsetX = 100
local offsetY = 100
local scale = 2

function love.load(...)
	building:load(...)
  player:load()
	player:setLimit(168, 100)
end

function love.update(dt)
	building:update(dt)
  player:update(dt)
end

function love.draw()
  love.graphics.scale(scale, scale)
	building:draw(offsetX, offsetY)
  player:draw(offsetY, offsetY)
end

function love.focus(focused)

end

function love.quit()

end

function love.keypressed(key, unicode)
	if 'escape' == key then
		love.event.push('quit')
	end
	if 'up' == key then
		building:moveUp()
	end
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

