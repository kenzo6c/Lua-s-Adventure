Room = {defaultLength = 40, defaultHeight = 30}

function Room:new(length, height, entrance, exit, enemies)
    local r = {}
    setmetatable(r, self)
    self.__index = self

    r.isFinished = false
    r.layer = nil
    r.mask = nil
    r.tileSize = 32

    -- Initialisation de la carte : 
    local t = {}
    for l = 1,height do
        local line = {}
        for c = 1, length do
            -- C'est du full bullshit, c'est juste pour remplir la carte pour l'instant
            local tile = {pixelPos={0,0}}
            line[c]=tile
        end
        t[l]=line
    end

    r.tiles = t

    -- Initialisation de la grille pour placer les objets : 
    local obj = {}
    for l = 1,height do
        local line = {}
        for c = 1, length do
            -- Pas le bon type pour le moment mais pg
            local object = {id=true}
            line[c]=object
        end
        obj[l]=line
    end

    r.objectsGrid = obj
    r.spawnCharacter = Vector() -- syntaxe à mettre

    r.objectsGrid[entrance[1]][entrance[2]] = "entrance" -- à ajuster en fonction de la forme de spawn (ici je considère que c'est juste un tableau avec les indices d'une tile dedans)
    r.objectsGrid[exit[1]][exit[2]] = "exit" -- meme chose

    -- Ici instancier le character

    local chara = "."

    -- Puis :
    r.entities[1] = chara

    -- Faire de même avec les ennemis

    for nbEnmy = 1,#enemies do
        -- Ici instancier l'ennemi
        r.entities[nbEnmy + 1] = chara
    end
end


function Room:draw()
    -- A voir comment c'est importé avec le JSON etc.
end

-- Returns the tile where the indicated position is
--- @param pos Vector The position to use
function Room:findTileWithPos(pos)
    local index = {row=0,col=0}
    -- i doit être le x du coin supérieur gauche de la carte
    local i = 0
    repeat
        if i*self.tileSize <= pos.x <= (i+1)*self.tileSize then
            index.row = i + 1
        end
        i = i + 1
    until (index.row ~= 0) or (i == self.length)

    -- j doit être le y du coin inférieur gauche de la carte
    local j = 0
    repeat
        if j*self.tileSize <= pos.x <= (j+1)*self.tileSize then
            index.col = j + 1
        end
        j = j + 1
    until (index.col ~= 0) or (i == self.height)

    return index
end

function Room:getIndexes(tile)
    return self.findTileWithPos(tile.pixelPos)
end

-- Returns the tile where the indicated position is
--- @param pos Vector The position with which we want to know if it's in the same tile as tile
--- @param tile table A tile
function Room:isOnTheSameTile(pos,tile)
    local posTileIndexes = self.findTileWithPos(pos)
    return self.tiles[posTileIndexes[1]][posTileIndexes[2]] == tile
end

return Room