push = require 'lib/push'
Class = require 'lib/class'
Timer = require 'lib/knife.timer'

require 'src/RainDrop'
require 'src/PushCircle'

require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/PlayState'

require 'src/StateMachine'


gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['huge'] = love.graphics.newFont('fonts/font.ttf', 64)
}