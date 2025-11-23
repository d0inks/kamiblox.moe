--BHOP is not possible until i find a work around just use velocity--
--havent done jb yet--
local CFG = {
    EB = 0xA0; --left shift
    JB = 0x06; --mb5
    ps = 0x05; --mb4
    speed = 23 --bhop speed
}
local edging = false
local jbing = false
local psing = false
local bhop = true --set to false when doing gui - doink
local playerS = game:GetService("Players")
local player = playerS.LocalPlayer.Character
local hum = player:WaitForChild("Humanoid")
local hrp = player:WaitForChild("HumanoidRootPart")
local white = Color3.new(1, 1, 1) --white
local cam = game:GetService("Workspace"):WaitForChild("Camera")

local ebTxt = Drawing.new("Text")
ebTxt.Position = Vector2.new(960, 750)
ebTxt.Text = "EB"
ebTxt.Color = white
ebTxt.Visible = false

local JBTxt = Drawing.new("Text")
JBTxt.Position = Vector2.new(945, 750)
JBTxt.Text = "JB"
JBTxt.Color = white
JBTxt.Visible = false

local PsTxt = Drawing.new("Text")
PsTxt.Position = Vector2.new(980, 750)
PsTxt.Text = "PS"
PsTxt.Color = white
PsTxt.Visible = false

print("movement sex intialized.")
--loop--
while true do
    local EBpressed = iskeypressed(CFG.EB)
    local JBpressed = iskeypressed(CFG.JB)
    local Pspressed = iskeypressed(CFG.ps)
    if EBpressed then
        if player and not edging then
            ebTxt.Visible = true
            edging = true
            local dir = hrp.AssemblyLinearVelocity
             for i=1,5 do
                 wait()
                    hrp.AssemblyLinearVelocity = Vector3.new(dir.X * 1.25, dir.Y * 0, dir.Z * 1.3) - Vector3.new(0,18,0)
                end
                wait()
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X * 1.8, hrp.AssemblyLinearVelocity.Y * 1, hrp.AssemblyLinearVelocity.Z * 2)
                spawn(function()
                    wait(0.1)
                    edging = false
                    ebTxt.Visible = false
                end)
        end
    end
    if JBpressed then
        if player and not jbing then
            JBTxt.Visible = true
            jbing = true
    --find a way to do jump bug--
        end
	else
        jbing = false
        JBTxt.Visible = false
    end
    if Pspressed then
        if player and not psing then
            local vel = hrp.AssemblyLinearVelocity
            local absX = math.abs(vel.X)
            local absZ = math.abs(vel.Z)
            psing = true
            PsTxt.Visible = true
            if absX < absZ then
                for i=1,25 do
                    hrp.AssemblyLinearVelocity = Vector3.new(0,0,vel.Z*1.5)
                    task.wait()
                end
            elseif absX > absZ then
                for i=1,25 do
                    hrp.AssemblyLinearVelocity = Vector3.new(vel.X*1.5,0,0)
                    task.wait()
                end
            end
            wait()
            hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X * 1, hrp.AssemblyLinearVelocity.Y * 1, hrp.AssemblyLinearVelocity.Z * 2)
        end
    else
        psing = false
        PsTxt.Visible = false
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X * 1, hrp.AssemblyLinearVelocity.Y * 1, hrp.AssemblyLinearVelocity.Z * 1)
        --pixel surf!--
        end
   wait(0.0001)
end

