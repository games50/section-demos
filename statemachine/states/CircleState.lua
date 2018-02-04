

CircleState = Class{__includes = BaseState}

function CircleState:init()
    self.ball = Ball{speed=10, 
                     color={math.random(100,255), math.random(100,255), math.random(100,255)}
                    }
    self.ball.origin = {x = VIRTUAL_WIDTH/2, y = VIRTUAL_HEIGHT/2}
    self.ball.radius = 40
    self.ball.angle = 1
    self.ball.angleSpeed = 5
end

function CircleState:update(dt)
    --  does in this case as dx and dy are 0
    self.ball:update(dt)
    
    -- get angle in radians
    self.ball.angle = (self.ball.angle + (self.ball.angleSpeed * dt)) % (2 * math.pi)
    
    -- calculate position from origin
    self.ball.x = self.ball.origin.x + math.cos(self.ball.angle) * self.ball.radius
    self.ball.y = self.ball.origin.y + math.sin(self.ball.angle) * self.ball.radius
    
    -- Switch state
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('welcome')
    end
end

function CircleState:render()
    love.graphics.setFont(bannerfont)
    love.graphics.printf("CIRCLES!",0,30,VIRTUAL_WIDTH,'center')
    love.graphics.setFont(normalfont)
    love.graphics.printf(DIRECTIONS,0,VIRTUAL_HEIGHT - 30,VIRTUAL_WIDTH,'center')

    self.ball:render()
end