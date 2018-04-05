PushCircle = Class()


function PushCircle:init(params) -- expects world, x, y, color, UserData

    self.world = params.world

    self.body = love.physics.newBody(self.world, 
        params.x or VIRTUAL_WIDTH/2 , params.y or VIRTUAL_HEIGHT/2,
        'kinematic')

    self.shape = love.physics.newCircleShape(50)

    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.fixture:setUserData(params.UserData)

    self.color = params.color or {0, 255, 0, 255}

    -- used to keep track of despawning the PushCircle and flinging it
    self.growing = true
end

function PushCircle:update(dt)
end

function PushCircle:render()
    love.graphics.setColor(self.color)
    love.graphics.circle('line', self.body:getX(), self.body:getY(), self.shape:getRadius())
end