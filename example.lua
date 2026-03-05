--[[
    5BLib v3 Example Script
]]

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/orbitalclientdev/tets/refs/heads/main/source/lua"))()

-- Create Window with all settings
local Window = Lib:CreateWindow({
    Name = "5BLib v3 Demo",
    Subtitle = "Glassmorphism UI",
    LogoID = "6031097225",
    LoadingEnabled = true,
    LoadingTitle = "5BLib Interface Suite",
    LoadingSubtitle = "Loading demo...",
    Theme = "Nightlight", -- Options: Nightlight, Starlight, Solar, Sparkle, Lime, Cherry, Daylight, Blossom, Vine, Ocean
    ToggleBind = Enum.KeyCode.RightControl,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "5BLib",
        FileName = "demo_config"
    },
   --  KeySystem = true, -- Uncomment to test key system
   -- KeySettings = {
   -- Title = "5BLib Demo | Key",
   --     Subtitle = "Key System",
   --     Note = "Enter key to continue",
   --     Key = {"demo123"},
   --     SaveKey = true,
   -- }
})

-- Welcome notification
Lib:Notification({
    Title = "Welcome to 5BLib v3",
    Content = "This demo showcases all the features including glassmorphism, gradient themes, and advanced UI elements.",
    Icon = "sparkle",
    Type = "Success",
    Duration = 5,
})

-- ══════════════════════════════════════
-- HOME TAB
-- ══════════════════════════════════════
Window:CreateHomeTab({
    Icon = "home",
    DiscordInvite = "your-discord-invite",
    SupportedExecutors = {"Synapse X", "Script-Ware", "KRNL", "Fluxus"},
})

-- ══════════════════════════════════════
-- MAIN TAB — All Elements
-- ══════════════════════════════════════
local MainTab = Window:CreateTab({
    Name = "Main",
    Icon = "view_in_ar",
    ShowTitle = true,
})

-- Section: Actions
local actionsSection = MainTab:CreateSection("Actions")

actionsSection:CreateButton({
    Name = "Simple Button",
    Callback = function()
        Lib:Notification({Title = "Button Clicked", Content = "You pressed the button!", Icon = "check", Type = "Success"})
    end
})

actionsSection:CreateButton({
    Name = "Button With Description",
    Description = "This button has a description explaining what it does",
    Callback = function()
        print("Button with description clicked!")
    end
})

actionsSection:CreateDivider()

-- Section: Toggles & Sliders
local controlsSection = MainTab:CreateSection("Controls")

controlsSection:CreateToggle({
    Name = "ESP Toggle",
    Description = "Enable visual indicators for players",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(value)
        print("ESP:", value)
    end
})

controlsSection:CreateToggle({
    Name = "Default On Toggle",
    CurrentValue = true,
    Flag = "DefaultOn",
    Callback = function(value)
        print("Default On:", value)
    end
})

controlsSection:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 16,
    Suffix = " studs/s",
    Flag = "WalkSpeed",
    Callback = function(value)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end)
    end
})

controlsSection:CreateSlider({
    Name = "Jump Power",
    Range = {50, 300},
    Increment = 5,
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(value)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end)
    end
})

-- ══════════════════════════════════════
-- ELEMENTS TAB — More Elements
-- ══════════════════════════════════════
local ElementsTab = Window:CreateTab({
    Name = "Elements",
    Icon = "dashboard",
    ShowTitle = true,
})

-- Section: Labels (3 styles)
local labelsSection = ElementsTab:CreateSection("Labels")

labelsSection:CreateLabel({
    Text = "Normal label — simple text display",
    Style = 1
})

labelsSection:CreateLabel({
    Text = "Info label — contextual information",
    Style = 2
})

labelsSection:CreateLabel({
    Text = "Warning label — caution or alert",
    Style = 3
})

-- Section: Paragraph
local paragraphSection = ElementsTab:CreateSection("Paragraphs")

paragraphSection:CreateParagraph({
    Title = "About 5BLib v3",
    Content = "5BLib v3 is a UI library featuring glassmorphism design, gradient accent themes, Material icons, and a comprehensive set of UI elements. Every element supports descriptions, hover effects, and smooth Exponential easing animations."
})

-- Section: Inputs
local inputSection = ElementsTab:CreateSection("Inputs")

inputSection:CreateInput({
    Name = "Text Input",
    Description = "Type anything here",
    PlaceholderText = "Enter text...",
    Callback = function(text)
        print("Input:", text)
    end
})

