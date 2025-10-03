-- grid
local cellSize = 20
local gridWidth = 20
local gridHeight = 20

-- snake
local snake = {
    {x = 10, y = 7},
}

local direction = "right"
local timer = 0
local speed = 0.15

-- food (where points will come from)
local food = {x = 5, y = 5}

-- starting the game
function love.load()
    love.window.setMode(gridWidth * cellSize, gridHeight * cellSize)
end

-- movement
function love.update(dt)
    timer = timer + dt

    if timer >= speed then
        timer = 0
    
        local head = {x = snake[1].x, y = snake[1].y}
        if direction == "up" then head.y = head.y - 1 end
        if direction == "down" then head.y = head.y + 1 end
        if direction == "left" then head.x = head.x - 1 end
        if direction == "right" then head.x = head.x + 1 end

        table.insert(snake, 1, head)

        if head.x == food.x and head.y == food.y then
            food.x = love.math.random(0, gridWidth - 1)
            food.y = love.math.random(0, gridHeight - 1)
        else
            table.remove(snake)
        end
    end
end

-- draw the game
function love.draw()
    for _, segment in ipairs(snake) do
        love.graphics.rectangle("fill", segment.x * cellSize, segment.y * cellSize, cellSize - 1 , cellSize -1)
    end
        love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("fill", food.x * cellSize, food.y * cellSize, cellSize - 1, cellSize - 1)

        love.graphics.setColor(1, 1, 1)
end

-- love keypresses
function love.keypressed(key)
    if key == "up" and direction ~= "down" then direction = "up" end
    if key == "down" and direction ~= "up" then direction = "down" end
    if key == "left" and direction ~= "right" then direction = "left" end
    if key == "right" and direction ~= "left" then direction = "right" end
end