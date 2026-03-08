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

tweenToPosition(CFrame.new(-57.1720009, 150.0280781, 106.606125), 3)
wait(3)
tweenToPosition(CFrame.new(41.7359543, 151.055878, -531.89093, 0.925303102, -0, -0.379228383, 0, 1, -0, 0.379228383, 0, 0.925303102), 3)
