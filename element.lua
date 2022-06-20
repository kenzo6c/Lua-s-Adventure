Element = {x = 0, y = 0, width = 8, height = 8, health = 1, flipH = 1, flipV = 1}

Hitbox = require("hitbox")

function Element:new()
    local e = {}
    setmetatable(e, self)
    self.__index = self
    return e
end

function Element:init(x, y, img, isSheet, width, height, hbWidth, hbHeight, hbOffsetX, hbOffsetY)
    self.x = x or Element.x
    self.y = y or Element.y

    self.sprite = love.graphics.newImage(img)
    self.isSheet = isSheet or false

    self.width = width or Element.width
    self.height = height or Element.height

    hbWidth = hbWidth or self.width
    hbHeight = hbHeight or self.height
    hbOffsetX = hbOffsetX or 0
    hbOffsetY = hbOffsetY or 0

    self.hitbox = Hitbox:new(self.x, self.y, hbWidth, hbHeight, hbOffsetX, hbOffsetY)

    if isSheet then
        self.frames = {}
        self.currentFrame = 1
        self.frameTimer = 0
        self.interval = 0.1
        for y = 0, self.sprite:getHeight() - height, height do
            for x = 0, self.sprite:getWidth() - width, width do
                self.frames[#self.frames + 1] = love.graphics.newQuad(x, y, width, height, self.sprite:getDimensions())
            end
        end
    end
end

function Element:update(dt)
    if self.isSheet then
        self.frameTimer = self.frameTimer + dt
        if self.frameTimer > self.interval then
            self.frameTimer = 0
            self.currentFrame = self.currentFrame + 1
            if self.currentFrame > #self.frames then
                self.currentFrame = 1
            end
        end
    end
    self.hitbox:move(self.x, self.y) -- TODO: move hitbox with element
end

function Element:draw(draw_hitbox)
    love.graphics.draw(self.sprite, self.frames[self.currentFrame], self.x, self.y, 0, self.flipH, self.flipV, self.width/2, self.height/2)
    if draw_hitbox then
        self.hitbox:draw()
    end
end

return Element