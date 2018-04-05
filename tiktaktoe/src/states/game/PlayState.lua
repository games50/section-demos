PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    gStateStack:push(DirectionsState{})
end

function PlayState:update(dt)

end

function PlayState:render()
    for i = 1, VIRTUAL_WIDTH/TILE_SIZE do
        love.graphics.rectangle('fill', i * TILE_SIZE - 10, 0, 10, VIRTUAL_HEIGHT)
    end

    for i = 1, VIRTUAL_HEIGHT/TILE_SIZE do
        love.graphics.rectangle('fill', 0, i * TILE_SIZE - 10, VIRTUAL_WIDTH, 10)
    end

    gBoard:render()

end