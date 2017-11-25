local Tile = require "tile"
local Map = require("class")()

function Map:__init(width, height)
    self.width = width
    self.height = height
    self.data = {}
    for i = 1, (width * height) do
        self.data[i] = Tile.void
    end
    return self
end

function Map:to_index(x, y)
    return self.width * y + x + 1
end

function Map:in_bounds(x, y)
    return x >= 0 and x < self.width and y >= 0 and y < self.height
end

function Map:set(x, y, v)
    if self:in_bounds(x, y) then
        self.data[self:to_index(x, y)] = v
    end
end

function Map:set_all(v)
    for i = 1, (self.width * self.height) do
        self.data[i] = v
    end
end

function Map:get(x, y)
    return self.data[self:to_index(x, y)]
end

function Map:for_region(x, y, w, h, func, ...)
    for x = x, x + w - 1 do
        for y = y, y + h - 1 do
            self:set(x, y, func(x, y, self:get(x, y), ...))
        end
    end
end

function Map:foreach(func, ...)
    for x = 0, self.width - 1 do
        for y = 0, self.height - 1 do
            self:set(x, y, func(x, y, self:get(x, y), ...))
        end
    end
end

return Map