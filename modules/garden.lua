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

    line.shape.scale = scale
    line.shape.Position = Number3(number%2, 0, number) * scale
    line.shape:SetParent(World)

    self.lines[number] = line
end

return garden