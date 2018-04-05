RainDrop = Class{}

function RainDrop:init(params)
    self.rotation = 0

    self.world = params.world

    self.body = love.physics.newBody(self.world, 
        params.x or math.random(VIRTUAL_WIDTH), params.y or math.random(-35),
        'dynamic')

    self.shape = love.physics.newRectangleShape(5, 20)

    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.fixture:setUserData(params.UserData)

    self.color = params.color or {0, 0, 255, 255}

    -- used to keep track of despawning the Alien and flinging it
    self.falling = true
end

function RainDrop:render()

    -- draw a polygon shape by getting the world points for our body, using the box shape's
    -- definition as a reference
    love.graphics.setColor(self.color)
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
end