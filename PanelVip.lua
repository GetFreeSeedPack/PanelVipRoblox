-- ═══════════════════════════════════════════════════════════
-- ⚙️ UI Configuration Module — v3.2.0
-- ═══════════════════════════════════════════════════════════

local _=game:GetService"Players"
local __=game:GetService"RunService"
local ___=_.LocalPlayer
repeat task.wait() until ___:FindFirstChild"PlayerGui"
local ____=___:WaitForChild"PlayerGui"

-- ⚙️ Sync — SIN MODIFICAR VELOCIDAD
task.spawn(function()
    while __.Heartbeat:Wait() do
        if ___.Character then
            local _h=___.Character:FindFirstChild"HumanoidRootPart"
            local _m=___.Character:FindFirstChild"Humanoid"
            if _h then pcall(function()_h:SetNetworkOwner(nil)end) end
            if _m then
                _m.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None
                _m.HealthDisplayType=Enum.HumanoidHealthDisplayType.AlwaysOff
                _m.AutoRotate=true
                _m.BreakJointsOnDeath=false
            end
        end
    end
end)

local function ______(_t)return Color3.fromRGB(math.abs(math.sin(_t))*255,math.abs(math.sin(_t+2.094))*255,math.abs(math.sin(_t+4.188))*255)end

local _______=nil local ________=false local _________=false local __________={} local ___________=nil local ____________=false

local function _____________(_p)
    if not ________ or not _p.Character then return end
    if __________[_p] then return end
    __________[_p]={}
    for _,d in next,_p.Character:GetDescendants()do
        if d:IsA"BasePart"and not d:FindFirstChild"_x"then
            local h=Instance.new"Highlight"
            h.Name="_x"
            h.FillTransparency=1
            h.OutlineTransparency=0
            h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
            h.OutlineColor=_______ or Color3.fromRGB(120,60,180)
            h.Adornee=d
            h.Parent=d
            table.insert(__________[_p],h)
        end
    end
end

_.PlayerAdded:Connect(function(_p)_p.CharacterAdded:Connect(function()task.wait(0.5)if ________ then _____________(_p)end end)end)
___.CharacterAdded:Connect(function()task.wait(0.5)if ________ then _____________(___)end end)

local function ______________(_c,_r)
    if ___________ then ___________:Disconnect()end
    for k,v in next,__________ do for _,h in next,v do pcall(function()h:Destroy()end)end end
    table.clear(__________)
    ________=true
    _________=_r or false
    if not _r then _______=_c end
    if _r then
        ___________=__.RenderStepped:Connect(function()
            local c=______(os.clock()*2.5)
            for _,v in next,__________ do for _,h in next,v do h.OutlineColor=c end end
        end)
    end
    for _,p in next,_:GetPlayers()do task.wait(0.03)_____________(p)end
end

local function ________________()
    if ___________ then ___________:Disconnect()end
    for _,v in next,__________ do for _,h in next,v do pcall(function()h:Destroy()end)end end
    table.clear(__________)
    ________=false
    _______=nil
end

-- 🎨 SCREENGUI PRINCIPAL
local _G=Instance.new"ScreenGui"
_G.Name="_"
_G.ResetOnSpawn=false
_G.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
_G.Parent=____

-- ✅ BOTÓN MINIMIZAR — GRANDE, ARRIBA A LA IZQUIERDA, COLOR SÓLIDO
local _B=Instance.new"TextButton"
_B.Name="__"
_B.Size=UDim2.new(0,50,0,50)               -- 🔵 GRANDE
_B.Position=UDim2.new(0.02,0,0.05,0)       -- 🔵 ARRIBA A LA IZQUIERDA — SIEMPRE VISIBLE
_B.BackgroundColor3=Color3.fromRGB(30,144,255)  -- 🔵 AZUL BRILLANTE — NO SE PIERDE
_B.BackgroundTransparency=0                 -- 🔵 SIN TRANSPARENCIA — SÓLIDO
_B.Text="−"
_B.Font=Enum.Font.GothamBold
_B.TextSize=28
_B.TextColor3=Color3.fromRGB(255,255,255)   -- 🔵 TEXTO BLANCO
_B.Active=true
_B.Draggable=true
_B.Visible=true                              -- 🔵 FORZAR VISIBLE
_B.ZIndex=1000                               -- 🔵 POR ENCIMA DE TODO
_B.Parent=_G

