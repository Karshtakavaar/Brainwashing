--[[
Features
Steal Tools
Semi effective Anti Kill 
Drop all tools
--]]
local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Karshtakavaar/Folder/main/WallysUI', true))()
local Window1 = library:CreateWindow('Features')
local CoreGui = game:GetService('CoreGui'); CoreGui.ScreenGui.Name = 'MainUI'
local Player = game:GetService('Players').LocalPlayer
local Character = Player.Character
local HumanoidRootPart = Character:WaitForChild('HumanoidRootPart')
local Humanoid = Character:WaitForChild('Humanoid')
Player.CharacterAdded:Connect(function(NewCharacter)
  Character = NewCharacter
  HumanoidRootPart = NewCharacter:WaitForChild('HumanoidRootPart')
  HumanoidRootPart = NewCharacter:WaitForChild('Humanoid')
end)


task.spawn(function()
    while task.wait() do
        if Window1.flags.StealTools then
            for i, v in next, game:GetService('Workspace'):GetChildren() do
                if v:IsA'Tool' then
                    for i, Tool in next, v:GetDescendants() do
                        if Tool:IsA'TouchTransmitter' then
                            firetouchinterest(HumanoidRootPart, Tool.Parent, 0)
                        for Random, Name in next, Character:GetChildren() do
                            if Name:IsA'Tool' then
                                Name.Parent = Player.Backpack
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
Window1:Toggle('Steal Tools', {flag = 'StealTools'})

task.spawn(function()
    while task.wait() do
        if Window1.flags.AntiKill then
            for i, v in next, Character:GetChildren() do
                if v:IsA'Tool' then
                    Humanoid:UnequipTools(v)
                end
            end
        end
    end
end)
Window1:Toggle('Anti Kill', {flag = 'AntiKill'})

Window1:Button('Drop All Tools', function()
    for i, v in next, Player.Backpack:GetChildren() do
        v.Parent = Character
        wait()
        v.Parent = game:GetService('Workspace')
        end
end)

Window1:Button('Destroy UI', function()
    CoreGui.MainUI:Destroy()
end)
