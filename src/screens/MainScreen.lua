local ScreenManager = require('lib.screenmanager.ScreenManager')
local Screen = require('lib.screenmanager.Screen')
local render = require('render')

local MainScreen = {}

function MainScreen.new()
    local self = Screen.new()

    local x, y = 0, 0

    function self:draw()
        render.draw_char("@", x, y, {255, 255, 255, 255}, {0, 0, 0, 0})
    end

    function self:keypressed(key)
        if key == 'up' then
            y = y - 1
        elseif key == 'left' then
            x = x - 1
        elseif key == 'right' then
            x = x + 1
        elseif key == 'down' then
            y = y + 1
        end
    end

    return self
end

return MainScreen