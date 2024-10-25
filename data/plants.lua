local plants = {
    peashooter = {
        name = "Peashooter",
        cost = 100,
        reload = 10,
        shape = "peashooter",
        Init = function(s)
            -- init function
        end,
        Tick = function(s)
            -- tick function
        end,
    },
    sunflower = {
        name = "Sunflower",
        cost = 50,
        reload = 5,
        shape = "sunflower",
        Init = function(s)
            s.object.Rotation.Y = 1.2

            s.body = s.object:GetChild(1) s.head = s.object:GetChild(2)
            s.bodyrot = Rotation(body.LocalRotation.X, body.LocalRotation.Y, body.LocalRotation.Z)
            s.headrot = Rotation(head.LocalRotation.X, head.LocalRotation.Y, head.LocalRotation.Z)
            s.tick = 0
        end,
        Tick = function(s)
            s.tick = s.tick + 1
            if s.tick > 314 then
                s.tick = 0
            end
            s.body.LocalRotation = Rotation(s.bodyrot.X, s.bodyrot.Y + math.sin(s.tick*0.01)*0.1, s.bodyrot.Z)
            s.head.LocalRotation = Rotation(s.headrot.X, s.headrot.Y + math.cos(s.tick*0.01)*0.1, s.headrot.Z)
        end,
    },
}

return plants