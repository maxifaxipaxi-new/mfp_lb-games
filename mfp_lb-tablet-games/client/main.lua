local identifier = "mfp_lb-tablet_games"

CreateThread(function ()
    while GetResourceState("lb-tablet") ~= "started" do
        Wait(500)
    end

    local function AddApp()
        local added, errorMessage = exports["lb-tablet"]:AddCustomApp({
            identifier = identifier,
            name = Config.AppName,
            description = Config.Description,
            developer = "MFPSCRIPTS.com",
            defaultApp = Config.DefaultApp,
            size = Config.Size,
            images = Config.Images,
            ui = "html/index.html", -- ✅ Wichtig!
            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/html/assets/app.jpg" -- ✅ Richtig aufbauen
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end

    AddApp()

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-tablet" then
            AddApp()
        end
    end)
end)
