--!strict
-- Ayden
-- Sep 25th, 2026

local TIMEOUT = 10
local MODULE_SELECTOR = "> ModuleScript, > Folder > ModuleScript"

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")

local App = ReplicatedStorage.App

function Register(moduleScript: ModuleScript): ()
	debug.setmemorycategory("Client module registration")
	local timeoutThread = task.delay(TIMEOUT, function()
		warn(`"{moduleScript.Name}" require timed out`)
	end);
	(require)(moduleScript)
	task.cancel(timeoutThread)
end

function Bootstrap(): ()
	for _, v in App:QueryDescendants(MODULE_SELECTOR) do
		Register(v)
	end

	workspace:SetAttribute("ClientStarted", true)
end

function Startup(): ()
	Bootstrap()
end

function OnFail(response: string): ()
	warn("Failed to start client:", response)
end

-- Wait for server to start
if not workspace:GetAttribute("ServerStarted") then
	local timeoutThread = task.delay(TIMEOUT, function()
		warn("Server load timeout")
	end)
	workspace:GetAttributeChangedSignal("ServerStarted"):Wait()
	task.cancel(timeoutThread)
end

GuiService.AutoSelectGuiEnabled = false
xpcall(Startup, OnFail)
