-- Initialize variables
local box = {
    x = 100,        -- Initial x-coordinate of the box
    y = 100,        -- Initial y-coordinate of the box
    size = 30,      -- Size of the box
    speed = 300,    -- Speed of the box
    vx = 1,         -- Initial velocity along the x-axis
    vy = 1,         -- Initial velocity along the y-axis
    r = 0,          -- Initial red value
    g = 0,          -- Initial green value
    b = 0,          -- Initial blue value
    color = {r, g, b}, -- Initial color (black)
    inc = 0.1       -- Color increment
}

-- Disable clearing the screen
love.graphics.clear = function() end

-- Initialize Love2D
function love.load()
    love.window.setTitle("Bouncing Box")
    love.window.setMode(640, 480)
    love.graphics.setBackgroundColor(0.01, 0.01, 0.01)
end

-- Update function
function love.update(dt)
    -- Update box position based on velocity and speed
    box.x = box.x + box.vx * box.speed * dt
    box.y = box.y + box.vy * box.speed * dt
    changeColor()

    -- Check for collisions with the edges
    if box.x <= 0 or (box.x + box.size) >= love.graphics.getWidth() then
        box.vx = -box.vx -- Reverse x-velocity on collision
    end
    if box.y <= 0 or (box.y + box.size) >= love.graphics.getHeight() then
        box.vy = -box.vy -- Reverse y-velocity on collision
    end
end

-- Draw function
function love.draw()
    love.graphics.setColor(box.color)
    love.graphics.rectangle("fill", box.x, box.y, box.size, box.size)
end

-- Change box color
function changeColor()
    box.r = box.r + box.inc
    if box.r > 1 then
        box.r = 0
        box.g = box.g + box.inc
    end
    if box.g > 1 then
        box.g = 0
        box.b = box.b + box.inc
    end
    if box.b > 1 then
        box.b = 0
    end
    box.color = {box.r, box.g, box.b}
end