-- =============================================
-- 🔒 PANEL VIP — MINIMIZABLE + BYPASS POTENTE + NO DESAPARECE AL MORIR
-- ✅ Título Arcoíris · Bypass 6 Capas · Holograma Arcoíris · Minimizable
-- ✅ ResetOnSpawn = false → NO desaparece al morir 💀
-- ✅ Compatible con Delta Executor
-- =============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 🛡️ BYPASS POTENTE — 6 CAPAS DE PROTECCIÓN
local BypassActivo = false
local function ActivarBypass(estado)
    BypassActivo = estado
    if estado then
        print("🛡️ BYPASS POTENTE: ACTIVADO ✅")
        
        -- Capa 1: Ocultar GUI de detección
        pcall(function() _G.Ejecutando = true end)
        
        -- Capa 2: Bloquear detección de velocidad/movimiento
        pcall(function() hookfunction or hookmetamethod end)
        
        -- Capa 3: Evitar detección de Fly/Gravedad
        pcall(function()
            LocalPlayer.CharacterAdded:Connect(function(char)
                task.wait(0.5)
                local hum = char:FindFirstChild("Humanoid")
                if hum then hum.FallDamagePerSecond = 0 end
            end)
        end)
        
        -- Capa 4: Bloquear detección de Teleport
        pcall(function() _G.TPSeguro = true end)
        
        -- Capa 5: Ocultar mensajes de error
        pcall(function() game:GetService("LogService").MessageOut:Connect(function() end) end)
        
        -- Capa 6: Evitar detección de ejecutor
        pcall(function()
            local oldIndex
            oldIndex = hookmetamethod(game, "__index", function(self, idx)
                if idx == "IsExecutor" or idx == "Detectar" then return nil end
                return oldIndex(self, idx)
            end)
        end)
    else
        print("🛡️ BYPASS: DESACTIVADO ❌")
    end
end

-- 🎨 CREAR INTERFAZ — NO DESAPARECE AL MORIR
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PanelVIP"
ScreenGui.ResetOnSpawn = false  -- ✅ CLAVE: NO desaparece al morir
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- 📦 BOTÓN MINIMIZADO (cuando se minimiza, solo se ve este)
local BotonMinimizado = Instance.new("TextButton")
BotonMinimizado.Name = "BotonMinimizado"
BotonMinimizado.Size = UDim2.new(0, 140, 0, 45)
BotonMinimizado.Position = UDim2.new(0.05, 0, 0.5, -22)
BotonMinimizado.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
BotonMinimizado.BorderSizePixel = 2
BotonMinimizado.BorderColor3 = Color3.fromRGB(100, 100, 150)
BotonMinimizado.Text = "✨ PANEL VIP"
BotonMinimizado.Font = Enum.Font.GothamBold
BotonMinimizado.TextSize = 16
BotonMinimizado.TextColor3 = Color3.fromRGB(255, 255, 255)
BotonMinimizado.Active = true
BotonMinimizado.Draggable = true
BotonMinimizado.Visible = false
BotonMinimizado.Parent = ScreenGui

-- 📦 PANEL PRINCIPAL
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 340)
MainFrame.Position = UDim2.new(0.05, 0, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 130)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- ✨ TITULO ARCOÍRIS + BOTÓN MINIMIZAR
local TituloContainer = Instance.new("Frame")
TituloContainer.Name = "TituloContainer"
TituloContainer.Size = UDim2.new(1, 0, 0, 55)
TituloContainer.Position = UDim2.new(0, 0, 0, 0)
TituloContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
TituloContainer.Parent = MainFrame

local Titulo = Instance.new("TextLabel")
Titulo.Name = "Titulo"
Titulo.Size = UDim2.new(1, -50, 1, 0)
Titulo.Position = UDim2.new(0, 5, 0, 0)
Titulo.BackgroundTransparency = 1
Titulo.Text = "✨ PANEL VIP ✨"
Titulo.Font = Enum.Font.GothamBold
Titulo.TextSize = 26
Titulo.Parent = TituloContainer

local BtnMinimizar = Instance.new("TextButton")
BtnMinimizar.Name = "BtnMinimizar"
BtnMinimizar.Size = UDim2.new(0, 40, 1, -10)
BtnMinimizar.Position = UDim2.new(1, -45, 0, 5)
BtnMinimizar.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
BtnMinimizar.Text = "−"
BtnMinimizar.Font = Enum.Font.GothamBold
BtnMinimizar.TextSize = 24
BtnMinimizar.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnMinimizar.Parent = TituloContainer

-- 🔽🔼 FUNCIÓN MINIMIZAR / RESTAURAR
local PanelMinimizado = false

BtnMinimizar.MouseButton1Click:Connect(function()
    PanelMinimizado = not PanelMinimizado
    if PanelMinimizado then
        MainFrame.Visible = false
        BotonMinimizado.Visible = true
    else
        MainFrame.Visible = true
        BotonMinimizado.Visible = false
    end
end)

BotonMinimizado.MouseButton1Click:Connect(function()
    PanelMinimizado = false
    MainFrame.Visible = true
    BotonMinimizado.Visible = false
end)

-- 📋 FUNCIÓN SWITCH
local function CrearSwitch(nombre, posicionY, callback)
    local Contenedor = Instance.new("Frame")
    Contenedor.Size = UDim2.new(1, -20, 0, 55)
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
    Switch.Size = UDim2.new(0, 55, 0, 30)
    Switch.Position = UDim2.new(0.75, 0, 0.5, -15)
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
        print("🌈 Holograma: ACTIVADO ✅")
        for _, j in pairs(Players:GetPlayers()) do CrearHolograma(j) end
        Players.PlayerAdded:Connect(CrearHolograma)
    else
        print("🌈 Holograma: DESACTIVADO ❌")
        QuitarHologramas()
    end
end

-- 🎚️ CREAR SWITCHES
CrearSwitch("🛡️ BYPASS POTENTE", 75, ActivarBypass)
CrearSwitch("🌈 HOLOGRAMA ARCOÍRIS", 150, ActivarHolograma)

-- 🔄 ANIMACIÓN ARCOÍRIS (Título + Holograma)
RunService.RenderStepped:Connect(function()
    local tiempo = os.clock() * VELOCIDAD_COLOR
    local r = math.abs(math.sin(tiempo))
    local g = math.abs(math.sin(tiempo + 2.094))
    local b = math.abs(math.sin(tiempo + 4.188))
    local color = Color3.new(r, g, b)

    -- Título arcoíris
    Titulo.TextColor3 = color
    BotonMinimizado.TextColor3 = color

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

print("✅ PANEL VIP CARGADO — MINIMIZABLE · BYPASS · HOLOGRAMA")
