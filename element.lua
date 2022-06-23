Vector = require("vector")
Hitbox = require("hitbox")
SpriteTimer = require("sprite/spriteTimer")

--- Class representing elements in the game: anything that is displayed.
--- @class Element
--- @field id number
--- @field pos Vector
--- @field health number
--- @field state string
--- @field spriteCollection SpriteCollection
--- @field spriteTimer SpriteTimer
--- @field hitboxes table<string, Hitbox>|string Example: {["hitbox"] = Hitbox, ["hurtbox"] = Hitbox}
Element = {health = 1, damage = 1, state = "idle"}

--- Constructor of Element.
--- @return Element
function Element:new()
    local e = {}
    setmetatable(e, self)
    self.__index = self

    G_eltCounter = G_eltCounter + 1
    e.id = G_eltCounter

    return e
end

--- Initializes the element.
--- @param pos Vector
--- @param spriteCollection SpriteCollection
--- @param hitboxFactory HitboxFactory|string
function Element:init(pos, spriteCollection, hitboxFactory)
    self.pos = pos or Vector:new(0, 0)

    self.spriteCollection = spriteCollection
    self.spriteTimer = SpriteTimer:new()

    -- test if hitboxFactory is a string
    if hitboxFactory == "None" then
        self.hitboxes = hitboxFactory
    else
        self.hitboxes = hitboxFactory:produceAll(pos, self)
    end
end

--- Update the element (called every frames).
--- @param dt number
function Element:update(dt)
    if self.spriteCollection:isSpriteSheet(self.state) then
        self.spriteTimer:update(dt, self.spriteCollection:getNumberOfSprites(self.state))
    end
    if self.hitboxes ~= "None" then self.hitboxes["hitbox"]:move(self.pos) end -- TODO: move hitbox with element
end

--- Draw the element.
--- @param draw_hitbox boolean
function Element:draw(draw_hitbox)
    self.spriteCollection:draw(self.state, self.pos, self.spriteTimer:getCurrentFrame())
    if draw_hitbox and self.hitboxes ~= "None" then
        local i = 1
        for k, v in pairs(self.hitboxes) do
            if i == 1 then
                v:draw({0, 255, 255})
            elseif i == 2 then
                v:draw({255, 255, 0})
            elseif i >= 3 then
                v:draw({255, 0, 255})
            end
            i = i + 1
        end
    end
end

function Element:changeState(state)
    if self.state ~= state then
        self.state = state
        self.spriteTimer:changeState()
    end
end

function Element:hurt(damage)
    self.health = self.health - damage
    if self.health <= 0 then
        G_deadElements[#G_deadElements + 1] = self
    end
end

function Element:__tostring()
    return "Element"
end

return Element