if arg[#arg] == "vsc_debug" then require("lldebugger").start() end

local Racket = require("racket")
local Ball = require("ball")
local Field = require("field")

-- Load function (call one time)
function love.load()
    G_racketLeft = Racket:new(90, 250)
    G_racketRight = Racket:new(710, 250)
    G_ball = Ball:new(400, 300)
    G_field = Field:new(50, 50)
end

-- Main loop for calcul
function love.update(dt)
    -- keypress
    --racketLeft
    if love.keyboard.isDown("z") then
        G_racketLeft:moveY(-5)
    end
    if love.keyboard.isDown("s") then
        G_racketLeft:moveY(5)
    end
    --racketRight
    if love.keyboard.isDown("up") then
        G_racketRight:moveY(-5)
    end
    if love.keyboard.isDown("down") then
        G_racketRight:moveY(5)
    end
    --print(racketLeft:top(), racketLeft:bottom())
    -- ball
    G_ball:move()

    --bounce at the top or at the bottom
    if G_ball:top() == G_field:top() or G_ball:bottom() == G_field:bottom() then
        G_ball:mulDY(-1)
    end

    if (G_ball:left() == G_racketLeft:right() and G_racketLeft:top() <= G_ball:top() and G_ball:bottom() <= G_racketLeft:bottom()) or (G_ball:right() == G_racketRight:left() and G_racketRight:top() <= G_ball:top() and G_ball:bottom() <= G_racketRight:bottom()) then
        G_ball:mulDX(-1)
    end

    if G_ball:left() <= G_field:left() or G_ball:right() >= G_field:right() then
        G_ball:place(400, 300)
    end

end

-- Main loop for drawing
-- function love.draw()
--     love.graphics.print("Hello World", 400, 300)
-- end
function love.draw()
    G_racketLeft:draw()
    G_racketRight:draw()
    G_ball:draw()
    G_field:draw()
end

-- functions
function love.keypressed(k)
    -- print(k)
	if k == 'escape' then
		love.event.push('quit') -- Quit the game.
	end
end
