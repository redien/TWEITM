require 'building'
require 'player'
require 'background'

local states = { start = 0, play = 1, over = 2 }

local game = {
	version = 0.1,
	state = states.start
}

local building = Building(10)
local player = Player()
local background = Background()

local remainingTime = 120

local offsetX = 90
local offsetY = 100

local scale = 2

love.graphics.setDefaultImageFilter('linear', 'nearest')

function love.load(...)
	game.state = states.play

	building:load(...)
	background:load(...)
  player:load(...)
	player:setLimit(building:getLimit())
end

function love.update(dt)
	background:update(st)
	building:update(dt)
	player:update(dt)

	if remainingTime - dt >= 0 then
		remainingTime = remainingTime - dt
	else
		game.state = states.over
	end
end

function love.draw()
	if states.play == game.state then
		game.drawStatePlay()
		game.drawGui()
	elseif states.over == game.state then
		game.drawStateOver()
	end
end

function love.focus(focused)

end

function love.quit()

end

function love.keypressed(key, unicode)
	if 'up' == key and building:canMoveUpAt(player.position.x, player.position.y) then
		building:moveUp()
	end
	if 'escape' == key then
		love.event.push('quit')
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

function game.drawStateStart()

end

function game.drawStatePlay()
	love.graphics.scale(scale, scale)

	background:draw(offsetX, offsetY)
	building:draw(offsetX, offsetY)
	player:draw(offsetX, offsetY)
end

function game.drawStateOver()
	love.graphics.clear()
	love.graphics.push()
		love.graphics.setColor(85, 190, 240)
		love.graphics.printf('GAME OVER', 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), 'center')
	love.graphics.pop()
end

function game.drawGui()
	love.graphics.push()
		love.graphics.setColor(85, 190, 240)
		love.graphics.print('Time: ' .. string.format('%.1f', remainingTime), 2, 2)
		love.graphics.print('FPS: ' .. love.timer.getFPS(), 2, 22)
	love.graphics.pop()
end

