-- =============================================
-- 🔒 PANEL VIP — COMPACTO · MINIMIZABLE · DESACTIVAR
-- ✅ MISMO DISEÑO COLUMNAS | MÁS PEQUEÑO | BOTÓN MINIMIZAR
-- ✅ BOTÓN DE DESACTIVAR HOLOGRAMAS
-- =============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 🎨 INTERFAZ
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PanelVIP"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- 📦 BOTÓN MINIMIZADO (cuando se cierra)
local BotonMinimizado = Instance.new("TextButton")
BotonMinimizado.Size = UDim2.new(0, 140, 0, 45)
BotonMinimizado.Position = UDim2.new(0.02, 0, 0.5, -22)
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

-- 📦 PANEL PRINCIPAL — MÁS CHICO
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 260)  -- ✅ MÁS PEQUEÑO
MainFrame.Position = UDim2.new(0.02, 0, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 130)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- ✨ TITULO + BOTÓN MINIMIZAR
local TituloContainer = Instance.new("Frame")
TituloContainer.Size = UDim2.new(1, 0, 0, 45)
TituloContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
TituloContainer.Parent = MainFrame

local Titulo = Instance.new("TextLabel")
Titulo.Size = UDim2.new(1, -45, 1, 0)
Titulo.Position = UDim2.new(0, 5, 0, 0)
Titulo.BackgroundTransparency = 1
Titulo.Text = "✨ PANEL VIP ✨"
Titulo.Font = Enum.Font.GothamBold
Titulo.TextSize = 22
Titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
Titulo.Parent = TituloContainer

local BtnMinimizar = Instance.new("TextButton")
BtnMinimizar.Size = UDim2.new(0, 40, 1, -10)
BtnMinimizar.Position = UDim2.new(1, -45, 0, 5)
BtnMinimizar.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
BtnMinimizar.Text = "−"
BtnMinimizar.Font = Enum.Font.GothamBold
BtnMinimizar.TextSize = 24
BtnMinimizar.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnMinimizar.Parent = TituloContainer

-- =============================================
-- 🔧 SISTEMA MINIMIZAR / RESTAURAR
-- =============================================
local PanelMinimizado = false
BtnMinimizar.MouseButton1Click:Connect(function()
    PanelMinimizado = true
    MainFrame.Visible = false
    BotonMinimizado.Visible = true
end)
BotonMinimizado.MouseButton1Click:Connect(function()
    PanelMinimizado = false
    MainFrame.Visible = true
    BotonMinimizado.Visible = false
end)

-- =============================================
-- 📋 FILA 1: SEGURIDAD
-- =============================================
local EtiquetaSeguridad = Instance.new("TextButton")
EtiquetaSeguridad.Size = UDim2.new(0.45, 0, 0, 40)
EtiquetaSeguridad.Position = UDim2.new(0.05, 0, 0, 55)
EtiquetaSeguridad.BackgroundTransparency = 1
EtiquetaSeguridad.Text = "▼ 🛡️ SEGURIDAD"
EtiquetaSeguridad.Font = Enum.Font.GothamBold
EtiquetaSeguridad.TextSize = 17
EtiquetaSeguridad.TextColor3 = Color3.fromRGB(100, 180, 255)
EtiquetaSeguridad.TextXAlignment = Enum.TextXAlignment.Left
EtiquetaSeguridad.Parent = MainFrame

local BtnBypass = Instance.new("TextButton")
BtnBypass.Size = UDim2.new(0.45, 0, 0, 38)
BtnBypass.Position = UDim2.new(0.50, 0, 0, 56)
BtnBypass.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
BtnBypass.BorderSizePixel = 2
BtnBypass.BorderColor3 = Color3.fromRGB(100, 100, 150)
BtnBypass.Text = "🔒 BYPASS"
BtnBypass.Font = Enum.Font.GothamBold
BtnBypass.TextSize = 15
BtnBypass.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnBypass.Visible = false
BtnBypass.Parent = MainFrame

-- =============================================
-- 📋 FILA 2: HOLOGRAMAS
-- =============================================
local EtiquetaHologramas = Instance.new("TextButton")
EtiquetaHologramas.Size = UDim2.new(0.45, 0, 0, 40)
EtiquetaHologramas.Position = UDim2.new(0.05, 0, 0, 105)
EtiquetaHologramas.BackgroundTransparency = 1
EtiquetaHologramas.Text = "▼ ✨ HOLOGRAMAS"
EtiquetaHologramas.Font = Enum.Font.GothamBold
EtiquetaHologramas.TextSize = 17
EtiquetaHologramas.TextColor3 = Color3.fromRGB(255, 150, 100)
EtiquetaHologramas.TextXAlignment = Enum.TextXAlignment.Left
EtiquetaHologramas.Parent = MainFrame

