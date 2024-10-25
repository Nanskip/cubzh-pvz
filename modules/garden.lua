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
        Remove = function(s)
            s.length = nil
            s.number = nil
            s.shape:SetParent(nil)
            s.shape = nil
            
            for i=1, #s.spots do
                s.spots[i]:SetParent(nil)
                s.spots[i] = nil
            end
            s.spots = nil
            s = nil
        end
    }
    if type == "default" then
        line.shape = Shape(Items.nanskip.pvz_garden_line)
    else
        line.shape = Shape(Items.nanskip.pvz_garden_line)
    end

    local scale = 5

    line.shape.Scale = scale
    line.shape.Position = Number3(number, 0, number%2) * scale * 3
    line.shape.Pivot = Number3(0, 0, 0)
    line.shape:SetParent(World)

    line.spots = {}
    for i=1, line.length do
        local spot = Quad()
        spot.Color = Color(255, 255, 255, 0)
        spot.Physics = PhysicsMode.Trigger
        spot.Scale = scale * 3
        spot.Rotation.X = math.pi/2
        spot.Position = Number3(number, 1/scale/3+0.01, i) * scale * 3

        spot:SetParent(World)
        line.spots[i] = spot
    end

    self.lines[number] = line
end

function garden.removeLines(self)
    for i=1, #self.lines do
        self.lines[i]:Remove()
    end
end

return garden