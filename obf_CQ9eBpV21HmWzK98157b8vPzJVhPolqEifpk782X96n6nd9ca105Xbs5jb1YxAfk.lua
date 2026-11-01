local _0xB591 = game:GetService("Players")
local _0xE0E1 = game:GetService("RunService")
local _0x23B9 = game:GetService("UserInputService")
local _0xD137 = _0xB591.LocalPlayer
local _0xFCD3 = {
autoWheelie = false,
maxSpeed = false,
speed = 175,wheelieDeg = 52,}
local function _0x3DF6()
local _0xFFBD = _0xD137.Character
if not _0xFFBD then return end
local _0x9603 = _0xFFBD:FindFirstChildOfClass("Humanoid")
if not _0x9603 or not _0x9603.SeatPart then return end
local _0x49D0 = _0x9603.SeatPart
local _0x1B3E = _0x49D0:FindFirstAncestorOfClass("Model")
if not _0x1B3E then return end
return _0x1B3E, _0x49D0
end
local function _0x08D4(_0x1B3E)
return _0x1B3E.PrimaryPart
or _0x1B3E:FindFirstChild("Chassis")
or _0x1B3E:FindFirstChild("Body")
or _0x1B3E:FindFirstChild("Root")
or _0x1B3E:FindFirstChildWhichIsA("BasePart")
endlocal _0x9CB4 = Instance.new("ScreenGui")
_0x9CB4.Name ="sm_menu"_0x9CB4.ResetOnSpawn = false
_0x9CB4.Parent = game:GetService("CoreGui")
local _0x5FA0 = Instance.new("Frame")
_0x5FA0.Size = UDim2.new(0, 210, 0, 130)
_0x5FA0.Position = UDim2.new(0, 20, 0.4, 0)
_0x5FA0.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
_0x5FA0.BorderSizePixel = 0
_0x5FA0.Active = true
_0x5FA0.Draggable = true
_0x5FA0.Parent = _0x9CB4
local _0x0D71 = Instance.new("TextLabel")
_0x0D71.Size = UDim2.new(1, 0, 0, 28)
_0x0D71.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_0x0D71.BorderSizePixel = 0
_0x0D71.Text ="wallz.lol"_0x0D71.TextColor3 = Color3.fromRGB(220, 220, 220)
_0x0D71.Font = Enum.Font.Code
_0x0D71.TextSize = 14
_0x0D71.Parent = _0x5FA0
local function _0x9868(name, y, flag)
local _0x26F1 = Instance.new("TextButton")
_0x26F1.Size = UDim2.new(1, -16, 0, 28)
_0x26F1.Position = UDim2.new(0, 8, 0, y)
_0x26F1.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0x26F1.BorderSizePixel = 0
_0x26F1.Text = name .."  [off]"_0x26F1.TextColor3 = Color3.fromRGB(180, 180, 180)
_0x26F1.Font = Enum.Font.Code
_0x26F1.TextSize = 13
_0x26F1.Parent = _0x5FA0
_0x26F1.MouseButton1Click:Connect(function()
_0xFCD3[flag] = not _0xFCD3[flag]
if _0xFCD3[flag] then
_0x26F1.Text = name .."  [on]"_0x26F1.BackgroundColor3 = Color3.fromRGB(40, 70, 40)
_0x26F1.TextColor3 = Color3.fromRGB(200, 255, 200)
else
_0x26F1.Text = name .."  [off]"_0x26F1.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0x26F1.TextColor3 = Color3.fromRGB(180, 180, 180)
end
end)
return _0x26F1
end
_0x9868("auto wheelie", 38,"autoWheelie")
_0x9868("max speed", 74,"maxSpeed")
local _0xA73E = Instance.new("TextButton")
_0xA73E.Size = UDim2.new(0, 22, 0, 22)
_0xA73E.Position = UDim2.new(1, -26, 0, 3)
_0xA73E.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
_0xA73E.BorderSizePixel = 0
_0xA73E.Text ="x"_0xA73E.TextColor3 = Color3.fromRGB(220, 150, 150)
_0xA73E.Font = Enum.Font.Code
_0xA73E.TextSize = 14
_0xA73E.Parent = _0x5FA0
_0xA73E.MouseButton1Click:Connect(function()
_0x9CB4:Destroy()
end)local _0x57C5
_0x57C5 = _0xE0E1.Heartbeat:Connect(function(dt)
local _0x8186, _0x49D0 = _0x3DF6()
if not _0x8186 then return end
local _0xBA10 = _0x08D4(_0x8186)
if not _0xBA10 then return endif _0xFCD3.maxSpeed then
local _0x3C8D = _0xBA10.CFrame.LookVector
local _0xCC53 = _0xBA10.AssemblyLinearVelocity
local _0x1EEC = _0x3C8D * _0xFCD3.speed
local _0x9486 = _0xCC53:Lerp(_0x1EEC, math.clamp(dt * 8, 0, 1))
_0xBA10.AssemblyLinearVelocity = Vector3.new(_0x9486.X, _0xCC53.Y, _0x9486.Z)
endif _0xFCD3.autoWheelie then
local _0x9558 = _0xBA10.CFrame
local _0x3C8D = _0x9558.LookVector
local _0xA477 = Vector3.new(_0x3C8D.X, 0, _0x3C8D.Z).Unit
if _0xA477.Magnitude < 0.1 then
_0xA477 = Vector3.new(0, 0, -1)
end
local _0x112D = math.rad(_0xFCD3.wheelieDeg)
local _0x3AEE = Vector3.new(0, 1, 0)
local _0xC202 = _0xA477:Cross(_0x3AEE).Unit
local _0xA1B1 = (_0xA477 * math.cos(_0x112D) + _0x3AEE * math.sin(_0x112D)).Unit
local _0x1263 = _0xC202:Cross(_0xA1B1).Unit
local _0x69F2 = CFrame.fromMatrix(_0xBA10.Position, _0xC202, _0x1263, -_0xA1B1)
_0xBA10.CFrame = _0x69F2
_0xBA10.AssemblyAngularVelocity = Vector3.zero
end
end)
_0x23B9.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.KeyCode == Enum.KeyCode.RightShift then
_0x5FA0.Visible = not _0x5FA0.Visible
end
end)
print("wallz.lol loaded - right shift to hide/show")
