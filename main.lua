Config = {
    Map = nil,
    Items = {
        "nanskip.pvz_garden_line",
        "nanskip.peashooter", "nanskip.sunflower"
    }
}

function Client.OnStart()
    _DEBUG = true

    _DOWNLOAD_EVERYTHING()
end

log = function(text)
    if _DEBUG == true then
        local timeStamp = os.date("[%H:%M:%S]")
        print(timeStamp .. ": " .. text)
    end
end

function _DOWNLOAD_EVERYTHING()
    local download_modules = {
        garden = "modules/garden.lua",
    }

    for k, v in pairs(modules) do
        HTTP:Get("https://raw.githubusercontent.com/Nanskip/cubzh-pvz/refs/heads/main/" .. v, function(response)
            if response.StatusCode ~= 200 then
                print("Error downloading " .. k .. ". Code: " .. response.StatusCode)
            end

            _ENV[k] = load(response.Body, nil, "bt", _ENV)()
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