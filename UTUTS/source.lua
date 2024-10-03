if not game:IsLoaded() then
	repeat
		wait()
	until game:IsLoaded() and game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor")
end

local Actor = game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor")

local RequiredUNC = {}

if cloneref == nil then
	function cloneref(v)
		return v
	end
	table.insert(RequiredUNC, "cloneref")
end

if clonefunction == nil then
	function clonefunction(v)
		return v
	end
	table.insert(RequiredUNC, "clonefunction")
end

if getcustomasset == nil then
	function getcustomasset()end
	table.insert(RequiredUNC, "getcustomasset")
end

if sethiddenproperty == nil then
	function sethiddenproperty()end
	table.insert(RequiredUNC, "sethiddenproperty")
end

if gethiddenproperty == nil then
	function gethiddenproperty()end
	table.insert(RequiredUNC, "gethiddenproperty")
end

if checkcaller == nil then
	function checkcaller()end
	table.insert(RequiredUNC, "checkcaller")
end

if isfolder == nil then
	function isfolder()end
	table.insert(RequiredUNC, "isfolder")
end

if makefolder == nil then
	function makefolder()end
	table.insert(RequiredUNC, "makefolder")
end

if isfile == nil then
	function isfile()end
	table.insert(RequiredUNC, "isfile")
end

if delfile == nil then
	function delfile()end
	table.insert(RequiredUNC, "delfile")
end

if readfile == nil then
	function readfile()end
	table.insert(RequiredUNC, "readfile")
end

if writefile == nil then
	function writefile()end
	table.insert(RequiredUNC, "writefile")
end

if create_comm_channel == nil then

	local NewEventsFolder = Instance.new("Folder", game:GetService("CoreGui"))
	NewEventsFolder.Name = "Comm_Channels"

	function create_comm_channel()
		local NewEvent = Instance.new("BindableEvent")
		local NewID = tostring(math.random(99999,99999999))
		if NewEventsFolder:FindFirstChild(NewID) then
			while NewEventsFolder:FindFirstChild(NewID) do
				NewID = tostring(math.random(99999,99999999))
				if not NewEventsFolder:FindFirstChild(NewID) then
					break
				end
				task.wait()
			end
		end
		NewEvent.Name = NewID
		NewEvent.Parent = NewEventsFolder
		return NewID, NewEvent
	end
end

if getgenv == nil then
	function getgenv()
		return getfenv()
	end
	table.insert(RequiredUNC, "getgenv")
end

if #RequiredUNC > 0 then
	local UNCString = "Required support: "

	for _, v in pairs(RequiredUNC) do
		UNCString = UNCString.. tostring(v):lower().. ", "
	end

	UNCString = UNCString:sub(0, string.len(UNCString)-2)

	warn(UNCString)
	return
end

local game = cloneref(game);
local checkcaller = clonefunction(checkcaller);
local error = clonefunction(error);
local loadstring = clonefunction(loadstring);

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/mainstreamed/clones/refs/heads/main/UTUTS/library.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/mainstreamed/clones/refs/heads/main/UTUTS/savemanager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/mainstreamed/clones/refs/heads/main/UTUTS/interfacemanager.lua"))()

local Tabs, CombatTab, VisualsTab, MiscTab = {}, {}, {}, {}

