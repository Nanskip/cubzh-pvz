local garden = {}

function garden.INIT(self)
    log("Module 'garden' initialized.")

    self.lines = {}
    self.arr = {"default", "default", "default", "default", "default"} -- 5 default lines

    for i=1, #self.arr do
        self:placeLine(i, self.arr[i])
    end
end

function garden.placeLine(self, number, type)
    local line = {
        length = 10,
        number = number,
    }
    if type == "default" then
        line.shape = Shape(Items.nanskip.pvz_garden_line)
    else
        line.shape = Shape(Items.nanskip.pvz_garden_line)
    end

    local scale = 5

    line.shape.Scale = scale
    line.shape.Position = Number3(number, 0, number%2) * scale * 3
    line.shape:SetParent(World)

    line.spots = {}
    for i=1, line.length do
        local spot = Quad()
        spot.Color = Color(255, 255, 255, 127)
        spot.Physics = PhysicsMode.Trigger
        spot.Scale = scale
        spot.Rotation.X = math.pi/2
        spot.Position = Number3(number, 5.01, i) * scale

        spot:SetParent(World)
        line.spots[i] = spot
    end

    self.lines[number] = line
end

return garden