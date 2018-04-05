Class = require './lib/class'
push = require './lib/push'
Timer = require './lib/knife.timer'

require 'src/constants'

require 'src/StateMachine'
require 'src/states/StateStack'

require 'src/states/BaseState'
require 'src/states/game/PlayState'
require 'src/states/game/DirectionsState'
require 'src/states/game/TakeTurnState'

require 'src/Board'

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['tik'] = love.graphics.newFont('fonts/font.ttf', 120),
}