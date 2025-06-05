local function formatIdentifier(title)
    local formatted = title:lower()
    formatted = formatted:gsub("[^a-z0-9 ]", "-")
    return ("mfp-tablet-games-%s"):format(title)
end

local function AddApps()
    for i = 1, #Games do
        local game = Games[i]
        local added, errorMessage = exports["lb-tablet"]:AddCustomApp({
            identifier = formatIdentifier(game.title),
            name = game.title,
            description = game.description,
            developer = "MFPSCRIPTS.com",
            defaultApp = game.defaultapp or false,
            size = game.size or 52812,
            images = game.images or {},
            ui = "https://cfx-nui-" .. GetCurrentResourceName() .. "/html/" .. game.gameUrl,
            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/html/" .. game.icon,
            fixBlur = true
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end
end

CreateThread(function ()
    while GetResourceState("lb-tablet") ~= "started" do
        Wait(500)
    end

    AddApps()

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-tablet" then
            AddApps()
        end
    end)
end)
