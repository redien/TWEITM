require 'floor'
require 'player'

local app = {
	version = 0.1,
	showdebug = false,
	showhelp = false
}

local floor = {}
local player = {}

local offsetX = love.graphics.getWidth() / 2 - 200
local offsetY = 100

function love.load(...)
	floor = Floor()
	floor:load(...)

	player = Player()
  player:load()
end

function love.update(dt)
	floor:update(dt)
  player:update(dt)
end

function love.draw()
	floor:draw(offsetX, offsetY)
  player:draw(offsetY, offsetY)
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