local BtnArcoiris = Instance.new("TextButton")
BtnArcoiris.Size = UDim2.new(0.45, 0, 0, 32)
BtnArcoiris.Position = UDim2.new(0.50, 0, 0, 100)
BtnArcoiris.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
BtnArcoiris.BorderSizePixel = 2
BtnArcoiris.BorderColor3 = Color3.fromRGB(100, 100, 150)
BtnArcoiris.Text = "🌈 ARCOÍRIS"
BtnArcoiris.Font = Enum.Font.GothamBold
BtnArcoiris.TextSize = 13
BtnArcoiris.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnArcoiris.Visible = false
BtnArcoiris.Parent = MainFrame

local BtnRojo = Instance.new("TextButton")
BtnRojo.Size = UDim2.new(0.45, 0, 0, 32)
BtnRojo.Position = UDim2.new(0.50, 0, 0, 134)
BtnRojo.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
BtnRojo.BorderSizePixel = 2
BtnRojo.BorderColor3 = Color3.fromRGB(100, 100, 150)
BtnRojo.Text = "🔴 ROJO"
BtnRojo.Font = Enum.Font.GothamBold
BtnRojo.TextSize = 13
BtnRojo.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnRojo.Visible = false
BtnRojo.Parent = MainFrame

local BtnAzul = Instance.new("TextButton")
BtnAzul.Size = UDim2.new(0.45, 0, 0, 32)
BtnAzul.Position = UDim2.new(0.50, 0, 0, 168)
BtnAzul.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
BtnAzul.BorderSizePixel = 2
BtnAzul.BorderColor3 = Color3.fromRGB(100, 100, 150)
BtnAzul.Text = "🔵 AZUL"
BtnAzul.Font = Enum.Font.GothamBold
BtnAzul.TextSize = 13
BtnAzul.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnAzul.Visible = false
BtnAzul.Parent = MainFrame

local BtnDesactivarHolo = Instance.new("TextButton")
BtnDesactivarHolo.Size = UDim2.new(0.45, 0, 0, 32)
BtnDesactivarHolo.Position = UDim2.new(0.50, 0, 0, 202)
BtnDesactivarHolo.BackgroundColor3 = Color3.fromRGB(80, 40, 40)
BtnDesactivarHolo.BorderSizePixel = 2
BtnDesactivarHolo.BorderColor3 = Color3.fromRGB(150, 60, 60)
BtnDesactivarHolo.Text = "❌ DESACTIVAR"
BtnDesactivarHolo.Font = Enum.Font.GothamBold
BtnDesactivarHolo.TextSize = 13
BtnDesactivarHolo.TextColor3 = Color3.fromRGB(255, 200, 200)
BtnDesactivarHolo.Visible = false
BtnDesactivarHolo.Parent = MainFrame

-- =============================================
-- 🔧 SISTEMA ABRIR / CERRAR
-- =============================================
local SeguridadAbierta = false
local HologramasAbierta = false

EtiquetaSeguridad.MouseButton1Click:Connect(function()
    SeguridadAbierta = not SeguridadAbierta
    BtnBypass.Visible = SeguridadAbierta
    EtiquetaSeguridad.Text = SeguridadAbierta and "▲ 🛡️ SEGURIDAD" or "▼ 🛡️ SEGURIDAD"
    if SeguridadAbierta and HologramasAbierta then
        HologramasAbierta = false
        EtiquetaHologramas.Text = "▼ ✨ HOLOGRAMAS"
        BtnArcoiris.Visible = false
        BtnRojo.Visible = false
        BtnAzul.Visible = false
        BtnDesactivarHolo.Visible = false
    end
end)

EtiquetaHologramas.MouseButton1Click:Connect(function()
    HologramasAbierta = not HologramasAbierta
    BtnArcoiris.Visible = HologramasAbierta
    BtnRojo.Visible = HologramasAbierta
    BtnAzul.Visible = HologramasAbierta
    BtnDesactivarHolo.Visible = HologramasAbierta
    EtiquetaHologramas.Text = HologramasAbierta and "▲ ✨ HOLOGRAMAS" or "▼ ✨ HOLOGRAMAS"
    if HologramasAbierta and SeguridadAbierta then
        SeguridadAbierta = false
        EtiquetaSeguridad.Text = "▼ 🛡️ SEGURIDAD"
        BtnBypass.Visible = false
    end
end)

