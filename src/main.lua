local moonshine = require('lib.moonshine')
local ScreenManager = require('lib.screenmanager.ScreenManager')

function love.load(args)
    -- Loading shaders
    -- Just scanlines and crt, used for the screen "texture".
    s_scanlines = moonshine(moonshine.effects.scanlines)
    .chain(moonshine.effects.crt)
    s_scanlines.scanlines.thickness = 0.5
    s_scanlines.crt.scaleFactor = {1.15, 1.15}

    -- Glowing screen, used for actual drawing.
    -- Use this for rendering characters and stuff.
    s_screen = moonshine(moonshine.effects.scanlines)
    .chain(moonshine.effects.glow)
    .chain(moonshine.effects.crt)
    s_screen.scanlines.thickness = 0.5
    s_screen.crt.scaleFactor = {1.15, 1.15}

    -- Loading font.
    font = love.graphics.newFont("assets/fonts/Press_Start_2P/PressStart2P-Regular.ttf", 24)
    love.graphics.setFont(font)

    -- Loading screen frame image.
    frame = love.graphics.newImage("assets/images/screen-frame0.png")

    -- Hiding cursor.
    love.mouse.setVisible(false)

    -- Loading music loop.
    music = love.audio.newSource("assets/music/1.ogg")
    music:setLooping(true)
    music:play()

    local screens = {
        main = require('screens.MainScreen')
    }

    ScreenManager.init(screens, 'main')
end

-- Rendering stuff
function love.draw()
    -- Drawing black scanlines background.
    s_scanlines(function()
        love.graphics.setColor({5, 5, 5, 255})
        love.graphics.rectangle("fill", 0, 0, 640, 480)
    end)
    s_screen(ScreenManager.draw)

    -- Drawing a screen frame.
    love.graphics.draw(frame, 0, 0)
end

function love.update(dt)
    ScreenManager.update(dt)
end

function love.quit(q)
    ScreenManager.quit(q)
end

function love.keypressed( key, scancode, isrepeat )
    ScreenManager.keypressed( key, scancode, isrepeat )
end

function love.resize( w, h )
    ScreenManager.resize( w, h )
end

function love.textinput( text )
    ScreenManager.textinput( text )
end

function love.mousepressed( mx, my, button, isTouch )
    ScreenManager.mousepressed( mx, my, button, isTouch )
end

function love.mousereleased( mx, my, button, isTouch )
    ScreenManager.mousereleased( mx, my, button, isTouch )
end

function love.mousefocus( f )
    ScreenManager.mousefocus( f )
end

function love.mousemoved( x, y, dx, dy, isTouch )
    ScreenManager.mousemoved( x, y, dx, dy, isTouch )
end

function love.wheelmoved( dx, dy )
    ScreenManager.wheelmoved( dx, dy )
end