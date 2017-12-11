utils = require 'utils'

render = {}

function render.draw_rect(x, y, w, h, color)
    love.graphics.setColor(color)
    love.graphics.rectangle('fill', x * 24 + 8, y * 24 + 4, w * 24, h * 24)
end

function render.draw_char(char, x, y, color, bg)
    love.graphics.setColor(bg)
    love.graphics.rectangle('fill', x * 24 + 8, y * 24 + 4, 24, 24)
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.print(char, x * 24 - 1 + 8, y * 24 + 9)
    love.graphics.print(char, x * 24 - 1 + 8, y * 24 + 11)
    love.graphics.print(char, x * 24 + 1 + 8, y * 24 + 9)
    love.graphics.print(char, x * 24 + 1 + 8, y * 24 + 11)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print({color, char}, x * 24 + 8, y * 24 + 10)
end

function render.draw_str(str, x, y, color, bg)
    love.graphics.setColor(bg)
    love.graphics.rectangle('fill', x * 24 + 8, y * 24 + 4, 24 * #str, 24)
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.print(str, x * 24 - 1 + 8, y * 24 + 9)
    love.graphics.print(str, x * 24 - 1 + 8, y * 24 + 11)
    love.graphics.print(str, x * 24 + 1 + 8, y * 24 + 9)
    love.graphics.print(str, x * 24 + 1 + 8, y * 24 + 11)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print({color, str}, x * 24 + 8, y * 24 + 10)
end

function render.draw_log(log, x, y)
    for i, msg in ipairs(log) do
        render.draw_str(tostring(msg.message), x, y + i - 1, msg.color, {0, 0, 0, 255})
    end
end

return render