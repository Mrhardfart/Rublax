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

function doAutoEgg()
    if SelectedEgg == "Common Egg" and getgenv().AutoEgg then
        local New_CFrame = CFrame.new(-7, 9, -82)
        local char = game.Players.LocalPlayer.Character
        local ti = TweenInfo.new(5, Enum.EasingStyle.Linear)
        local tp = {CFrame = New_CFrame}
        local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, ti, tp)
        tween:Play()
        tween.Completed:Wait()
    end
    
    while getgenv().AutoEgg and wait() do
        if SelectedEgg == "Common Egg" then
            local args = {[1] = "HatchEgg", [2] = "Common Egg", [3] = getgenv().Amount}
            game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        end
    end    
end
Eggs:Label("Auto Hatch Eggs! (PLEASE DON'T MOVE WHILE TELEPORTING OR IT MIGHT CAUSE ISSUES!)")

local EggsDrop = Eggs:Dropdown("Choose egg",{"Common Egg","Option 2","Option 3","Option 4","Option 5"}, function(bool)
    print("Selected Egg: ".. bool)
    getgenv().SelectedEgg = bool
end)

local EggsAmount = Eggs:Dropdown("Choose amount of Eggs to Hatch",{1,2,3,4,5,6}, function(bool)
    print("Selected Amount to hatch: ".. bool)
    getgenv().Amount = bool
end)

Eggs:Toggle("Auto hatch Eggs",false, function(bool)
    getgenv().AutoEgg = bool
    doAutoEgg()
end)
Eggs:Toggle("Freeze Character",false, function(bool)
    if bool then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    elseif bool == false then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
end)

local IslandsTeleport = w1:Channel("Teleport")
IslandsTeleport:Button("Floating Island", function()
    local args = {[1] = "Teleport",[2] = "Workspace.Worlds.The Overworld.Islands.Floating Island.Island.Portal.Spawn"}
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
end)
IslandsTeleport:Button("Outer Space", function()
    local args = {[1] = "Teleport",[2] = "Workspace.Worlds.The Overworld.Islands.Outer Space.Island.Portal.Spawn"}
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
end)
IslandsTeleport:Button("Twilight", function()
    local args = {[1] = "Teleport",[2] = "Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn"}
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
end)
IslandsTeleport:Button("The Void", function()
    local args = {[1] = "Teleport",[2] = "Workspace.Worlds.The Overworld.Islands.The Void.Island.Portal.Spawn"}
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
end)
IslandsTeleport:Button("Zen", function()
    local args = {[1] = "Teleport",[2] = "Workspace.Worlds.The Overworld.Islands.Zen.Island.Portal.Spawn"}
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
end)
