local plants = {
    peashooter = {
        name = "Peashooter",
        cost = 100,
        reload = 10,
        shape = "peashooter",
        Init = function(s)
            s.body = s.object:GetChild(1) s.head = s.body:GetChild(1)
            s.bodyrot = Rotation(s.body.LocalRotation.X, s.body.LocalRotation.Y, s.body.LocalRotation.Z)
            s.headrot = Rotation(s.head.LocalRotation.X, s.head.LocalRotation.Y, s.head.LocalRotation.Z)
            s.tick = 0
        end,
        Tick = function(s)
            s.tick = s.tick + 1
            if s.tick > 628 then
                s.tick = 0
            end
            s.body.LocalRotation = Rotation(s.bodyrot.X + math.abs(math.sin(s.tick*0.05)*0.2), s.bodyrot.Y, s.bodyrot.Z)
            s.head.LocalRotation = Rotation(s.headrot.X - math.abs(math.sin(s.tick*0.05)*0.2), s.headrot.Y, s.headrot.Z)
        end,
    },
    sunflower = {
        name = "Sunflower",
        cost = 50,
        reload = 5,
        shape = "sunflower",
        Init = function(s)
            s.object.Rotation.Y = 1.2

            s.body = s.object:GetChild(1) s.head = s.body:GetChild(1)
            s.bodyrot = Rotation(s.body.LocalRotation.X, s.body.LocalRotation.Y, s.body.LocalRotation.Z)
            s.headrot = Rotation(s.head.LocalRotation.X, s.head.LocalRotation.Y, s.head.LocalRotation.Z)
            s.tick = 0
        end,
        Tick = function(s)
            s.tick = s.tick + 1
            if s.tick > 628 then
                s.tick = 0
            end
            s.body.LocalRotation = Rotation(s.bodyrot.X + math.abs(math.sin(s.tick*0.05)*0.2), s.bodyrot.Y, s.bodyrot.Z)
            s.head.LocalRotation = Rotation(s.headrot.X - math.abs(math.sin(s.tick*0.05)*0.2), s.headrot.Y, s.headrot.Z)
        end,
    },
}

return plants