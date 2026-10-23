-- Behaviour trace of a MoonVeil script
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 1201 statements recorded in 0.89s
-- URLs requested:
--   https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua
--   https://games.roblox.com/v1/games/0/servers/Public?sortOrder=Asc&limit=50
-- remotes fired/invoked:
--   Hatch
--   CompleteHatch
--   ConnectGui
--   Collect
--   GetAnimals
--   ClaimOfflineCash
--   Request
--   ActivateTreadmill
--   MultiplierClicked
--   controller48.Signals.TreadmillDeactivated
--   controller48.Signals.ToggleStopBtnVisibility
--   DeactivateTreadmill
--   Purchase
--   RequestToUpgrade
--   RequestToUpgrade2
--   TeleportTo
--   SetActive
--   Claim
--   Claim2
--   ClaimReward
--   Capture

-- [deobf] folded 0 repeated calls into 0 helper functions and 4 unrolled runs into loops
local CoreGui = game:GetService("CoreGui")
local IceDragonHub = CoreGui:FindFirstChild("IceDragonHub")
IceDragonHub:Destroy()
local WindUI = CoreGui:FindFirstChild("WindUI")
WindUI:Destroy()
local WindUI_Notify = CoreGui:FindFirstChild("WindUI_Notify")
WindUI_Notify:Destroy()
local IceDragonFloatingBtn = CoreGui:FindFirstChild("IceDragonFloatingBtn")
IceDragonFloatingBtn:Destroy()
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
local IceDragonHub2 = PlayerGui:FindFirstChild("IceDragonHub")
IceDragonHub2:Destroy()
local WindUI2 = PlayerGui:FindFirstChild("WindUI")
WindUI2:Destroy()
local WindUI_Notify2 = PlayerGui:FindFirstChild("WindUI_Notify")
WindUI_Notify2:Destroy()
local IceDragonFloatingBtn2 = PlayerGui:FindFirstChild("IceDragonFloatingBtn")
IceDragonFloatingBtn2:Destroy()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")

_G.__IceDragonHub = {
	ActiveThreads = {},
	Alive = true,
	Connections = {},
	ESPObjects = {},
	FarmRunning = false,
	OriginalSpeedHooked = false,
	OriginalWalkSpeed = 16
}

local src = ReplicatedStorage:FindFirstChild("src")
local Packages = src:FindFirstChild("Packages")
local lastSrc = Packages:FindFirstChild("lastSrc")
local module = require(lastSrc)

task.spawn(function()
	local controller = module.GetController("SpeedStateController")

	controller.StateFunctions.Stealing = function()
	end

	controller.StateFunctions.Idle = function()
		controller._RawOldIdle()
	end

	controller.StateFunctions.Treadmill = function()
		controller._RawOldTreadmill()
	end

	controller:updateWalkSpeed()
end)

local connection = Players.LocalPlayer.CharacterAdded:Connect(function(character)
	task.wait(0.2)
end)

-- isfile("WindUI/src.lua") -> false
-- isfile("WindUI_Official/src.lua") -> false
local response = game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
local WindUI3 = loadstring(response)()

local Window = WindUI3:CreateWindow({
	Title = "ICEDRAGON | CLIMB FOR ANIMALS EGG",
	Acrylic = false,
	Author = "made by icedragon",
	Folder = "IceDragon/ClimbForAnimalsEgg",
	HidePanelBackground = false,
	HideSearchBar = false,
	Icon = "egg",
	NewElements = true,
	OpenButton = { ShowIconOnly = true },
	SideBarWidth = 195,
	Size = UDim2.fromOffset(620, 520),
	Theme = "Sky"
})

WindUI3.TransparencyValue = 0.7
Window:ToggleTransparency(true)
Window:DisableTopbarButtons({ "Fullscreen" })
-- identifyexecutor() -> "Wave"
Window:Tag({ Title = "Wave" })
Window:Tag({ Title = "IceDragon Hub" })
Window:Tag({ Title = "v2.0" })

task.spawn(function()
	local PlayerScripts = Players.LocalPlayer:FindFirstChild("PlayerScripts")
	local Scripts = PlayerScripts:FindFirstChild("Scripts")
	local Game = Scripts:FindFirstChild("Game")
	local Guardians = Game:FindFirstChild("Guardians")
	local lastScripts = Guardians:FindFirstChild("lastScripts")
	local module2 = require(lastScripts)

	module2.Attack = function()
	end

	module2.SetChasing = function(arg9)
		arg9:StopMoving()
	end
end)

local AutoFarmTab = Window:Tab({ Title = "Auto Farm", Icon = "layout-grid" })
local HatchFuseTab = Window:Tab({ Title = "Hatch & Fuse", Icon = "sparkles" })
local AnimalsTab = Window:Tab({ Title = "Animals", Icon = "paw-print" })
local TrainingTab = Window:Tab({ Title = "Training", Icon = "dumbbell" })
local TeleportTab = Window:Tab({ Title = "Teleport", Icon = "map-pin" })
local RewardsTab = Window:Tab({ Title = "Rewards", Icon = "gift" })
local CombatWorldTab = Window:Tab({ Title = "Combat/World", Icon = "swords" })
local ESPVisualsTab = Window:Tab({ Title = "ESP/Visuals", Icon = "eye" })
local ServerSafeTab = Window:Tab({ Title = "Server/Safe", Icon = "shield-alert" })
local PerformanceTab = Window:Tab({ Title = "Performance", Icon = "zap" })
local WebhookTab = Window:Tab({ Title = "Webhook", Icon = "send" })
local SupportTab = Window:Tab({ Title = "Support", Icon = "heart" })
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "settings" })
AutoFarmTab:Section({ Title = "3-Stage Auto Farm Engine", TextSize = 18 })

