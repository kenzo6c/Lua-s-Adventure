local Panel = require("hud/panel")
local Text = require("hud/panel")

local Button = {}


-- Classe fille Button qui hérite de Panel
function Button:new(pX, pY, pW, pH, pText, pFont, pColor)
    self.__index = self
    setmetatable(self, {__index = Panel}) --heritage

    local myButton = Panel.new(self, pX, pY, pW, pH) --appel constructeur de la classe mère
    setmetatable(Button, self)
    
    -- initialisation
    Button.text = pText
    Button.font = pFont
    Button.label = Text:new(pX, pY, pW, pH, pText, pFont, "center", "center", pColor)
    Button.imgDefault = nil
    Button.imgHover = nil
    Button.imgPressed = nil
    Button.isPressed = false
    Button.oldButtonState = false

    return myButton
end

function Button:setImages(pImageDefault, pImageHover, pImagePressed)
  self.imgDefault = pImageDefault
  self.imgHover = pImageHover
  self.imgPressed = pImagePressed
  self.w = pImageDefault:getWidth()
  self.h = pImageDefault:getHeight()
end

function Button:update(dt)

  Panel.update(self,dt)
  if self.isHover and love.mouse.isDown(1) and
      self.isPressed == false and
      self.oldButtonState == false then
    self.isPressed = true
    if self.lstEvents["pressed"] ~= nil then
      self.lstEvents["pressed"]("begin")
    end
  else
    if self.isPressed == true and love.mouse.isDown(1) == false then
      self.isPressed = false
      if self.lstEvents["pressed"] ~= nil then
        self.lstEvents["pressed"]("end")
      end
    end
  end
  self.oldButtonState = love.mouse.isDown(1)
end

function Button:draw()
  love.graphics.setColor(1,1,1)
  if self.isPressed then
    if self.imgPressed == nil then
      Panel.draw(self)
      love.graphics.setColor(1,1,1,.2)
      love.graphics.rectangle("fill", self.X, self.Y, self.W, self.H)
    else
      love.graphics.draw(self.imgPressed, self.X, self.Y)
    end
  elseif self.isHover then
    if self.imgHover == nil then
      Panel.draw(self)
      love.graphics.setColor(1,1,1)
      love.graphics.rectangle("line", self.X+2, self.Y+2, self.W-4, self.H-4)
    else
      love.graphics.draw(self.imgHover, self.X, self.Y)
    end
  else
    if self.imgDefault == nil then
      Panel.draw(self)
    else
      love.graphics.draw(self.imgDefault, self.X, self.Y)
    end    
  end
  self.Label:draw()
end
  
return Button

