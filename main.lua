Config = {
    Map = nil,
    Items = {
        "nanskip.pvz_garden_line",
        "nanskip.peashooter", "nanskip.sunflower"
    }
}

function Client.OnStart()
    _DEBUG = true
    _HASH = "84f04f6"
    _LATEST_LINK = "https://raw.githubusercontent.com/Nanskip/cubzh-pvz/" .. _HASH .. "/"

    _DOWNLOAD_DATA()
end

_PLANTS = {
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

log = function(text)
    if _DEBUG == true then
        local timeStamp = os.date("[%H:%M:%S]")
        print(timeStamp .. ": " .. text)
    end
end

function _DOWNLOAD_DATA()
    local data = {
        _PLANTS = "data/plants.lua",
    }
    local downloaded = 0
    log("Need to download " .. tableLength(data) .. " data files.")

    for k, v in pairs(data) do
        HTTP:Get(_LATEST_LINK .. v, function(response)
            if response.StatusCode ~= 200 then
                print("Error downloading " .. k .. ". Code: " .. response.StatusCode)

                return
            end

            _ENV[k] = load(response.Body:ToString(), nil, "bt", _ENV)()
            downloaded = downloaded + 1

            if downloaded == tableLength(data) then
                log("Downloaded all required data.")
                _DOWNLOAD_MODULES()
            end
        end)
    end
end

function _DOWNLOAD_MODULES()
    local modules = {
        garden = "modules/garden.lua",
        plant = "modules/plant.lua",
    }
    local downloaded = 0
    log("Need to download " .. tableLength(modules) .. " modules files.")

    for k, v in pairs(modules) do
        HTTP:Get(_LATEST_LINK .. v, function(response)
            if response.StatusCode ~= 200 then
                print("Error downloading " .. k .. ". Code: " .. response.StatusCode)

                return
            end

            _ENV[k] = load(response.Body:ToString(), nil, "bt", _ENV)()
            if _ENV[k].INIT ~= nil then
                _ENV[k]:INIT()
            end

            downloaded = downloaded + 1
            if downloaded == tableLength(modules) then
                log("Downloaded all required modules.")
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

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end