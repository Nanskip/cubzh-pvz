local plant = {}

function plant.INIT(self)
    log("Module 'plant' initialized.")
    self.plants = _PLANTS

    log("Module plant: loaded " .. tableLength(self.plants) .. " plants.")
end

function plant.place(self, name, position)
    local scale = 5
    local _plant = _PLANTS[name]
    _plant.shape.Position = Number3(position[1], 1/3+0.01, position[2]) * scale * 3
    _plant.shape:SetParent(World)
    _plant:Init()
    _plant.shape.parent = _plant
    _plant.shape.Tick = function(s)
        s.parent:Tick()
    end

    garden.lines[position[1]].spots[position[2]].plant = _plant
end

return plant