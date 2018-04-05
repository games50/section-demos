PlayState = Class{__includes = BaseState}

function PlayState:enter(params) 
    -- new Box2D "world" which will run all of our physics calculations
    self.world = love.physics.newWorld(0, 300)
    
    self.raindrops = {}
    
    self.timer = Timer.every(0.2, function () 
        table.insert(self.raindrops, RainDrop{world = self.world, x = nil, y = nil, color = nil, UserData = "RainDrop"})   
    end)
    
    self.destroyedBodies = {}

    function beginContact(a, b, coll)
        
        local types = {}
        types[a:getUserData()] = true
        types[b:getUserData()] = true

        if types["Ground"] and types["RainDrop"] then
            if a:getUserData() == 'Ground' then
                table.insert(self.destroyedBodies, b:getBody())
            else
                table.insert(self.destroyedBodies, a:getBody())
            end
        end

    end

    -- the remaining three functions here are sample definitions, but we are not
    -- implementing any functionality with them in this demo; use-case specific
    function endContact(a, b, coll) end

    function preSolve(a, b, coll) end

    function postSolve(a, b, coll, normalImpulse, tangentImpulse) end

    -- register just-defined functions as collision callbacks for world
    self.world:setCallbacks(beginContact, endContact, preSolve, postSolve)
    
    -- self.pushCircle = PushCircle{world = self.world, x = nil, y = nil, color = nil, UserData = "PushCircle"}

    -- static ground body
    self.groundBody = love.physics.newBody(self.world, 0, VIRTUAL_HEIGHT - 10, 'static')

    -- edge shape Box2D provides, perfect for ground
    self.edgeShape = love.physics.newEdgeShape(0, 0, VIRTUAL_WIDTH, 0)

    -- affix edge shape to our body
    self.groundFixture = love.physics.newFixture(self.groundBody, self.edgeShape)
    self.groundFixture:setUserData('Ground')
end

function PlayState:update(dt)
    self.timer:update(dt)
    self.world:update(dt)


    -- destroy all bodies we calculated to destroy during the update call
    for k, body in pairs(self.destroyedBodies) do
        if not body:isDestroyed() then 
            body:destroy()
        end
    end

    -- reset destroyed bodies to empty table for next update phase
    self.destroyedBodies = {}

    -- remove 
    for i = #self.raindrops, 1, -1 do
        if self.raindrops[i].body:isDestroyed() then
            table.remove(self.raindrops, i)
        end
    end

    if love.mouse.wasPressed(1) then 
        local x, y = push:toGame(love.mouse.getPosition())
        if self.pushCircle then
            if not self.pushCircle.body:isDestroyed() then 
                self.pushCircle.body:destroy()
            end
            self.growing = false
        end
        self.pushCircle = PushCircle{world = self.world, x = x, y = y, color = nil, UserData = "PushCircle"}
    end

    if self.pushCircle and not self.pushCircle.growing then
        self.pushCircle = nil
    end

end

function PlayState:render()
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()))
    love.graphics.setColor(255, 255, 255, 255)

    for k, r in pairs(self.raindrops) do
        r:render()
    end

    if self.pushCircle then 
        self.pushCircle:render()
    end

    -- draw a line that represents our ground, calculated from ground body and edge shape
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.setLineWidth(2)
    love.graphics.line(self.groundBody:getWorldPoints(self.edgeShape:getPoints()))
end

function PlayState:spawnRainDrop(params)
    table.insert(self.raindrops, RainDrop(params))
end