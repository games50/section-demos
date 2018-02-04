Ball = Class{}

function Ball:init(perams)
    self.x = perams.x or VIRTUAL_WIDTH/2
    self.y = perams.y or VIRTUAL_HEIGHT/2
    
    self.width = perams.width or 15
    self.height = perams.height or 15

    self.dx = perams.dx or 0
    self.dy = perams.dy or 0
    self.speed = perams.speed or 50

    self.color = perams.color or {255, 255, 255}
end

-- AABB collisions, assumes object has x,y,width,height attributes
function Ball:collides(object)
    if (self.x + self.width) >= object.x and self.x <= object.x + object.width then
        if (self.y + self.height) >= object.y and self.y <= object.y + object.height then
            return true
        end
    end
    return false
end

-- edge of screen detection
function Ball:outOfBounds()
    if (self.x) >= 0 and self.x + self.width <= VIRTUAL_WIDTH then
        if (self.y) >= 0 and self.y + self.height <= VIRTUAL_HEIGHT then
            return false
        end
    end
    return true
end

function Ball:update(dt)
    -- update position based on velocity
    self.x = self.x + (self.dx * dt)
    self.y = self.y + (self.dy * dt)
end

function Ball:render()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end