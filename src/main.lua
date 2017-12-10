local ScreenManager = require('lib.screenmanager.ScreenManager')

function love.load(args)
    local screens = {
        main = require('src.screens.MainScreen')
    }

    ScreenManager.init(screens, 'main')
end

function love.update(dt)
    ScreenManager.update(dt)
end

function love.draw()
    ScreenManager.draw()
end

-- function love.quit(q)
--     ScreenManager.quit(q)
-- end

-- function love.keypressed( key, scancode, isrepeat )
--     ScreenManager.keypressed( key, scancode, isrepeat )
-- end

-- function love.resize( w, h )
--     ScreenManager.resize( w, h )
-- end

-- function love.textinput( text )
--     ScreenManager.textinput( text )
-- end

-- function love.mousepressed( mx, my, button, isTouch )
--     ScreenManager.mousepressed( mx, my, button, isTouch )
-- end

-- function love.mousereleased( mx, my, button, isTouch )
--     ScreenManager.mousereleased( mx, my, button, isTouch )
-- end

-- function love.mousefocus( f )
--     ScreenManager.mousefocus( f )
-- end

-- function love.mousemoved( x, y, dx, dy, isTouch )
--     ScreenManager.mousemoved( x, y, dx, dy, isTouch )
-- end

-- function love.wheelmoved( dx, dy )
--     ScreenManager.wheelmoved( dx, dy )
-- end