AutoFarmTab:Toggle({
	Title = "Auto Farm Eggs",
	Desc = "Multi-island 3-stage altitude flight & plot delivery",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				WindUI3:Notify({ Title = "Auto Farm", Content = "3-Stage Auto Farm started!", Duration = 3 })
				Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				workspace:SetAttribute("GuardsJailedUntil", 9999999999)
				local LocalGuardians = workspace:FindFirstChild("LocalGuardians")
				local children = LocalGuardians:GetChildren()

				for i, v in ipairs(children) do
					local Humanoid = v:FindFirstChildOfClass("Humanoid")
					Humanoid.WalkSpeed = 0
					local HumanoidRootPart = v:FindFirstChild("HumanoidRootPart")
					HumanoidRootPart.Anchored = true
					local descendants = v:GetDescendants()

					for i2, v2 in ipairs(descendants) do
						v2.CanTouch = false
						v2.CanCollide = false
					end
				end

				Players.LocalPlayer:GetAttribute("CarryingEgg")
				local controller2 = module.GetController("BaseController")
				controller2:GetBase()
				local controller3 = module.GetController("BaseController")
				controller3:GetTpCFrame()
				Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				warn("[ICEDRAGON] AutoFarm recoverable loop warning: Script:2: attempt to compare userdata < number")
				task.wait(0.3)
				Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				workspace:SetAttribute("GuardsJailedUntil", 9999999999)
				local LocalGuardians2 = workspace:FindFirstChild("LocalGuardians")
				local children2 = LocalGuardians2:GetChildren()

				for i3, v3 in ipairs(children2) do
					local Humanoid2 = v3:FindFirstChildOfClass("Humanoid")
					Humanoid2.WalkSpeed = 0
					local HumanoidRootPart2 = v3:FindFirstChild("HumanoidRootPart")
					HumanoidRootPart2.Anchored = true
					local descendants2 = v3:GetDescendants()

					for i4, v4 in ipairs(descendants2) do
						v4.CanTouch = false
						v4.CanCollide = false
					end
				end

				Players.LocalPlayer:GetAttribute("CarryingEgg")
				local controller4 = module.GetController("BaseController")
				controller4:GetBase()
				local controller5 = module.GetController("BaseController")
				controller5:GetTpCFrame()
				Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				warn("[ICEDRAGON] AutoFarm recoverable loop warning: Script:2: attempt to compare userdata < number")
				task.wait(0.3)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

AutoFarmTab:Dropdown({
	Title = "Target Island / Biome Filter",
	Value = "All",
	Values = {
		"All",
		"Forest",
		"Winter",
		"Ocean",
		"Desert",
		"Crystal Mines",
		"Jungle",
		"Mystic Isles",
		"PreHistoric",
		"Divine Heights",
		"Celestial",
		"Realm of Legends",
		"Forbidden Forest",
		"Ocean Abyss"
	},
	Callback = function()
	end
})

AutoFarmTab:Toggle({
	Title = "Bypass Carry Slowdown Penalty",
	Desc = "Hooks SpeedStateController to prevent WalkSpeed throttling",
	Value = true,
	Callback = function(state)
		if state then
			local controller6 = module.GetController("SpeedStateController")

			controller6.StateFunctions.Stealing = function()
			end

			controller6.StateFunctions.Idle = function()
				controller6._RawOldIdle()
			end

			controller6.StateFunctions.Treadmill = function()
				controller6._RawOldTreadmill()
			end

			controller6:updateWalkSpeed()
		else
			local controller7 = module.GetController("SpeedStateController")

			controller7.StateFunctions.Stealing = function()
				controller7._RawOldStealing()
			end

			controller7.StateFunctions.Idle = function()
				controller7._RawOldIdle()
			end

			controller7.StateFunctions.Treadmill = function()
				controller7._RawOldTreadmill()
			end

			controller7:updateWalkSpeed()
		end
	end
})

AutoFarmTab:Toggle({
	Title = "Auto Place Eggs to Plot",
	Desc = "Places delivered eggs on base stands via EggPlacementService",
	Value = true,
	Callback = function()
	end
})

AutoFarmTab:Toggle({
	Title = "Egg Snipe Alert",
	Desc = "On-screen notifications when rare eggs are sniped",
	Value = true,
	Callback = function()
	end
})

AutoFarmTab:Section({ Title = "Flight & Altitude Adjustments", TextSize = 16 })

for _, item in ipairs({
	{ title = "Flight Speed", desc = "Navigation flight tween speed", default = 85, max = 250, min = 30 },
	{ title = "Safe Hover Height (Stage 1)", desc = "Altitude above nest to avoid monster detection (+35 to +50 studs)", default = 45, max = 100, min = 20 },
	{ title = "Escape Height (Stage 3)", desc = "Instant vertical rise altitude after claiming egg", default = 40, max = 80, min = 10 },
}) do
	AutoFarmTab:Slider({
		Title = item.title,
		Desc = item.desc,
		Step = 5,
		Value = { Default = item.default, Max = item.max, Min = item.min },
		Callback = function()
		end
	})
end

AutoFarmTab:Section({ Title = "Rarity Whitelist Filter", TextSize = 16 })

AutoFarmTab:Toggle({
	Title = "Enable Rarity Whitelist",
	Desc = "Only farm eggs selected below",
	Value = false,
	Callback = function()
	end
})

for _, title in ipairs({
	"Allow Eclipse", "Allow Royal", "Allow Astral", "Allow Radiant", "Allow Eternal",
	"Allow Celestial", "Allow Forbidden", "Allow Divine", "Allow Mythic", "Allow Legendary",
	"Allow Epic", "Allow Rare", "Allow Uncommon", "Allow Common",
}) do
	AutoFarmTab:Toggle({
		Title = title,
		Value = true,
		Callback = function()
		end
	})
end

HatchFuseTab:Section({ Title = "Instant Hatch Automation", TextSize = 18 })

HatchFuseTab:Toggle({
	Title = "Instant Auto Hatch (0s Animation)",
	Desc = "Bypasses hatch cutscene: Hatch -> instant CompleteHatch(ReferenceName)",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller8 = module.GetController("BaseController")
				local base = controller8:GetBase()
				local PlacedEggs = base:FindFirstChild("PlacedEggs")
				local children3 = PlacedEggs:GetChildren()

				for i7, v7 in ipairs(children3) do
					local src2 = ReplicatedStorage:FindFirstChild("src")
					local Packages2 = src2:FindFirstChild("Packages")
					local _Index = Packages2:FindFirstChild("_Index")
					local children4 = _Index:GetChildren()

					for i8, v8 in ipairs(children4) do
						v8.Name:find("sleitnick_knit")
						local knit2 = v8:FindFirstChild("lastSrc")
						local Services = knit2:FindFirstChild("Services")
						local EggHatchService = Services:FindFirstChild("EggHatchService")
						local RF = EggHatchService:FindFirstChild("RF")
						local Hatch = RF:FindFirstChild("Hatch")
						local response2 = Hatch:InvokeServer(tostring(v7.Name))
						local EggHatchService2 = Services:FindFirstChild("EggHatchService")
						local RF2 = EggHatchService2:FindFirstChild("RF")
						local CompleteHatch = RF2:FindFirstChild("CompleteHatch")
						CompleteHatch:InvokeServer(response2.ReferenceName)
						task.wait(0.1)
					end

					task.wait(0.5)
					local controller9 = module.GetController("BaseController")
					local base2 = controller9:GetBase()
					local PlacedEggs2 = base2:FindFirstChild("PlacedEggs")
					local children5 = PlacedEggs2:GetChildren()

					for i9, v9 in ipairs(children5) do
						local response3 = Hatch:InvokeServer(tostring(v9.Name))
						CompleteHatch:InvokeServer(response3.ReferenceName)
						task.wait(0.1)
					end

					task.wait(0.5)
					-- [envlog] the statements above repeat forever (loop)
				end
			end)
		end
	end
})

HatchFuseTab:Toggle({
	Title = "Auto Grow Eggs",
	Desc = "Accelerates egg growth incubation via EggGrowService",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local EggGrowService = Services:FindFirstChild("EggGrowService")
				local RF3 = EggGrowService:FindFirstChild("RF")
				local ConnectGui = RF3:FindFirstChild("ConnectGui")
				ConnectGui:FireServer()
				task.wait(1)
				ConnectGui:FireServer()
				task.wait(1)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

HatchFuseTab:Section({ Title = "Mutation Fusion Machine", TextSize = 16 })

HatchFuseTab:Toggle({
	Title = "Auto Fusion Queue & Start",
	Desc = "Assigns eligible pets to slots (SetSlot) and begins fusion (Start)",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller10 = module.GetController("DataController")
				local value = controller10:GetValue("Fuse")
				local serverTimeNow = workspace:GetServerTimeNow()
				-- condition: value.FinishAt <= serverTimeNow  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller11 = module.GetController("DataController")
				local value2 = controller11:GetValue("Fuse")
				local serverTimeNow2 = workspace:GetServerTimeNow()
				-- condition: value2.FinishAt <= serverTimeNow2  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller12 = module.GetController("DataController")
				local value3 = controller12:GetValue("Fuse")
				local serverTimeNow3 = workspace:GetServerTimeNow()
				-- condition: value3.FinishAt <= serverTimeNow3  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller13 = module.GetController("DataController")
				local value4 = controller13:GetValue("Fuse")
				local serverTimeNow4 = workspace:GetServerTimeNow()
				-- condition: value4.FinishAt <= serverTimeNow4  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller14 = module.GetController("DataController")
				local value5 = controller14:GetValue("Fuse")
				local serverTimeNow5 = workspace:GetServerTimeNow()
				-- condition: value5.FinishAt <= serverTimeNow5  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller15 = module.GetController("DataController")
				local value6 = controller15:GetValue("Fuse")
				local serverTimeNow6 = workspace:GetServerTimeNow()
				-- condition: value6.FinishAt <= serverTimeNow6  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller16 = module.GetController("DataController")
				local value7 = controller16:GetValue("Fuse")
				local serverTimeNow7 = workspace:GetServerTimeNow()
				-- condition: value7.FinishAt <= serverTimeNow7  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller17 = module.GetController("DataController")
				local value8 = controller17:GetValue("Fuse")
				local serverTimeNow8 = workspace:GetServerTimeNow()
				-- condition: value8.FinishAt <= serverTimeNow8  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller18 = module.GetController("DataController")
				local value9 = controller18:GetValue("Fuse")
				local serverTimeNow9 = workspace:GetServerTimeNow()
				-- condition: value9.FinishAt <= serverTimeNow9  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller19 = module.GetController("DataController")
				local value10 = controller19:GetValue("Fuse")
				local serverTimeNow10 = workspace:GetServerTimeNow()
				-- condition: value10.FinishAt <= serverTimeNow10  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller20 = module.GetController("DataController")
				local value11 = controller20:GetValue("Fuse")
				local serverTimeNow11 = workspace:GetServerTimeNow()
				-- condition: value11.FinishAt <= serverTimeNow11  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller21 = module.GetController("DataController")
				local value12 = controller21:GetValue("Fuse")
				local serverTimeNow12 = workspace:GetServerTimeNow()
				-- condition: value12.FinishAt <= serverTimeNow12  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller22 = module.GetController("DataController")
				local value13 = controller22:GetValue("Fuse")
				local serverTimeNow13 = workspace:GetServerTimeNow()
				-- condition: value13.FinishAt <= serverTimeNow13  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller23 = module.GetController("DataController")
				local value14 = controller23:GetValue("Fuse")
				local serverTimeNow14 = workspace:GetServerTimeNow()
				-- condition: value14.FinishAt <= serverTimeNow14  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller24 = module.GetController("DataController")
				local value15 = controller24:GetValue("Fuse")
				local serverTimeNow15 = workspace:GetServerTimeNow()
				-- condition: value15.FinishAt <= serverTimeNow15  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller25 = module.GetController("DataController")
				local value16 = controller25:GetValue("Fuse")
				local serverTimeNow16 = workspace:GetServerTimeNow()
				-- condition: value16.FinishAt <= serverTimeNow16  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller26 = module.GetController("DataController")
				local value17 = controller26:GetValue("Fuse")
				local serverTimeNow17 = workspace:GetServerTimeNow()
				-- condition: value17.FinishAt <= serverTimeNow17  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller27 = module.GetController("DataController")
				local value18 = controller27:GetValue("Fuse")
				local serverTimeNow18 = workspace:GetServerTimeNow()
				-- condition: value18.FinishAt <= serverTimeNow18  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller28 = module.GetController("DataController")
				local value19 = controller28:GetValue("Fuse")
				local serverTimeNow19 = workspace:GetServerTimeNow()
				-- condition: value19.FinishAt <= serverTimeNow19  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller29 = module.GetController("DataController")
				local value20 = controller29:GetValue("Fuse")
				local serverTimeNow20 = workspace:GetServerTimeNow()
				-- condition: value20.FinishAt <= serverTimeNow20  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller30 = module.GetController("DataController")
				local value21 = controller30:GetValue("Fuse")
				local serverTimeNow21 = workspace:GetServerTimeNow()
				-- condition: value21.FinishAt <= serverTimeNow21  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller31 = module.GetController("DataController")
				local value22 = controller31:GetValue("Fuse")
				local serverTimeNow22 = workspace:GetServerTimeNow()
				-- condition: value22.FinishAt <= serverTimeNow22  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller32 = module.GetController("DataController")
				local value23 = controller32:GetValue("Fuse")
				local serverTimeNow23 = workspace:GetServerTimeNow()
				-- condition: value23.FinishAt <= serverTimeNow23  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller33 = module.GetController("DataController")
				local value24 = controller33:GetValue("Fuse")
				local serverTimeNow24 = workspace:GetServerTimeNow()
				-- condition: value24.FinishAt <= serverTimeNow24  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller34 = module.GetController("DataController")
				local value25 = controller34:GetValue("Fuse")
				local serverTimeNow25 = workspace:GetServerTimeNow()
				-- condition: value25.FinishAt <= serverTimeNow25  (assumed false)
				task.wait(2)
				task.wait(2)
				local controller35 = module.GetController("DataController")
				local value26 = controller35:GetValue("Fuse")
				local serverTimeNow26 = workspace:GetServerTimeNow()
				-- condition: value26.FinishAt <= serverTimeNow26  (assumed false)
				task.wait(2)
				-- [envlog] stopped after 50 waits
			end)
		end
	end
})

HatchFuseTab:Toggle({
	Title = "Auto Collect Fused Animals",
	Desc = "Collects completed mutated animals from machine via FuseService.Collect",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local FuseService = Services:FindFirstChild("FuseService")
				local RF4 = FuseService:FindFirstChild("RF")
				local Collect = RF4:FindFirstChild("Collect")
				Collect:InvokeServer()
				task.wait(1.5)
				Collect:InvokeServer()
				task.wait(1.5)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

HatchFuseTab:Toggle({
	Title = "Server Luck Event Hold",
	Desc = "Pauses automatic hatching and fusion until 2x/3x ServerLuck boost is active",
	Value = false,
	Callback = function()
	end
})

AnimalsTab:Section({ Title = "Equip & Sell Automation", TextSize = 18 })

AnimalsTab:Toggle({
	Title = "Auto Equip Best Animals",
	Desc = "Uses AnimalLoadoutService to equip highest income animals instantly",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller36 = module.GetController("AnimalLoadoutController")
				controller36:Request("EquipBest")
				task.wait(3.5)
				local controller37 = module.GetController("AnimalLoadoutController")
				controller37:Request("EquipBest")
				task.wait(3.5)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

AnimalsTab:Toggle({
	Title = "Auto UnEquip Worst Animals",
	Desc = "Automatically unequips lowest multiplier animals from plot stands",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local AnimalService = Services:FindFirstChild("AnimalService")
				local RF5 = AnimalService:FindFirstChild("RF")
				local GetAnimals = RF5:FindFirstChild("GetAnimals")
				GetAnimals:InvokeServer()
				task.wait(5)
				GetAnimals:InvokeServer()
				task.wait(5)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

AnimalsTab:Toggle({
	Title = "Selective Auto Sell",
	Desc = "Sells inventory animals matching selected rarity filter for Cash",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller38 = module.GetController("DataController")
				controller38:GetValue("Inventory")
				controller38:GetValue("EquippedAnimals")
				controller38:GetValue("Fuse")
				local Backpack = Players.LocalPlayer:FindFirstChild("Backpack")
				local children6 = Players.LocalPlayer.Character:GetChildren()

				for i11, v11 in ipairs(children6) do
					v11:GetAttribute("Handler")
					v11.Name:find("Animal")
					local attribute = v11:GetAttribute("ReferenceName")
					v11:GetAttribute("Rarity")
				end

				local children7 = Backpack:GetChildren()

				for i12, v12 in ipairs(children7) do
					v12:GetAttribute("Handler")
					v12.Name:find("Animal")
					local attribute2 = v12:GetAttribute("ReferenceName")
					v12:GetAttribute("Rarity")
				end

				local controller39 = module.GetController("AnimalSellController")
				controller39:Request("SellList", { attribute, attribute2 })
				task.wait(3)
				local controller40 = module.GetController("DataController")
				controller40:GetValue("Inventory")
				controller40:GetValue("EquippedAnimals")
				controller40:GetValue("Fuse")
				local Backpack2 = Players.LocalPlayer:FindFirstChild("Backpack")
				local children8 = Players.LocalPlayer.Character:GetChildren()

				for i13, v13 in ipairs(children8) do
					v13:GetAttribute("Handler")
					v13.Name:find("Animal")
					local attribute3 = v13:GetAttribute("ReferenceName")
					v13:GetAttribute("Rarity")
				end

				local children9 = Backpack2:GetChildren()

				for i14, v14 in ipairs(children9) do
					v14:GetAttribute("Handler")
					v14.Name:find("Animal")
					local attribute4 = v14:GetAttribute("ReferenceName")
					v14:GetAttribute("Rarity")
				end

				local controller41 = module.GetController("AnimalSellController")
				controller41:Request("SellList", { attribute3, attribute4 })
				task.wait(3)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

AnimalsTab:Dropdown({
	Title = "Auto Sell Max Rarity",
	Value = "Common",
	Values = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic" },
	Callback = function()
	end
})

AnimalsTab:Section({ Title = "Earnings & DNA Theft", TextSize = 16 })

AnimalsTab:Toggle({
	Title = "Auto Claim Offline Stand Cash",
	Desc = "Claims accumulated earnings via CashFlowService.ClaimOfflineCash",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local CashFlowService = Services:FindFirstChild("CashFlowService")
				local RF6 = CashFlowService:FindFirstChild("RF")
				local ClaimOfflineCash = RF6:FindFirstChild("ClaimOfflineCash")
				ClaimOfflineCash:InvokeServer()
				task.wait(5)
				ClaimOfflineCash:InvokeServer()
				task.wait(5)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

AnimalsTab:Toggle({
	Title = "Multi-Target DNA Theft",
	Desc = "Steals DNA automatically from opponent plots via StealDnaService",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller42 = module.GetController("AnimalController")

				for k, v17 in pairs(controller42.Animals) do
					local StealDnaService = Services:FindFirstChild("StealDnaService")
					local RF7 = StealDnaService:FindFirstChild("RF")
					local Request = RF7:FindFirstChild("Request")
					Request:InvokeServer(v17.State.OwnerId, v17.State.ReferenceName)
					task.wait(0.2)
				end

				task.wait(4)
				local controller43 = module.GetController("AnimalController")

				for k2, v18 in pairs(controller43.Animals) do
					Request:InvokeServer(v18.State.OwnerId, v18.State.ReferenceName)
					task.wait(0.2)
				end

				task.wait(4)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

TrainingTab:Section({ Title = "Speed & WalkSpeed Hack", TextSize = 18 })

TrainingTab:Toggle({
	Title = "WalkSpeed Hack",
	Desc = "Overrides local player movement speed directly without reset",
	Value = false,
	Callback = function(state)
		if state then
			local controller44 = module.GetController("SpeedStateController")

			controller44.StateFunctions.Stealing = function()
				controller44._RawOldStealing()
			end

			controller44.StateFunctions.Idle = function()
			end

			controller44.StateFunctions.Treadmill = function()
				controller44._RawOldTreadmill()
			end

			controller44:updateWalkSpeed()
			local Humanoid3 = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			Humanoid3.WalkSpeed = 35
		else
			local controller45 = module.GetController("SpeedStateController")

			controller45.StateFunctions.Stealing = function()
				controller45._RawOldStealing()
			end

			controller45.StateFunctions.Idle = function()
				controller45._RawOldIdle()
			end

			controller45.StateFunctions.Treadmill = function()
				controller45._RawOldTreadmill()
			end

			controller45:updateWalkSpeed()
			local Humanoid4 = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			Humanoid4.WalkSpeed = 16
		end
	end
})

TrainingTab:Slider({
	Title = "WalkSpeed Value",
	Step = 5,
	Value = { Default = 35, Max = 250, Min = 16 },
	Callback = function()
	end
})

TrainingTab:Section({ Title = "Treadmill Auto Training", TextSize = 16 })

TrainingTab:Toggle({
	Title = "Remote Treadmill Training",
	Desc = "Virtual treadmill training with synchronized session GUID (no physics lock)",
	Value = false,
	Callback = function(state)
		if state then
			local controller46 = module.GetController("TreadmillController")
			local guid = HttpService:GenerateGUID(false)

			controller46.DeactivateTreadmill = function(arg109, arg110)
				controller46._OriginalDeactivate(arg109, arg110)
			end

			controller46.OnTreadmill = true
			controller46.TreadmillSession = guid
			controller46.DisableActivation = false
			local TreadmillService = Services:FindFirstChild("TreadmillService")
			local RF8 = TreadmillService:FindFirstChild("RF")
			local ActivateTreadmill = RF8:FindFirstChild("ActivateTreadmill")
			ActivateTreadmill:InvokeServer(guid)
			local HumanoidRootPart3 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			HumanoidRootPart3.Anchored = false
			local controller47 = module.GetController("SpeedStateController")

			controller47.StateFunctions.Stealing = function()
				controller47._RawOldStealing()
			end

			controller47.StateFunctions.Idle = function()
				controller47._RawOldIdle()
			end

			controller47.StateFunctions.Treadmill = function()
			end

			controller47:updateWalkSpeed()

			task.spawn(function()
				local HumanoidRootPart4 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				HumanoidRootPart4.Anchored = false
				local PlayerGui2 = Players.LocalPlayer:FindFirstChild("PlayerGui")
				local General = PlayerGui2:FindFirstChild("General")
				local children10 = General:GetChildren()

				for i17, v20 in ipairs(children10) do
					v20:GetAttribute("Id")
					local ImageButton = v20:FindFirstChildWhichIsA("ImageButton")
					ImageButton:GetAttribute("Id")
					local attribute5 = ImageButton:GetAttribute("Id")
					local TreadmillService2 = Services:FindFirstChild("TreadmillService")
					local RF9 = TreadmillService2:FindFirstChild("RF")
					local MultiplierClicked = RF9:FindFirstChild("MultiplierClicked")
					MultiplierClicked:FireServer(attribute5)
					controller46:ClaimMultiplier(attribute5)
					task.wait(0.5)
					local HumanoidRootPart5 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					HumanoidRootPart5.Anchored = false
					local PlayerGui3 = Players.LocalPlayer:FindFirstChild("PlayerGui")
					local General2 = PlayerGui3:FindFirstChild("General")
					local children11 = General2:GetChildren()

					for i18, v21 in ipairs(children11) do
						v21:GetAttribute("Id")
						local ImageButton2 = v21:FindFirstChildWhichIsA("ImageButton")
						ImageButton2:GetAttribute("Id")
						local attribute6 = ImageButton2:GetAttribute("Id")
						MultiplierClicked:FireServer(attribute6)
						controller46:ClaimMultiplier(attribute6)
					end

					task.wait(0.5)
					-- [envlog] the statements above repeat forever (loop)
				end
			end)
		else
			local controller48 = module.GetController("TreadmillController")
			controller48.DeactivateTreadmill = controller48._OriginalDeactivate
			controller48._OriginalDeactivate = nil
			controller48.OnTreadmill = false
			controller48.TreadmillSession = nil
			controller48.DisableActivation = true

			task.delay(1, function()
				controller48.DisableActivation = false
			end)

			controller48:stopTreadmillSfx()
			controller48.Signals.TreadmillDeactivated:Fire()
			controller48.Signals.ToggleStopBtnVisibility:Fire(false)
			local ContextActionService = game:GetService("ContextActionService")
			ContextActionService:UnbindAction("TreadmillJump")
			controller48.LoadedAnimation:Stop()
			controller48.LoadedAnimation:Destroy()
			controller48.LoadedAnimation = nil
			local TreadmillService3 = Services:FindFirstChild("TreadmillService")
			local RF10 = TreadmillService3:FindFirstChild("RF")
			local DeactivateTreadmill = RF10:FindFirstChild("DeactivateTreadmill")
			DeactivateTreadmill:InvokeServer()
			DeactivateTreadmill:FireServer()
			local controller49 = module.GetController("SpeedStateController")
			controller49:UpdateState("Idle")
			local HumanoidRootPart6 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			HumanoidRootPart6.Anchored = false
			HumanoidRootPart6.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			WindUI3:Notify({ Title = "Treadmill", Content = "Remote Treadmill stopped and released.", Duration = 2 })
		end
	end
})

TrainingTab:Toggle({
	Title = "Multiplier Click Spam (15Hz)",
	Desc = "Detects and clicks active speed multipliers automatically",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local PlayerGui4 = Players.LocalPlayer:FindFirstChild("PlayerGui")
				local General3 = PlayerGui4:FindFirstChild("General")
				local children12 = General3:GetChildren()

				for i20, v23 in ipairs(children12) do
					v23:GetAttribute("Id")
					local ImageButton3 = v23:FindFirstChildWhichIsA("ImageButton")
					ImageButton3:GetAttribute("Id")
					local attribute7 = ImageButton3:GetAttribute("Id")
					MultiplierClicked:FireServer(attribute7)
					local controller50 = module.GetController("TreadmillController")
					controller50:ClaimMultiplier(attribute7)
					task.wait(0.08)
					local PlayerGui5 = Players.LocalPlayer:FindFirstChild("PlayerGui")
					local General4 = PlayerGui5:FindFirstChild("General")
					local children13 = General4:GetChildren()

					for i21, v24 in ipairs(children13) do
						v24:GetAttribute("Id")
						local ImageButton4 = v24:FindFirstChildWhichIsA("ImageButton")
						ImageButton4:GetAttribute("Id")
						local attribute8 = ImageButton4:GetAttribute("Id")
						MultiplierClicked:FireServer(attribute8)
						local controller51 = module.GetController("TreadmillController")
						controller51:ClaimMultiplier(attribute8)
					end

					task.wait(0.08)
					-- [envlog] the statements above repeat forever (loop)
				end
			end)
		end
	end
})

TrainingTab:Section({ Title = "Upgrades & Rebirth", TextSize = 16 })

TrainingTab:Toggle({
	Title = "Auto Rebirth",
	Desc = "Automatically rebirths when speed milestone is reached",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller52 = module.GetController("RebirthController")
				controller52.Pending = false
				controller52:Request(false)
				task.wait(1.5)
				local controller53 = module.GetController("RebirthController")
				controller53.Pending = false
				controller53:Request(false)
				task.wait(1.5)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

TrainingTab:Toggle({
	Title = "Auto Upgrade All Simultaneously",
	Desc = "Buys Speed, Stamina, Base, and Treadmill upgrades continuously",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller54 = module.GetController("DataController")
				local value27 = controller54:GetValue("StaminaLevel")
				local StaminaUpgradeService = Services:FindFirstChild("StaminaUpgradeService")
				local RF11 = StaminaUpgradeService:FindFirstChild("RF")
				local Purchase = RF11:FindFirstChild("Purchase")
				Purchase:InvokeServer(value27)
				local BaseUpgradeService = Services:FindFirstChild("BaseUpgradeService")
				local RF12 = BaseUpgradeService:FindFirstChild("RF")
				local RequestToUpgrade = RF12:FindFirstChild("RequestToUpgrade")
				RequestToUpgrade:InvokeServer()
				local TreadmillService4 = Services:FindFirstChild("TreadmillService")
				local RF13 = TreadmillService4:FindFirstChild("RF")
				local RequestToUpgrade2 = RF13:FindFirstChild("RequestToUpgrade")
				RequestToUpgrade2:InvokeServer()
				task.wait(0.8)
				local controller55 = module.GetController("DataController")
				local value28 = controller55:GetValue("StaminaLevel")
				Purchase:InvokeServer(value28)
				RequestToUpgrade:InvokeServer()
				RequestToUpgrade2:InvokeServer()
				task.wait(0.8)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

TeleportTab:Section({ Title = "12-Biome Real Coordinates Teleport", TextSize = 18 })

TeleportTab:Dropdown({
	Title = "Select Target Biome",
	Value = "Biome 0 (Lobby/Bases)",
	Values = {
		"Biome 0 (Lobby/Bases)",
		"Biome 1 (Forest)",
		"Biome 2 (Winter)",
		"Biome 3 (Ocean)",
		"Biome 4 (Desert)",
		"Biome 5 (Crystal Mines)",
		"Biome 6 (Jungle)",
		"Biome 7 (Mystic Isles)",
		"Biome 8 (PreHistoric)",
		"Biome 9 (Divine Heights)",
		"Biome 10 (Celestial)",
		"Biome 11 (Realm of Legends)",
		"Biome 12 (Forbidden Forest)"
	},
	Callback = function()
	end
})

TeleportTab:Button({
	Title = "Teleport to Selected Biome",
	Desc = "Moves character smoothly to chosen altitude island",
	Callback = function()
	end
})

TeleportTab:Button({
	Title = "Instant Teleport to Base Plot",
	Desc = "Uses BaseService.RE.TeleportTo for legitimate server-side teleport",
	Callback = function()
		local controller56 = module.GetController("BaseController")
		local base3 = controller56:GetBase()
		local BaseService = Services:FindFirstChild("BaseService")
		local RF14 = BaseService:FindFirstChild("RF")
		local TeleportTo = RF14:FindFirstChild("TeleportTo")
		TeleportTo:FireServer(base3)
		task.wait(0.35)
		local controller57 = module.GetController("BaseController")
		controller57:GetTpCFrame()
		Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		-- [envlog] error: Script:2: attempt to compare number < userdata
	end
})

TeleportTab:Section({ Title = "Movement Enhancements", TextSize = 16 })

TeleportTab:Toggle({
	Title = "Noclip Mode",
	Desc = "Pass through all walls and obstacles",
	Value = false,
	Callback = function(state)
		if state then
			local connection2 = RunService.Stepped:Connect(function(time, deltaTime)
			end)
		else
			connection2:Disconnect()
			local descendants3 = Players.LocalPlayer.Character:GetDescendants()

			for i23, v26 in ipairs(descendants3) do
				v26.CanCollide = true
			end
		end
	end
})

TeleportTab:Toggle({
	Title = "Infinite Jump",
	Desc = "Jump continuously in mid-air",
	Value = false,
	Callback = function()
	end
})

local connection3 = UserInputService.JumpRequest:Connect(function()
end)

TeleportTab:Toggle({
	Title = "Jetpack Free Fly Boost",
	Desc = "Enables native jetpack flight via JetpackService",
	Value = false,
	Callback = function(state)
		if state then
			local JetpackService = Services:FindFirstChild("JetpackService")
			local RF15 = JetpackService:FindFirstChild("RF")
			local SetActive = RF15:FindFirstChild("SetActive")
			SetActive:InvokeServer(state)
		else
			SetActive:InvokeServer(false)
		end
	end
})

RewardsTab:Section({ Title = "Reward Claimers", TextSize = 18 })

RewardsTab:Toggle({
	Title = "Auto Claim Index Collection Rewards",
	Desc = "Automatically claims all discovered pet/egg index rewards in the background",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller58 = module.GetController("IndexController")
				controller58:ClaimAll()
				task.wait(4)
				local controller59 = module.GetController("IndexController")
				controller59:ClaimAll()
				task.wait(4)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

RewardsTab:Button({
	Title = "Claim All Index Rewards (Instant)",
	Desc = "Claims all discovered pet/egg index milestones instantly",
	Callback = function(state)
		if state then
			local controller60 = module.GetController("IndexController")
			controller60:ClaimAll()
		else
			local controller61 = module.GetController("IndexController")
			controller61:ClaimAll()
		end

		WindUI3:Notify({ Title = "Index Rewards", Content = "All index rewards claimed!", Duration = 2 })
	end
})

RewardsTab:Toggle({
	Title = "Auto Claim Daily Rewards",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local DailyRewardsService = Services:FindFirstChild("DailyRewardsService")
				local RF16 = DailyRewardsService:FindFirstChild("RF")
				local Claim = RF16:FindFirstChild("Claim")
				Claim:InvokeServer()
				task.wait(10)
				Claim:InvokeServer()
				task.wait(10)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

RewardsTab:Toggle({
	Title = "Auto Claim Playtime Gifts",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local GiftPlayTimeService = Services:FindFirstChild("GiftPlayTimeService")
				local RF17 = GiftPlayTimeService:FindFirstChild("RF")
				local Claim2 = RF17:FindFirstChild("Claim")
				Claim2:InvokeServer(1)
				task.wait(0.1)
				Claim2:InvokeServer(2)
				task.wait(0.1)
				Claim2:InvokeServer(3)
				task.wait(0.1)
				Claim2:InvokeServer(4)
				task.wait(0.1)
				Claim2:InvokeServer(5)
				task.wait(0.1)
				Claim2:InvokeServer(6)
				task.wait(0.1)
				Claim2:InvokeServer(7)
				task.wait(0.1)
				Claim2:InvokeServer(8)
				task.wait(0.1)
				Claim2:InvokeServer(9)
				task.wait(0.1)
				Claim2:InvokeServer(10)
				task.wait(0.1)
				Claim2:InvokeServer(11)
				task.wait(0.1)
				Claim2:InvokeServer(12)
				task.wait(0.1)
				task.wait(5)
				Claim2:InvokeServer(1)
				task.wait(0.1)
				Claim2:InvokeServer(2)
				task.wait(0.1)
				Claim2:InvokeServer(3)
				task.wait(0.1)
				Claim2:InvokeServer(4)
				task.wait(0.1)
				Claim2:InvokeServer(5)
				task.wait(0.1)
				Claim2:InvokeServer(6)
				task.wait(0.1)
				Claim2:InvokeServer(7)
				task.wait(0.1)
				Claim2:InvokeServer(8)
				task.wait(0.1)
				Claim2:InvokeServer(9)
				task.wait(0.1)
				Claim2:InvokeServer(10)
				task.wait(0.1)
				Claim2:InvokeServer(11)
				task.wait(0.1)
				Claim2:InvokeServer(12)
				task.wait(0.1)
				task.wait(5)
				Claim2:InvokeServer(1)
				task.wait(0.1)
				Claim2:InvokeServer(2)
				task.wait(0.1)
				Claim2:InvokeServer(3)
				task.wait(0.1)
				Claim2:InvokeServer(4)
				task.wait(0.1)
				Claim2:InvokeServer(5)
				task.wait(0.1)
				Claim2:InvokeServer(6)
				task.wait(0.1)
				Claim2:InvokeServer(7)
				task.wait(0.1)
				Claim2:InvokeServer(8)
				task.wait(0.1)
				Claim2:InvokeServer(9)
				task.wait(0.1)
				Claim2:InvokeServer(10)
				task.wait(0.1)
				Claim2:InvokeServer(11)
				task.wait(0.1)
				Claim2:InvokeServer(12)
				task.wait(0.1)
				task.wait(5)
				Claim2:InvokeServer(1)
				task.wait(0.1)
				Claim2:InvokeServer(2)
				task.wait(0.1)
				Claim2:InvokeServer(3)
				task.wait(0.1)
				Claim2:InvokeServer(4)
				task.wait(0.1)
				Claim2:InvokeServer(5)
				task.wait(0.1)
				Claim2:InvokeServer(6)
				task.wait(0.1)
				Claim2:InvokeServer(7)
				task.wait(0.1)
				Claim2:InvokeServer(8)
				task.wait(0.1)
				Claim2:InvokeServer(9)
				task.wait(0.1)
				Claim2:InvokeServer(10)
				task.wait(0.1)
				Claim2:InvokeServer(11)
				task.wait(0.1)
				Claim2:InvokeServer(12)
				task.wait(0.1)
				-- [envlog] stopped after 50 waits
			end)
		end
	end
})

RewardsTab:Button({
	Title = "Claim Roblox Group Rewards",
	Callback = function(state)
		if state then
			local GroupRewardService = Services:FindFirstChild("GroupRewardService")
			local RF18 = GroupRewardService:FindFirstChild("RF")
			local ClaimReward = RF18:FindFirstChild("ClaimReward")
		end

		ClaimReward:InvokeServer()
		WindUI3:Notify({ Title = "Group Rewards", Content = "Attempted group reward claim!", Duration = 2 })
	end
})

RewardsTab:Paragraph({ Title = "Promo Codes", Desc = "No native promo code remote in this game build." })
CombatWorldTab:Section({ Title = "lastScripts & Boss Neutralizer", TextSize = 18 })

CombatWorldTab:Toggle({
	Title = "Anti-lastScripts Freeze (Zero Speed & AI Lock)",
	Desc = "Freezes guardian WalkSpeed and disables monster attacks",
	Value = true,
	Callback = function(state)
		if state then
			workspace:SetAttribute("GuardsJailedUntil", 9999999999)
			local LocalGuardians3 = workspace:FindFirstChild("LocalGuardians")
			local children14 = LocalGuardians3:GetChildren()

			for i24, v27 in ipairs(children14) do
				local Humanoid5 = v27:FindFirstChildOfClass("Humanoid")
				Humanoid5.WalkSpeed = 0
				local HumanoidRootPart7 = v27:FindFirstChild("HumanoidRootPart")
				HumanoidRootPart7.Anchored = state
				local descendants4 = v27:GetDescendants()

				for i25, v28 in ipairs(descendants4) do
					v28.CanTouch = false
					v28.CanCollide = false
				end
			end
		else
			workspace:SetAttribute("GuardsJailedUntil", 0)
			local LocalGuardians4 = workspace:FindFirstChild("LocalGuardians")
			local children15 = LocalGuardians4:GetChildren()

			for i26, v29 in ipairs(children15) do
				local Humanoid6 = v29:FindFirstChildOfClass("Humanoid")
				Humanoid6.WalkSpeed = 16
				local HumanoidRootPart8 = v29:FindFirstChild("HumanoidRootPart")
				HumanoidRootPart8.Anchored = false
				local descendants5 = v29:GetDescendants()

				for i27, v30 in ipairs(descendants5) do
					v30.CanTouch = true
					v30.CanCollide = true
				end
			end
		end
	end
})

CombatWorldTab:Button({
	Title = "Push All Monsters Away (Sink Under Map)",
	Desc = "Teleports local guardians under the terrain",
	Callback = function(state)
		if state then
			local LocalGuardians5 = workspace:FindFirstChild("LocalGuardians")
			local children16 = LocalGuardians5:GetChildren()

			for i28, v31 in ipairs(children16) do
				local HumanoidRootPart9 = v31:FindFirstChild("HumanoidRootPart")
				HumanoidRootPart9.CFrame = CFrame.new(HumanoidRootPart9.Position.X, -300, HumanoidRootPart9.Position.Z)
				HumanoidRootPart9.Anchored = true
			end
		else
			local LocalGuardians6 = workspace:FindFirstChild("LocalGuardians")
			local children17 = LocalGuardians6:GetChildren()

			for i29, v32 in ipairs(children17) do
				local HumanoidRootPart10 = v32:FindFirstChild("HumanoidRootPart")
				HumanoidRootPart10.CFrame = CFrame.new(HumanoidRootPart10.Position.X, -300, HumanoidRootPart10.Position.Z)
				HumanoidRootPart10.Anchored = true
			end
		end

		WindUI3:Notify({ Title = "Combat", Content = "Pushed 1 monsters underground!", Duration = 2 })
	end
})

CombatWorldTab:Toggle({
	Title = "Auto Capture Guard Bosses",
	Desc = "Automatically captures 12 bosses via GuardService.Capture",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local HumanoidRootPart11 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				local controller62 = module.GetController("GuardController")

				for k4, v33 in pairs(controller62.Guards) do
					local GuardService = Services:FindFirstChild("GuardService")
					local RF19 = GuardService:FindFirstChild("RF")
					local Capture = RF19:FindFirstChild("Capture")
					Capture:InvokeServer(tostring(k4), v33.Hitbox.Position, HumanoidRootPart11.Position)
					task.wait(0.05)
				end

				task.wait(2)
				local HumanoidRootPart12 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				local controller63 = module.GetController("GuardController")

				for k5, v34 in pairs(controller63.Guards) do
					Capture:InvokeServer(tostring(k5), v34.Hitbox.Position, HumanoidRootPart12.Position)
					task.wait(0.05)
				end

				task.wait(2)
				-- [envlog] the statements above repeat forever (loop)
			end)
		end
	end
})

CombatWorldTab:Section({ Title = "World Lighting & Base Defense", TextSize = 16 })

CombatWorldTab:Toggle({
	Title = "FullBright & No-Fog",
	Desc = "Permanent daylight and zero fog visibility",
	Value = false,
	Callback = function(state)
		if state then
			Lighting.Brightness = 2
			Lighting.ClockTime = 14
			Lighting.FogEnd = 1000000
			Lighting.GlobalShadows = false
		else
			Lighting.Brightness = 1
			Lighting.ClockTime = 12
			Lighting.FogEnd = 1000
			Lighting.GlobalShadows = true
		end
	end
})

CombatWorldTab:Toggle({
	Title = "Base Intruder Radar",
	Desc = "Alerts you if another player approaches your plot area",
	Value = true,
	Callback = function(state)
		if state then
			task.spawn(function()
				local controller64 = module.GetController("BaseController")
				controller64:GetBase()
				local controller65 = module.GetController("BaseController")
				controller65:GetTpCFrame()
				local players = Players:GetPlayers()

				for i30, v36 in ipairs(players) do
					v36.Character:FindFirstChild("HumanoidRootPart")
				end
				-- [envlog] error: Script:2: attempt to compare userdata < number
			end)
		end
	end
})

ESPVisualsTab:Section({ Title = "ESP & Chams Highlights", TextSize = 18 })

for _, item in ipairs({
	{ title = "Egg ESP", desc = "Displays Name, Rarity with custom colors, and Distance across all 13 biomes" },
	{ title = "Animal ESP", desc = "Displays Animal Name, Multiplier, and Distance on bases and plots" },
	{ title = "lastScripts Boss ESP", desc = "Displays Boss Guardians, AI chase states, and distance" },
	{ title = "Player ESP", desc = "Displays Player Name, Distance, and Health bars" },
	{ title = "3D Box / Chams Highlight", desc = "Draws luminous 3D highlight chams through walls" },
}) do
	ESPVisualsTab:Toggle({
		Title = item.title,
		Desc = item.desc,
		Value = false,
		Callback = function()
		end
	})
end

ESPVisualsTab:Slider({
	Title = "Max ESP Render Distance",
	Step = 100,
	Value = { Default = 2500, Max = 10000, Min = 200 },
	Callback = function()
	end
})

task.spawn(function()
	Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	task.wait(1.5)
	Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	task.wait(1.5)
	-- [envlog] the statements above repeat forever (loop)
end)

ServerSafeTab:Section({ Title = "Staff & Anti-Ban Security", TextSize = 18 })

ServerSafeTab:Toggle({
	Title = "Staff & Moderator Detector",
	Desc = "Detects when game developers/moderators join or exist in the server",
	Value = true,
	Callback = function()
	end
})

ServerSafeTab:Dropdown({
	Title = "Staff Detection Action",
	Value = "Notify",
	Values = { "Notify", "Hop", "Kick" },
	Callback = function()
	end
})

local players2 = Players:GetPlayers()

for i31, v37 in ipairs(players2) do
end

local connection4 = Players.PlayerAdded:Connect(function(player)
end)

local connection5 = Players.PlayerRemoving:Connect(function(player2)
	local IceDragonPlayerESP = player2.Character:FindFirstChild("IceDragonPlayerESP")
	IceDragonPlayerESP:Destroy()
end)

local AdminService = Services:FindFirstChild("AdminService")
local RF20 = AdminService:FindFirstChild("RF")
local lastAdminService = RF20:FindFirstChild("lastAdminService")

local connection6 = lastAdminService.OnClientEvent:Connect(function(arg172)
	WindUI3:Notify({ Title = "ADMIN NOTICE", Content = tostring(arg172), Duration = 6 })
end)

local AdminService2 = Services:FindFirstChild("AdminService")
local RF21 = AdminService2:FindFirstChild("RF")
local lastAdminService2 = RF21:FindFirstChild("lastAdminService2")

local connection7 = lastAdminService2.OnClientEvent:Connect(function(arg173)
	WindUI3:Notify({ Title = "GLOBAL MESSAGE", Content = tostring(arg173), Duration = 6 })
end)

ServerSafeTab:Section({ Title = "Server Hopping & Finding", TextSize = 16 })

ServerSafeTab:Button({
	Title = "Hop to Low-Player Server (1–3 Players)",
	Desc = "Finds and joins a quiet server for undisturbed farming",
	Callback = function(state)
		WindUI3:Notify({ Title = "Server Hop", Content = "Searching for quiet server...", Duration = 2 })

		if state then
			local response4 = game:HttpGet("https://games.roblox.com/v1/games/0/servers/Public?sortOrder=Asc&limit=50")
			local data = HttpService:JSONDecode(response4)

			for i32, v38 in ipairs(data.data) do
				TeleportService:Teleport(0, Players.LocalPlayer)
			end
		else
			local response5 = game:HttpGet("https://games.roblox.com/v1/games/0/servers/Public?sortOrder=Asc&limit=50")
			local data2 = HttpService:JSONDecode(response5)

			for i33, v39 in ipairs(data2.data) do
				TeleportService:Teleport(0, Players.LocalPlayer)
			end
		end
	end
})

ServerSafeTab:Button({
	Title = "Rare Egg Server Sniper Hop",
	Desc = "Hops servers until Celestial/Forbidden eggs are detected",
	Callback = function(state)
		if state then
			local SpawnedEggs = workspace:FindFirstChild("SpawnedEggs")
			local children18 = SpawnedEggs:GetChildren()

			for i34, v40 in ipairs(children18) do
				v40:GetAttribute("Rarity")
			end
		else
			local SpawnedEggs2 = workspace:FindFirstChild("SpawnedEggs")
			local children19 = SpawnedEggs2:GetChildren()

			for i35, v41 in ipairs(children19) do
				v41:GetAttribute("Rarity")
			end
		end

		WindUI3:Notify({ Title = "Rare Egg Sniper", Content = "No rare eggs here. Hopping server...", Duration = 2 })
		task.wait(0.5)
		TeleportService:Teleport(0, Players.LocalPlayer)
	end
})

PerformanceTab:Section({ Title = "Multi-Account & VPS Tuning", TextSize = 18 })

PerformanceTab:Toggle({
	Title = "Potato Mode (Disable 3D Rendering)",
	Desc = "Cuts GPU/CPU usage by 90% for overnight AFK multi-accounting",
	Value = false,
	Callback = function(state)
		if state then
			RunService:Set3dRenderingEnabled(false)
			WindUI3:Notify({ Title = "Performance", Content = "3D Rendering Disabled (Potato Mode ON)", Duration = 2 })
		else
			RunService:Set3dRenderingEnabled(true)
			WindUI3:Notify({ Title = "Performance", Content = "3D Rendering Restored", Duration = 2 })
		end
	end
})

PerformanceTab:Button({
	Title = "Clean Particles & Debris",
	Desc = "Destroys particle emitters, smoke, and footprints to stop memory leaks",
	Callback = function(state)
		if state then
			local descendants6 = workspace:GetDescendants()

			for i36, v42 in ipairs(descendants6) do
				v42:Destroy()
			end
		else
			local descendants7 = workspace:GetDescendants()

			for i37, v43 in ipairs(descendants7) do
				v43:Destroy()
			end
		end

		WindUI3:Notify({ Title = "Cleaner", Content = "Removed 1 performance-draining elements!", Duration = 2 })
	end
})

WebhookTab:Section({ Title = "Discord Webhook Integration", TextSize = 18 })

WebhookTab:Input({
	Title = "Discord Webhook URL",
	Placeholder = "Paste https://discord.com/api/webhooks/... here",
	Value = "",
	Callback = function()
	end
})

WebhookTab:Button({
	Title = "Send Test Notification",
	Callback = function()
		WindUI3:Notify({ Title = "Webhook", Content = "Test embed sent to Discord!", Duration = 2 })
	end
})

WebhookTab:Toggle({
	Title = "Log Rare Egg Snipes (Celestial / Forbidden)",
	Value = true,
	Callback = function()
	end
})

WebhookTab:Toggle({
	Title = "Hourly AFK Summary Logger",
	Value = false,
	Callback = function()
	end
})

task.spawn(function()
	task.wait(3600)
	task.wait(3600)
	-- [envlog] the statements above repeat forever (loop)
end)

SupportTab:Section({ Title = "Support & Creator Community", TextSize = 18 })

SupportTab:Paragraph({
	Title = "DO NOT FORGET SUBSCRIBE LIKE SHARE",
	Desc = "Support the development of high-performance free scripts by subscribing to the official YouTube channel and joining our Discord community!"
})

SupportTab:Section({ Title = "Official Links (One-Click Copy)", TextSize = 16 })

for _, item in ipairs({
	{ title = "YouTube: www.youtube.com/@ROBLOX_icedragonScript", desc = "Click to copy official YouTube link to clipboard", text = "https://www.youtube.com/@ROBLOX_icedragonScript", title2 = "YouTube Link", content = "Copied to clipboard: www.youtube.com/@ROBLOX_icedragonScript" },
	{ title = "Discord: https://discord.gg/FSNv577TN", desc = "Click to copy official Discord invite to clipboard", text = "https://discord.gg/FSNv577TN", title2 = "Discord Invite", content = "Copied to clipboard: https://discord.gg/FSNv577TN" },
}) do
	SupportTab:Button({
		Title = item.title,
		Desc = item.desc,
		Callback = function()
			setclipboard(item.text)

			WindUI3:Notify({
		Title = item.title2,
		Content = item.content,
		Duration = 4
	})
		end
	})
end

SupportTab:Paragraph({
	Title = "Credits & Architecture",
	Desc = "Script crafted for dj by icedragon.\nPowered by WindUI (Official Footagesus Version v1.6.66) with a customized transparent Sky Blue glass aesthetic."
})

SettingsTab:Section({ Title = "Theme & Transparency", TextSize = 18 })
local themes = WindUI3:GetThemes()

for k7, v44 in pairs(themes) do
end

SettingsTab:Dropdown({
	Title = "UI Theme",
	Value = "Sky",
	Values = { k7 },
	Callback = function(state)
		if state then
			WindUI3:SetTheme(state)
		else
			WindUI3:SetTheme(false)
		end
	end
})

SettingsTab:Slider({
	Title = "Window Transparency",
	Desc = "Adjust glass window opacity level",
	Step = 0.05,
	Value = { Default = 0.7, Max = 1, Min = 0.1 },
	Callback = function(state)
		if state then
			WindUI3.TransparencyValue = state
		else
			WindUI3.TransparencyValue = false
		end

		Window:ToggleTransparency(true)
	end
})

SettingsTab:Button({
	Title = "Center Window on Screen",
	Callback = function()
		Window:Open()
	end
})

SettingsTab:Button({
	Title = "Unload / Close Script",
	Desc = "Safely unloads script, unfreezes character, and clears visuals",
	Callback = function(state)
		workspace:SetAttribute("GuardsJailedUntil", 0)

		if state then
			local LocalGuardians7 = workspace:FindFirstChild("LocalGuardians")
			local children20 = LocalGuardians7:GetChildren()

			for i38, v45 in ipairs(children20) do
				local Humanoid7 = v45:FindFirstChildOfClass("Humanoid")
				Humanoid7.WalkSpeed = 16
				local HumanoidRootPart13 = v45:FindFirstChild("HumanoidRootPart")
				HumanoidRootPart13.Anchored = false
				local descendants8 = v45:GetDescendants()

				for i39, v46 in ipairs(descendants8) do
					v46.CanTouch = true
					v46.CanCollide = true
				end
			end

			RunService:Set3dRenderingEnabled(true)
			local controller66 = module.GetController("SpeedStateController")
			controller66.StateFunctions.Stealing = controller66._RawOldStealing
			controller66.StateFunctions.Idle = controller66._RawOldIdle
			controller66.StateFunctions.Treadmill = controller66._RawOldTreadmill
			local PlayerScripts2 = Players.LocalPlayer:FindFirstChild("PlayerScripts")
			local Scripts2 = PlayerScripts2:FindFirstChild("Scripts")
			local Game2 = Scripts2:FindFirstChild("Game")
			local Guardians2 = Game2:FindFirstChild("Guardians")
			local Guardian2 = Guardians2:FindFirstChild("lastScripts")
			local module3 = require(Guardian2)
			module3.Attack = module3._OriginalAttack
			module3.SetChasing = module3._OriginalSetChasing
			local controller67 = module.GetController("TreadmillController")
			controller67.DeactivateTreadmill = controller67._OriginalDeactivate
			local Humanoid8 = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			Humanoid8.WalkSpeed = 16
			local HumanoidRootPart14 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			HumanoidRootPart14.Anchored = false
		else
			local LocalGuardians8 = workspace:FindFirstChild("LocalGuardians")
			local children21 = LocalGuardians8:GetChildren()

			for i40, v47 in ipairs(children21) do
				local Humanoid9 = v47:FindFirstChildOfClass("Humanoid")
				Humanoid9.WalkSpeed = 16
				local HumanoidRootPart15 = v47:FindFirstChild("HumanoidRootPart")
				HumanoidRootPart15.Anchored = false
				local descendants9 = v47:GetDescendants()

				for i41, v48 in ipairs(descendants9) do
					v48.CanTouch = true
					v48.CanCollide = true
				end
			end

			RunService:Set3dRenderingEnabled(true)
			local controller68 = module.GetController("SpeedStateController")
			controller68.StateFunctions.Stealing = controller68._RawOldStealing
			controller68.StateFunctions.Idle = controller68._RawOldIdle
			controller68.StateFunctions.Treadmill = controller68._RawOldTreadmill
			local PlayerScripts3 = Players.LocalPlayer:FindFirstChild("PlayerScripts")
			local Scripts3 = PlayerScripts3:FindFirstChild("Scripts")
			local Game3 = Scripts3:FindFirstChild("Game")
			local Guardians3 = Game3:FindFirstChild("Guardians")
			local Guardian3 = Guardians3:FindFirstChild("lastScripts")
			local module4 = require(Guardian3)
			module4.Attack = module4._OriginalAttack
			module4.SetChasing = module4._OriginalSetChasing
			local controller69 = module.GetController("TreadmillController")
			controller69.DeactivateTreadmill = controller69._OriginalDeactivate
			local Humanoid10 = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			Humanoid10.WalkSpeed = 16
			local HumanoidRootPart16 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			HumanoidRootPart16.Anchored = false
		end

		connection:Disconnect()
		connection3:Disconnect()
		connection4:Disconnect()
		connection5:Disconnect()
		connection6:Disconnect()
		connection7:Disconnect()
		Window:Destroy()
		WindUI3:Notify({ Title = "ICEDRAGON", Content = "Script unloaded safely.", Duration = 2 })
	end
})

task.spawn(function()
	local hui = gethui()
	local IceDragonFloatingBtn3 = Instance.new("ScreenGui")
	IceDragonFloatingBtn3.Name = "IceDragonFloatingBtn"
	IceDragonFloatingBtn3.ResetOnSpawn = false
	IceDragonFloatingBtn3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local ToggleBtn = Instance.new("ImageButton", IceDragonFloatingBtn3)
	ToggleBtn.Name = "ToggleBtn"
	ToggleBtn.Size = UDim2.fromOffset(50, 50)
	ToggleBtn.Position = UDim2.new(0.04, 0, 0.45, 0)
	ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 30, 55)
	ToggleBtn.BackgroundTransparency = 0.25
	ToggleBtn.AutoButtonColor = true
	local UICorner = Instance.new("UICorner", ToggleBtn)
	UICorner.CornerRadius = UDim.new(1, 0)
	local UIStroke = Instance.new("UIStroke", ToggleBtn)
	UIStroke.Color = Color3.fromRGB(0, 170, 255)
	UIStroke.Thickness = 2
	local TextLabel = Instance.new("TextLabel", ToggleBtn)
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Text = "🐲"
	TextLabel.TextSize = 26
	TextLabel.Font = Enum.Font.GothamBold

	ToggleBtn.InputBegan:Connect(function(input, gameProcessed)
	end)

	ToggleBtn.InputChanged:Connect(function(input2, gameProcessed2)
	end)

	ToggleBtn.MouseButton1Click:Connect(function()
		Window:Toggle()
	end)

	IceDragonFloatingBtn3.Parent = hui
end)

print("[ICEDRAGON] ICEDRAGON | CLIMB FOR ANIMALS EGG loaded successfully with WindUI (Sky Blue Transparent)!")

WindUI3:Notify({
	Title = "ICEDRAGON HUB",
	Content = "Welcome! Transparent Sky Blue WindUI Loaded.\nDO NOT FORGET SUBSCRIBE LIKE SHARE",
	Duration = 5
})
