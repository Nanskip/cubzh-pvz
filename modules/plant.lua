local plant = {}

function plant.INIT(self)
    log("Module 'plant' initialized.")
    self.plants = _PLANTS

    log("Module plant: loaded " .. tableLength(self.plants) .. " plants.")
end

function plant.place(self, name, position)
    local scale = 5
    local _plant = deepcopy(_PLANTS[name])
    
    _plant.object = Shape(Items.nanskip[_plant.shape])
    _plant.object.Position = Number3(position[1]+0.5, 1/3+0.01, position[2]+0.5) * scale * 3
    _plant.object:SetParent(World)
    _plant:Init()
    _plant.object.parent = _plant
    _plant.object.Tick = function(s)
        s.parent:Tick()
    end

    _plant.Remove = function(s)
        s.object:SetParent(nil)
        s.object.Tick = nil
        s.object = nil
        s.Remove = nil
        s = nil
    end

    garden.lines[position[1]].spots[position[2]].plant = _plant
end

return plant