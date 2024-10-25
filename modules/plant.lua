local plant = {}

function plant.INIT(self)
    self.plants = _PLANTS

    log("Module plant: loaded " .. tableLength(self.plants) .. " plants.")
end

return plant