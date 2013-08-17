require 'AnAL'
require 'building'
require 'player'
require 'background'

math.randomseed( os.time() )
math.random(); math.random(); math.random()

local states = { start = 0, play = 1, lost = 2, won = 3 }

local game = {
	version = 0.1,
	state = states.start
}

local time_scale = 2.0

local number_of_floors = 80 / time_scale

local building = Building(number_of_floors)
local player = Player()
local background = Background()

local won_image, lost_image

local remainingTime = 120

local offsetX = 90
local offsetY = 129

local scale = 2

local player_animation_start, player_animation_end

local time_speed = 1.0
local slow_timer = 0.0

love.graphics.setDefaultImageFilter('linear', 'nearest')

function love.load(...)
	love.graphics.setDefaultImageFilter('linear', 'nearest')

	game.state = states.play

	building:load(...)
	background:load(...)
  player:load(...)
	player:setLimit(building:getLimit())
	
	won_image = love.graphics.newImage("Youwonthegame.png")
	lost_image = love.graphics.newImage("youlostthegame.png")
end

function love.update(dt)
	if slow_timer ~= 0 then
		slow_timer = slow_timer - dt
	end

	if slow_timer < 0 then
		slow_timer = 0
		time_speed = 1.0
	end

	background:update(dt)
	building:update(dt, player, slowDownTime)
  player:update(dt, building:isMoving())

	if building:isMoving() then
		player.position.x = player_animation_start + (player_animation_end - player_animation_start) * building:moveProgress()
	else 
		if building.currentFloor == number_of_floors and game.state ~= states.lost then
			game.state = states.won
		end
	end

	if remainingTime - dt >= 0 then
		remainingTime = remainingTime - dt * time_scale * time_speed
	else
		if game.state ~= states.won then
			game.state = states.lost
		end
	end
end

function love.draw()
	if states.play == game.state then
		game.drawStatePlay()
		game.drawGui()
	elseif states.lost == game.state then
		game.drawStateLost()
	elseif states.won == game.state then
		game.drawStateWon()
	end
end

function love.focus(focused)

end

function love.quit()

end

function love.keypressed(key, unicode)
	if states.play == game.state then
		if 'up' == key then
			local can_move_up, animation_start, animation_end = building:canMoveUpAt(player.position.x, player.position.y)
			if can_move_up then
				building:moveUp()
				player_animation_start = animation_start
				player_animation_end = animation_end
			end
		end
		player:keypressed(key, unicode)
	end

	if 'escape' == key then
		love.event.push('quit')
	end
end

function love.keyreleased(key, unicode)
	player:keyreleased(key, unicode)
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

function game.drawStateLost()
	love.graphics.clear()
	love.graphics.push()
		love.graphics.draw(lost_image, 0, 0, 0, 2, 2)
	love.graphics.pop()
end

function game.drawStateWon()
	love.graphics.clear()
	love.graphics.push()
		love.graphics.draw(won_image, 0, 0, 0, 2, 2)
	love.graphics.pop()
end

function game.drawGui()
	love.graphics.push()
		love.graphics.setColor(85, 190, 240)
		love.graphics.print('Time: ' .. string.format('%.1f', remainingTime), 2, 2)
		love.graphics.print('Floors left: ' .. number_of_floors - building:getCurrentFloor(), 2, 18)
		love.graphics.print('FPS: ' .. love.timer.getFPS(), 2, 34)
	love.graphics.pop()
end

function slowDownTime()
	time_speed = 0.5
	slow_timer = 5
end

