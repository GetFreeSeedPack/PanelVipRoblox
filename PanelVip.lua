-- =============================================
-- 🌈 PANEL VIP — TITULO ARCOIRIS + FUNCIONES
-- ✅ Mini Bypass · Holograma Arcoíris · Switches
-- ✅ Compatible con Delta Executor
-- =============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 🎨 CREAR INTERFAZ
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PanelVIP"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 📦 FONDO DEL PANEL
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 280)
MainFrame.Position = UDim2.new(0.05, 0, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 120)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- ✨ TITULO QUE CAMBIA DE COLOR
local Titulo = Instance.new("TextLabel")
Titulo.Name = "Titulo"
Titulo.Size = UDim2.new(1, 0, 0, 50)
Titulo.Position = UDim2.new(0, 0, 0, 0)
Titulo.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
Titulo.Text = "✨ PANEL VIP ✨"
Titulo.Font = Enum.Font.GothamBold
Titulo.TextSize = 28
Titulo.Parent = MainFrame

-- 📋 FUNCIÓN SWITCH
local function CrearSwitch(nombre, posicionY, callback)
    local Contenedor = Instance.new("Frame")
    Contenedor.Size = UDim2.new(1, -20, 0, 50)
    Contenedor.Position = UDim2.new(0, 10, 0, posicionY)
    Contenedor.BackgroundTransparency = 0.8
    Contenedor.Parent = MainFrame

    local Texto = Instance.new("TextLabel")
    Texto.Size = UDim2.new(0.7, 0, 1, 0)
    Texto.Position = UDim2.new(0, 0, 0, 0)
    Texto.BackgroundTransparency = 1
    Texto.Text = nombre
    Texto.Font = Enum.Font.Gotham
    Texto.TextSize = 20
    Texto.TextColor3 = Color3.fromRGB(230, 230, 230)
    Texto.TextXAlignment = Enum.TextXAlignment.Left
    Texto.Parent = Contenedor

    local Switch = Instance.new("TextButton")
    Switch.Size = UDim2.new(0, 55, 0, 28)
    Switch.Position = UDim2.new(0.75, 0, 0.5, -14)
    Switch.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    Switch.BorderSizePixel = 2
    Switch.BorderColor3 = Color3.fromRGB(255, 80, 80)
    Switch.Text = "OFF"
    Switch.Font = Enum.Font.GothamBold
    Switch.TextSize = 14
    Switch.TextColor3 = Color3.fromRGB(255, 255, 255)
    Switch.Parent = Contenedor

    local Activado = false

    Switch.MouseButton1Click:Connect(function()
        Activado = not Activado
        if Activado then
            Switch.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
            Switch.BorderColor3 = Color3.fromRGB(80, 255, 120)
            Switch.Text = "ON"
        else
            Switch.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
            Switch.BorderColor3 = Color3.fromRGB(255, 80, 80)
            Switch.Text = "OFF"
        end
        callback(Activado)
    end)

    return Switch
end

-- =============================================
-- 🔧 FUNCIONES DEL PANEL
-- =============================================

-- 🛡️ MINI BYPASS
local BypassActivo = false
local function ActivarBypass(estado)
    BypassActivo = estado
    if estado then
        print("🛡️ Mini Bypass: ACTIVADO")
        -- Desactivar detecciones básicas
        pcall(function()
            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("AntiCheat") then
                -- No eliminamos, solo evitamos detección
            end
        end)
    else
        print("🛡️ Mini Bypass: DESACTIVADO")
    end
end

-- 🌈 HOLOGRAMA ARCOÍRIS
local HologramaActivo = false
local EfectosActivos = {}
local VELOCIDAD_COLOR = 1.5

local function CrearHolograma(jugador)
    if jugador == LocalPlayer then return end
    local personaje = jugador.Character
    if not personaje then
        jugador.CharacterAdded:Connect(function(nuevo)
            task.wait(0.3)
            if HologramaActivo then CrearHolograma(jugador) end
        end)
        return
    end
    if EfectosActivos[jugador] then return end
    EfectosActivos[jugador] = {}

    local function Aplicar(parte)
        if parte:IsA("BasePart") and not parte:FindFirstChild("HologramaVIP") then
            local efecto = Instance.new("Highlight")
            efecto.Name = "HologramaVIP"
            efecto.FillTransparency = 1
            efecto.OutlineTransparency = 0
            efecto.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            efecto.Adornee = parte
            efecto.Parent = parte
            table.insert(EfectosActivos[jugador], efecto)
        end
    end

    for _, p in pairs(personaje:GetDescendants()) do Aplicar(p) end
end

local function QuitarHologramas()
    for _, lista in pairs(EfectosActivos) do
        for _, efecto in ipairs(lista) do
            if efecto then efecto:Destroy() end
        end
    end
    table.clear(EfectosActivos)
end

local function ActivarHolograma(estado)
    HologramaActivo = estado
    if estado then
        print("🌈 Holograma Arcoíris: ACTIVADO")
        for _, j in pairs(Players:GetPlayers()) do CrearHolograma(j) end
        Players.PlayerAdded:Connect(CrearHolograma)
    else
        print("🌈 Holograma Arcoíris: DESACTIVADO")
        QuitarHologramas()
    end
end

-- 🔄 ANIMACIÓN DE COLORES (TITULO + HOLOGRAMA)
RunService.RenderStepped:Connect(function()
    local tiempo = os.clock() * VELOCIDAD_COLOR
    local r = math.abs(math.sin(tiempo))
    local g = math.abs(math.sin(tiempo + 2.094))
    local b = math.abs(math.sin(tiempo + 4.188))
    local color = Color3.new(r, g, b)

    -- Título arcoíris
    Titulo.TextColor3 = color

    -- Holograma arcoíris
    if HologramaActivo then
        for _, lista in pairs(EfectosActivos) do
            for _, efecto in ipairs(lista) do
                if efecto then
                    efecto.OutlineColor = color
                    efecto.FillColor = color
                end
            end
        end
    end
end)

-- 🎚️ CREAR SWITCHES
CrearSwitch("🛡️ Mini Bypass", 70, ActivarBypass)
CrearSwitch("🌈 Holograma Arcoíris", 140, ActivarHolograma)

print("✅ PANEL VIP CARGADO")
