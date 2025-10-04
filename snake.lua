local Snake = {}

-- initialize snake at given position
function Snake.new(x, y)
    local self = {
        body = { {x = x, y = y} },
        direction = "right"
    }

    -- moving the snake
    function self:move()
        local head = {x = self.body[1].x, y = self.body[1].y}
        if self.direction == "up" then head.y = head.y - 1 end
        if self.direction == "down" then head.y = head.y + 1 end
        if self.direction == "left" then head.x = head.x - 1 end
        if self.direction == "right" then head.x = head.x + 1 end
        table.insert(self.body, 1, head)
    end

    -- grow the snake (by not removing from the body)
    function self:grow()
        -- when moving we dont change anything
    end

    -- trim tail (if not eating)
    function self:trim()
        table.remove(self.body)
    end

    return self
end

return Snake