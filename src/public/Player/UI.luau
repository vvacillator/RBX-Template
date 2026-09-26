--!strict
-- Ayden
-- Sep 25th, 2026

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.Vide)
local mount = Vide.mount

local App = require("../Interface/Components/App")

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerUI = Player:WaitForChild("PlayerGui", 180)

mount(App, PlayerUI)

return nil