function RunActorFunction()

	if game:GetService("CoreGui"):FindFirstChild("USU_Drawings") then
		game:GetService("CoreGui"):FindFirstChild("USU_Drawings"):Destroy()
	end

	if getgenv()["USUDirectory"] ~= nil then

		getgenv()["USUDirectory"]["Render"]:Disconnect()
		getgenv()["USUDirectory"]["RenderStepped"]:Disconnect()

		getgenv()["USUDirectory"] = nil
		pcall(function()
			Drawing.clear()
		end)
	end

	getgenv()["USUDirectory"] = {}
	if identifyexecutor() ~= "Wave" and not tostring(identifyexecutor()):lower():find("macsploit") then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/mainstreamed/clones/refs/heads/main/UTUTS/drawinglibrary.lua"))()
	else
		getgenv()["USUDirectory"].DrawingLibrary = Drawing
	end

	local HTTPService, Players, ReplicatedStorage, workspace, LocalPlayer, Mouse, RunService, SoundService, Camera, UserInputService = game:GetService("HttpService"), game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("Workspace"), game:GetService("Players").LocalPlayer, game:GetService("Players").LocalPlayer:GetMouse(), game:GetService("RunService"), game:GetService("SoundService"), game:GetService("Workspace").CurrentCamera, game:GetService("UserInputService")

	local Window = Library:CreateWindow({
		Title = "USU | Trident survival",
		SubTitle = "Paid",
		TabWidth = 140,
		Size = UDim2.fromOffset(500, 400),
		Acrylic = false,
		Theme = "Darker",
		MinimizeKey = Enum.KeyCode.LeftControl
	})

	Tabs = {
		Combat = Window:AddTab({ Title = "Combat", Icon = "" }),
		Visuals = Window:AddTab({ Title = "Visuals", Icon = "" }),
		Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
		Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
	}

	local Options = Library.Options

	do

		local CharacterPartList = {
			"Head";
			"Torso";
			"LowerTorso";
			"RightUpperLeg";
			"LeftUpperLeg";
			"RightLowerLeg";
			"LeftLowerLeg";
			"RightUpperArm";
			"LeftUpperArm";
			"LeftHand";
			"RightHand";
			"LeftFoot";
			"RightFoot";
		}

		CombatTab = {
			Aimbot = Tabs.Combat:AddToggle("Aimbot", {Title = "Aimbot", Default = false });
			SilentAim = Tabs.Combat:AddToggle("SilentAim", {Title = "Silent Aim", Default = false });
			Manipulator = Tabs.Combat:AddToggle("Manipulator", {Title = "Manipulator", Default = false });
			Snapline = Tabs.Combat:AddToggle("Snapline", {Title = "Snapline", Default = false });
			FOVCircle = Tabs.Combat:AddToggle("FOVCircle", {Title = "FOV Circle", Default = false });
			FOVCircleSize = Tabs.Combat:AddSlider("FOVCircleSize", {
				Title = "FOV Circle Size",
				Default = 150,
				Min = 0,
				Max = 500,
				Rounding = 1
			});
			SleeperCheck = Tabs.Combat:AddToggle("SleeperCheck", {Title = "Sleeper Check", Default = false });
			VisibleCheck = Tabs.Combat:AddToggle("VisibleCheck", {Title = "Visible Check", Default = false });
			FOVCircleColor = Tabs.Combat:AddColorpicker("FOVCircleColor", {Title = "FOV Circle Color", Default = Color3.fromRGB(200, 200, 200), Transparency = 0});
			HitChance = Tabs.Combat:AddSlider("HitChance", {
				Title = "Hit Chance",
				Default = 100,
				Min = 0,
				Max = 100,
				Rounding = 1
			});
			MaxDistance = Tabs.Combat:AddSlider("MaxDistance", {
				Title = "Max Distance",
				Default = 1000,
				Min = 0,
				Max = 1500,
				Rounding = 1
			});
			TargetPart = Tabs.Combat:AddDropdown("TargetPart", {
				Title = "Target Part",
				Values = CharacterPartList,
				Multi = false,
				Default = 1,
			});
		}

		VisualsTab = {
			ESP = Tabs.Visuals:AddToggle("ESP", {Title = "ESP", Default = false });
			Name = Tabs.Visuals:AddToggle("Name", {Title = "Name", Default = false });
			Distance = Tabs.Visuals:AddToggle("Distance", {Title = "Distance", Default = false });
			Weapon = Tabs.Visuals:AddToggle("Weapon", {Title = "Weapon", Default = false });
			Box = Tabs.Visuals:AddToggle("Box", {Title = "Box", Default = false });
			BoxFilled = Tabs.Visuals:AddToggle("BoxFilled", {Title = "Box Filled", Default = false });
			MaxDistance = Tabs.Visuals:AddSlider("MaxDistance", {
				Title = "Max Distance",
				Default = 1000,
				Min = 0,
				Max = 1500,
				Rounding = 1
			});
			SleeperCheck = Tabs.Visuals:AddToggle("SleeperCheck", {Title = "Sleeper Check", Default = false });
			ESPColor = Tabs.Visuals:AddColorpicker("ESPColor", {Title = "ESP Color", Default = Color3.fromRGB(200, 200, 200), Transparency = 0});
			VisibleColor = Tabs.Visuals:AddColorpicker("ESPColor", {Title = "Visible Color", Default = Color3.fromRGB(200, 200, 200), Transparency = 0});
			OreESP = Tabs.Visuals:AddToggle("OreESP", {Title = "Ore ESP", Default = false });
			NitrateESP = Tabs.Visuals:AddToggle("NitrateESP", {Title = "Nitrate", Default = false });
			IronESP = Tabs.Visuals:AddToggle("IronESP", {Title = "Iron", Default = false });
			StoneESP = Tabs.Visuals:AddToggle("StoneESP", {Title = "Stone", Default = false });
			ClaimtotemESP = Tabs.Visuals:AddToggle("ClaimtotemESP", {Title = "Claim totem ESP", Default = false });
			CrateESP = Tabs.Visuals:AddToggle("CrateESP", {Title = "Crate ESP", Default = false });
			BackpackESP = Tabs.Visuals:AddToggle("BackpackESP", {Title = "Backpack ESP", Default = false });
		}

		MiscTab = {
			RecoilModification = Tabs.Misc:AddToggle("RecoilModification", {Title = "Recoil Modification", Default = false });
			RecoilPercent = Tabs.Misc:AddSlider("RecoilPercent", {
				Title = "Recoil Percent",
				Default = 100,
				Min = 0,
				Max = 100,
				Rounding = 1
			});
			HitboxExpander = Tabs.Misc:AddToggle("HitboxExpander", {Title = "Hitbox Expander", Default = false });
			HitboxPart = Tabs.Misc:AddDropdown("HitboxPart", {
				Title = "Hitbox Part",
				Values = CharacterPartList,
				Multi = false,
				Default = 1,
			});
			HitboxSize = Tabs.Misc:AddSlider("HitboxSize", {
				Title = "Hitbox Size",
				Description = "Recommend no higher then 7/8",
				Default = 3,
				Min = 0,
				Max = 10,
				Rounding = 1
			});
			HitboxCollision = Tabs.Misc:AddToggle("HitboxCollision", {Title = "Hitbox Collision", Default = false });
			AICHECK = Tabs.Misc:AddToggle("AICHECK", {Title = "AI Check", Default = false });
			HitSound = Tabs.Misc:AddInput("HitSound", {
				Title = "Hit Sound",
				Default = 9114487369,
				Placeholder = "sound id",
				Numeric = true,
				Finished = false,
				Callback = function(Value)
					if tonumber(Value) then
						SoundService:FindFirstChild("PlayerHit").SoundId = tostring("rbxassetid://%s"):format(tostring(Value))
						SoundService:FindFirstChild("PlayerHit2").SoundId = tostring("rbxassetid://%s"):format(tostring(Value))
					else
						SoundService:FindFirstChild("PlayerHit").SoundId = tostring("rbxassetid://%s"):format(tostring(9114487369))
						SoundService:FindFirstChild("PlayerHit2").SoundId = tostring("rbxassetid://%s"):format(tostring(9114487369))
					end
				end
			});
			HeadshotSound = Tabs.Misc:AddInput("HeadShotSound", {
				Title = "Headshot Sound",
				Default = 9119561046,
				Placeholder = "sound id",
				Numeric = true,
				Finished = false,
				Callback = function(Value)
					if tonumber(Value) then
						SoundService:FindFirstChild("PlayerHitHeadshot").SoundId = tostring("rbxassetid://%s"):format(tostring(Value))
					else
						SoundService:FindFirstChild("PlayerHitHeadshot").SoundId = tostring("rbxassetid://%s"):format(tostring(9119561046))
					end
				end
			});

			FastBullet = Tabs.Misc:AddToggle("FastBullet", {Title = "Fast Bullet", Default = false });
			ShowGrass = Tabs.Misc:AddToggle("ShowGrass", {Title = "Show Grass", Default = true });

			Tabs.Misc:AddButton({
				Title = "Kill Textures",
				Description = "FPS Boost",
				Callback = function()
					Window:Dialog({
						Title = "Are you sure you would like to kill textures",
						Content = "you will have to rejoin to undo this action.",
						Buttons = {
							{
								Title = "Confirm",
								Callback = function()

									local function updateTextures(obj)
										pcall(function()
											for _,v in pairs(obj:GetDescendants()) do
												if v:IsA("Texture") then
													v:Destroy()
												end
											end
										end)
									end

									updateTextures(workspace)

									workspace.ChildAdded:Connect(function(child)

										if child:IsA("Texture") then
											child:Destroy()
										end

										updateTextures(child)

									end)
								end
							},
							{
								Title = "Cancel",
								Callback = function()

								end
							}
						}
					})
				end
			});
		}

		MiscTab["ShowGrass"]:OnChanged(function()
			local showGrassSuc, showGrassErr = pcall(function()
				sethiddenproperty(workspace.Terrain, "Decoration", MiscTab["ShowGrass"].Value)
			end)

			if not showGrassSuc then
				warn("unable to use show grass: ass executor")
			end
		end)

		local Functions = {}
		local TridentFunctions = {
			["createProjectile"] = nil;
		}

		local ClosestTargetToMouse = nil
		local TargetList = {}

		local DefaultDrawings = {
			Snapline = getgenv()["USUDirectory"].DrawingLibrary.new("Line");
			FOVCircle = getgenv()["USUDirectory"].DrawingLibrary.new("Circle");
		}

		local TridentLocals = {
			["EntityList"] = nil;
			["ClassesList"] = nil;
		}

		DefaultDrawings.Snapline.Visible = false
		DefaultDrawings.FOVCircle.Visible = (CombatTab["SilentAim"].Value or CombatTab["Aimbot"].Value) and CombatTab["FOVCircle"].Value

		DefaultDrawings.Snapline.Transparency = 1 - tonumber(CombatTab["FOVCircleColor"].Transparency)
		DefaultDrawings.Snapline.Color = Color3.fromRGB(255, 255, 255)
		DefaultDrawings.Snapline.Thickness = 1
		DefaultDrawings.Snapline.From = Vector2.new(Mouse.X, Mouse.Y + 36)
		DefaultDrawings.FOVCircle.Transparency = 1 - tonumber(CombatTab["FOVCircleColor"].Transparency)
		DefaultDrawings.FOVCircle.Thickness = 1.25
		DefaultDrawings.FOVCircle.Radius = tonumber(CombatTab["FOVCircleSize"].Value)
		DefaultDrawings.FOVCircle.Color = CombatTab["FOVCircleColor"].Value

		local Datastore = {
			["PlayerNames"] = {};
			["Entitys"] = {};
			["ManipulationVectors"] = {};
		}

		local TriggerbotData = {
			["LastShotArgs"] = {};
		}

		function Functions:GetPercentFromNumber(number, percent, maxpercent)
			return (number * percent) / maxpercent
		end

		function Functions:GetRootPosition()
			if workspace:FindFirstChild("Ignore") and workspace.Ignore:FindFirstChild("FPSArms") and workspace.Ignore:FindFirstChild("LocalCharacter") then
				return workspace.Ignore:FindFirstChild("LocalCharacter").Middle.Position
			end

			return Vector3.new(0, 0, 0)
		end

		function Functions:GetHeadPosition()
			if workspace:FindFirstChild("Ignore") and workspace.Ignore:FindFirstChild("FPSArms") and workspace.Ignore:FindFirstChild("LocalCharacter") then
				return workspace.Ignore:FindFirstChild("LocalCharacter").Top.Position
			end

			return Vector3.new(0, 0, 0)
		end

		function Functions:IsAlive()

			if workspace:FindFirstChild("Ignore") and workspace.Ignore:FindFirstChild("FPSArms") then
				return true
			end

			return false
		end

		function Functions:GetLocalCharacter()
			if Functions:IsAlive() then
				return workspace.Ignore.FPSArms
			end

			return nil
		end

		function Functions:GetEntityInformation(Entity)
			local EntityInformation = nil
			if Entity ~= nil then

				if TridentLocals["EntityList"] ~= nil then

					if Datastore["Entitys"][Entity] then
						return TridentLocals.EntityList[Datastore["Entitys"][Entity]]
					end

					LPH_NO_VIRTUALIZE(function()
						for __i, __v in pairs(TridentLocals.EntityList) do
							for _i, _v in pairs(__v) do
								if tostring(_i):lower() == 'model' and typeof(_v) == 'Instance' and _v == Entity then
									EntityInformation = __v
									Datastore["Entitys"][Entity] = __i
									break
								end
							end
						end
					end)()
				end
			end

			return EntityInformation
		end

		function Functions:DistanceFromCharacter(Position)
			local RootPos = Functions:GetRootPosition()
			local Distance = math.floor((RootPos - Position).Magnitude)
			return Distance
		end

		function Functions:GetWeaponName(Character)
			local WeaponName = "None"
			local Entity_Information = Functions:GetEntityInformation(Character)

			if Entity_Information ~= nil and Entity_Information["handModel"] ~= nil and tostring(Entity_Information["handModel"]):lower() ~= "handmodel" and Entity_Information["handModel"]:IsDescendantOf(workspace) then
				WeaponName = tostring(Entity_Information["handModel"])
				return WeaponName
			end

			local PlayerWeapon = nil

			if Character:FindFirstChild("HandModel") then
				PlayerWeapon = Character:FindFirstChild("HandModel")
			end

			local MeshIds_Model, Mesh_Count = {}, 0

			LPH_NO_VIRTUALIZE(function()
				if PlayerWeapon ~= nil then
					for _,v in pairs(PlayerWeapon:GetChildren()) do
						if v:IsA("MeshPart") then
							MeshIds_Model[v.Name] = v.MeshId
							Mesh_Count += 1
						end
					end
				end

				for _,v in pairs(ReplicatedStorage:WaitForChild("HandModels"):GetChildren()) do

					local MatchingMeshes = {};

					for _,v2 in pairs(v:GetChildren()) do
						if v2:IsA("MeshPart") and MeshIds_Model[v2.Name] then
							if MeshIds_Model[v2.Name] == v2.MeshId then
								table.insert(MatchingMeshes, v2.Name)
							end
						end
					end

					if #MatchingMeshes == Mesh_Count and Mesh_Count > 0 and #MatchingMeshes > 0 then
						WeaponName = v.Name
						break
					end
				end
			end)()

			return WeaponName
		end

		function Functions:CurrentWeaponInformation()
			local LocalCharacter = Functions:GetLocalCharacter()

			if LocalCharacter ~= nil then
				local PlayerWeapon = nil

				if LocalCharacter:FindFirstChild("HandModel") then
					PlayerWeapon = LocalCharacter:FindFirstChild("HandModel")
				end

				local WeaponName = nil
				local MeshIds_Model, Mesh_Count = {}, 0

				LPH_NO_VIRTUALIZE(function()
					if PlayerWeapon ~= nil then
						for _,v in pairs(PlayerWeapon:GetChildren()) do
							if v:IsA("MeshPart") then
								MeshIds_Model[v.Name] = v.MeshId
								Mesh_Count += 1
							end
						end
					end

					for _,v in pairs(ReplicatedStorage:WaitForChild("HandModels"):GetChildren()) do

						local MatchingMeshes = {};

						for _,v2 in pairs(v:GetChildren()) do
							if v2:IsA("MeshPart") and MeshIds_Model[v2.Name] then
								if MeshIds_Model[v2.Name] == v2.MeshId then
									table.insert(MatchingMeshes, v2.Name)
								end
							end
						end

						if #MatchingMeshes == Mesh_Count and Mesh_Count > 0 and #MatchingMeshes > 0 then
							WeaponName = v.Name
							break
						end
					end
				end)()

				if WeaponName ~= nil and TridentLocals.ClassesList[WeaponName] ~= nil then
					return TridentLocals.ClassesList[WeaponName]
				end

			end

			return nil
		end

		function Functions:PredictShotTiming(part, projectile_speed, projectile_drop)
			local distance = (workspace.Ignore.LocalCharacter.Middle.Position - part.Position).Magnitude
			local time_to_hit = (distance / projectile_speed)
			local final_projectile_speed = projectile_speed * (time_to_hit) * projectile_speed ^ 2
			time_to_hit = time_to_hit + (distance / final_projectile_speed)
			local drop_timing = projectile_drop ^ (time_to_hit * projectile_drop) - 1
			if not (drop_timing ~= drop_timing) then
				return drop_timing
			end
			return 0
		end

		function Functions:IsVisible(startPos, endPos)
			local rayParams = RaycastParams.new()
			rayParams.FilterType = Enum.RaycastFilterType.Exclude
			rayParams.IgnoreWater = true

			local filterRaycastList = {workspace.Ignore}

			rayParams.FilterDescendantsInstances = filterRaycastList

			local direction = (endPos - startPos).Unit
			local distance = (endPos - startPos).Magnitude
			local rayResult = workspace:Raycast(startPos, direction * distance, rayParams)

			local IsHittable = false

			while (rayResult ~= nil and rayResult.Instance ~= nil and rayResult.Instance.CollisionGroup == 'Pierceable') do
				table.insert(filterRaycastList, rayResult.Instance)
				rayParams.FilterDescendantsInstances = filterRaycastList
				rayResult = workspace:Raycast(startPos, direction * distance, rayParams)
				if (rayResult == nil or (rayResult.Instance ~= nil and rayResult.Instance.CollisionGroup ~= 'Pierceable')) then
					break
				end
			end

			if (rayResult == nil or (rayResult.Instance ~= nil and rayResult.Instance.Parent ~= nil and (rayResult.Instance.Parent:FindFirstChild("Head") or rayResult.Instance.Parent:FindFirstChild("HumanoidRootPart")))) then
				return true
			end

			return false
		end

		function Functions:ManipulateBullet(startPos, endPos, targetChar)
			local rayDirection = (endPos - startPos).unit * 20
			local rayParams = RaycastParams.new()
			rayParams.FilterDescendantsInstances = {workspace.Ignore}
			rayParams.FilterType = Enum.RaycastFilterType.Exclude

			local Visible = Functions:IsVisible(startPos, endPos)

			if not Visible then
				local newShootPos = startPos
				local directionVector = Vector3.new(0, 0, 0)
				local startManipTick = tick()

				local attemts = 0

				local rayDirection_PartSearch = (endPos - startPos).unit * 20
				local rayParams_PartSearch = RaycastParams.new()
				rayParams.FilterDescendantsInstances = {workspace.Ignore}
				rayParams.FilterType = Enum.RaycastFilterType.Exclude

				local raycastResult_PartSearch = workspace:Raycast(startPos, rayDirection_PartSearch, rayParams_PartSearch)

				if raycastResult_PartSearch ~= nil and raycastResult_PartSearch.Instance ~= nil then
					LPH_NO_VIRTUALIZE(function()
						repeat

							local directionVector = Vector3.new(
								math.random(-3.75, 3.75),
								math.random(-2, 4),
								math.random(-3.75, 3.75) 
							)

							if targetChar ~= nil and Datastore["ManipulationVectors"][targetChar] ~= nil and Functions:IsVisible(startPos + Datastore["ManipulationVectors"][targetChar], endPos) then
								directionVector = Datastore["ManipulationVectors"][targetChar]
							end

							newShootPos = startPos + directionVector

							if Functions:IsVisible(newShootPos, endPos) then
								Datastore["ManipulationVectors"][targetChar] = directionVector
								break
							end
							attemts += 1
						until attemts >= 12 or Functions:IsVisible(startPos + directionVector, endPos)
					end)()
				end

				if Functions:IsVisible(newShootPos, endPos) then
					return CFrame.lookAt(newShootPos, endPos), newShootPos, endPos
				end

				return CFrame.lookAt(startPos, endPos), startPos, endPos
			else
				return CFrame.lookAt(startPos, endPos), startPos, endPos
			end
		end

		function Functions:PredictShot(Target)

			if Target ~= nil then
				local HitPart = Target:FindFirstChild(tostring(CombatTab["TargetPart"].Value))
				local TargetInformation = Functions:GetEntityInformation(Target)
				local WeaponInformation = Functions:CurrentWeaponInformation()

				if HitPart~=nil and TargetInformation~=nil and WeaponInformation~=nil then
					local ShootAtPosition = HitPart.Position
					local ProjectileDropTiming = Functions:PredictShotTiming(HitPart, WeaponInformation["ProjectileSpeed"], WeaponInformation["ProjectileDrop"])
					local Velocity = TargetInformation["velocityVector"] or Vector3.new(0,0,0)

					Velocity *= math.max(1,ProjectileDropTiming ^ 0.225)

					ShootAtPosition += Vector3.new(Velocity.X / 2, ProjectileDropTiming / 1.025, Velocity.Z / 2)

					if CombatTab["Manipulator"].Value then

						return Functions:ManipulateBullet(Functions:GetHeadPosition(), ShootAtPosition)

					end

					return CFrame.lookAt(Functions:GetHeadPosition(), ShootAtPosition), Functions:GetHeadPosition(), ShootAtPosition
				end
			end

			return CFrame.lookAt(Functions:GetHeadPosition(), Mouse.Hit.Position), Functions:GetHeadPosition(), Mouse.Hit.Position

		end

		function Functions:UpdateClosestTarget()
			local target = nil
			local currentDist = math.huge

			LPH_NO_VIRTUALIZE(function()
				for v,_ in pairs(TargetList) do
					if v:FindFirstChild("Head") and v:FindFirstChild("HumanoidRootPart") then
						local PredictedCF = nil

						if v:FindFirstChild(CombatTab["TargetPart"].Value) then
							PredictedCF = v:FindFirstChild(CombatTab["TargetPart"].Value).CFrame
						end

						if PredictedCF ~= nil then
							local pos, vis = Camera:WorldToViewportPoint(PredictedCF.Position)
							local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
							local distanceFrom = (workspace.Ignore.LocalCharacter.Middle.Position - PredictedCF.Position).Magnitude

							local IsAbleToShow = true

							if (distanceFrom > tonumber(CombatTab["MaxDistance"].Value)) then
								IsAbleToShow = false
							end

							local Entity_Information = Functions:GetEntityInformation(v)

							if (CombatTab["SleeperCheck"].Value and Entity_Information ~= nil and Entity_Information["sleeping"]) then
								IsAbleToShow = false
							end

							if (dist < currentDist) and IsAbleToShow then

								local function completeStatement()

									if CombatTab["FOVCircle"].Value then

										if dist <= DefaultDrawings.FOVCircle.Radius then

											target = v
											currentDist = dist
										end
									else
										target = v
										currentDist = dist
									end


								end

								if CombatTab["VisibleCheck"].Value then
									local Predicted_CFrame, ShootFrom, ShootAt = Functions:PredictShot(v)
									if Functions:IsVisible(ShootFrom, ShootAt) then
										completeStatement()
									end
								else
									completeStatement()
								end

							end
						end

					end
				end
			end)()

			ClosestTargetToMouse = target
		end

		local ESPCache = {
			["Players"] = {};
			["AIs"] = {};
			["Others"] = {};
			["Ore"] = {
				["Nitrate"] = {};
				["Iron"] = {};
				["Stone"] = {};
			};
			["ClaimTotems"] = {};
			["Crates"] = {};
			["Backpacks"] = {};
		}

		function Functions:IsNPC(Character)
			return Character ~= nil and Character:IsA("Model") and Character:IsDescendantOf(workspace) and (Character.Name:lower() == "soldier" or Character.Name:lower() == "officer")
		end

		function Functions:CreateESP(TargetCharacter)

			if TargetCharacter == nil or not TargetCharacter:FindFirstChild("Head") or not TargetCharacter:FindFirstChild("HumanoidRootPart") then
				return
			end

			local Name_Default = TargetCharacter.Name

			local Entity_Information = Functions:GetEntityInformation(TargetCharacter)

			if TargetCharacter ~= nil and TargetCharacter:FindFirstChild("Head") and TargetCharacter:FindFirstChild("Head"):FindFirstChild("Nametag") and TargetCharacter:FindFirstChild("Head"):FindFirstChild("Nametag"):FindFirstChild("tag") then
				if tostring(TargetCharacter:FindFirstChild("Head"):FindFirstChild("Nametag"):FindFirstChild("tag").Text):len() >= 3 and not tostring(TargetCharacter:FindFirstChild("Head"):FindFirstChild("Nametag"):FindFirstChild("tag").Text):lower():find("shylou") then
					Name_Default = tostring(TargetCharacter:FindFirstChild("Head"):FindFirstChild("Nametag"):FindFirstChild("tag").Text)
				elseif Entity_Information ~= nil then
					Name_Default = Entity_Information["type"]
				end
			end

			TargetCharacter.Name = Name_Default



			local function BuildESP(ESPTableName, Character)
				if ESPCache[ESPTableName][Character] == nil then
					ESPCache[ESPTableName][Character] = {}
				end

				if ESPCache[ESPTableName][Character]["Name"] == nil then
					ESPCache[ESPTableName][Character]["Name"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
					ESPCache[ESPTableName][Character]["Name"].Text = Name_Default;
					ESPCache[ESPTableName][Character]["Name"].Transparency = 1
					ESPCache[ESPTableName][Character]["Name"].Size = 13
					ESPCache[ESPTableName][Character]["Name"].Center = true
					ESPCache[ESPTableName][Character]["Name"].Visible = false
					ESPCache[ESPTableName][Character]["Name"].Color = Color3.fromRGB(255, 255, 255)
					ESPCache[ESPTableName][Character]["Name"].Font = 2
				end

				if ESPCache[ESPTableName][Character]["Distance"] == nil then
					ESPCache[ESPTableName][Character]["Distance"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
					ESPCache[ESPTableName][Character]["Distance"].Text = "[-]";
					ESPCache[ESPTableName][Character]["Distance"].Transparency = 1
					ESPCache[ESPTableName][Character]["Distance"].Size = 13
					ESPCache[ESPTableName][Character]["Distance"].Center = true
					ESPCache[ESPTableName][Character]["Distance"].Visible = false
					ESPCache[ESPTableName][Character]["Distance"].Color = Color3.fromRGB(255, 255, 255)
					ESPCache[ESPTableName][Character]["Distance"].Font = 2
				end

				if ESPCache[ESPTableName][Character]["BoxESPTable"] == nil then

					ESPCache[ESPTableName][Character]["BoxESPTable"] = {}

					ESPCache[ESPTableName][Character]["BoxESPTable"]["Box"] = getgenv()["USUDirectory"].DrawingLibrary.new("Square")
					ESPCache[ESPTableName][Character]["BoxESPTable"]["Box"].Visible = false
					ESPCache[ESPTableName][Character]["BoxESPTable"]["Box"].Thickness = 1
					ESPCache[ESPTableName][Character]["BoxESPTable"]["Box"].Transparency = 1
					ESPCache[ESPTableName][Character]["BoxESPTable"]["Box"].Filled = true
					ESPCache[ESPTableName][Character]["BoxESPTable"]["Box"].Color = VisualsTab["ESPColor"].Value

				end
			end

			if MiscTab["AICHECK"].Value then
				if not Functions:IsNPC(TargetCharacter) then
					BuildESP("Players", TargetCharacter)
					return "Players"
				end
			else
				if Functions:IsNPC(TargetCharacter) then
					BuildESP("AIs", TargetCharacter)
					return "AIs"
				else
					BuildESP("Players", TargetCharacter)
					return "Players"
				end
			end
		end

		function Functions:RenderModel(Model : Model)
			if Model ~= nil and Model:IsA("Model") and Model:IsDescendantOf(workspace) then

				local Model_Information = Functions:GetEntityInformation(Model)

				if Model_Information ~= nil then

					local Type = Model_Information["type"]

					if Type ~= nil then

						local IsTarget = tostring(Type):lower() == 'player' or tostring(Type):lower() == 'soldier' or tostring(Type):lower() == 'officer'

						if IsTarget then

							if MiscTab["HitboxExpander"].Value then
								local hitboxPart = Model:FindFirstChild(MiscTab["HitboxPart"].Value)
								if hitboxPart ~= nil then
									if not getgenv()["USUDirectory"]["DefaultHitbox"]["Sizes"][hitboxPart.Name] then
										getgenv()["USUDirectory"]["DefaultHitbox"]["Sizes"][hitboxPart.Name] = hitboxPart.Size
									end
									if not getgenv()["USUDirectory"]["DefaultHitbox"]["Transparency"][hitboxPart.Name] then
										getgenv()["USUDirectory"]["DefaultHitbox"]["Transparency"][hitboxPart.Name] = hitboxPart.Transparency
									end
									if not getgenv()["USUDirectory"]["DefaultHitbox"]["Collisions"][hitboxPart.Name] then
										getgenv()["USUDirectory"]["DefaultHitbox"]["Collisions"][hitboxPart.Name] = hitboxPart.CanCollide
									end

									hitboxPart.Size = getgenv()["USUDirectory"]["DefaultHitbox"]["Sizes"][hitboxPart.Name] * tonumber(MiscTab["HitboxSize"].Value)
									hitboxPart.Transparency = 0.7
									hitboxPart.CanCollide = MiscTab["HitboxCollision"].Value
								end
							end

							TargetList[Model] = true

							local CharacterType = ""

							pcall(function()
								local __newIndex_CharacterType = Functions:CreateESP(Model)
								if __newIndex_CharacterType ~= nil and tostring(__newIndex_CharacterType) and tostring(__newIndex_CharacterType):len() > 0 then
									CharacterType = __newIndex_CharacterType
								end
							end)

							Model.Destroying:Connect(function()
								if ESPCache ~= nil and ESPCache[CharacterType] ~= nil and Model ~= nil and ESPCache[CharacterType][Model] ~= nil then
									TargetList[Model] = nil
									for _, ESP1 in pairs(ESPCache[CharacterType][Model]) do
										if typeof(ESP1) == 'table' then
											for _2, ESP2 in pairs(ESP1) do
												ESP2:Remove()
											end
										else
											ESP1:Remove()
										end
									end
								end
							end)

						elseif VisualsTab["ClaimtotemESP"].Value and Type == 'ClaimTotem' then

							local Body = Model:FindFirstChild("Body")
							if Body ~= nil then
								local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - Body.Position).Magnitude))
								if ESPCache["ClaimTotems"][Model] == nil then
									ESPCache["ClaimTotems"][Model] = {}
									ESPCache["ClaimTotems"][Model]["Name"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
									ESPCache["ClaimTotems"][Model]["Name"].Text = "Claim Totem";
									ESPCache["ClaimTotems"][Model]["Name"].Transparency = 1
									ESPCache["ClaimTotems"][Model]["Name"].Size = 10
									ESPCache["ClaimTotems"][Model]["Name"].Center = true
									ESPCache["ClaimTotems"][Model]["Name"].Visible = false
									ESPCache["ClaimTotems"][Model]["Name"].Color = Color3.fromRGB(185, 185, 185)
									ESPCache["ClaimTotems"][Model]["Name"].Font = 2
									ESPCache["ClaimTotems"][Model]["Distance"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
									ESPCache["ClaimTotems"][Model]["Distance"].Text = "[-]";
									ESPCache["ClaimTotems"][Model]["Distance"].Transparency = 1
									ESPCache["ClaimTotems"][Model]["Distance"].Size = 10
									ESPCache["ClaimTotems"][Model]["Distance"].Center = true
									ESPCache["ClaimTotems"][Model]["Distance"].Visible = false
									ESPCache["ClaimTotems"][Model]["Distance"].Color = Color3.fromRGB(185, 185, 185)
									ESPCache["ClaimTotems"][Model]["Distance"].Font = 2

									Model.Destroying:Connect(function()
										pcall(function()
											ESPCache["ClaimTotems"][Model]["Name"]:Remove()
											ESPCache["ClaimTotems"][Model]["Distance"]:Remove()
											ESPCache["ClaimTotems"][Model] = nil
										end)
									end)
								end
							end

						elseif VisualsTab["CrateESP"].Value and (tostring(Type):find("Crate") or tostring(Type):find("Box")) then
							local Body = Model.PrimaryPart
							if Body ~= nil then
								local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - Body.Position).Magnitude))
								if ESPCache["Crates"][Model] == nil then
									ESPCache["Crates"][Model] = {}
									ESPCache["Crates"][Model]["Name"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
									ESPCache["Crates"][Model]["Name"].Text = tostring(Type);
									ESPCache["Crates"][Model]["Name"].Transparency = 1
									ESPCache["Crates"][Model]["Name"].Size = 10
									ESPCache["Crates"][Model]["Name"].Center = true
									ESPCache["Crates"][Model]["Name"].Visible = false
									ESPCache["Crates"][Model]["Name"].Color = Color3.fromRGB(185, 185, 185)
									ESPCache["Crates"][Model]["Name"].Font = 2
									ESPCache["Crates"][Model]["Distance"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
									ESPCache["Crates"][Model]["Distance"].Text = "[-]";
									ESPCache["Crates"][Model]["Distance"].Transparency = 1
									ESPCache["Crates"][Model]["Distance"].Size = 10
									ESPCache["Crates"][Model]["Distance"].Center = true
									ESPCache["Crates"][Model]["Distance"].Visible = false
									ESPCache["Crates"][Model]["Distance"].Color = Color3.fromRGB(185, 185, 185)
									ESPCache["Crates"][Model]["Distance"].Font = 2

									Model.Destroying:Connect(function()
										pcall(function()
											ESPCache["Crates"][Model]["Name"]:Remove()
											ESPCache["Crates"][Model]["Distance"]:Remove()
											ESPCache["Crates"][Model] = nil
										end)
									end)
								end
							end

						elseif VisualsTab["BackpackESP"].Value and Type == 'Backpack' then
							local Body = Model:GetChildren()[1]
							if Body ~= nil then
								local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - Body.Position).Magnitude))
								if ESPCache["Backpacks"][Model] == nil then
									ESPCache["Backpacks"][Model] = {}
									ESPCache["Backpacks"][Model]["Name"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
									ESPCache["Backpacks"][Model]["Name"].Text = "Backpack";
									ESPCache["Backpacks"][Model]["Name"].Transparency = 1
									ESPCache["Backpacks"][Model]["Name"].Size = 10
									ESPCache["Backpacks"][Model]["Name"].Center = true
									ESPCache["Backpacks"][Model]["Name"].Visible = false
									ESPCache["Backpacks"][Model]["Name"].Color = Color3.fromRGB(185, 185, 185)
									ESPCache["Backpacks"][Model]["Name"].Font = 2
									ESPCache["Backpacks"][Model]["Distance"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
									ESPCache["Backpacks"][Model]["Distance"].Text = "[-]";
									ESPCache["Backpacks"][Model]["Distance"].Transparency = 1
									ESPCache["Backpacks"][Model]["Distance"].Size = 10
									ESPCache["Backpacks"][Model]["Distance"].Center = true
									ESPCache["Backpacks"][Model]["Distance"].Visible = false
									ESPCache["Backpacks"][Model]["Distance"].Color = Color3.fromRGB(185, 185, 185)
									ESPCache["Backpacks"][Model]["Distance"].Font = 2

									Model.Destroying:Connect(function()
										pcall(function()
											ESPCache["Backpacks"][Model]["Name"]:Remove()
											ESPCache["Backpacks"][Model]["Distance"]:Remove()
											ESPCache["Backpacks"][Model] = nil
										end)
									end)
								end

							end
						else
							if VisualsTab["OreESP"].Value then
								local OrePart = Model.PrimaryPart

								if OrePart ~= nil and OrePart:IsA("MeshPart") then
									local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - OrePart.Position).Magnitude))

									if VisualsTab["NitrateESP"].Value and Type == 'NitrateOre' and ESPCache["Ore"]["Nitrate"][Model] == nil then
										ESPCache["Ore"]["Nitrate"][Model] = {}
										ESPCache["Ore"]["Nitrate"][Model]["Name"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
										ESPCache["Ore"]["Nitrate"][Model]["Name"].Text = "Nitrate";
										ESPCache["Ore"]["Nitrate"][Model]["Name"].Transparency = 1
										ESPCache["Ore"]["Nitrate"][Model]["Name"].Size = 10
										ESPCache["Ore"]["Nitrate"][Model]["Name"].Center = true
										ESPCache["Ore"]["Nitrate"][Model]["Name"].Visible = false
										ESPCache["Ore"]["Nitrate"][Model]["Name"].Color = Color3.fromRGB(185, 185, 185)
										ESPCache["Ore"]["Nitrate"][Model]["Name"].Font = 2
										ESPCache["Ore"]["Nitrate"][Model]["Distance"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
										ESPCache["Ore"]["Nitrate"][Model]["Distance"].Text = "[-]";
										ESPCache["Ore"]["Nitrate"][Model]["Distance"].Transparency = 1
										ESPCache["Ore"]["Nitrate"][Model]["Distance"].Size = 10
										ESPCache["Ore"]["Nitrate"][Model]["Distance"].Center = true
										ESPCache["Ore"]["Nitrate"][Model]["Distance"].Visible = false
										ESPCache["Ore"]["Nitrate"][Model]["Distance"].Color = Color3.fromRGB(185, 185, 185)
										ESPCache["Ore"]["Nitrate"][Model]["Distance"].Font = 2
										Model.Destroying:Connect(function()
											pcall(function()
												ESPCache["Ore"]["Nitrate"][Model]["Name"]:Remove()
												ESPCache["Ore"]["Nitrate"][Model]["Distance"]:Remove()
												ESPCache["Ore"]["Nitrate"][Model] = nil
											end)
										end)
									elseif VisualsTab["IronESP"].Value and Type == 'IronOre' and ESPCache["Ore"]["Iron"][Model] == nil then
										ESPCache["Ore"]["Iron"][Model] = {}
										ESPCache["Ore"]["Iron"][Model]["Name"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
										ESPCache["Ore"]["Iron"][Model]["Name"].Text = "Iron";
										ESPCache["Ore"]["Iron"][Model]["Name"].Transparency = 1
										ESPCache["Ore"]["Iron"][Model]["Name"].Size = 10
										ESPCache["Ore"]["Iron"][Model]["Name"].Center = true
										ESPCache["Ore"]["Iron"][Model]["Name"].Visible = false
										ESPCache["Ore"]["Iron"][Model]["Name"].Color = Color3.fromRGB(255, 192, 32)
										ESPCache["Ore"]["Iron"][Model]["Name"].Font = 2
										ESPCache["Ore"]["Iron"][Model]["Distance"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
										ESPCache["Ore"]["Iron"][Model]["Distance"].Text = "[-]";
										ESPCache["Ore"]["Iron"][Model]["Distance"].Transparency = 1
										ESPCache["Ore"]["Iron"][Model]["Distance"].Size = 10
										ESPCache["Ore"]["Iron"][Model]["Distance"].Center = true
										ESPCache["Ore"]["Iron"][Model]["Distance"].Visible = false
										ESPCache["Ore"]["Iron"][Model]["Distance"].Color = Color3.fromRGB(255, 192, 32)
										ESPCache["Ore"]["Iron"][Model]["Distance"].Font = 2

										Model.Destroying:Connect(function()
											pcall(function()
												ESPCache["Ore"]["Iron"][Model]["Name"]:Remove()
												ESPCache["Ore"]["Iron"][Model]["Distance"]:Remove()
												ESPCache["Ore"]["Iron"][Model] = nil
											end)
										end)
									elseif VisualsTab["StoneESP"].Value and Type == 'StoneOre' and ESPCache["Ore"]["Stone"][Model] == nil then
										ESPCache["Ore"]["Stone"][Model] = {}
										ESPCache["Ore"]["Stone"][Model]["Name"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
										ESPCache["Ore"]["Stone"][Model]["Name"].Text = "Stone";
										ESPCache["Ore"]["Stone"][Model]["Name"].Transparency = 1
										ESPCache["Ore"]["Stone"][Model]["Name"].Size = 10
										ESPCache["Ore"]["Stone"][Model]["Name"].Center = true
										ESPCache["Ore"]["Stone"][Model]["Name"].Visible = false
										ESPCache["Ore"]["Stone"][Model]["Name"].Color = Color3.fromRGB(90, 90, 90)
										ESPCache["Ore"]["Stone"][Model]["Name"].Font = 2
										ESPCache["Ore"]["Stone"][Model]["Distance"] = getgenv()["USUDirectory"].DrawingLibrary.new("Text")
										ESPCache["Ore"]["Stone"][Model]["Distance"].Text = "[-]";
										ESPCache["Ore"]["Stone"][Model]["Distance"].Transparency = 1
										ESPCache["Ore"]["Stone"][Model]["Distance"].Size = 10
										ESPCache["Ore"]["Stone"][Model]["Distance"].Center = true
										ESPCache["Ore"]["Stone"][Model]["Distance"].Visible = false
										ESPCache["Ore"]["Stone"][Model]["Distance"].Color = Color3.fromRGB(90, 90, 90)
										ESPCache["Ore"]["Stone"][Model]["Distance"].Font = 2

										Model.Destroying:Connect(function()
											pcall(function()
												ESPCache["Ore"]["Stone"][Model]["Name"]:Remove()
												ESPCache["Ore"]["Stone"][Model]["Distance"]:Remove()
												ESPCache["Ore"]["Stone"][Model] = nil
											end)
										end)
									end
								end
							end
						end

					end

				end

			end
		end

		local CurrentAimbotTarget = nil

		function Functions:RenderStepped()

			local ESP_Targets_Table = {}

			for Character,LIB in pairs(ESPCache["Players"]) do
				ESP_Targets_Table[Character] = LIB
			end

			if MiscTab["AICHECK"].Value == false then
				for Character,LIB in pairs(ESPCache["AIs"]) do
					ESP_Targets_Table[Character] = LIB
				end
			end

			DefaultDrawings.Snapline.From = Vector2.new(Mouse.X, Mouse.Y + 36)
			if CurrentAimbotTarget == nil and ClosestTargetToMouse ~= nil then
				CurrentAimbotTarget = ClosestTargetToMouse
			end

			if CombatTab["Aimbot"].Value and game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and CurrentAimbotTarget ~= nil then
				local TargetPart = CurrentAimbotTarget:FindFirstChild(CombatTab["TargetPart"].Value);
				if TargetPart then
					local Predicted_CF, ShootFrom, ShootAt = Functions:PredictShot(CurrentAimbotTarget)
					if Predicted_CF ~= nil then
						local pos, _vis = Camera:WorldToViewportPoint(ShootAt)
						if _vis then
							mousemoverel((pos.X - (Mouse.X))/10, (pos.Y - (Mouse.Y))/10)
						end
					end
				end
			elseif not game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
				CurrentAimbotTarget = nil
			end

			DefaultDrawings.FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)

			if ClosestTargetToMouse == nil then
				DefaultDrawings.Snapline.Visible = false
			end

			if CombatTab["Snapline"].Value and ClosestTargetToMouse ~= nil and ClosestTargetToMouse:FindFirstChild("HumanoidRootPart") then
				if ClosestTargetToMouse ~= nil then

					local IsAbleToShow = true
					local DistinBetween = math.floor((workspace.Ignore.LocalCharacter.Middle.Position - ClosestTargetToMouse:FindFirstChild("HumanoidRootPart").Position).Magnitude)

					if (DistinBetween > tonumber(CombatTab["MaxDistance"].Value)) then
						IsAbleToShow = false
					end

					local Entity_Information = Functions:GetEntityInformation(ClosestTargetToMouse)

					if (CombatTab["SleeperCheck"].Value and Entity_Information ~= nil and Entity_Information["sleeping"]) then
						IsAbleToShow = false
					end


					local SnapTargetPart = nil

					if ClosestTargetToMouse:FindFirstChild(CombatTab["TargetPart"].Value) then
						SnapTargetPart = ClosestTargetToMouse:FindFirstChild(CombatTab["TargetPart"].Value)
					end

					local PredictedCF, ShootFromPosition, ShootAtPosition = Functions:PredictShot(ClosestTargetToMouse)
					local ToVector, onScreen = Camera:WorldToViewportPoint(SnapTargetPart.Position)
					local FromVector, FromOnScreen = Camera:WorldToViewportPoint(ShootFromPosition)

					DefaultDrawings.Snapline.Visible = (CombatTab["Aimbot"].Value or CombatTab["SilentAim"].Value) and IsAbleToShow and onScreen

					if onScreen then
						DefaultDrawings.Snapline.To = Vector2.new(ToVector.X, ToVector.Y)
					else
						DefaultDrawings.Snapline.Visible = false
					end

					DefaultDrawings.Snapline.From = Vector2.new(Mouse.X, Mouse.Y + 36)

				else
					DefaultDrawings.Snapline.Visible = false
				end
			else
				DefaultDrawings.Snapline.Visible = false
			end

			for Character, DrawingLib in pairs(ESP_Targets_Table) do
				if DrawingLib["BoxESPTable"] ~= nil and DrawingLib["Name"] ~= nil and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Head") then
					local Name_Default = Character.Name

					local Entity_Information = Functions:GetEntityInformation(Character)

					if Entity_Information ~= nil then

						if Character ~= nil and Character:FindFirstChild("Head") and Character:FindFirstChild("Head"):FindFirstChild("Nametag") and Character:FindFirstChild("Head"):FindFirstChild("Nametag"):FindFirstChild("tag") then
							if tostring(Character:FindFirstChild("Head"):FindFirstChild("Nametag"):FindFirstChild("tag").Text):len() >= 3 and not tostring(Character:FindFirstChild("Head"):FindFirstChild("Nametag"):FindFirstChild("tag").Text):lower():find("shylou") then
								Name_Default = tostring(Character:FindFirstChild("Head"):FindFirstChild("Nametag"):FindFirstChild("tag").Text)
							end
						end

						Character.Name = Name_Default

						local IsAbleToShow = true
						local DistinBetween = math.floor((workspace.Ignore.LocalCharacter.Middle.Position - Character:FindFirstChild("HumanoidRootPart").Position).Magnitude)

						if (DistinBetween > tonumber(VisualsTab["MaxDistance"].Value)) then
							IsAbleToShow = false
						end

						if (VisualsTab["SleeperCheck"].Value and Entity_Information ~= nil and Entity_Information["sleeping"]) then
							IsAbleToShow = false
						end

						local RootPos, RootVisible = Camera:WorldToViewportPoint(Character:FindFirstChild("HumanoidRootPart").Position)
						local HeadPos, HeadESPVisible = Camera:WorldToViewportPoint(Character:FindFirstChild("Head").Position + Vector3.new(0,1,0))
						local LegPos, LegVisible = Camera:WorldToViewportPoint(Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(0,4,0))

						local boxHeight = math.abs(HeadPos.Y - LegPos.Y)

						local boxWidth = boxHeight / 2

						local boxX = ((HeadPos.X + LegPos.X) / 2 - boxWidth / 2)
						local boxY = (HeadPos.Y)

						DrawingLib["BoxESPTable"]["Box"].Position = Vector2.new(boxX, boxY)
						DrawingLib["BoxESPTable"]["Box"].Size = Vector2.new(boxWidth, boxHeight)

						DrawingLib["Name"].Position = Vector2.new(HeadPos.X, DrawingLib["BoxESPTable"]["Box"].Position.Y - (DrawingLib["Name"].Size * 1.25))
						DrawingLib["BoxESPTable"]["Box"].Visible = VisualsTab["ESP"].Value and HeadESPVisible and IsAbleToShow and VisualsTab["Box"].Value
						DrawingLib["BoxESPTable"]["Box"].Filled = VisualsTab["BoxFilled"].Value

						DrawingLib["Name"].Visible = VisualsTab["ESP"].Value and HeadESPVisible and IsAbleToShow

						local PredictedCF, ShootFrom, ShootAt = Functions:PredictShot(Character)

						if Functions:IsVisible(ShootFrom, ShootAt) then
							DrawingLib["Name"].Color = VisualsTab["VisibleColor"].Value
							DrawingLib["BoxESPTable"]["Box"].Color = VisualsTab["VisibleColor"].Value
							DrawingLib["Distance"].Color = VisualsTab["VisibleColor"].Value
						else
							DrawingLib["Name"].Color = VisualsTab["ESPColor"].Value
							DrawingLib["BoxESPTable"]["Box"].Color = VisualsTab["ESPColor"].Value
							DrawingLib["Distance"].Color = VisualsTab["ESPColor"].Value
						end

						local String__ = ""

						if VisualsTab["Name"].Value then
							String__ = String__.. Character.Name
						end

						if VisualsTab["Distance"].Value then
							pcall(function()
								local DistanceTextVector, DistanceTextOnScreen = Camera:WorldToViewportPoint(Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(0,5,0))

								if DistanceTextOnScreen then
									DrawingLib["Distance"].Visible = true and IsAbleToShow and VisualsTab["ESP"].Value
									DrawingLib["Distance"].Text = "[".. tostring(DistinBetween).. "]"
									DrawingLib["Distance"].Position = Vector2.new(DistanceTextVector.X, DistanceTextVector.Y)
								else
									DrawingLib["Distance"].Visible = false
								end
							end)
						else
							DrawingLib["Distance"].Visible = false
						end

						if VisualsTab["Weapon"].Value then

							local WeaponName = Functions:GetWeaponName(Character)

							if VisualsTab["Name"].Value then
								String__ = String__.. " | "
							end

							if WeaponName ~= nil then
								String__ = String__.. tostring(WeaponName)
							end

						end
						DrawingLib["Name"].Text = String__

					end
				end
			end


			if VisualsTab["ClaimtotemESP"].Value then
				for Model, ESP_Library in pairs(ESPCache["ClaimTotems"]) do
					local NameText = ESP_Library["Name"]
					local DistanceText = ESP_Library["Distance"]
					if NameText ~= nil and DistanceText ~= nil then

						local BodyPart = Model:FindFirstChild("Body")
						if BodyPart ~= nil then
							local NameTextVector, NameOnScreen = Camera:WorldToViewportPoint(BodyPart.Position)
							local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - BodyPart.Position).Magnitude))
							local DistanceTextVector, DistanceOnScreen = Camera:WorldToViewportPoint(BodyPart.Position - Vector3.new(0, 1.85 * (DistanceFrom ^ 0.35), 0))

							NameText.Color = VisualsTab["ESPColor"].Value
							DistanceText.Color = VisualsTab["ESPColor"].Value

							if NameOnScreen then
								NameText.Position = Vector2.new(NameTextVector.X, NameTextVector.Y)
								NameText.Visible = true and (DistanceFrom < tonumber(VisualsTab["MaxDistance"].Value))
							else
								NameText.Visible = false
							end

							if DistanceOnScreen then
								DistanceText.Text = "[".. tostring(DistanceFrom).. "]"
								DistanceText.Position = Vector2.new(DistanceTextVector.X, DistanceTextVector.Y)
								DistanceText.Visible = true and NameText.Visible
							else
								DistanceText.Visible = false
							end
						end

					end

				end
			end

			if VisualsTab["CrateESP"].Value then
				for Model, ESP_Library in pairs(ESPCache["Crates"]) do
					local NameText = ESP_Library["Name"]
					local DistanceText = ESP_Library["Distance"]
					if NameText ~= nil and DistanceText ~= nil then

						local BodyPart = Model:FindFirstChild("Body")
						if BodyPart ~= nil then
							local NameTextVector, NameOnScreen = Camera:WorldToViewportPoint(BodyPart.Position)
							local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - BodyPart.Position).Magnitude))
							local DistanceTextVector, DistanceOnScreen = Camera:WorldToViewportPoint(BodyPart.Position - Vector3.new(0, 1.85 * (DistanceFrom ^ 0.35), 0))

							NameText.Color = VisualsTab["ESPColor"].Value
							DistanceText.Color = VisualsTab["ESPColor"].Value

							if NameOnScreen then
								NameText.Position = Vector2.new(NameTextVector.X, NameTextVector.Y)
								NameText.Visible = true and (DistanceFrom < tonumber(VisualsTab["MaxDistance"].Value))
							else
								NameText.Visible = false
							end

							if DistanceOnScreen then
								DistanceText.Text = "[".. tostring(DistanceFrom).. "]"
								DistanceText.Position = Vector2.new(DistanceTextVector.X, DistanceTextVector.Y)
								DistanceText.Visible = true and NameText.Visible
							else
								DistanceText.Visible = false
							end
						end

					end

				end
			end

			if VisualsTab["BackpackESP"].Value then
				for Model, ESP_Library in pairs(ESPCache["Backpacks"]) do
					local NameText = ESP_Library["Name"]
					local DistanceText = ESP_Library["Distance"]
					if NameText ~= nil and DistanceText ~= nil then

						local BodyPart = Model:GetChildren()[1]
						if BodyPart ~= nil then
							local NameTextVector, NameOnScreen = Camera:WorldToViewportPoint(BodyPart.Position)
							local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - BodyPart.Position).Magnitude))
							local DistanceTextVector, DistanceOnScreen = Camera:WorldToViewportPoint(BodyPart.Position - Vector3.new(0, 1.85 * (DistanceFrom ^ 0.35), 0))

							NameText.Color = VisualsTab["ESPColor"].Value
							DistanceText.Color = VisualsTab["ESPColor"].Value

							if NameOnScreen then
								NameText.Position = Vector2.new(NameTextVector.X, NameTextVector.Y)
								NameText.Visible = true and (DistanceFrom < tonumber(VisualsTab["MaxDistance"].Value))
							else
								NameText.Visible = false
							end

							if DistanceOnScreen then
								DistanceText.Text = "[".. tostring(DistanceFrom).. "]"
								DistanceText.Position = Vector2.new(DistanceTextVector.X, DistanceTextVector.Y)
								DistanceText.Visible = true and NameText.Visible
							else
								DistanceText.Visible = false
							end
						end

					end

				end
			end

			if VisualsTab["OreESP"].Value then


				if VisualsTab["NitrateESP"].Value then
					for OreModel, Ore_Esp_Library in pairs(ESPCache["Ore"]["Nitrate"]) do
						local NameText = Ore_Esp_Library["Name"]
						local DistanceText = Ore_Esp_Library["Distance"]
						if NameText ~= nil and DistanceText ~= nil then

							local OrePart = OreModel.PrimaryPart
							if OrePart ~= nil then
								local NameTextVector, NameOnScreen = Camera:WorldToViewportPoint(OrePart.Position)
								local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - OrePart.Position).Magnitude))
								local DistanceTextVector, DistanceOnScreen = Camera:WorldToViewportPoint(OrePart.Position - Vector3.new(0, 1.85 * (DistanceFrom ^ 0.35), 0))

								if NameOnScreen then
									NameText.Position = Vector2.new(NameTextVector.X, NameTextVector.Y)
									NameText.Visible = true
								else
									NameText.Visible = false
								end

								if DistanceOnScreen then
									DistanceText.Text = "[".. tostring(DistanceFrom).. "]"
									DistanceText.Position = Vector2.new(DistanceTextVector.X, DistanceTextVector.Y)
									DistanceText.Visible = true and NameText.Visible
								else
									DistanceText.Visible = false
								end
							end

						end

					end
				end

				if VisualsTab["IronESP"].Value then
					for OreModel, Ore_Esp_Library in pairs(ESPCache["Ore"]["Iron"]) do
						local NameText = Ore_Esp_Library["Name"]
						local DistanceText = Ore_Esp_Library["Distance"]
						if NameText ~= nil and DistanceText ~= nil then

							local OrePart = OreModel.PrimaryPart
							if OrePart ~= nil then
								local NameTextVector, NameOnScreen = Camera:WorldToViewportPoint(OrePart.Position)
								local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - OrePart.Position).Magnitude))
								local DistanceTextVector, DistanceOnScreen = Camera:WorldToViewportPoint(OrePart.Position - Vector3.new(0, 1.85 * (DistanceFrom ^ 0.35), 0))


								if NameOnScreen then
									NameText.Position = Vector2.new(NameTextVector.X, NameTextVector.Y)
									NameText.Visible = true
								else
									NameText.Visible = false
								end

								if DistanceOnScreen then
									DistanceText.Text = "[".. tostring(DistanceFrom).. "]"
									DistanceText.Position = Vector2.new(DistanceTextVector.X, DistanceTextVector.Y)
									DistanceText.Visible = true and NameText.Visible
								else
									DistanceText.Visible = false
								end
							end

						end

					end
				end

				if VisualsTab["StoneESP"].Value then
					for OreModel, Ore_Esp_Library in pairs(ESPCache["Ore"]["Stone"]) do
						local NameText = Ore_Esp_Library["Name"]
						local DistanceText = Ore_Esp_Library["Distance"]
						if NameText ~= nil and DistanceText ~= nil then

							local OrePart = OreModel.PrimaryPart
							if OrePart ~= nil then
								local NameTextVector, NameOnScreen = Camera:WorldToViewportPoint(OrePart.Position)
								local DistanceFrom = math.floor(tonumber((workspace.Ignore.LocalCharacter.Middle.Position - OrePart.Position).Magnitude))
								local DistanceTextVector, DistanceOnScreen = Camera:WorldToViewportPoint(OrePart.Position - Vector3.new(0, 1.85 * (DistanceFrom ^ 0.35), 0))

								if NameOnScreen then
									NameText.Position = Vector2.new(NameTextVector.X, NameTextVector.Y)
									NameText.Visible = true
								else
									NameText.Visible = false
								end

								if DistanceOnScreen then
									DistanceText.Text = "[".. tostring(DistanceFrom).. "]"
									DistanceText.Position = Vector2.new(DistanceTextVector.X, DistanceTextVector.Y)
									DistanceText.Visible = true and NameText.Visible
								else
									DistanceText.Visible = false
								end
							end

						end

					end
				end
			end
		end

		if getgenv()["USUDirectory"]["DefaultHitbox"] == nil then
			getgenv()["USUDirectory"]["DefaultHitbox"] = {["Sizes"] = {}, ["Transparency"] = {}, ["Collisions"] = {}}
		end

		function Functions:UpdateHitboxes()
			if MiscTab["HitboxExpander"].Value then
				for v, _ in pairs(TargetList) do
					if v:IsA("Model") and v:FindFirstChild("Head") and v:FindFirstChild("HumanoidRootPart") then
						local hitboxPart = v:FindFirstChild(MiscTab["HitboxPart"].Value)
						if hitboxPart ~= nil then
							if not getgenv()["USUDirectory"]["DefaultHitbox"]["Sizes"][hitboxPart.Name] then
								getgenv()["USUDirectory"]["DefaultHitbox"]["Sizes"][hitboxPart.Name] = hitboxPart.Size
							end
							if not getgenv()["USUDirectory"]["DefaultHitbox"]["Transparency"][hitboxPart.Name] then
								getgenv()["USUDirectory"]["DefaultHitbox"]["Transparency"][hitboxPart.Name] = hitboxPart.Transparency
							end
							if not getgenv()["USUDirectory"]["DefaultHitbox"]["Collisions"][hitboxPart.Name] then
								getgenv()["USUDirectory"]["DefaultHitbox"]["Collisions"][hitboxPart.Name] = hitboxPart.CanCollide
							end

							hitboxPart.Size = getgenv()["USUDirectory"]["DefaultHitbox"]["Sizes"][hitboxPart.Name] * tonumber(MiscTab["HitboxSize"].Value)
							hitboxPart.Transparency = 0.7
							hitboxPart.CanCollide = MiscTab["HitboxCollision"].Value
						end
					end
				end
			else
				for v, _ in pairs(TargetList) do
					if v:IsA("Model") and v:FindFirstChild("Head") and v:FindFirstChild("HumanoidRootPart") then
						local hitboxPart = v:FindFirstChild(MiscTab["HitboxPart"].Value)
						if hitboxPart ~= nil then
							hitboxPart.Size = getgenv()["USUDirectory"]["DefaultHitbox"]["Sizes"][hitboxPart.Name]
							hitboxPart.Transparency = getgenv()["USUDirectory"]["DefaultHitbox"]["Transparency"][hitboxPart.Name]
							hitboxPart.CanCollide = getgenv()["USUDirectory"]["DefaultHitbox"]["Collisions"][hitboxPart.Name]
						end
					end
				end
			end
		end

		local IsRenderring = false
		local PreviousRender = workspace:GetChildren()

		local function UpdateRenderredObjs()
			spawn(function()
				if IsRenderring then
					repeat task.wait() until not IsRenderring
				end

				IsRenderring = true
				for _,v in pairs(PreviousRender) do
					if v:IsA("Model") then
						Functions:RenderModel(v)
						task.wait()
					end
				end

				IsRenderring = false
				PreviousRender = workspace:GetChildren()
			end)
		end

		MiscTab["HitboxExpander"]:OnChanged(function()
			Functions:UpdateHitboxes()
		end)

		CombatTab["SilentAim"]:OnChanged(function()
			DefaultDrawings.FOVCircle.Visible = (CombatTab["SilentAim"].Value or CombatTab["Aimbot"].Value) and CombatTab["FOVCircle"].Value
		end)

		CombatTab["Aimbot"]:OnChanged(function()
			DefaultDrawings.FOVCircle.Visible = (CombatTab["SilentAim"].Value or CombatTab["Aimbot"].Value) and CombatTab["FOVCircle"].Value
		end)

		CombatTab["FOVCircle"]:OnChanged(function()
			DefaultDrawings.FOVCircle.Visible = (CombatTab["SilentAim"].Value or CombatTab["Aimbot"].Value) and CombatTab["FOVCircle"].Value
		end)

		CombatTab["FOVCircleColor"]:OnChanged(function()
			DefaultDrawings.FOVCircle.Color = CombatTab["FOVCircleColor"].Value
			DefaultDrawings.Snapline.Color = CombatTab["FOVCircleColor"].Value
			DefaultDrawings.Snapline.Transparency = 1 - tonumber(CombatTab["FOVCircleColor"].Transparency)
			DefaultDrawings.FOVCircle.Transparency = 1 - tonumber(CombatTab["FOVCircleColor"].Transparency)
		end)

		CombatTab["FOVCircleSize"]:OnChanged(function()
			DefaultDrawings.FOVCircle.Radius = tonumber(CombatTab["FOVCircleSize"].Value)
		end)

		VisualsTab["NitrateESP"]:OnChanged(function()

			for _,v in pairs(ESPCache["Ore"]["Nitrate"]) do
				if typeof(v) == 'table' then
					for __, _v in pairs(v) do
						_v.Visible = VisualsTab["NitrateESP"].Value and VisualsTab["OreESP"].Value
					end
				end
			end
		end)

		VisualsTab["IronESP"]:OnChanged(function()
			for _,v in pairs(ESPCache["Ore"]["Iron"]) do
				if typeof(v) == 'table' then
					for __, _v in pairs(v) do
						_v.Visible = VisualsTab["IronESP"].Value and VisualsTab["OreESP"].Value
					end
				end
			end
		end)

		VisualsTab["StoneESP"]:OnChanged(function()
			for _,v in pairs(ESPCache["Ore"]["Stone"]) do
				if typeof(v) == 'table' then
					for __, _v in pairs(v) do
						_v.Visible = VisualsTab["StoneESP"].Value and VisualsTab["OreESP"].Value
					end
				end
			end
		end)

		MiscTab["AICHECK"]:OnChanged(function()
			if MiscTab["AICHECK"].Value == true then
				for Character, DrawingLib in pairs(ESPCache["AIs"]) do
					if typeof(DrawingLib) == 'table' then
						for _,v in pairs(DrawingLib) do
							if typeof(v) == 'table' then
								for __, __v in pairs(v) do
									pcall(function()
										__v:Remove()
									end)
								end
							else
								pcall(function()
									v:Remove()
								end)
							end
						end
						TargetList[Character] = nil
						ESPCache["AIs"][Character] = nil
					end
				end
			else
				UpdateRenderredObjs()
			end
		end)

		VisualsTab["OreESP"]:OnChanged(function()
			if VisualsTab["OreESP"].Value then
				UpdateRenderredObjs()
			else
				for OreLibName, OreLib in pairs(ESPCache["Ore"]) do
					for _, _v in pairs(OreLib) do
						if typeof(_v) == 'table' then
							for __, v in pairs(_v) do
								v:Remove()
							end
						else
							_v:Remove()
						end
					end
				end
				ESPCache["Ore"]["Nitrate"] = {}
				ESPCache["Ore"]["Iron"] = {}
				ESPCache["Ore"]["Stone"] = {}
			end
		end)

		VisualsTab["ESP"]:OnChanged(function()
			if VisualsTab["ESP"].Value == false then
				for Character, DrawingLib in pairs(ESPCache["Players"]) do
					if typeof(DrawingLib) == 'table' then
						for _,v in pairs(DrawingLib) do
							if typeof(v) == 'table' then
								for __, __v in pairs(v) do
									pcall(function()
										__v:Remove()
									end)
								end
							else
								pcall(function()
									v:Remove()
								end)
							end
						end
						ESPCache["Players"][Character] = nil
					end
				end

				for Character, DrawingLib in pairs(ESPCache["AIs"]) do
					if typeof(DrawingLib) == 'table' then
						for _,v in pairs(DrawingLib) do
							if typeof(v) == 'table' then
								for __, __v in pairs(v) do
									pcall(function()
										__v:Remove()
									end)
								end
							else
								pcall(function()
									v:Remove()
								end)
							end
						end
						ESPCache["AIs"][Character] = nil
					end
				end
			else
				UpdateRenderredObjs()
			end
		end)

		VisualsTab["ClaimtotemESP"]:OnChanged(function()
			if VisualsTab["ClaimtotemESP"].Value == false then
				for Model, DrawingLib in pairs(ESPCache["ClaimTotems"]) do
					if typeof(DrawingLib) == 'table' then
						for _,v in pairs(DrawingLib) do
							pcall(function()
								v:Remove()
							end)
						end
						ESPCache["ClaimTotems"][Model] = nil
					end
				end
			else
				UpdateRenderredObjs()
			end
		end)

		VisualsTab["BackpackESP"]:OnChanged(function()
			if VisualsTab["BackpackESP"].Value == false then
				for Model, DrawingLib in pairs(ESPCache["Backpacks"]) do
					if typeof(DrawingLib) == 'table' then
						for _,v in pairs(DrawingLib) do
							pcall(function()
								v:Remove()
							end)
						end
						ESPCache["Backpacks"][Model] = nil
					end
				end
			else
				UpdateRenderredObjs()
			end
		end)

		VisualsTab["CrateESP"]:OnChanged(function()
			if VisualsTab["CrateESP"].Value == false then
				for Model, DrawingLib in pairs(ESPCache["Crates"]) do
					if typeof(DrawingLib) == 'table' then
						for _,v in pairs(DrawingLib) do
							pcall(function()
								v:Remove()
							end)
						end
						ESPCache["Crates"][Model] = nil
					end
				end
			else
				UpdateRenderredObjs()
			end
		end)

		LPH_NO_VIRTUALIZE(function()

			getgenv()["USUDirectory"]["RenderStepped"] = RunService.RenderStepped:Connect(function()
				Functions:UpdateClosestTarget()
				Functions:RenderStepped()
			end)

			for i, v in pairs(getgc()) do
				if typeof(v) == 'function' then
					local functionInfo = debug.getinfo(v)
					if functionInfo ~= nil and functionInfo.name ~= nil then
						if tostring(functionInfo.name) == "createProjectile" then
							local oldCreateProjectile; oldCreateProjectile = hookfunction(v, function(...)
								local args = {...}

								if #args == 3 then

									if CombatTab["SilentAim"].Value then

										if ClosestTargetToMouse ~= nil then

											local PredictedCF = nil

											if ClosestTargetToMouse:FindFirstChild(CombatTab["TargetPart"].Value) then
												PredictedCF = Functions:PredictShot(ClosestTargetToMouse)
											end

											local EntityInformation = Functions:GetEntityInformation(ClosestTargetToMouse)

											if EntityInformation ~= nil then

												local IsAbleToSilent = true
												local Distance = Functions:DistanceFromCharacter(ClosestTargetToMouse:FindFirstChild("HumanoidRootPart").Position)

												if (Distance > tonumber(CombatTab["MaxDistance"].Value)) then
													IsAbleToSilent = false
												end	

												if (CombatTab["SleeperCheck"].Value and EntityInformation ~= nil and EntityInformation["sleeping"]) then
													IsAbleToSilent = false
												end

												if PredictedCF ~= nil and IsAbleToSilent then
													args[1] = PredictedCF
												end
											end
										end
									else
										args[1] = CFrame.lookAt(Camera.CFrame.Position + (Camera.CFrame.LookVector), Mouse.Hit.Position)
									end

									if MiscTab["FastBullet"].Value then

										if Functions:IsVisible(args[1].Position, args[1].Position + (args[1].LookVector * 4)) then
											args[1] = args[1] + (args[1].LookVector * 4)
										end


									end
								end

								return oldCreateProjectile(unpack(args));
							end)

							TridentFunctions.createProjectile = clonefunction(v)

						end
						if tostring(functionInfo.name) == "cameraRecoil" then
							local oldfunction; oldfunction = hookfunction(v, function(...)
								local Args = {...}

								if MiscTab["RecoilModification"].Value then

									local RecoilPercentageX = Functions:GetPercentFromNumber(Args[1], MiscTab["RecoilPercent"].Value, 100)
									local RecoilPercentageY = Functions:GetPercentFromNumber(Args[2], MiscTab["RecoilPercent"].Value, 100)
									if RecoilPercentageX ~= nil then
										Args[1] = tonumber(RecoilPercentageX)
									end

									if RecoilPercentageY ~= nil then
										Args[2] = tonumber(RecoilPercentageY)
									end

									return oldfunction(unpack(Args))
								end



								return oldfunction(...)
							end)
						end

						if tostring(functionInfo.name) == "GetEntityFromPart" then
							TridentLocals.EntityList = debug.getupvalue(v, 1)
						end

						if tostring(functionInfo.name) == "ToClass" then
							TridentLocals.ClassesList = debug.getupvalue(v, 1)
						end
					end
				end
			end

			for _,v in pairs(workspace:GetChildren()) do
				if v:IsA("Model") then
					Functions:RenderModel(v)
				end
			end

			getgenv()["USUDirectory"]["Render"] = workspace.ChildAdded:Connect(function(Model)
				if Model:IsA("Model") and not table.find(PreviousRender, Model) then
					UpdateRenderredObjs()
				end
			end)

		end)()

	end

	Window:SelectTab(1)
	SaveManager:SetLibrary(Library)
	InterfaceManager:SetLibrary(Library)
	SaveManager:LoadAutoloadConfig()
	SaveManager:IgnoreThemeSettings()
	SaveManager:SetIgnoreIndexes({})
	InterfaceManager:SetFolder("usu_data")
	SaveManager:SetFolder("usu_data/trident_survival")

	pcall(function()
		SaveManager:BuildConfigSection(Tabs.Settings)
	end)

end

loadstring([[
	function LPH_NO_VIRTUALIZE(f) return f end;
]])()

if run_on_actor ~= nil then

	local id, channel = create_comm_channel()

	local suc, err = pcall(function()
		LPH_NO_VIRTUALIZE(function()channel.Event:Connect(RunActorFunction)end)()
	end)

	if not suc then
		warn("failed to use run_on_actor functionality!")
		RunActorFunction()
	end

	run_on_actor(Actor, [[
local s = get_comm_channel(...)
s:Fire()
]], id)
else
	local successRunning, ErrorRunning = pcall(RunActorFunction)

	if rconsolewarn ~= nil and not successRunning then
		pcall(function() rconsolewarn("error: ".. tostring(ErrorRunning))end)
	end
end
