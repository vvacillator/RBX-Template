--!strict
-- Ayden
-- Sep 25th, 2026

local TIMEOUT = 10
local MODULE_SELECTOR = "> ModuleScript, > Folder > ModuleScript"

local ServerStorage = game:GetService("ServerStorage")

local App = ServerStorage.App

function Register(moduleScript: ModuleScript): ()
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

	workspace:SetAttribute("ServerStarted", true)
end

function Startup(): ()
	Bootstrap()
end

function OnFail(err: string): ()
	warn("Failed to start server:", err)
end

xpcall(Startup, OnFail)