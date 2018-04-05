StartState = Class{__includes = BaseState}

function StartState:update(dt)

    if love.mouse.wasPressed(1) then
        gStateMachine:change('play')
    end
end

function StartState:render()

    love.graphics.setColor(200, 200, 200, 255)
    love.graphics.setFont(gFonts['huge'])
    love.graphics.printf('Rain', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

    
    love.graphics.setColor(200, 200, 200, 255)
    love.graphics.setFont(gFonts['medium'])    
    love.graphics.printf('Click to start!', 0, VIRTUAL_HEIGHT / 2 + 80, VIRTUAL_WIDTH, 'center')
end