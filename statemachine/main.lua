
-- allow classes
Class = require "lib/class"

-- allow resize
push = require "lib/push"

-- state management
require "lib/StateMachine"

-- states
require "states/BaseState"
require "states/WelcomeState"
require "states/CircleState"
require "states/BounceState"

require "sprites/Ball"

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

DIRECTIONS = "press 'enter' to switch to next state"


function love.load()

    -- initialize our nearest-neighbor filter
    love.graphics.setDefaultFilter('nearest', 'nearest')
 
    -- app window title
    love.window.setTitle('State Machine Demo')

    bannerfont = love.graphics.newFont('fonts/font.ttf', 30)
    normalfont = love.graphics.newFont('fonts/font.ttf', 20)
    love.graphics.setFont(bannerfont)

    -- set RNG
    math.randomseed(os.time())


    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })
    love.graphics.setBackgroundColor(150, 150, 150)

    gStateMachine = StateMachine {
        ['welcome'] = function () return WelcomeState() end,
        ['bounce'] = function () return BounceState() end,
        ['circle'] = function () return CircleState() end
    }
    gStateMachine:change('welcome')

    love.keyboard.keysPressed = {}
end


function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == "escape" then
        love.event.quit()
    end
end


function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end


function love.resize(w, h)
    push:resize(w, h)
end


function love.update(dt)
    
    -- update state
    gStateMachine:update(dt)
    
    love.keyboard.keysPressed = {}
end


function love.draw()
    push:start()
    gStateMachine:render()
    push:finish()
end


