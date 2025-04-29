-- scripted by Cake. Do not judge :rage:
print("[CakeHub]: Executed! Waiting for the game to load..")
repeat wait() until game:IsLoaded()

print("[CakeHub]: Game loaded!")
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window("[v1.1] CakeHub: Bubblegum Simulator INFINITY")
print("[CakeHub]: Library responded!")

-- Main
getgenv().AutoBubble = false;
getgenv().AutoPickups = false;
-- Stuff
getgenv().AutoPlaytime = false;
getgenv().AutoChests = false;
getgenv().AutoCraft = false;
getgenv().AutoMarket = false;
-- Eggs
getgenv().AutoEgg = false;
getgenv().SpamAutoEgg = false;
getgenv().SelectedEgg = "N/A";
getgenv().Amount = 1
-- Comp
local vim = game:service'VirtualInputManager'
getgenv().AutoComp = false;
getgenv().AutoCompHatch = false;
-- Discord
getgenv().ServerInvite = "https://discord.gg/jC46e4p9RK"

print("[CakeHub]: Getgenv's Loaded!")
-- [ FUNCTIONS ]--
function doChests()
    while getgenv().AutoChests and wait(5) do
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("ClaimChest", "Void Chest", true)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("ClaimChest", "Giant Chest", true)
    end
end
function doBubble()
    while getgenv().AutoBubble and wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("BlowBubble")
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
while getgenv().AutoPickups and wait() do
spawn(function()
    for _, chunker in ipairs(game.Workspace:WaitForChild("Rendered"):GetChildren()) do
        if chunker:IsA("Folder") and chunker.Name == "Chunker" then
            for _, idFolder in ipairs(chunker:GetChildren()) do
                local args = { idFolder.Name }
                print("Collecting: " .. tostring(idFolder.Name))
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Pickups"):WaitForChild("CollectPickup"):FireServer(unpack(args))
                if not string.find(idFolder.Name, "Egg") then
                    idFolder:Destroy()
                end
            end
        end
    end
end)
end
end

function doAutoMarket()
    while getgenv().AutoMarket and wait(1) do
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("BuyShopItem", "alien-shop", 3)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("BuyShopItem", "alien-shop", 2)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("BuyShopItem", "alien-shop", 1)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("BuyShopItem", "shard-shop", 3)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("BuyShopItem", "shard-shop", 2)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("BuyShopItem", "shard-shop", 1)
    end
end
function doAutoCraft()
    while getgenv().AutoCraft and wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Lucky", 2)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Lucky", 3)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Lucky", 4)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Lucky", 5)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Speed", 2)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Speed", 3)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Speed", 4)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Speed", 5)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Coins", 2)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Coins", 3)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Coins", 4)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Coins", 5)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Mythic", 2)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Mythic", 3)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Mythic", 4)
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("CraftPotion", "Mythic", 5)
    
    end
end
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
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("HatchEgg", getgenv().SelectedEgg, getgenv().Amount)
    end    
end

function doSpamEgg()
    while getgenv().SpamAutoEgg and wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("HatchEgg", getgenv().SelectedEgg, getgenv().Amount)
    end
end
function doComp()
    local competitiveFrame = game.Players.LocalPlayer.PlayerGui.ScreenGui.Competitive.Frame.Content.Tasks
    
    local chosenFrame = nil
    local leftmostX = math.huge
    local bottommostY = -math.huge
    for i, v in pairs(competitiveFrame:GetChildren()) do
        if v.Name == "Template" then
            if v.Visible then
                if v.AbsolutePosition.X < leftmostX then
                    leftmostX = v.AbsolutePosition.X
                    bottommostY = v.AbsolutePosition.Y
                    chosenFrame = v
                elseif v.AbsolutePosition.X == leftmostX then
                    if v.AbsolutePosition.Y > bottommostY then
                        bottommostY = v.AbsolutePosition.Y
                        chosenFrame = v
                    end
                end
            end
        end
    end
    if chosenFrame then
        print("Chosen frame: " .. chosenFrame.Name)
        local label = chosenFrame:FindFirstChild("Content") and chosenFrame.Content:FindFirstChild("Label")
        if label then
            print("Label Text: " .. label.Text)
        else
            print("Label not found.")
        end
        chosenFrame.BackgroundColor3 = Color3.fromRGB(253, 253, 150)
        print("Background color of chosen frame set to pastel yellow.")
    else
        print("No visible Template frame found.")
    end
    
    for i, v in pairs(competitiveFrame:GetChildren()) do
        if v.Name == "Template" and v.BackgroundColor3 == Color3.fromRGB(253, 253, 150) then
            local content = v:FindFirstChild("Content")
            if content then
                local label = content:FindFirstChild("Label")
                if label then
                    if string.find(label.Text, "Mythic") then
                        print("Mythic found!")
                        local args = {[1] = "CompetitiveReroll",[2] = 3}
                        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    elseif string.find(label.Text, "Shiny") and getgenv().AutoComp then
                        print("Shiny")
                        teleportToTween(CFrame.new(14, 9, -8))
                    elseif string.find(label.Text, "Play") and getgenv().AutoComp then
                        print("Play")
                        teleportToTween(CFrame.new(14, 9, -8))
                    elseif string.match(label.Text, "Common") and getgenv().AutoComp then
                        print("Common")
                        teleportToTween(CFrame.new(-7, 9, -82))
                    elseif string.match(label.Text, "Spotted") and getgenv().AutoComp then
                        print("Spotted")
                        teleportToTween(CFrame.new(-7, 10, -71))
                    elseif string.match(label.Text, "Iceshard") and getgenv().AutoComp then
                        print("Iceshard")
                        teleportToTween(CFrame.new(-8, 10, -62))
                    elseif string.match(label.Text, "Spikey") and getgenv().AutoComp then
                        print("Spikey")
                        teleportToTween(CFrame.new(-127, 10, 6))
                    elseif string.match(label.Text, "Magma") and getgenv().AutoComp then
                        print("Magma")
                        teleportToTween(CFrame.new(-135, 10, 0))
                    elseif string.match(label.Text, "Crystal") and getgenv().AutoComp then
                        print("Crystal")
                        teleportToTween(CFrame.new(-140, 10, -8))
                    elseif string.match(label.Text, "Lunar") and getgenv().AutoComp then
                        print("Lunar")
                        teleportToTween(CFrame.new(-145, 10, -15))
                    elseif string.match(label.Text, "Void") and getgenv().AutoComp then
                        print("Void")
                        teleportToTween(CFrame.new(-146, 10, -25))
                    elseif string.match(label.Text, "Hell") and getgenv().AutoComp then
                        print("Hell")
                        teleportToTween(CFrame.new(-146, 10, -34))
                    elseif string.match(label.Text, "Nightmare") and getgenv().AutoComp then
                        print("Nightmare")
                        teleportToTween(CFrame.new(-142, 10, -44))
                    elseif string.match(label.Text, "Rainbow") and getgenv().AutoComp then
                        print("Rainbow")
                        teleportToTween(CFrame.new(-137, 10, -52))
                    elseif string.match(label.Text, "Throwback") and getgenv().AutoComp then
                        print("Throwback")
                        teleportToTween(CFrame.new(-130, 10, -59))
                    end
                else
                    print("Label not found.")
                end
            else
                print("Content not found.")
            end
        end
    end