inputSection:CreateInput({
    Name = "Numeric Only",
    Description = "Numbers only, max 6 characters",
    PlaceholderText = "123456",
    Numeric = true,
    MaxCharacters = 6,
    Callback = function(text)
        print("Number:", text)
    end
})

inputSection:CreateInput({
    Name = "Enter Required",
    Description = "Press Enter to submit",
    PlaceholderText = "Press Enter...",
    Enter = true,
    Callback = function(text)
        Lib:Notification({Title = "Input Submitted", Content = "You typed: " .. text, Icon = "send", Type = "Info"})
    end
})

-- ══════════════════════════════════════
-- ADVANCED TAB — Dropdowns, Binds, Colors
-- ══════════════════════════════════════
local AdvancedTab = Window:CreateTab({
    Name = "Advanced",
    Icon = "settings",
    ShowTitle = true,
})

-- Section: Dropdowns
local ddSection = AdvancedTab:CreateSection("Dropdowns")

ddSection:CreateDropdown({
    Name = "Single Select",
    Description = "Pick one option",
    Options = {"Aimbot", "ESP", "Speed", "Fly", "Noclip"},
    CurrentOption = "ESP",
    MultipleOptions = false,
    Flag = "Feature",
    Callback = function(selected)
        print("Selected:", selected)
    end
})

ddSection:CreateDropdown({
    Name = "Multi Select",
    Description = "Pick multiple options",
    Options = {"Red", "Blue", "Green", "Yellow", "Purple", "Orange"},
    CurrentOption = {"Red", "Blue"},
    MultipleOptions = true,
    Callback = function(selected)
        print("Selected:", table.concat(selected, ", "))
    end
})

ddSection:CreateDropdown({
    Name = "Player Select",
    Description = "Built-in player dropdown",
    Options = {},
    MultipleOptions = false,
    SpecialType = "Player",
    Callback = function(selected)
        print("Player:", selected)
    end
})

-- Section: Keybinds
local bindSection = AdvancedTab:CreateSection("Keybinds")

bindSection:CreateBind({
    Name = "Toggle Bind",
    Description = "Press to toggle on/off",
    CurrentBind = "Q",
    HoldToInteract = false,
    Flag = "ToggleBind",
    Callback = function(active)
        print("Bind active:", active)
    end
})

bindSection:CreateBind({
    Name = "Hold to Sprint",
    Description = "Hold key for speed boost",
    CurrentBind = "LeftShift",
    HoldToInteract = true,
    Callback = function(holding)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = holding and 100 or 16
        end)
    end
})

-- Section: Color Pickers
local colorSection = AdvancedTab:CreateSection("Colors")

colorSection:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(86, 171, 128),
    Flag = "ESPColor",
    Callback = function(color)
        print("Color:", color)
    end
})

colorSection:CreateColorPicker({
    Name = "Aimbot Color",
    Color = Color3.fromRGB(255, 100, 100),
    Flag = "AimbotColor",
    Callback = function(color)
        print("Aimbot Color:", color)
    end
})

-- ══════════════════════════════════════
-- SETTINGS TAB — Config & Theme
-- ══════════════════════════════════════
local SettingsTab = Window:CreateTab({
    Name = "Settings",
    Icon = "settings",
    ShowTitle = true,
})

SettingsTab:BuildThemeSection()
SettingsTab:BuildConfigSection()

-- Notification types demo
local notifSection = SettingsTab:CreateSection("Notification Types")

notifSection:CreateButton({
    Name = "Info Notification",
    Callback = function()
        Lib:Notification({Title = "Information", Content = "This is an info notification.", Icon = "info", Type = "Info"})
    end
})

notifSection:CreateButton({
    Name = "Success Notification",
    Callback = function()
        Lib:Notification({Title = "Success!", Content = "Operation completed successfully.", Icon = "check", Type = "Success"})
    end
})

notifSection:CreateButton({
    Name = "Warning Notification",
    Callback = function()
        Lib:Notification({Title = "Warning", Content = "Something might not be right.", Icon = "warning", Type = "Warning"})
    end
})

notifSection:CreateButton({
    Name = "Error Notification",
    Callback = function()
        Lib:Notification({Title = "Error", Content = "Something went wrong!", Icon = "error", Type = "Error"})
    end
})

-- Destroy button
local destroySection = SettingsTab:CreateSection("Danger Zone")
destroySection:CreateButton({
    Name = "Destroy UI",
    Description = "Completely removes the UI library",
    Callback = function()
        Lib:Destroy()
    end
})