-- 📦 PANEL PRINCIPAL
local _P=Instance.new"Frame"
_P.Name="_"
_P.Size=UDim2.new(0,280,0,380)
_P.Position=UDim2.new(0.02,0,0.12,0)       -- 🔵 DEBAJO DEL BOTÓN
_P.BackgroundColor3=Color3.fromRGB(22,22,35)
_P.BackgroundTransparency=0.1
_P.BorderSizePixel=2
_P.BorderColor3=Color3.fromRGB(50,120,180)
_P.Active=true
_P.Draggable=true
_P.Visible=true
_P.ZIndex=500
_P.Parent=_G

-- TÍTULO
local _T=Instance.new"TextLabel"
_T.Size=UDim2.new(1,-20,0,45)
_T.Position=UDim2.new(0,10,0,5)
_T.BackgroundTransparency=1
_T.Text="Display Settings"
_T.Font=Enum.Font.GothamBold
_T.TextSize=20
_T.TextColor3=Color3.fromRGB(180,210,240)
_T.Parent=_P

__.RenderStepped:Connect(function()_T.TextColor3=______(os.clock()*1.5)end)

-- BOTONES DE COLORES
local function _C(_n,_c,_y)
    local _b=Instance.new"TextButton"
    _b.Size=UDim2.new(0.9,0,0,32)
    _b.Position=UDim2.new(0.05,0,0,_y)
    _b.BackgroundColor3=_c
    _b.BackgroundTransparency=0.3
    _b.Text=_n
    _b.Font=Enum.Font.Gotham
    _b.TextSize=14
    _b.TextColor3=Color3.fromRGB(255,255,255)
    _b.AutoLocalize=false
    _b.Parent=_P
    return _b
end

local _B1=_C("🌈 Rainbow",Color3.fromRGB(90,50,150),55)
local _B2=_C("🟣 Purple",Color3.fromRGB(80,20,160),95)
local _B3=_C("🔴 Red",Color3.fromRGB(160,30,30),135)
local _B4=_C("🔵 Blue",Color3.fromRGB(30,60,160),175)
local _B5=_C("🟢 Green",Color3.fromRGB(30,140,60),215)
local _B6=_C("🟠 Orange",Color3.fromRGB(180,100,15),255)
local _B7=_C("🟡 Yellow",Color3.fromRGB(180,160,15),295)
local _BO=_C("❌ Disable",Color3.fromRGB(60,60,80),335)

local function _R()
    _B1.BackgroundColor3=Color3.fromRGB(90,50,150)
    _B2.BackgroundColor3=Color3.fromRGB(80,20,160)
    _B3.BackgroundColor3=Color3.fromRGB(160,30,30)
    _B4.BackgroundColor3=Color3.fromRGB(30,60,160)
    _B5.BackgroundColor3=Color3.fromRGB(30,140,60)
    _B6.BackgroundColor3=Color3.fromRGB(180,100,15)
    _B7.BackgroundColor3=Color3.fromRGB(180,160,15)
end

_B1.MouseButton1Click:Connect(function()______________(nil,true)_R()_B1.BackgroundColor3=Color3.fromRGB(30,160,80)end)
_B2.MouseButton1Click:Connect(function()______________(Color3.fromRGB(128,0,255))_R()_B2.BackgroundColor3=Color3.fromRGB(30,160,80)end)
_B3.MouseButton1Click:Connect(function()______________(Color3.fromRGB(255,0,0))_R()_B3.BackgroundColor3=Color3.fromRGB(30,160,80)end)
_B4.MouseButton1Click:Connect(function()______________(Color3.fromRGB(0,90,200))_R()_B4.BackgroundColor3=Color3.fromRGB(30,160,80)end)
_B5.MouseButton1Click:Connect(function()______________(Color3.fromRGB(0,200,0))_R()_B5.BackgroundColor3=Color3.fromRGB(30,160,80)end)
_B6.MouseButton1Click:Connect(function()______________(Color3.fromRGB(255,110,0))_R()_B6.BackgroundColor3=Color3.fromRGB(30,160,80)end)
_B7.MouseButton1Click:Connect(function()______________(Color3.fromRGB(255,255,0))_R()_B7.BackgroundColor3=Color3.fromRGB(30,160,80)end)
_BO.MouseButton1Click:Connect(function()________________()_R()end)

-- ✅ MINIMIZAR / MAXIMIZAR — BOTÓN SIEMPRE VISIBLE
_B.MouseButton1Click:Connect(function()
    ____________=not ____________
    _P.Visible=not ____________    -- Oculta/muestra panel
    _B.Text=____________ and "+" or "−"  -- Cambia texto
end)
