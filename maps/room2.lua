--addind everything we want on map (monsters and items)


--HITBOXES
local rhinoHF = HitboxFactory:new(
  {name="hitbox", layers={enemy=true}, width=4, height=7, offset=Vector:new(-3, 1)},
  {name="hurtbox", layers={player=true}, width=6, height=9, offset=Vector:new(-4, 0)}
)


--SPRITES COLLECTIONS
local rhino_sc = SpriteCollection:new("rhino")
  rhino_sc:init({Sprite:new("img/rhino_idle-Sheet.png", true, "idle", 16, 16, Vector:new(7, 6)),
  Sprite:new("img/rhino_run-Sheet.png", true, "run", 16, 16, Vector:new(7, 6))})


--INITIALISATION OF MONSTERS AND ITEMS
local rhino = Monster:new()
rhino:init("rhino", 50, "simple", 0.5, 0.5, "epee", Vector:new(88, 40), rhino_sc, rhinoHF)

return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.8.6",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 38,
  height = 20,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 3,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "topdown",
      firstgid = 1,
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "../microFantasy.v0.4/tilesets/topdown.png",
      imagewidth = 64,
      imageheight = 64,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 8,
        height = 8
      },
      properties = {},
      wangsets = {},
      tilecount = 64,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 38,
      height = 20,
      id = 2,
      name = "Ground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        52, 35, 44, 28, 44, 49, 53, 37, 35, 34, 27, 51, 34, 43, 49, 33, 52, 35, 44, 28, 44, 49, 53, 37, 35, 34, 27, 51, 34, 43, 49, 33, 25, 25, 25, 25, 25, 25,
        49, 35, 28, 25, 52, 26, 28, 26, 41, 25, 34, 36, 53, 35, 28, 37, 49, 35, 28, 25, 52, 26, 28, 26, 41, 25, 34, 36, 53, 35, 28, 37, 34, 53, 53, 34, 29, 43,
        43, 45, 53, 43, 34, 29, 35, 25, 50, 49, 25, 45, 42, 35, 41, 33, 43, 45, 53, 43, 34, 29, 35, 25, 50, 49, 25, 45, 42, 35, 41, 33, 50, 27, 35, 42, 28, 53,
        43, 34, 50, 53, 50, 50, 29, 45, 34, 51, 53, 27, 45, 25, 26, 27, 43, 34, 50, 53, 50, 50, 29, 45, 34, 51, 53, 27, 45, 25, 26, 27, 43, 49, 29, 36, 26, 27,
        26, 25, 52, 50, 42, 45, 44, 53, 34, 29, 35, 36, 34, 34, 37, 49, 26, 25, 52, 50, 42, 45, 44, 53, 34, 29, 35, 36, 34, 34, 37, 49, 37, 26, 53, 33, 45, 36,
        51, 27, 49, 37, 52, 33, 43, 33, 52, 35, 42, 27, 35, 43, 44, 51, 51, 27, 49, 37, 52, 33, 43, 33, 52, 35, 42, 27, 35, 43, 44, 51, 53, 36, 49, 26, 41, 49,
        50, 44, 36, 51, 36, 44, 42, 50, 25, 45, 42, 34, 50, 41, 29, 50, 50, 44, 36, 51, 36, 44, 42, 50, 25, 45, 42, 34, 50, 41, 29, 50, 26, 25, 35, 28, 41, 49,
        33, 36, 51, 29, 26, 28, 52, 53, 33, 42, 37, 36, 53, 29, 52, 51, 33, 36, 51, 29, 26, 28, 52, 53, 33, 42, 37, 36, 53, 29, 52, 51, 34, 41, 43, 36, 42, 37,
        43, 35, 27, 27, 45, 34, 35, 35, 45, 41, 51, 51, 45, 53, 50, 42, 43, 35, 27, 27, 45, 34, 35, 35, 45, 41, 51, 51, 45, 53, 50, 42, 49, 36, 37, 25, 35, 51,
        25, 28, 35, 34, 45, 37, 34, 34, 36, 35, 35, 25, 36, 53, 53, 37, 25, 28, 35, 34, 45, 37, 34, 34, 36, 35, 35, 25, 36, 53, 53, 25, 45, 27, 51, 36, 50, 53,
        52, 35, 44, 28, 44, 49, 53, 37, 35, 34, 27, 51, 34, 43, 49, 33, 52, 35, 44, 28, 44, 49, 53, 37, 35, 34, 27, 51, 34, 43, 49, 29, 28, 42, 50, 34, 26, 28,
        49, 35, 28, 25, 52, 26, 28, 26, 41, 25, 34, 36, 53, 35, 28, 37, 49, 35, 28, 25, 52, 26, 28, 26, 41, 25, 34, 36, 53, 35, 28, 37, 50, 27, 29, 34, 28, 51,
        43, 45, 53, 43, 34, 29, 35, 25, 50, 49, 25, 45, 42, 35, 41, 33, 43, 45, 53, 43, 34, 29, 35, 25, 50, 49, 25, 45, 42, 35, 41, 33, 42, 52, 35, 41, 53, 34,
        43, 34, 50, 53, 50, 50, 29, 45, 34, 51, 53, 27, 45, 25, 26, 27, 43, 34, 50, 53, 50, 50, 29, 45, 34, 51, 53, 27, 45, 25, 26, 27, 51, 51, 53, 25, 27, 50,
        26, 25, 52, 50, 42, 45, 44, 53, 34, 29, 35, 36, 34, 34, 37, 49, 26, 25, 52, 50, 42, 45, 44, 53, 34, 29, 35, 36, 34, 34, 37, 49, 51, 43, 44, 42, 28, 49,
        51, 27, 49, 37, 52, 33, 43, 33, 52, 35, 42, 27, 35, 43, 44, 51, 51, 27, 49, 37, 52, 33, 43, 33, 52, 35, 42, 27, 35, 43, 44, 51, 35, 36, 25, 50, 45, 25,
        50, 44, 36, 51, 36, 44, 42, 50, 25, 45, 42, 34, 50, 41, 29, 50, 50, 44, 36, 51, 36, 44, 42, 50, 25, 45, 42, 34, 50, 41, 29, 50, 42, 43, 50, 25, 37, 33,
        33, 36, 51, 29, 26, 28, 52, 53, 33, 42, 37, 36, 53, 29, 52, 51, 33, 36, 51, 29, 26, 28, 52, 53, 33, 42, 37, 36, 53, 29, 52, 51, 43, 34, 34, 49, 45, 36,
        43, 35, 27, 27, 45, 34, 35, 35, 45, 41, 51, 51, 45, 53, 50, 42, 43, 35, 27, 27, 45, 34, 35, 35, 45, 41, 51, 51, 45, 53, 50, 42, 33, 43, 35, 43, 28, 52,
        25, 28, 35, 34, 45, 37, 34, 34, 36, 35, 35, 25, 36, 53, 53, 37, 25, 28, 35, 34, 45, 37, 34, 34, 36, 35, 35, 25, 36, 53, 53, 37, 35, 51, 27, 33, 33, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 38,
      height = 20,
      id = 1,
      name = "Walls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        13, 2, 2, 2, 2, 13, 2, 6, 2, 2, 2, 2, 2, 2, 2, 5, 13, 2, 2, 2, 6, 2, 2, 2, 2, 2, 5, 13, 2, 2, 6, 2, 2, 2, 2, 2, 2, 14,
        12, 0, 0, 0, 28, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 28, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 28, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 28, 12, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 28, 13, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 21, 2, 2, 2, 2, 26, 2, 2, 2, 2, 2, 21, 6, 2, 2, 2, 27, 2, 2, 2, 2, 14,
        12, 0, 0, 0, 0, 12, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 37, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 12, 0, 43, 0, 25, 0, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 18, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 10, 0, 0, 0, 25, 0, 0, 0, 0, 25, 25, 26, 25, 25, 25, 25, 25, 25, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 12, 0, 0, 25, 25, 0, 0, 43, 43, 43, 43, 45, 0, 0, 0, 37, 42, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 12, 0, 37, 37, 37, 37, 0, 0, 43, 43, 42, 35, 37, 0, 0, 0, 0, 42, 42, 0, 0, 0, 0, 25, 42, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 12, 0, 0, 25, 37, 45, 45, 0, 0, 42, 45, 45, 37, 45, 0, 0, 0, 0, 42, 35, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 12, 0, 0, 25, 25, 42, 0, 0, 0, 45, 45, 45, 0, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 20, 0, 0, 0, 25, 42, 42, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 42, 42, 45, 45, 0, 0, 0, 0, 0, 0, 0, 42, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 37, 35, 0, 0, 0, 0, 0, 0, 0, 0, 42, 42, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 45, 45, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        12, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        21, 2, 2, 5, 6, 2, 2, 2, 2, 2, 2, 5, 2, 2, 2, 22, 21, 2, 2, 5, 6, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 2, 2, 2, 2, 2, 22
      }
    }
  }
}
