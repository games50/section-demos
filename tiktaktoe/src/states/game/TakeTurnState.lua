TakeTurnState = Class{__includes = BaseState}

function TakeTurnState:init(params)
    self.player = params.player
    self.nextPlayer = params.player == 'X' and 'O' or 'X'
    self.color = {255, 255, 255, 255}
    self.timer = Timer.after(5, function () end)
end

function TakeTurnState:update(dt)
    self.timer:update(dt)
    
    local x, y = push:toGame(love.mouse.getPosition())
    local idxX = math.floor(x/TILE_SIZE) + 1
    local idxY = math.floor(y/TILE_SIZE) + 1
    
    if love.mouse.wasPressed(1) then 
        if gBoard:setTile(idxX, idxY, self.player) then
            gStateStack:pop()
            gStateStack:push(TakeTurnState{player = self.nextPlayer})
        else
            self.color = {255, 0, 0, 255}
            self.timer = Timer.after(0.5, function () self.color = {255, 255, 255, 255} end)
        end
    end

end

function TakeTurnState:render()
    local x, y = push:toGame(love.mouse.getPosition())
    local idxX = math.floor(x/TILE_SIZE)
    local idxY = math.floor(y/TILE_SIZE)

    -- mask the current piece
    love.graphics.setColor(0,0,0, 255)
    love.graphics.rectangle('fill', idxX * TILE_SIZE, idxY * TILE_SIZE, TILE_SIZE -10, TILE_SIZE -10)
    
    -- highlight color
    love.graphics.setColor(255, 255, 255, 200)
    love.graphics.rectangle('fill', idxX * TILE_SIZE, idxY * TILE_SIZE, TILE_SIZE, TILE_SIZE)
    
    -- drawing the piece
    love.graphics.setColor(self.color)
    love.graphics.setFont(gFonts['tik'])
    love.graphics.printf(self.player, idxX * TILE_SIZE + 30, idxY * TILE_SIZE, (idxX + 1) * TILE_SIZE, 'left')
end