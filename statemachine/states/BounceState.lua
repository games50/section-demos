

BounceState = Class{__includes = BaseState}

function BounceState:init()
    self.ball = Ball{dx=(math.random(30, 100) * (math.random() >= 0.5 and 1 or -1)), 
                     dy=(math.random(30,100)  * (math.random() >= 0.5 and 1 or -1)),
                     color={math.random(100,255), math.random(100,255), math.random(100,255)}
                    }

    local n = math.floor( 7.23 + 0.5 )
end

function BounceState:update(dt)
    --  bounce off walls
    if self.ball:outOfBounds() then
        if self.ball.y <= 0 then
            self.ball.y = 0
            self.ball.dy = -self.ball.dy
        end

        if self.ball.y >= VIRTUAL_HEIGHT - self.ball.height then
            self.ball.y = VIRTUAL_HEIGHT - self.ball.height
            self.ball.dy = -self.ball.dy
        end

        if self.ball.x <= 0 then
            self.ball.x = 0
            self.ball.dx = -self.ball.dx
        end

        if self.ball.x >= VIRTUAL_WIDTH - self.ball.width then
            self.ball.x = VIRTUAL_WIDTH - self.ball.width
            self.ball.dx = -self.ball.dx
        end
    end

    self.ball:update(dt)

    -- Switch state
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('circle')
    end
end

function BounceState:render()
    love.graphics.setFont(bannerfont)
    love.graphics.printf("Bounce! Bounce! Bounce!",0,30,VIRTUAL_WIDTH,'center')
    love.graphics.setFont(normalfont)
    love.graphics.printf(DIRECTIONS,0,VIRTUAL_HEIGHT - 30,VIRTUAL_WIDTH,'center')

    self.ball:render()
end