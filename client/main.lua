local identifier = "mfp_lb-games"

CreateThread(function ()
    while GetResourceState("lb-phone") ~= "started" do
        Wait(500)
    end

    local function AddApp()
        local added, errorMessage = exports["lb-phone"]:AddCustomApp({
            identifier = identifier,
            name = Config.AppName,
            description = Config.Description,
            developer = "MFPSCRIPTS.com",
            defaultApp = Config.DefaultApp,
            size = Config.Size,
            images = Config.Images,
            ui = GetCurrentResourceName() .. "/html/index.html",
            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/html/assets/app.jpg"
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end

    AddApp()

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-phone" then
            AddApp()
        end
    end)
end)
