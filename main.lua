require 'building'
require 'player'
require 'background'

local app = {
	version = 0.1,
	showdebug = false,
	showhelp = false
}

local building = Building(10)
local player = Player()
local background = Background()

local offsetX = 90
local offsetY = 100
local scale = 2

love.graphics.setDefaultImageFilter('linear', 'nearest')

function love.load(...)
	building:load(...)
	background:load(...)
  player:load()
	player:setLimit(building:getLimit())
end

function love.update(dt)
	background:update(st)
	building:update(dt)
  player:update(dt)
end

function love.draw()
  love.graphics.scale(scale, scale)

	background:draw(offsetX, offsetY)
	building:draw(offsetX, offsetY)
  player:draw(offsetX, offsetY)
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
		if building:canMoveUpAt(player.position.x, player.position.y) then
			building:moveUp()
		end
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

