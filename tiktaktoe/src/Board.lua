Board = Class()

function Board:init(h, w)
    self.h = h
    self.w = w
    
    self.board = {}
    for i=1,h do
      self.board[i] = {}     -- create a new row
      for j=1,w do
        self.board[i][j] = nil
      end
    end
end

function Board:setTile(i, j, piece)
    if self.board[i][j] == nil then
        self.board[i][j] = piece
        return true
    end
    return false
end

function Board:checkBoard()
-- TODO
end

function Board:clear()
    self.board = {}
    for i=1,h do
      self.board[i] = {}
      for j=1,w do
        self.board[i][j] = nil
      end
    end
end

function Board:render()
    for i=1,self.h do
        for j=1,self.w do
            if self.board[i][j] then
                love.graphics.setColor(255, 255, 255, 255)
                love.graphics.setFont(gFonts['tik'])
                love.graphics.printf(self.board[i][j], (i - 1) * TILE_SIZE + 30, (j - 1) * TILE_SIZE, (i) * TILE_SIZE, 'left')
            end
        end
    end
end
