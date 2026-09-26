--!strict
-- Ayden
-- Sep 25th, 2026

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

local px = require("../Libs/px")

return function()
    px.usePx()

    return create "ScreenGui" {
        Name = "App",
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		IgnoreGuiInset = true,
		ResetOnSpawn = false,

        -- Add components here
    }
end