-- =============================================
-- 🔧 SISTEMA BYPASS
-- =============================================
local BypassActivo = false
BtnBypass.MouseButton1Click:Connect(function()
    BypassActivo = not BypassActivo
    if BypassActivo then
        BtnBypass.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
        BtnBypass.BorderColor3 = Color3.fromRGB(80, 220, 120)
        BtnBypass.Text = "✅ ACTIVADO"
        pcall(function()
            LocalPlayer.CharacterAdded:Connect(function(char)
                task.wait(0.5)
                local hum = char:FindFirstChild("Humanoid")
                if hum then hum.FallDamagePerSecond = 0 end
            end)
        end)
    else
        BtnBypass.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
        BtnBypass.BorderColor3 = Color3.fromRGB(100, 100, 150)
        BtnBypass.Text = "🔒 BYPASS"
    end
end)

-- =============================================
-- 🌈 SISTEMA HOLOGRAMAS
-- =============================================
local HologramaActivo = false
local EfectosActivos = {}
local ModoArcoiris = false
local ColorFijo = nil
local VELOCIDAD_COLOR = 1.5

local BotonesHolo = {BtnArcoiris, BtnRojo, BtnAzul}

local function QuitarTodo()
    for _, lista in pairs(EfectosActivos) do
        for _, efecto in ipairs(lista) do
            if efecto then pcall(function() efecto:Destroy() end) end
        end
    end
    table.clear(EfectosActivos)
    HologramaActivo = false
    ModoArcoiris = false
    ColorFijo = nil
    for _, btn in ipairs(BotonesHolo) do
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
        btn.BorderColor3 = Color3.fromRGB(100, 100, 150)
    end
    print("❌ HOLOGRAMAS DESACTIVADOS")
end

local function AplicarAJugador(jugador)
    if not HologramaActivo then return end
    if jugador == LocalPlayer then return end
    if EfectosActivos[jugador] then return end
    local personaje = jugador.Character
    if not personaje then
        jugador.CharacterAdded:Connect(function()
            task.wait(0.5)
            if HologramaActivo then AplicarAJugador(jugador) end
        end)
        return
    end
    EfectosActivos[jugador] = {}
    for _, parte in pairs(personaje:GetDescendants()) do
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
end

local function ActivarHolograma(color, esArcoiris, btnActivo)
    QuitarTodo()
    task.wait(0.1)
    HologramaActivo = true
    ModoArcoiris = esArcoiris
    ColorFijo = color
    btnActivo.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
    btnActivo.BorderColor3 = Color3.fromRGB(80, 220, 120)
    for _, j in ipairs(Players:GetPlayers()) do
        task.wait(0.05)
        AplicarAJugador(j)
    end
    Players.PlayerAdded:Connect(function(nuevo)
        task.wait(0.8)
        if HologramaActivo then AplicarAJugador(nuevo) end
    end)
end

-- 🎚️ BOTONES
BtnArcoiris.MouseButton1Click:Connect(function()
    ActivarHolograma(nil, true, BtnArcoiris)
end)
BtnRojo.MouseButton1Click:Connect(function()
    ActivarHolograma(Color3.fromRGB(255, 0, 0), false, BtnRojo)
end)
BtnAzul.MouseButton1Click:Connect(function()
    ActivarHolograma(Color3.fromRGB(0, 120, 255), false, BtnAzul)
end)
BtnDesactivarHolo.MouseButton1Click:Connect(QuitarTodo)

-- =============================================
-- 🔄 ANIMACIÓN ARCOÍRIS
-- =============================================
RunService.RenderStepped:Connect(function()
    local tiempo = os.clock() * VELOCIDAD_COLOR
    local r = math.abs(math.sin(tiempo))
    local g = math.abs(math.sin(tiempo + 2.094))
    local b = math.abs(math.sin(tiempo + 4.188))
    local colorArcoiris = Color3.new(r, g, b)
    Titulo.TextColor3 = colorArcoiris
    if HologramaActivo then
        local colorActual = ModoArcoiris and colorArcoiris or ColorFijo
        for _, lista in pairs(EfectosActivos) do
            for _, efecto in ipairs(lista) do
                if efecto and colorActual then
                    pcall(function()
                        efecto.OutlineColor = colorActual
                        efecto.FillColor = colorActual
                    end)
                end
            end
        end
    end
end)

print("✅ PANEL VIP — COMPACTO + MINIMIZABLE + DESACTIVAR! 🎉")
