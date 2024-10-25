Config = {
    Map = nil,
    Items = {
        "nanskip.pvz_garden_line",
        "nanskip.peashooter", "nanskip.sunflower"
    }
}

function Client.OnStart()
    _DEBUG = true
    _HASH = "aab9f3f"
    _LATEST_LINK = "https://raw.githubusercontent.com/Nanskip/cubzh-pvz/" .. _HASH .. "/"

    _DOWNLOAD_EVERYTHING()
end

_PLANTS = {
    peashooter = {
        name = "Peashooter",
        cost = 100,
        reload = 10,
        shape = Items.nanskip.peashooter,
        Init = function(s)
            -- init function
        end,
        Tick = function(s)
            -- tick function
        end,
    },
    sunflower = {
        name = "Peashooter",
        cost = 50,
        reload = 5,
        shape = Items.nanskip.sunflower,
        Init = function(s)
            -- init function
        end,
        Tick = function(s)
            -- tick function
        end,
    },
}

log = function(text)
    if _DEBUG == true then
        local timeStamp = os.date("[%H:%M:%S]")
        print(timeStamp .. ": " .. text)
    end
end

function _DOWNLOAD_EVERYTHING()
    local modules = {
        garden = "modules/garden.lua",
        plant = "modules/plant.lua",
    }

    for k, v in pairs(modules) do
        HTTP:Get(_LATEST_LINK .. v, function(response)
            if response.StatusCode ~= 200 then
                print("Error downloading " .. k .. ". Code: " .. response.StatusCode)
            end

            _ENV[k] = load(response.Body:ToString(), nil, "bt", _ENV)()
            if _ENV[k].INIT ~= nil then
                _ENV[k]:INIT()
            end
        end)
    end
end

function tableLength(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end