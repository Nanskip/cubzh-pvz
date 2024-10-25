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
            s.object.Rotation.Y = s.object.Rotation.Y + 0.01
        end,
    },
    sunflower = {
        name = "Sunflower",
        cost = 50,
        reload = 5,
        shape = "sunflower",
        Init = function(s)
            -- init function
        end,
        Tick = function(s)
            -- tick function
        end,
    },
}

return plants