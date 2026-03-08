local player = game.Players.LocalPlayer
local tweenService = game:GetService("TweenService")
local character = player.Character
if not character then
    character = player.CharacterAdded:Wait()
end
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)

local function tweenToPosition(targetCFrame, duration)

    if not humanoidRootPart then
        warn("HumanoidRootPart не найден!")
        return
    end

    local tweenInfo = TweenInfo.new(
        duration or 2,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out,
        0,
        false,
        0
    )
    local tween = tweenService:Create(humanoidRootPart, tweenInfo, {
        CFrame = targetCFrame
    })
    tween:Play()
end

local function colorsAreSimilar(color1, color2, tolerance)
    tolerance = tolerance or 5
    
    return math.abs(color1.R - color2.R) * 255 <= tolerance and
           math.abs(color1.G - color2.G) * 255 <= tolerance and
           math.abs(color1.B - color2.B) * 255 <= tolerance
end

local targetColor = Color3.new(110/255, 244/255, 240/255)
local targetColorGold = Color3.new(110/255, 244/255, 240/255)
local targetTexture = "rbxassetid://1471850677"
local decalName = "FrontDecal"
local targetTextureGold = "rbxassetid://1471849394"

local folder = workspace:FindFirstChild("Collectibles")

if not folder then
    warn("folder cannot be finded")
    return
end

for index, item in ipairs(folder:GetChildren()) do

    if item:IsA("Part") or item:IsA("MeshPart") then
        
        local colorMatches = colorsAreSimilar(item.Color, targetColor)
        
        local decal = item:FindFirstChild(decalName)
        local textureMatches = decal and decal:IsA("Decal") and decal.Texture == targetTexture
        
        if colorMatches and textureMatches then
            item.Name = "Diamond"
        end
    end
end

for index, item in ipairs(folder:GetChildren()) do

    if item:IsA("Part") or item:IsA("MeshPart") then
        
        local colorMatches = colorsAreSimilar(item.Color, targetColorGold)
        
        local decal = item:FindFirstChild(decalName)
        local textureMatches = decal and decal:IsA("Decal") and decal.Texture == targetTextureGold
        
        if colorMatches and textureMatches then
            item.Name = "Gold"
        end
    end
end

runned = true
runnedGold = true
while runned do
	dia = workspace.Collectibles:WaitForChild("Diamond")
	if dia.Transparency == 0.699999988079071 then
		runned = false
	end
	if dia.Transparency == 0 then
		tweenToPosition(CFrame.new(-57.1720009, 150.0280781, 106.606125), 3)
		wait(3)
		tweenToPosition(CFrame.new(41.7359543, 151.055878, -531.89093, 0.925303102, -0, -0.379228383, 0, 1, -0, 0.379228383, 0, 0.925303102), 3)
		wait(3)
		tweenToPosition(CFrame.new(-57.1720009, 150.0280781, 106.606125), 3)
		wait(3)
	end
	if not dia then
	    runned = false
	end
end

while runnedGold do
	gold = workspace.Collectibles:WaitForChild("Gold")
	if gold.Transparency == 0.699999988079071 then
		runnedGold = false
	end
	if gold.Transparency == 0 then
		tweenToPosition(CFrame.new(-57.1720009, 150.0280781, 106.606125), 3)
		wait(3)
		tweenToPosition(CFrame.new(83.8066254, 69.4766388, -142.149338), 3)
		wait(3)
		tweenToPosition(CFrame.new(-57.1720009, 150.0280781, 106.606125), 3)
		wait(3)
	end
	if not gold then
	    runnedGold = false
	end
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/374qvc/bsseggsget/refs/heads/main/placeeggs.lua"))()
