

WelcomeState = Class{__includes = BaseState}


function WelcomeState:init()
    self.welcome_text = "Welcome to state machine!"
end

function WelcomeState:update()
    -- Switch state
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('bounce')
    end
end

function WelcomeState:render()
    love.graphics.setFont(bannerfont)
    love.graphics.printf(self.welcome_text,0,30,VIRTUAL_WIDTH,'center')
    love.graphics.setFont(normalfont)
    love.graphics.printf(DIRECTIONS,0,VIRTUAL_HEIGHT - 30,VIRTUAL_WIDTH,'center')
end

