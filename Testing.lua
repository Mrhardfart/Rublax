local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("CakeHub: Bubblegum Simulator INFINITY")

local w1 = win:Server("Features", "")

local Main = w1:Channel("Main")
getgenv().AutoBubble = false;
getgenv().AutoPickups = false;
getgenv().AutoPlaytime = false;
getgenv().AutoChests = false;
function doChests()
    while getgenv().AutoChests and wait(5) do
        local args = {[1] = "ClaimChest",[2] = "Void Chest",[3] = true}
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        local args = {[1] = "ClaimChest",[2] = "Giant Chest",[3] = true}
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
    end
end
function doBubble()
    while getgenv().AutoBubble and wait() do
        local args = {[1] = "BlowBubble"}
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
    end
end
function doPlaytime()
    while getgenv().AutoPlaytime and wait(5) do
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 1)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 2)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 3)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 4)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 5)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 6)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 7)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 8)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("ClaimPlaytime", 9)
        
    end
end

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
Main:Seperator()
Main:Toggle("Auto Blow bubble",false, function(bool)
    getgenv().AutoBubble = bool
    doBubble()
end)
Main:Seperator()
Main:Label("Collect automatically coins and gems around the map!")
Main:Toggle("Auto collect Coins / Gems",false, function(bool)
getgenv().AutoPickups = bool
doCollectPickups()
end)
Main:Button("Auto collect Coins / Gems (once)", function()
    doCollectPickupsONCE()
end)
Main:Seperator()
Main:Toggle("Auto Collect playtime rewards",false, function(bool)
    getgenv().AutoPlaytime = bool
    doPlaytime()
end)
Main:Toggle("Auto Collect chests",false, function(bool)
    getgenv().AutoChests = bool
    doChests()
end)

Main:Seperator()

local Eggs = w1:Channel("Eggs")
getgenv().AutoEgg = false;
getgenv().SpamAutoEgg = false;
getgenv().SelectedEgg = "N/A";
getgenv().Amount = 1
function teleportToTween(position)
    local char = game.Players.LocalPlayer.Character
    local ti = TweenInfo.new(5, Enum.EasingStyle.Linear)
    local tp = {CFrame = position}
    local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, ti, tp)
    tween:Play()
    tween.Completed:Wait()
end

function doAutoEgg()

if getgenv().SelectedEgg == "Common Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-7, 9, -82))
elseif getgenv().SelectedEgg == "Spotted Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-7, 10, -71))
elseif getgenv().SelectedEgg == "Iceshard Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-8, 10, -62))
elseif getgenv().SelectedEgg == "Spikey Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-127, 10, 6))
elseif getgenv().SelectedEgg == "Magma Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-135, 10, 0))
elseif getgenv().SelectedEgg == "Crystal Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-140, 10, -8))
elseif getgenv().SelectedEgg == "Lunar Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-145, 10, -15))
elseif getgenv().SelectedEgg == "Void Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-146, 10, -25))
elseif getgenv().SelectedEgg == "Hell Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-146, 10, -34))
elseif getgenv().SelectedEgg == "Nightmare Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-142, 10, -44))
elseif getgenv().SelectedEgg == "Rainbow Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-137, 10, -52))
elseif getgenv().SelectedEgg == "Throwback Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(-130, 10, -59))
elseif getgenv().SelectedEgg == "100M Egg" and getgenv().AutoEgg then
    teleportToTween(CFrame.new(14, 9, -8))
end

    while getgenv().AutoEgg and wait() do
            local args = {[1] = "HatchEgg", [2] = getgenv().SelectedEgg, [3] = getgenv().Amount}
            game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
    end    
end
function doSpamEgg()
    while getgenv().SpamAutoEgg and wait() do
        local args = {[1] = "HatchEgg", [2] = getgenv().SelectedEgg, [3] = getgenv().Amount}
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
    end
end
Eggs:Label("Auto Hatch Eggs! (PLEASE DON'T MOVE WHILE TELEPORTING OR IT MIGHT CAUSE ISSUES!)")

local EggsDrop = Eggs:Dropdown("Choose egg",{"Common Egg","Spotted Egg","Iceshard Egg","Spikey Egg","Magma Egg","Crystal Egg","Lunar Egg","Void Egg","Hell Egg","Nightmare Egg","Rainbow Egg","Throwback Egg","100M Egg"}, function(bool)
    print("Selected Egg: ".. bool)
    getgenv().SelectedEgg = bool
end)

local EggsAmount = Eggs:Dropdown("Choose amount of Eggs to Hatch",{1,2,3,4,5,6}, function(bool)
    print("Selected Amount to hatch: ".. bool)
    getgenv().Amount = bool
end)

Eggs:Toggle("Auto Hatch Eggs",false, function(bool)
    getgenv().AutoEgg = bool
    doAutoEgg()
end)

Eggs:Toggle("SPAM Auto Hatch",false, function(bool)
    getgenv().SpamAutoEgg = bool
    doSpamEgg()
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