end

print("[CakeHub]: Functions Loaded!")

--[ UI: BUTTONS, TOGGLES, ETC! ]--
local w1 = win:Server("Features", "")

-- [ MAIN ]
local Main = w1:Channel("Main")

Main:Seperator()
Main:Toggle("Auto Blow bubble",false, function(bool)
    getgenv().AutoBubble = bool;
    doBubble()
end)
Main:Seperator()
Main:Toggle("Auto collect Coins / Gems",false, function(bool)
getgenv().AutoPickups = bool
doCollectPickups()
end)
Main:Seperator()
print("[CakeHub]: 'Main' Tab Loaded!")

-- [ STUFF ]
local Stuff = w1:Channel("Stuff")

Stuff:Toggle("Auto Collect playtime rewards",false, function(bool)
    getgenv().AutoPlaytime = bool
    doPlaytime()
end)
Stuff:Toggle("Auto Collect chests",false, function(bool)
    getgenv().AutoChests = bool
    doChests()
end)
Stuff:Toggle("Auto Craft",false, function(bool)
    getgenv().AutoCraft = bool
    doAutoCraft()
end)
Stuff:Toggle("Auto Buy markets",false, function(bool)
    getgenv().AutoMarket = bool
    doAutoMarket()
end)
Stuff:Seperator()
print("[CakeHub]: 'Stuff' Tab Loaded!")

-- [ EGGS ]
local Eggs = w1:Channel("Eggs")
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
print("[CakeHub]: 'Eggs' Tab Loaded!")

-- [ TELEPORTS ]
local IslandsTeleport = w1:Channel("Teleport")
IslandsTeleport:Button("Floating Island", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.Floating Island.Island.Portal.Spawn")
end)
IslandsTeleport:Button("Outer Space", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.Outer Space.Island.Portal.Spawn")
end)
IslandsTeleport:Button("Twilight", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn")
end)
IslandsTeleport:Button("The Void", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.The Void.Island.Portal.Spawn")
end)
IslandsTeleport:Button("Zen", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.Zen.Island.Portal.Spawn")
end)
print("[CakeHub]: 'Teleports' Tab Loaded!")

-- [ COMP ]
local Comp = w1:Channel("Competitive")

Comp:Toggle("Auto Teleport 3rd comp task! [BETA]",false, function(bool)
    getgenv().AutoComp = bool
    
    while getgenv().AutoComp and wait(5) do
        doComp()
    end
end)
Comp:Toggle("Spam R (Auto Hatch)",false, function(bool)
    getgenv().AutoCompHatch = bool
    
    while getgenv().AutoCompHatch and wait() do
        vim:SendKeyEvent(true, "R", false, game)
    end
end)

print("[CakeHub]: 'Competitive' Tab Loaded!")

-- [ DISCORD ]
local Discord = w1:Channel("Discord Server")
Discord:Label(getgenv().ServerInvite)
Discord:Button("Copy Discord invite", function()
    setclipboard(getgenv().ServerInvite)
end)

print("[CakeHub]: 'Discord' Tab Loaded!")


print("[CakeHub]: Script fully loaded. Reported any issues you may have in the Discord Server. Enjoy!")
