DirectionsState = Class{__includes = BaseState}


function DirectionsState:enter()
    
end

function DirectionsState:update(dt)
    if love.mouse.wasPressed(1) then
        gStateStack:pop()
        gStateStack:push(TakeTurnState{player = 'X'})
    end
end

function DirectionsState:render()

    love.graphics.setColor(24, 244, 24, 255)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Click to Start!', 0, VIRTUAL_HEIGHT / 2 - 50, VIRTUAL_WIDTH, 'center')

end