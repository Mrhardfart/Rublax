local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("CakeHub: Bubblegum Simulator INFINITY")

local w1 = win:Server("Features", "")

local Main = w1:Channel("Main")
getgenv().AutoPickups = false;

function doCollectPickups()
while getgenv().AutoPickups == true and wait() do
task.spawn(function()
    local rendered = game.Workspace:WaitForChild("Rendered")
    for _, chunker in ipairs(rendered:GetChildren()) do
        if chunker:IsA("Folder") and chunker.Name == "Chunker" then
            for _, idFolder in ipairs(chunker:GetChildren()) do
                local args = { idFolder.Name }
                print("Collecting: " .. tostring(idFolder.Name))
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Pickups"):WaitForChild("CollectPickup"):FireServer(unpack(args))
                if not string.find(idFolder.Name, "Egg") then
                    idFolder:Destroy()
                else
                    print("Skipped destroying: " .. idFolder.Name)
                end
            end
        end
    end
end)
end
end

function doCollectPickupsONCE()
    task.spawn(function()
        local rendered = game.Workspace:WaitForChild("Rendered")
        for _, chunker in ipairs(rendered:GetChildren()) do
            if chunker:IsA("Folder") and chunker.Name == "Chunker" then
                for _, idFolder in ipairs(chunker:GetChildren()) do
                    local args = { idFolder.Name }
                    print("Collecting: " .. tostring(idFolder.Name))
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Pickups"):WaitForChild("CollectPickup"):FireServer(unpack(args))
                    if not string.find(idFolder.Name, "Egg") then
                        idFolder:Destroy()
                    else
                        print("Skipped destroying: " .. idFolder.Name)
                    end
                end
            end
        end
    end)
end

Main:Label("Collect automatically coins and gems around the map!")
Main:Toggle("Auto collect Coins / Gems",false, function(bool)
getgenv().AutoPickups = bool
doCollectPickups()
end)

Main:Button("Auto collect Coins / Gems (once)", function()
    doCollectPickupsONCE()
end)

Main:Seperator()

local Eggs = w1:Channel("Eggs")
getgenv().AutoEgg = false;
getgenv().SelectedEgg = "N/A";
getgenv().Amount = 1

local EggsDrop = Eggs:Dropdown("Choose egg",{"Common Egg","Option 2","Option 3","Option 4","Option 5"}, function(bool)
    print("Selected Egg: ".. bool)
    getgenv().SelectedEgg = bool
end)
local EggsAmount = Eggs:Dropdown("Choose amount of Eggs to Hatch",{1,2,3,4,5,6}, function(bool)
    print("Selected Amount to hatch: ".. bool)
    getgenv().Amount = bool
end)
