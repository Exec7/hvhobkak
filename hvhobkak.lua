xpcall(function()
	require("zxcmodule")
end,function()
	Derma_Message("need gmod x64 chromium brench, and gmod bin module gmcl_zxcmodule_win64.dll in Steam/steamapps/common/GarrysMod/garrysmod/lua/bin","hvh obkak","ok")
end)
require("zxcmodule")
jit.flush()

local hvhobkak                          = {}
local me                                = LocalPlayer()

local global 		                    = _G //table.Copy( _G ) 

local gRunCmd                           = global.RunConsoleCommand

local Angle                             = Angle 
local Material                          = Material 
local Vector                            = Vector 
local Color                             = Color
local pairs                             = pairs
local ipairs                            = ipairs 
local IsValid                           = IsValid
local tostring                          = tostring 
local tonumber                          = tonumber
local CurTime                           = CurTime
local IsFirstTimePredicted              = IsFirstTimePredicted
local Lerp                              = Lerp 
local LerpAngle                         = LerpAngle

local gFindMeta                         = global.FindMetaTable

local MetaPlayer                        = gFindMeta("Player")

local gVgui                             = global.vgui 
local gGui                              = global.gui
local gString                           = global.string
local gTable                            = global.table
local gUtil                             = global.util
local gHttp                             = global.http
local gFile                             = global.file
local gSurface                          = global.surface
local gDraw                             = global.draw
local gRender                           = global.render
local gCam                              = global.cam
local gInput                            = global.input
local gHook                             = global.hook
local gNet                              = global.net
local gMath                             = global.math
local gBit                              = global.bit
local gEnts                             = global.ents
local gPlys                             = global.player
local gGame                             = global.game
local gEngine                           = global.engine
local gTeam                             = global.team

local gPlayer                            = global.Player
local gEntity                            = global.Entity

local team_GetColor                     = gTeam.GetColor 
local team_GetName                      = gTeam.GetName

local surface_DrawLine                  = gSurface.DrawLine
local surface_DrawOutlinedRect          = gSurface.DrawOutlinedRect
local surface_DrawPoly                  = gSurface.DrawPoly
local surface_DrawRect                  = gSurface.DrawRect
local surface_DrawText                  = gSurface.DrawText
local surface_DrawTexturedRect          = gSurface.DrawTexturedRect
local surface_DrawTexturedRectRotated   = gSurface.DrawTexturedRectRotated
local surface_GetTextSize               = gSurface.GetTextSize
local surface_PlaySound                 = gSurface.PlaySound
local surface_SetAlphaMultiplier        = gSurface.SetAlphaMultiplier
local surface_SetDrawColor              = gSurface.SetDrawColor
local surface_SetFont                   = gSurface.SetFont
local surface_SetMaterial               = gSurface.SetMaterial
local surface_SetTextColor              = gSurface.SetTextColor
local surface_SetTextPos                = gSurface.SetTextPos
local surface_CreateFont                = gSurface.CreateFont
local surface_DrawCircle                = gSurface.DrawCircle

local math_abs                          = gMath.abs
local math_Round                        = gMath.Round
local math_floor                        = gMath.floor
local math_ceil                         = gMath.ceil
local math_min                          = gMath.min
local math_max                          = gMath.max
local math_Clamp                        = gMath.Clamp
local math_sin                          = gMath.sin
local math_cos                          = gMath.cos
local math_tan                          = gMath.tan
local math_rad                          = gMath.rad
local math_Rand                         = gMath.Rand
local math_randomseed                   = gMath.randomseed
local math_deg                          = gMath.deg
local math_atan                         = gMath.atan
local math_atan2                        = gMath.atan2
local math_random                       = gMath.random
local math_huge                         = gMath.huge
local math_sqrt                         = gMath.sqrt

local math_Approach                     = gMath.Approach
local math_NormalizeAngle               = gMath.NormalizeAngle
local math_DistanceSqr                  = gMath.DistanceSqr

local hook_Add                          = gHook.Add
local hook_Remove                       = gHook.Remove
local hook_GetTable                     = gHook.GetTable
local hook_Call                         = gHook.Call
local hook_Run                          = gHook.Run

local bor                               = gBit.bor

local vgui_Create                       = gVgui.Create
local vgui_Register                     = gVgui.Register

local table_Count                       = gTable.Count
local table_Empty                      = gTable.Empty
local table_concat                      = gTable.concat
local table_insert                      = gTable.insert
local table_remove                      = gTable.remove
local table_RemoveByValue               = gTable.RemoveByValue
local table_sort                        = gTable.sort

function table.Empty( tbl ) 
    if tbl == _G then return end

    return table_Empty( tbl )
end 

local gui_ActivateGameUI                = gGui.ActivateGameUI
local gui_HideGameUI                    = gGui.HideGameUI
local gui_OpenURL                       = gGui.OpenURL

local string_find                       = gString.find
local string_format                     = gString.format
local string_len                        = gString.len
local string_sub                        = gString.sub
local string_lower                      = gString.lower
local StartsWith                        = gString.StartWith
local string_ToColor                    = gString.ToColor

local TraceHull                         = gUtil.TraceHull    
local TraceLine                         = gUtil.TraceLine

local file_Exists                       = gFile.Exists
local file_Delete                       = gFile.Delete
local file_Find                         = gFile.Find
local file_Read                         = gFile.Read
local file_Write                        = gFile.Write

local cam_Start3D                       = gCam.Start3D
local cam_End3D                         = gCam.End3D
local cam_Start3D2D                     = gCam.Start3D2D
local cam_End3D2D                       = gCam.End3D2D
local cam_Start2D                       = gCam.Start2D
local cam_End2D                         = gCam.End2D
local cam_IgnoreZ                       = gCam.IgnoreZ

local input_IsKeyDown                   = gInput.IsKeyDown
local input_IsMouseDown                 = gInput.IsMouseDown
local input_GetCursorPos                = gInput.GetCursorPos

local TickInterval                      = gEngine.TickInterval()
local ActiveGamemode                    = gEngine.ActiveGamemode()

local render_MaterialOverride           = gRender.MaterialOverride
local render_SetColorModulation         = gRender.SetColorModulation
local render_SetBlend                   = gRender.SetBlend
local render_SuppressEngineLighting     = gRender.SuppressEngineLighting
local render_DrawBeam                   = gRender.DrawBeam
local render_SetMaterial                = gRender.SetMaterial
local render_DrawWireframeBox           = gRender.DrawWireframeBox
local render_RenderView                 = gRender.RenderView
local render_Clear                      = gRender.Clear
local render_Capture                    = gRender.Capture
local render_CapturePixels              = gRender.CapturePixels
//render.CapturePixels                    = function() return end
//render.ReadPixel                        = function( x, y ) return 255, 255, 255, nil end

local player_GetAll                     = gPlys.GetAll
local ents_GetAll                       = gEnts.GetAll

local gDebugGetInfo                     = global.debug.getinfo

local scrw                              = ScrW()
local scrh                              = ScrH()
local scrwc                             = scrw / 2
local scrhc                             = scrh / 2

hvhobkak.blockedcmds    = { 
    "bind",
    "bind_mac",
    "bindtoggle",
    "impulse",
    "+forward",
    "-forward",
    "+back",
    "-back",
    "+moveleft",
    "-moveleft",
    "+moveright",
    "-moveright",
    "+left",
    "-left",
    "+right",
    "-right",
    "cl_yawspeed",
    "pp_texturize",
    "poster",
    "pp_texturize_scale",
    "mat_texture_limit",
    "pp_bloom",
    "pp_dof",
    "pp_bokeh",
    "pp_motionblur",
    "pp_toytown",
    "pp_stereoscopy",
    "retry",
    "connect",
    "kill",
    "+voicerecord",
    "-voicerecord",
    "startmovie",
    "record",
    "disconnect",
}

/*
if debug and debug.getinfo then
    function debug.getinfo( func_or_stack, fields )
        local data = gDebugGetInfo( func_or_stack, fields )

        if(func_or_stack == _G.RunConsoleCommand || func_or_stack == _G.debug.getinfo) then
            data.source = "=[C]"
            data.what = "C"
        end

        return data
    end
end
*/

// custom funcs

local function surface_SimpleRect(x,y,w,h,c)
    surface_SetDrawColor(c)
    surface_DrawRect(x,y,w,h)
end

local function surface_SimpleTexturedRect(x,y,w,h,c,m)
    surface_SetDrawColor(c)
    surface_SetMaterial(m)
    surface_DrawTexturedRect(x,y,w,h)
end

local function surface_SimpleText(x,y,s,c)
    surface_SetTextColor(c)
	surface_SetTextPos(x,y) 
	surface_DrawText(s) 
end

local function SmoothMaterial(path)
    return Material( path, "noclamp smooth" )
end

// fonts

surface_CreateFont( "tbfont", {	font = "Open Sans", extended = false,size = 15,weight = 100,additive = false,} )
surface_CreateFont( "veranda", { font = "Verdana", size = 12, antialias = false, outline = true } )
surface_CreateFont( "veranda_s", { font = "Verdana", size = 12, antialias = false, shadow = true } )
surface_CreateFont( "veranda_scr", { font = "Verdana", size = ScreenScale( 9 ), antialias = false, outline = true } )

hvhobkak.Colors = {}

for i = 0,255 do  // 50 shades of grey
    hvhobkak.Colors[i] = Color( i, i, i )
end

hvhobkak.Colors["Red"] = Color( 255, 0, 0, 255 )

hvhobkak.accent = Color( 255, 255, 255 )

/*
    Cached shit 
*/

hvhobkak.cached = {}

hvhobkak.Materials = {}

hvhobkak.Materials["Gradient"] = SmoothMaterial("gui/gradient_up")
hvhobkak.Materials["Gradient down"] = SmoothMaterial("gui/gradient_down")
hvhobkak.Materials["Gradient right"] = SmoothMaterial("gui/gradient")
hvhobkak.Materials["Alpha grid"] = SmoothMaterial("gui/alpha_grid.png")
hvhobkak.blur = Material("pp/blurscreen")

// CONFIG 

hvhobkak.presets = {}
hvhobkak.cfg = { vars = {}, binds = {}, colors = {} }

hvhobkak.cfg.vars["Enable aimbot"]              = false
hvhobkak.cfg.binds["Aim on key"]                = 0

hvhobkak.cfg.vars["Silent aim"]                 = true
hvhobkak.cfg.vars["pSilent"]                    = false

hvhobkak.cfg.vars["Auto reload"]                = false
hvhobkak.cfg.vars["Auto fire"]                  = false
hvhobkak.cfg.vars["Rapid fire"]                 = false
hvhobkak.cfg.vars["Alt Rapid fire"]             = false
hvhobkak.cfg.vars["Bullet time"]                = false

hvhobkak.cfg.vars["Nospread"]                   = false
hvhobkak.cfg.vars["Force seed"]                 = false
hvhobkak.cfg.vars["Wait for seed"]              = false
hvhobkak.cfg.vars["Norecoil"]                   = false

hvhobkak.cfg.vars["Extrapolation"]              = false
hvhobkak.cfg.vars["last update"]                = false
hvhobkak.cfg.vars["Disable animations"]         = false
hvhobkak.cfg.vars["Bone fix"]                   = false
hvhobkak.cfg.vars["Update Client Anim fix"]     = false
hvhobkak.cfg.vars["Wait for simtime update"]    = false
hvhobkak.cfg.vars["Disable interpolation"]      = true
hvhobkak.cfg.vars["Disable Sequence interpolation"] = true

hvhobkak.cfg.vars["Target selection"]           = 2
hvhobkak.cfg.vars["Ignores-Friends"]            = false
hvhobkak.cfg.vars["Ignores-Steam friends"]      = false
hvhobkak.cfg.vars["Ignores-Teammates"]          = false
hvhobkak.cfg.vars["Ignores-Admins"]             = false
hvhobkak.cfg.vars["Ignores-Bots"]               = false
hvhobkak.cfg.vars["Ignores-Frozen"]             = false
hvhobkak.cfg.vars["Ignores-Nodraw"]             = false
hvhobkak.cfg.vars["Ignores-Nocliping"]          = false
hvhobkak.cfg.vars["Ignores-God time"]           = false
hvhobkak.cfg.vars["Ignores-Head unhitable"]     = false
hvhobkak.cfg.vars["Ignores-Driver"]             = false
hvhobkak.cfg.vars["Wallz"]                      = false
hvhobkak.cfg.vars["Max targets"]                = 0

hvhobkak.cfg.vars["Hitbox selection"]           = 1
hvhobkak.cfg.vars["Hitscan"]                    = false
hvhobkak.cfg.vars["Hitscan groups-Head"]        = false
hvhobkak.cfg.vars["Hitscan groups-Chest"]       = false
hvhobkak.cfg.vars["Hitscan groups-Stomach"]     = false
hvhobkak.cfg.vars["Hitscan groups-Arms"]        = false
hvhobkak.cfg.vars["Hitscan groups-Legs"]        = false
hvhobkak.cfg.vars["Hitscan groups-Generic"]     = false
hvhobkak.cfg.vars["Hitscan mode"]               = 1
hvhobkak.cfg.vars["Multipoint"]                 = false
hvhobkak.cfg.vars["Multipoint scale"]           = 0.8
hvhobkak.cfg.vars["Multipoint groups-Head"]     = false
hvhobkak.cfg.vars["Multipoint groups-Chest"]    = false
hvhobkak.cfg.vars["Multipoint groups-Stomach"]  = false
hvhobkak.cfg.vars["Multipoint groups-Arms"]     = false
hvhobkak.cfg.vars["Multipoint groups-Legs"]     = false
hvhobkak.cfg.vars["Multipoint groups-Generic"]  = false

hvhobkak.cfg.vars["Adjust tickcount"]           = false
hvhobkak.cfg.vars["Gun switch"]                 = false
hvhobkak.cfg.vars["Auto detonator"]             = false
hvhobkak.cfg.vars["AutoD distance"]             = 96

hvhobkak.cfg.vars["Backtrack"]                  = false
hvhobkak.cfg.vars["Always backtrack"]           = false
hvhobkak.cfg.vars["Backtrack mode"]             = 1
hvhobkak.cfg.vars["Sampling interval"]          = 0
hvhobkak.cfg.vars["Backtrack time"]             = 200

hvhobkak.cfg.vars["Aimbot smoothing"]           = false
hvhobkak.cfg.vars["Smoothing"]                  = 0.05

hvhobkak.cfg.vars["Fov limit"]                  = false
hvhobkak.cfg.vars["Fov dynamic"]                = false
hvhobkak.cfg.vars["Aimbot FOV"]                 = 30
hvhobkak.cfg.vars["Show FOV"]                   = false
hvhobkak.cfg.colors["Show FOV"]                 = "255 255 0 255"

hvhobkak.cfg.vars["Aimbot snapline"]                   = false
hvhobkak.cfg.colors["Aimbot snapline"]                 = "255 128 0 255"
hvhobkak.cfg.vars["Aimbot marker"]                   = false
hvhobkak.cfg.colors["Aimbot marker"]                 = "255 255 255 255"



hvhobkak.cfg.vars["Trigger bot"]                = false
hvhobkak.cfg.binds["Trigger bot"]               = 0

hvhobkak.cfg.vars["Prop aimbot"]                = false
hvhobkak.cfg.vars["PA thrower"]                 = false
hvhobkak.cfg.vars["PA thrower dist"]            = 128
hvhobkak.cfg.vars["Prop max simtime"]           = 4

hvhobkak.cfg.vars["Crossbow prediction"]        = false
hvhobkak.cfg.vars["Smg grenade prediction"]     = false

hvhobkak.cfg.vars["Simulation limit"]           = 4

hvhobkak.cfg.vars["Baim low health"]            = false
hvhobkak.cfg.vars["Baim health"]                = 65

hvhobkak.cfg.vars["Auto healthkit"]             = false
hvhobkak.cfg.vars["Healthkit-Self heal"]        = false
hvhobkak.cfg.vars["Healthkit-Heal closest"]     = false

hvhobkak.cfg.vars["Knifebot"]                   = false
hvhobkak.cfg.vars["Knifebot mode"]              = 1
hvhobkak.presets["Knifebot mode"] = { "Damage", "Fast", "Fatal" }

hvhobkak.cfg.vars["Facestab"]                   = false

hvhobkak.cfg.vars["Projectile aimbot"]          = false

hvhobkak.cfg.vars["Forwardtrack"]               = false
hvhobkak.cfg.vars["Forwardtrack time"]          = 100








// Resolver 

hvhobkak.cfg.vars["Resolver"] = false
hvhobkak.cfg.vars["Yaw mode"] = 1
hvhobkak.cfg.vars["Pitch resolver"] = false
hvhobkak.cfg.vars["Taunt resolver"] = false



hvhobkak.cfg.vars["Invert first shot"] = false
hvhobkak.cfg.vars["Resolver max misses"] = 2


// Tickbase 
hvhobkak.cfg.vars["Tickbase shift"] = false
hvhobkak.cfg.vars["Wait for unlag"] = false

hvhobkak.cfg.vars["Fakelag comp"] = 2

hvhobkak.cfg.vars["Skip fire tick"] = false
hvhobkak.cfg.vars["Double tap"] = false
hvhobkak.cfg.vars["Dodge projectiles"] = false
hvhobkak.cfg.vars["Passive recharge"] = false

hvhobkak.cfg.vars["Auto recharge"] = false
hvhobkak.cfg.vars["Wait for charge"] = false
hvhobkak.cfg.vars["Warp on peek"] = false

hvhobkak.cfg.vars["Charge ticks"] = 48
hvhobkak.cfg.vars["Shift ticks"] = 48
hvhobkak.cfg.binds["Tickbase shift"] = 0
hvhobkak.cfg.binds["Auto recharge"] = 0



hvhobkak.cfg.vars["Anti aim"]                   = false
hvhobkak.cfg.vars["Yaw randomisation"]          = false

hvhobkak.cfg.vars["Custom real"]                = 75
hvhobkak.cfg.vars["Custom fake"]                = 180
hvhobkak.cfg.vars["Custom pitch"]               = 89
hvhobkak.cfg.vars["Spin speed"]                 = 30
hvhobkak.cfg.vars["LBY min delta"]              = 100
hvhobkak.cfg.vars["LBY break delta"]            = 120
hvhobkak.cfg.vars["Sin delta"]                  = 89
hvhobkak.cfg.vars["Sin add"]                    = 11
hvhobkak.cfg.vars["Jitter delta"]               = 45



hvhobkak.cfg.vars["Yaw base"]                   = 1
hvhobkak.presets["Yaw base"] = { "Viewangles", "At targets" }
hvhobkak.cfg.vars["Yaw"]                        = 1
hvhobkak.presets["Yaw"] = { 
    "Backward", "Fake Forward", "Legit Delta",
    "Sideways", "Half Sideways",
    "Fake Spin", "LBY", "LBY Breaker",
    "Sin Sway", "Pendulum Sway", "Lag Sway",
    "Fake Jitter", "Kappa Jitter", "Abu Jitter",
    "Satanic Spin", "Custom",
    "Hand Block", "Low delta",
    "Fake Switch", "Tank AA",
}
hvhobkak.cfg.vars["Pitch"]                      = 1
hvhobkak.presets["Pitch"] = { 
    "Down", "Up", "Zero", 
    "Fake down", "Fake fake down", 
    "Fake jitter", "Kizaru", 
    "Custom"
}
hvhobkak.cfg.vars["Edge"]                       = 1

hvhobkak.cfg.binds["Anti aim"]                   = 0







hvhobkak.cfg.vars["Antiaim material"] = 1
hvhobkak.cfg.vars["Antiaim fullbright"] = false
hvhobkak.cfg.colors["Real chams"] = "128 128 255 255"

// Anim breakers 

hvhobkak.cfg.vars["Taunt spam"] = false
hvhobkak.cfg.vars["Taunt"] = 1

hvhobkak.cfg.vars["Handjob"] = false
hvhobkak.cfg.vars["Handjob mode"] = 1


hvhobkak.cfg.vars["Micromovement"] = false
hvhobkak.cfg.vars["On shot aa"] = false
hvhobkak.cfg.vars["Freestanding"] = false
hvhobkak.cfg.binds["freestand"] = 0
hvhobkak.cfg.vars["Inverter"] = false
hvhobkak.cfg.binds["Inverter"] = 0
hvhobkak.cfg.vars["Anti aim chams"] = false

hvhobkak.cfg.vars["Angle arrows"] = false






hvhobkak.cfg.vars["Free standing"] = false
hvhobkak.cfg.vars["Dancer"] = false
    hvhobkak.cfg.vars["Dance"] = 1
    hvhobkak.cfg.vars["Arm breaker"] = false
    hvhobkak.cfg.vars["Arm breaker mode"] = 1
    hvhobkak.cfg.vars["Fake duck"] = false
    hvhobkak.cfg.vars["Fake duck mode"] = 1
    hvhobkak.cfg.vars["Fake walk"] = false
    hvhobkak.cfg.vars["Crimwalk"] = false

    hvhobkak.cfg.vars["Air crouch"] = false
    hvhobkak.cfg.vars["Air crouch mode"] = 1

// fake lag
hvhobkak.cfg.vars["Fake lag"] = false

hvhobkak.cfg.vars["Fake lag options-Disable on ladder"] = false
hvhobkak.cfg.vars["Fake lag options-Disable in attack"] = false
hvhobkak.cfg.vars["Fake lag options-On peek"] = false
hvhobkak.cfg.vars["Fake lag options-Randomise"] = false

hvhobkak.cfg.vars["Lag mode"] = 1

hvhobkak.cfg.vars["Lag limit"] = 1
hvhobkak.cfg.vars["Lag randomisation"] = 1

hvhobkak.cfg.vars["Fake duck"] = false
hvhobkak.cfg.binds["Fake duck"] = 0

hvhobkak.cfg.vars["Air lag duck"] = false
hvhobkak.cfg.vars["Jesus lag"] = false



hvhobkak.cfg.vars["Allah fly"] = false

    
// Sequence manip
hvhobkak.cfg.vars["Sequence manip"] = false
hvhobkak.cfg.vars["OutSequence"] = 500
hvhobkak.cfg.binds["Sequence manip"] = 0
hvhobkak.cfg.vars["Sequence min random"] = false
hvhobkak.cfg.vars["Sequence min"] = 1

hvhobkak.cfg.binds["Animation freezer"] = 0
hvhobkak.cfg.vars["Animation freezer"] = false

hvhobkak.cfg.vars["Freeze on peek"] = false

hvhobkak.cfg.vars["Allah walk"] = false
hvhobkak.cfg.binds["allahwalk"] = 0

// Animfix 

hvhobkak.cfg.vars["Interpolation-Disable interpolation"] = false
hvhobkak.cfg.vars["Interpolation-Fast sequences"] = false





    // ESP
    hvhobkak.cfg.vars["Bounding box"] = false



// Movement
hvhobkak.cfg.vars["Bhop"] = false
hvhobkak.cfg.vars["Sprint"] = false
hvhobkak.cfg.vars["Safe hop"] = false
hvhobkak.cfg.vars["Edge jump"] = false
hvhobkak.cfg.vars["Air duck"] = false

hvhobkak.cfg.vars["Air strafer"] = false
hvhobkak.cfg.vars["Strafe mode"] = 1
hvhobkak.cfg.vars["Ground strafer"] = false
hvhobkak.cfg.vars["Fast stop"] = false
hvhobkak.cfg.vars["Z Hop"] = false
hvhobkak.cfg.binds["Z Hop"] = 0

hvhobkak.cfg.vars["Water jump"] = false

hvhobkak.cfg.vars["Auto peak"] = false
hvhobkak.cfg.binds["Auto peak"] = 0
hvhobkak.cfg.vars["Auto peak tp"] = false

hvhobkak.cfg.vars["Circle strafe"] = false
hvhobkak.cfg.binds["Circle strafe"] = 0
hvhobkak.cfg.vars["CStrafe ticks"] = 64
hvhobkak.cfg.vars["CStrafe angle step"] = 1
hvhobkak.cfg.vars["CStrafe angle max step"] = 10
hvhobkak.cfg.vars["CStrafe ground diff"] = 10

hvhobkak.cfg.vars["Cvar name"] = ""
hvhobkak.cfg.vars["Cvar int"] = "1"
hvhobkak.cfg.vars["Cvar str"] = ""
hvhobkak.cfg.vars["Cvar mode"] = 1
hvhobkak.cfg.vars["Cvar flag"] = 1

hvhobkak.cfg.vars["Net Convar"] = ""
hvhobkak.cfg.vars["Net Convar str"] = ""
hvhobkak.cfg.vars["Net Convar int"] = 1
hvhobkak.cfg.vars["Net Convar mode"] = 1

hvhobkak.cfg.vars["Name Convar"] = ""
hvhobkak.cfg.vars["Disconnect reason"] = "VAC banned from secure server"
hvhobkak.cfg.vars["Name stealer"] = false
hvhobkak.cfg.vars["Auto reconnect"] = false

hvhobkak.cfg.vars["Chat spammer"]       = false
hvhobkak.cfg.vars["Chat mode"]          = 1
hvhobkak.cfg.vars["Chat group"]         = 1
hvhobkak.cfg.vars["Chat delay"]         = 1

hvhobkak.cfg.vars["Killsay"]            = false
hvhobkak.cfg.vars["Killsay mode"]          = 1
hvhobkak.cfg.vars["Killsay group"]         = 1

// FTPToPos abuse xd )))
hvhobkak.cfg.vars["FSpec Teleport"] = false
hvhobkak.cfg.binds["FSpec Teleport"] = 0

hvhobkak.cfg.vars["FSpec Masskill"] = false
hvhobkak.cfg.binds["FSpec Masskill"] = 0

hvhobkak.cfg.vars["FSpec ClickTP"] = false
hvhobkak.cfg.binds["FSpec ClickTP"] = 0

hvhobkak.cfg.vars["FSpec Velocity"] = false
hvhobkak.cfg.binds["FSpec Velocity"] = 0

// Player visuals 
hvhobkak.cfg.vars["Box esp"]                    = false
hvhobkak.cfg.vars["Box style"]                  = 1

hvhobkak.cfg.vars["Sight lines"]        = false

hvhobkak.cfg.vars["ESP Font"]                  = 1

hvhobkak.cfg.vars["Box gradient"]   = false

hvhobkak.cfg.colors["Box esp"]      = "255 0 255 255"
hvhobkak.cfg.colors["Box gradient"] = "0 255 255 255"

hvhobkak.cfg.vars["Box team color"] = false

hvhobkak.cfg.vars["Name"] = false
hvhobkak.cfg.vars["Name pos"] = 1

hvhobkak.cfg.vars["Usergroup"] = false
hvhobkak.cfg.vars["Usergroup pos"] = 1

hvhobkak.cfg.vars["Team"] = false
hvhobkak.cfg.vars["Team pos"] = 1

hvhobkak.cfg.vars["Health"] = false
hvhobkak.cfg.vars["Health bar"] = false
hvhobkak.cfg.vars["Health bar gradient"] = false
hvhobkak.cfg.vars["Health pos"] = 4
hvhobkak.cfg.colors["Health"] = "75 255 0 255"
hvhobkak.cfg.colors["Health bar gradient"] = "255 45 0 255"


hvhobkak.cfg.vars["Armor"] = false
hvhobkak.cfg.vars["Armor bar"] = false
hvhobkak.cfg.vars["Armor bar gradient"] = false
hvhobkak.cfg.vars["Armor pos"] = 4
hvhobkak.cfg.colors["Armor"] = "72 72 255 255"
hvhobkak.cfg.colors["Armor bar gradient"] = "72 255 72 255"

hvhobkak.cfg.vars["DarkRP Money"] = false
hvhobkak.cfg.vars["Money pos"] = 1

hvhobkak.cfg.vars["Weapon"] = false
hvhobkak.cfg.vars["Weapon pos"] = 1

hvhobkak.cfg.vars["Show ammo"] = false
hvhobkak.cfg.vars["Weapon printname"] = false
hvhobkak.cfg.vars["Show reload"] = false 

hvhobkak.cfg.vars["Break LC"] = false
hvhobkak.cfg.vars["Break LC pos"] = 1

hvhobkak.cfg.vars["Simtime updated"] = false
hvhobkak.cfg.vars["Simtime pos"] = 1

hvhobkak.cfg.colors["Skeleton"] = "255 255 255 255"
hvhobkak.cfg.vars["Skeleton"] = false

hvhobkak.cfg.vars["Player flags"] = false


// Chams
hvhobkak.cfg.vars["Visible chams"] = false
hvhobkak.cfg.vars["Visible chams w"] = false
hvhobkak.cfg.vars["Visible mat"] = 1
hvhobkak.cfg.colors["Visible chams"] = "0 255 255 255"

hvhobkak.cfg.vars["inVisible chams"] = false
hvhobkak.cfg.vars["inVisible chams w"] = false
hvhobkak.cfg.vars["inVisible mat"] = 1
hvhobkak.cfg.colors["inVisible chams"] = "255 255 0 255"

hvhobkak.cfg.vars["Supress lighting"] = false

hvhobkak.cfg.vars["Self chams"] = false
hvhobkak.cfg.vars["Self chams w"] = false
hvhobkak.cfg.vars["Self mat"] = 1
hvhobkak.cfg.colors["Self chams"] = "255 0 255 255"

hvhobkak.cfg.vars["Supress self lighting"] = false

hvhobkak.cfg.vars["Show records"] = false

hvhobkak.cfg.vars["Backtrack chams"] = false
hvhobkak.cfg.vars["Backtrack material"] = 1
hvhobkak.cfg.vars["Backtrack fullbright"] = false
hvhobkak.cfg.colors["Backtrack chams"] = "255 128 255 255"
hvhobkak.cfg.vars["Backtrack skeleton"] = false
hvhobkak.cfg.vars["OOF Arrows"] = false
hvhobkak.cfg.vars["OOF Style"] = 1



hvhobkak.cfg.vars["On screen logs"] = false

hvhobkak.cfg.colors["On screen logs"] = "69 255 69 255"
hvhobkak.cfg.colors["Miss lagcomp"] = "69 69 255 255"
hvhobkak.cfg.colors["Miss spread"] = "255 255 69 255"
hvhobkak.cfg.colors["Miss fail"] = "255 69 69 255"

hvhobkak.cfg.vars["Entity chams"] = false
hvhobkak.cfg.vars["Entity material"] = 1
hvhobkak.cfg.vars["Entity fullbright"] = false
hvhobkak.cfg.colors["Entity chams"] = "255 89 89 255"

hvhobkak.cfg.vars["Player outline"] = false
hvhobkak.cfg.vars["Entity outline"] = false
hvhobkak.cfg.colors["Player outline"] = "45 255 86 255"
hvhobkak.cfg.colors["Entity outline"] = "255 86 45 255"

hvhobkak.cfg.vars["Outline style"] = 1 

hvhobkak.cfg.vars["ESP Distance"] = 3500

// Entity Esp
hvhobkak.cfg.binds["Ent add"] = 0
hvhobkak.cfg.vars["Ent box"] = false
hvhobkak.cfg.vars["Ent box style"] = 1
hvhobkak.cfg.vars["Ent class"] = false
hvhobkak.cfg.vars["Ent ESP Distance"] = 3500

hvhobkak.cfg.vars["Fresnel minimum illum"] = 0
hvhobkak.cfg.vars["Fresnel maximum illum"] = 1
hvhobkak.cfg.vars["Fresnel exponent"] = 1

// Hitmarker
hvhobkak.cfg.vars["Hitmarker"] = false
hvhobkak.cfg.vars["Hit particles"] = false
hvhobkak.cfg.vars["Hitnumbers"] = false

hvhobkak.cfg.vars["Hitsound"] = false
hvhobkak.cfg.vars["Killsound"] = false

hvhobkak.cfg.vars["Hitsound str"] = "phx/hmetal1.wav"
hvhobkak.cfg.vars["Killsound str"] = "ambient/levels/canals/windchime2.wav"

hvhobkak.cfg.colors["Hit particles"] = "255 128 235 255"
hvhobkak.cfg.colors["Hitmarker"] = "255 155 25 255"
hvhobkak.cfg.colors["Hitnumbers"] = "255 255 255 255"
hvhobkak.cfg.colors["Hitnumbers krit"] = "255 35 35 255"

// Name hide / visual misc

hvhobkak.cfg.vars["Hide name"] = false
hvhobkak.cfg.vars["Custom name"] = "Your mom"
hvhobkak.cfg.vars["Disable SADJ"] = false
hvhobkak.cfg.vars["Screengrab image"] = false


// Visuals 
hvhobkak.cfg.vars["Tickbase indicator"] = false
hvhobkak.cfg.vars["Spectator list"] = false


hvhobkak.cfg.vars["Killsound"] = false

// World 
hvhobkak.cfg.vars["Custom sky"] = GetConVar("sv_skyname"):GetString()
hvhobkak.cfg.vars["Sky color"] = false 
hvhobkak.cfg.colors["Sky color"] = "145 185 245 255"
hvhobkak.cfg.vars["Wall color"] = false 
hvhobkak.cfg.colors["Wall color"] = "50 45 65 255"
hvhobkak.cfg.vars["Fullbright"] = false 
hvhobkak.cfg.vars["Fullbright mode"] = 1
hvhobkak.cfg.binds["Fullbright"] = 0
hvhobkak.cfg.vars["Disable shadows"] = false
hvhobkak.cfg.vars["FogChanger"] = false
hvhobkak.cfg.colors["FogChanger"] = "255 255 255 255"
hvhobkak.cfg.vars["FogStart"] = 1500
hvhobkak.cfg.vars["FogEnd"] = 3000
hvhobkak.cfg.vars["Color Modify"] = false
hvhobkak.cfg.vars["Color Modify Brightness"] = 0
hvhobkak.cfg.vars["Color Modify Contrast"] = 1
hvhobkak.cfg.vars["Color Modify Saturation"] = 3
hvhobkak.cfg.vars["Color Modify Add Red"] = 0
hvhobkak.cfg.vars["Color Modify Add Green"] = 0
hvhobkak.cfg.vars["Color Modify Add Blue"] = 0
hvhobkak.cfg.vars["Color Modify Mul Red"] = 0
hvhobkak.cfg.vars["Color Modify Mul Green"] = 0
hvhobkak.cfg.vars["Color Modify Mul Blue"] = 0

// Effects
hvhobkak.cfg.vars["Bullet tracers"] = false 
hvhobkak.cfg.colors["Bullet tracers"] = "255 65 65 255"
hvhobkak.cfg.vars["Bullet tracers material"] = "sprites/tp_beam001" 
hvhobkak.cfg.vars["Tracers die time"] = 5 
hvhobkak.cfg.vars["Bullet tracers muzzle"] = false 

// View 
hvhobkak.cfg.vars["Third person"] = false
hvhobkak.cfg.binds["Third person"] = 0
hvhobkak.cfg.vars["Third person collision"] = false
hvhobkak.cfg.vars["Third person smoothing"] = false
hvhobkak.cfg.vars["Third person distance"] = 150

hvhobkak.cfg.vars["Free camera"] = false
hvhobkak.cfg.binds["Free camera"] = 0
hvhobkak.cfg.vars["Free camera speed"] = 25
hvhobkak.cfg.vars["Ghetto free cam"] = false


hvhobkak.cfg.vars["Fov override"] = GetConVarNumber("fov_desired")
hvhobkak.cfg.vars["Aspect ratio"] = 0

hvhobkak.cfg.vars["Viewmodel changer"] = false

hvhobkak.cfg.vars["Viewmodel fov"] = GetConVar("viewmodel_fov"):GetInt()

hvhobkak.cfg.vars["Viewmodel chams"] = false
hvhobkak.cfg.colors["Viewmodel chams"] = "75 95 128 255"
hvhobkak.cfg.vars["Viewmodel chams type"] = 1
hvhobkak.cfg.vars["Fullbright viewmodel"] = false


hvhobkak.cfg.vars["Viewmodel x"] = 0
hvhobkak.cfg.vars["Viewmodel y"] = 0
hvhobkak.cfg.vars["Viewmodel z"] = 0
hvhobkak.cfg.vars["Viewmodel r"] = 0

hvhobkak.cfg.vars["Ghost follower"] = false
hvhobkak.cfg.vars["GFID"] = "SteamID"

// Misc

hvhobkak.cfg.vars["Use spam"] = false
hvhobkak.cfg.vars["Flashlight spam"] = false
hvhobkak.cfg.vars["Auto GTA"] = false
hvhobkak.cfg.vars["Camera spam"] = false
hvhobkak.cfg.vars["Fast lockpick"] = false


hvhobkak.cfg.vars["Config name"] = "new"
hvhobkak.cfg.vars["Selected config"] = 1

hvhobkak.cfg.colors["Menu color"] = "0 0 0 255"

do 
    local maxshift = GetConVar("sv_maxusrcmdprocessticks"):GetInt() - 1
    local tickrate = tostring(math_Round(1 / TickInterval))

	gRunCmd("cl_cmdrate", tickrate)
	gRunCmd("cl_updaterate", tickrate)

	gRunCmd("cl_interp", "0")
	gRunCmd("cl_interp_ratio", "0")

    hvhobkak.cfg.vars["Shift ticks"] = maxshift
    hvhobkak.cfg.vars["Charge ticks"] = maxshift
    
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ded.EnableAnimFix( false )
end




/*
    Miss / Hit logs
*/

hvhobkak.onScreenLogs = {}
hvhobkak.firedShots = 0
hvhobkak.HitLogsWhite = Color( 255, 105, 180 )
hvhobkak.MissReasons = {
    [ 1 ] =     { str = "spread", var = "Miss spread" },
    [ 2 ] =     { str = "occlusion", var = "Miss spread" },
    [ 3 ] =     { str = "desync", var = "Miss lagcomp" },
    [ 4 ] =     { str = "lagcomp", var = "Miss lagcomp" },
    [ 5 ] =     { str = "resolver", var = "Miss fail" },
}

 





// Config save / load

if not file.Exists( "data/hvhobkak", "GAME" ) then 
    file.CreateDir("hvhobkak") 
end

if not file.Exists( "hvhobkak/default.txt", "DATA" ) then 
    file.Write( "hvhobkak/default.txt", util.TableToJSON( hvhobkak.cfg, false ) ) 
end


hvhobkak.cfgTable = {}

function hvhobkak.fillConfigTable()
    local ftbl = file.Find("hvhobkak/*.txt", "DATA")
    hvhobkak.cfgTable = {}

    if not ftbl or #ftbl == 0 then return end

    for i = 1, #ftbl do
        local str = ftbl[i] 
        local len = string.len(str)
        local f = string.sub(str, 1, len - 4) -- Remove .txt extension

        hvhobkak.cfgTable[#hvhobkak.cfgTable + 1] = f
    end
end

hvhobkak.fillConfigTable()

function hvhobkak.SaveConfig()
    local tojs = util.TableToJSON(hvhobkak.cfg, false)
    local str = hvhobkak.cfgTable[hvhobkak.cfg.vars["Selected config"]]

    if str then
        file.Write("hvhobkak/" .. str .. ".txt", tojs)
    else
        print("Error: Selected config not found.")
    end
end

function hvhobkak.LoadConfig()
    local str = hvhobkak.cfgTable[hvhobkak.cfg.vars["Selected config"]]
    //print(hvhobkak.cfg.vars["Selected config"])

    if not str or not file.Exists("hvhobkak/" .. str .. ".txt", "DATA") then
        print("Error: Config file not found.")
        return
    end

    local read = file.Read("hvhobkak/" .. str .. ".txt", "DATA")
    local totbl = util.JSONToTable(read)
    if not totbl then
        print("Error: Failed to parse config file.")
        return
    end

    local ConfigName = hvhobkak.cfg.vars["Config name"]
    local SelectedConfig = hvhobkak.cfg.vars["Selected config"]

    for k, v in pairs(totbl) do
        for key, value in pairs(v) do
            local tbl = hvhobkak.cfg

            if k == "vars" then
                tbl = hvhobkak.cfg.vars
            elseif k == "colors" then
                tbl = hvhobkak.cfg.colors
            elseif k == "binds" then
                tbl = hvhobkak.cfg.binds
            end
            
            tbl[key] = value
        end
    end

    hvhobkak.cfg.vars["Config name"] = ConfigName
    hvhobkak.cfg.vars["Selected config"] = SelectedConfig

    ded.SetInterpolation(hvhobkak.cfg.vars["Disable interpolation"])
    ded.SetSequenceInterpolation(hvhobkak.cfg.vars["Disable Sequence interpolation"])
    ded.EnableAnimFix(hvhobkak.cfg.vars["Update Client Anim fix"])
    ded.EnableBoneFix(hvhobkak.cfg.vars["Bone fix"])

    ded.SetMaxShift(hvhobkak.cfg.vars["Charge ticks"])
    ded.SetMinShift(hvhobkak.cfg.vars["Shift ticks"])
    ded.EnableTickbaseShifting(hvhobkak.cfg.vars["Tickbase shift"])
end

function hvhobkak.CreateConfig()
    local str = hvhobkak.cfg.vars["Config name"]

    if str then
        file.Write("hvhobkak/" .. str .. ".txt", "")
        hvhobkak.fillConfigTable()
        hvhobkak.initTab("Config")
    else
        print("Error: Config name not specified.")
    end
end

function hvhobkak.DeleteConfig()
    local selectedConfigId = hvhobkak.cfg.vars["Selected config"]
    local str = hvhobkak.cfgTable[selectedConfigId]

    if str then
        file.Delete("hvhobkak/" .. str .. ".txt")

        table.remove(hvhobkak.cfgTable, selectedConfigId)

        if #hvhobkak.cfgTable > 0 then
            hvhobkak.cfg.vars["Selected config"] = 1
        else
            hvhobkak.cfg.vars["Selected config"] = nil
        end

        hvhobkak.fillConfigTable()
        hvhobkak.initTab("Config")
    else
        print("Error: Selected config not found.")
    end
end


function hvhobkak.TIME_TO_TICKS(time)
	return math_floor(0.5 + time / TickInterval)
end

function hvhobkak.TICKS_TO_TIME(ticks)
    return TickInterval * ticks
end

function hvhobkak.ROUND_TO_TICK(time)
    return hvhobkak.TICKS_TO_TIME(hvhobkak.TIME_TO_TICKS(time))
end

/*
    Materials 
*/

hvhobkak.chamsMaterials = {
    "Flat",
    "Wireframe",
    "Selfillum",
    "Selfillum additive",
    "Metallic",
    "Glass",
    "Glowing glass"
}



























/*
    Detours 
*/

do
    local PLAYER = FindMetaTable( "Player" )

    local Name_     = PLAYER.Name
    local Nick_     = PLAYER.Nick
    local GetName_  = PLAYER.GetName

    function PLAYER:Name()

        if hvhobkak.cfg.vars["Hide name"] and self == me then
            return hvhobkak.cfg.vars["Custom name"]
        end

        return Name_( self )
    end

    function PLAYER:Nick()

        if hvhobkak.cfg.vars["Hide name"] and self == me then
            return hvhobkak.cfg.vars["Custom name"]
        end

        return Nick_( self )
    end

    function PLAYER:GetName()

        if hvhobkak.cfg.vars["Hide name"] and self == me then
            return hvhobkak.cfg.vars["Custom name"]
        end

        return GetName_( self )
    end
end









hvhobkak.ui = {}

hvhobkak.validsnd = false 


hvhobkak.activetab = "Aimbot"
hvhobkak.multicombo = false


hvhobkak.hint = false
hvhobkak.hintText = ""
hvhobkak.hintX = 0
hvhobkak.hintY = 0

do
    StoredCursorPos = {}

    function RememberCursorPosition()

        local x, y = input_GetCursorPos()

        if ( x == 0 && y == 0 ) then return end

        StoredCursorPos.x, StoredCursorPos.y = x, y

    end

    function RestoreCursorPosition()

        if ( !StoredCursorPos.x || !StoredCursorPos.y ) then return end
        input.SetCursorPos( StoredCursorPos.x, StoredCursorPos.y )

    end
end

do
    local PANEL = {}

    PANEL.FadeTime = 0

    function PANEL:Init()
        self:SetFocusTopLevel( true )
        self:SetSize( 800, 500 )

        self:SetPaintBackgroundEnabled( false )
        self:SetPaintBorderEnabled( false )
        self:DockPadding( 5, 60, 5, 5 )
        self:MakePopup()
        self:Center( true )

        PANEL.TopPanel = self:Add( "DPanel" )
        PANEL.TopPanel:SetPos( 5, 30 )
        PANEL.TopPanel:SetSize( 800-10, 25 )
        
        function PANEL.TopPanel:Paint( w, h )
            surface_SimpleRect( 0, 24, w, 1, hvhobkak.Colors[ 54 ] )
        end
    end

    function PANEL:Think()
        local x,y = input_GetCursorPos()
        local mousex = math_Clamp( x, 1, scrw - 1 )
        local mousey = math_Clamp( y, 1, scrh - 1 )

        if ( self.Dragging ) then

            local x = mousex - self.Dragging[1]
            local y = mousey - self.Dragging[2]

            self:SetPos( x, y )

        end

        self:SetCursor( "arrow" )

        hvhobkak.accent = HSVToColor(  ( CurTime() * 25 ) % 360, 1, 1 )

        hvhobkak.accent.r = math_Clamp( hvhobkak.accent.r, 128, 255 )
        hvhobkak.accent.g = math_Clamp( hvhobkak.accent.g, 128, 255 )
        hvhobkak.accent.b = math_Clamp( hvhobkak.accent.b, 128, 255 )
    end

    function PANEL:IsActive()

        if ( self:HasFocus() ) then return true end
        if ( vgui.FocusedHasParent( self ) ) then return true end
    
        return false
    
    end
    

    function PANEL:OnMousePressed()
        local x,y = input_GetCursorPos()
        local screenX, screenY = self:LocalToScreen( 0, 0 )

        if (  y < ( screenY + 850 ) ) then
            self.Dragging = { x - self.x, y - self.y }
            self:MouseCapture( true )
            return
        end

    end

    function PANEL:OnMouseReleased()

        self.Dragging = nil
        self.Sizing = nil
        self:MouseCapture( false )

    end

    local bgmat = Material("despair/bg.png", "noclamp smooth")
    function PANEL:Paint(w, h)
        //local x, y = self:LocalToScreen( 0, 0 )

        //surface_SetDrawColor( 255, 255, 255 )
        //surface_SetMaterial( bgmat )

        //render.SetScissorRect( 0, 0, w, h, true)
        //    surface_DrawTexturedRect(0, 0, scrw, scrh)
        //render.SetScissorRect(0, 0, 0, 0, false)

        //for i = 1, 4 do
        //    hvhobkak.blur:SetFloat( "$blur", (i / 3) * 4 )
        //    hvhobkak.blur:Recompute()
//
        //    render.UpdateScreenEffectTexture()
        //    surface_DrawTexturedRect( x * -1, y * -1, scrw, scrh )
        //end


        surface_SimpleRect(0, 0, w, h, hvhobkak.Colors[24])
        surface_SimpleRect(0, 0, w, 25, hvhobkak.Colors[54])
        surface_SetFont("tbfont")
        surface_SimpleText(8,4,"HVH OBKAK",color_white) 

        
    end

    function PANEL:GetTopPanel()
        return PANEL.TopPanel
    end

    vgui_Register( "UFrame", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )

        local vbar = self.VBar
        vbar:SetWide(3)
    
        vbar.Paint = nil
        vbar.btnUp.Paint = nil
        vbar.btnDown.Paint = nil
    
        function vbar.btnGrip:Paint( w, h ) 
            surface_SetDrawColor( hvhobkak.Colors[54] )
            surface_DrawRect( 0, 0, w, h )
        end
    end

    function PANEL:Paint( w, h )
    end

    function PANEL:OnMousePressed()
        hvhobkak.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        hvhobkak.frame:OnMouseReleased()
    end

    vgui_Register( "UScroll", PANEL, "DScrollPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.ItemPanel = vgui_Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 23, 3, 3 )

        self.ItemPanel.Paint = nil

        function self.ItemPanel:OnMousePressed()
            hvhobkak.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            hvhobkak.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface_SetDrawColor( hvhobkak.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
   
        surface_SetFont( "tbfont" )
        surface_SimpleText( 8, 2, self.txt, hvhobkak.Colors[165] )

        surface_SimpleRect( 6, 20, w-12, 1, hvhobkak.Colors[54] )
    end

    function PANEL:OnMousePressed()
        hvhobkak.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        hvhobkak.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end
    
    vgui_Register( "UPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface_SimpleRect( 0, 0, w, h, hvhobkak.Colors[54] )
    end
    
    vgui_Register( "UPaintedPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( TOP )
        self:DockMargin( 4, 4, 4, 0 )
        self:SetTall( 18 )
    end

    function PANEL:Paint( w, h )
        
    end
    
    vgui_Register( "UCBPanel", PANEL, "DPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.Label:SetFont("tbfont")
        self.Label:SetTextColor(hvhobkak.Colors[165])

        self.Button:SetSize( 18, 18 )

        function self.Button:Paint(w,h)
            local v = self:GetChecked()

            surface_SetDrawColor(hvhobkak.Colors[54])

            surface_DrawOutlinedRect(0,0,w,h,1)

            if !v and !self:IsHovered() then return end

            if v then
                surface_SetDrawColor(hvhobkak.Colors[54])
            else
                surface_SetDrawColor(hvhobkak.Colors[40])
            end
                
            surface_DrawRect(3,3,w-6,h-6)
        end
    end

    function PANEL:PerformLayout()

        local x = self.m_iIndent || 0
    
        self.Button:SetSize( 18, 18 )
        self.Button:SetPos( x, math_floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )
    
        self.Label:SizeToContents()
        self.Label:SetPos( x + self.Button:GetWide() + 9, math_floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )
    
    end
    
    vgui_Register( "UCheckboxLabel", PANEL, "DCheckBoxLabel" )
end

do
    local PANEL = {}
    AccessorFunc(PANEL, "Value", "Value")
    AccessorFunc(PANEL, "SlideX", "SlideX")
    AccessorFunc(PANEL, "Min", "Min")
    AccessorFunc(PANEL, "Decimals", "Decimals")
    AccessorFunc(PANEL, "Max", "Max")
    AccessorFunc(PANEL, "Dragging", "Dragging")
    
    function PANEL:Init()
        self:SetMouseInputEnabled(true)
    
        self.Min = 0
        self.Max = 1
        self.SlideX = 0
        self.Decimals = 0
    
        self:SetValue(self.Min)
        self:SetSlideX(0)

        self:SetTall(15)
    end
    
    function PANEL:OnCursorMoved(x, y)
        if !self.Dragging then return end
    
        local w, h = self:GetSize()
    
        x = math_Clamp(x, 0, w) / w
        y = math_Clamp(y, 0, h) / h
    
        local value = self.Min + (self.Max - self.Min) * x
        value = math_Round(value, self:GetDecimals())
    
        self:SetValue(value)
        self:SetSlideX(x)
    
        self:OnValueChanged(value)
    
        self:InvalidateLayout()
    end
    
    function PANEL:OnMousePressed(mcode)
        self:SetDragging(true)
        self:MouseCapture(true)
    
        local x, y = self:CursorPos()
        self:OnCursorMoved(x, y)
    end
    
    function PANEL:OnMouseReleased(mcode)
        self:SetDragging(false)
        self:MouseCapture(false)
    end
    
    function PANEL:OnValueChanged(value)
    
    end

    function PANEL:Paint(w,h)
        local min, max = self:GetMin(), self:GetMax()

        surface_SetDrawColor(hvhobkak.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h,1)
    
        surface_SetDrawColor(hvhobkak.Colors[54])
        surface_DrawRect(2, 2, self:GetSlideX()*w-4, h-4)
    end
    
    vgui_Register("USlider", PANEL, "Panel")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(4,4,4,0)

        self:SetTextColor(hvhobkak.Colors[165])
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface_SetDrawColor(hvhobkak.Colors[35])
            surface_DrawRect(0, 0, w, h)
        end

        surface_SetDrawColor(hvhobkak.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h,1)    
    end

    vgui_Register( "UButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(1,1,1,0)

        self:SetTextColor(hvhobkak.Colors[245])
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface_SetDrawColor(hvhobkak.Colors[35])
            surface_DrawRect(0, 0, w, h)
        end
    end

    vgui_Register( "UESPPButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetTall(20)
        self.DropButton.Paint = nil
    end

    function PANEL:Paint(w,h)
        surface_SetDrawColor(hvhobkak.Colors[25])
        surface_DrawRect(0,0,w,h)
    
        surface_SetDrawColor(hvhobkak.Colors[32])
        surface_DrawRect(w-25,0,25,25)
    
        surface_SetTextColor(hvhobkak.Colors[222])
        surface_SetTextPos(w-20,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText("▼")

        surface_SetDrawColor(hvhobkak.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h)
    end

    function PANEL:OpenMenu( pControlOpener )

        if ( pControlOpener && pControlOpener == self.TextEntry ) then
            return
        end
    
        -- Don't do anything if there aren't any options..
        if ( #self.Choices == 0 ) then return end
    
        -- If the menu still exists and hasn't been deleted
        -- then just close it and don't open a new one.
        if ( IsValid( self.Menu ) ) then
            self.Menu:Remove()
            self.Menu = nil
        end
    
        -- If we have a modal parent at some level, we gotta parent to that or our menu items are not gonna be selectable
        local parent = self
        while ( IsValid( parent ) && !parent:IsModal() ) do
            parent = parent:GetParent()
        end
        if ( !IsValid( parent ) ) then parent = self end
    
        self.Menu = DermaMenu( false, parent )

        function self.Menu:Paint(w,h)
            surface_SetDrawColor(hvhobkak.Colors[24])
            surface_DrawRect(0,0,w,h)
            surface_SetDrawColor(hvhobkak.Colors[54])
            surface_DrawOutlinedRect(0,-1,w,h+1)
        end

        for k, v in pairs( self.Choices ) do
            local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
            option.txt = option:GetText()
            option:SetText("")

            function option:Paint(w,h)
                if self:IsHovered() then 
                    surface_SimpleRect(1,1,w-2,h-2,hvhobkak.Colors[32])
                end

                surface_SetTextColor(hvhobkak.Colors[165])
                surface_SimpleText(10,4,option.txt,hvhobkak.Colors[165])
            end   

            if ( self.Spacers[ k ] ) then
                self.Menu:AddSpacer()
            end
        end

    
        local x, y = self:LocalToScreen( 0, self:GetTall() )
    
        self.Menu:SetMinimumWidth( self:GetWide() )
        self.Menu:Open( x, y, false, self )
    
        self:OnMenuOpened( self.Menu )
    
    end
    
    function PANEL:PerformLayout(s)
        self:SetTextColor(hvhobkak.Colors[165])
        self:SetFont("tbfont")
    end

    vgui_Register( "UComboBox", PANEL, "DComboBox" )
end




do
    local PANEL = {}

    AccessorFunc( PANEL, "m_iSelectedNumber", "SelectedNumber" )

    function PANEL:Init()

        self:SetSelectedNumber( 0 )
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 75 )

    end

    function PANEL:UpdateText()

        local str = input.GetKeyName( self:GetSelectedNumber() )
        if ( !str ) then str = "" end

        str = language.GetPhrase( str )

        self:SetText( "["..str.."]" )
        self:SetTextColor(hvhobkak.Colors[165])
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        surface_SetDrawColor(hvhobkak.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h,1)
    end

    function PANEL:DoClick()

        self:SetText( "PRESS A KEY" )
        input.StartKeyTrapping()
        self.Trapping = true

    end

    function PANEL:DoRightClick()

        self:SetText( "[]" )
        self:SetValue( 0 )

    end

    function PANEL:SetSelectedNumber( iNum )

        self.m_iSelectedNumber = iNum
        self:UpdateText()
        self:OnChange( iNum )

    end

    function PANEL:Think()

        if ( input.IsKeyTrapping() && self.Trapping ) then

            local code = input.CheckKeyTrapping()
            if ( code ) then

                if ( code == KEY_ESCAPE ) then

                    self:SetValue( self:GetSelectedNumber() )

                else

                    self:SetValue( code )

                end

                self.Trapping = false

            end

        end

    end

    function PANEL:SetValue( iNumValue )

        self:SetSelectedNumber( iNumValue )

    end

    function PANEL:GetValue()

        return self:GetSelectedNumber()

    end

    function PANEL:OnChange()
    end

    vgui_Register( "UBinder", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.Color = Color(255,255,255,255)

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall(18)
        self:SetWide(18)
        
        self:SetText("")
    end

    function PANEL:Paint(w,h)
        if self.Color.a < 255 then
            surface_SimpleTexturedRect(0,0,w,h,hvhobkak.Colors[255],hvhobkak.Materials["Alpha grid"])  
        end

        surface_SetDrawColor(self.Color)
        surface_DrawRect(0,0,w,h)
    end

    vgui_Register( "UCPicker", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.lifeTime = 0

    function PANEL:Paint( w, h )
        surface_SimpleRect( 0, 0, w, h, hvhobkak.Colors[25] )

        surface_SetDrawColor( hvhobkak.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    function PANEL:Init()
        self:RequestFocus()
        self:MakePopup()
    end

    function PANEL:Think()
        if self.lifeTime < 15 then self.lifeTime = self.lifeTime + 1 end

        if not self:HasFocus() and self.lifeTime >= 14 then
            self:Remove()
        end
    end

    vgui_Register( "ULifeTimeBase", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetSize(200,200)
    end 

    function PANEL:Paint( w, h )
        surface_SimpleRect( 0, 0, w, h, hvhobkak.Colors[25] )

        surface_SetDrawColor( hvhobkak.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui_Register( "UColorPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )
        self:DockPadding(5, 5, 5, 5)
        self:SetPalette( false )
        self:SetWangs( false )
    end

    vgui_Register( "UColorMixer", PANEL, "DColorMixer" )
end

do
    local PANEL = {}

    AccessorFunc( PANEL, "m_bDirty", "Dirty", FORCE_BOOL )
    AccessorFunc( PANEL, "m_bSortable", "Sortable", FORCE_BOOL )

    AccessorFunc( PANEL, "m_iHeaderHeight", "HeaderHeight" )
    AccessorFunc( PANEL, "m_iDataHeight", "DataHeight" )

    AccessorFunc( PANEL, "m_bMultiSelect", "MultiSelect" )
    AccessorFunc( PANEL, "m_bHideHeaders", "HideHeaders" )

    function PANEL:Init()
        self:SetSortable( true )
        self:SetMouseInputEnabled( true )
        self:SetMultiSelect( true )
        self:SetHideHeaders( false )

        self:SetPaintBackground( true )
        self:SetHeaderHeight( 16 )
        self:SetDataHeight( 17 )

        self.Columns = {}

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

        self.pnlCanvas = vgui.Create( "Panel", self )

        self.VBar = vgui.Create( "DVScrollBar", self )
        self.VBar:SetZPos( 20 )
    end

    function PANEL:DisableScrollbar()

        if ( IsValid( self.VBar ) ) then
            self.VBar:Remove()
        end

        self.VBar = nil

    end

    function PANEL:GetLines()
        return self.Lines
    end

    function PANEL:GetInnerTall()
        return self:GetCanvas():GetTall()
    end

    function PANEL:GetCanvas()
        return self.pnlCanvas
    end

    function PANEL:AddColumn( strName, iPosition )

        if ( iPosition ) then
            if ( iPosition <= 0 ) then
                ErrorNoHaltWithStack( "Attempted to insert column at invalid position ", iPosition )
                return
            end
        
            if ( IsValid( self.Columns[ iPosition ] ) ) then
                ErrorNoHaltWithStack( "Attempted to insert duplicate column." )
                return
            end
        end

        local pColumn = nil

        if ( self.m_bSortable ) then
            pColumn = vgui.Create( "DListView_Column", self )
        else
            pColumn = vgui.Create( "DListView_ColumnPlain", self )
        end

        pColumn:SetName( strName )
        pColumn:SetZPos( 10 )

        if ( iPosition ) then

            table.insert( self.Columns, iPosition, pColumn )

            local i = 1
            for id, pnl in pairs( self.Columns ) do
                pnl:SetColumnID( i )
                i = i + 1
            end

        else

            local ID = table.insert( self.Columns, pColumn )
            pColumn:SetColumnID( ID )

        end

        self:InvalidateLayout()

        return pColumn

    end

    function PANEL:RemoveLine( LineID )

        local Line = self:GetLine( LineID )
        local SelectedID = self:GetSortedID( LineID )

        self.Lines[ LineID ] = nil
        table.remove( self.Sorted, SelectedID )

        self:SetDirty( true )
        self:InvalidateLayout()

        Line:Remove()

    end

    function PANEL:ColumnWidth( i )

        local ctrl = self.Columns[ i ]
        if ( !ctrl ) then return 0 end

        return ctrl:GetWide()

    end

    function PANEL:FixColumnsLayout()

        local NumColumns = table.Count( self.Columns )
        if ( NumColumns == 0 ) then return end

        local AllWidth = 0
        for k, Column in pairs( self.Columns ) do
            AllWidth = AllWidth + math.ceil( Column:GetWide() )
        end

        local ChangeRequired = self.pnlCanvas:GetWide() - AllWidth
        local ChangePerColumn = math.floor( ChangeRequired / NumColumns )
        local Remainder = ChangeRequired - ( ChangePerColumn * NumColumns )

        for k, Column in pairs( self.Columns ) do

            local TargetWidth = math.ceil( Column:GetWide() ) + ChangePerColumn
            Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

        end

        local TotalMaxWidth = 0

        -- If there's a remainder, try to palm it off on the other panels, equally
        while ( Remainder != 0 ) do

            local PerPanel = math.floor( Remainder / NumColumns )

            for k, Column in pairs( self.Columns ) do

                Remainder = math.Approach( Remainder, 0, PerPanel )

                local TargetWidth = math.ceil( Column:GetWide() ) + PerPanel
                Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

                if ( Remainder == 0 ) then break end

                TotalMaxWidth = TotalMaxWidth + math.ceil( Column:GetMaxWidth() )

            end

            -- Total max width of all the columns is less than the width of the DListView, abort!
            if ( TotalMaxWidth < self.pnlCanvas:GetWide() ) then break end

            Remainder = math.Approach( Remainder, 0, 1 )

        end

        -- Set the positions of the resized columns
        local x = 0
        for k, Column in pairs( self.Columns ) do

            Column.x = x
            x = x + math.ceil( Column:GetWide() )

            Column:SetTall( math.ceil( self:GetHeaderHeight() ) )
            Column:SetVisible( !self:GetHideHeaders() )

        end

    end

    function PANEL:PerformLayout()

        -- Do Scrollbar
        local Wide = self:GetWide()
        local YPos = 0

        if ( IsValid( self.VBar ) ) then

            self.VBar:SetPos( self:GetWide() - 16, 0 )
            self.VBar:SetSize( 16, self:GetTall() )
            self.VBar:SetUp( self.VBar:GetTall() - self:GetHeaderHeight(), self.pnlCanvas:GetTall() )
            YPos = self.VBar:GetOffset()

            if ( self.VBar.Enabled ) then Wide = Wide - 16 end

        end

        if ( self.m_bHideHeaders ) then
            self.pnlCanvas:SetPos( 0, YPos )
        else
            self.pnlCanvas:SetPos( 0, YPos + self:GetHeaderHeight() )
        end

        self.pnlCanvas:SetSize( Wide, self.pnlCanvas:GetTall() )

        self:FixColumnsLayout()

        --
        -- If the data is dirty, re-layout
        --
        if ( self:GetDirty() ) then

            self:SetDirty( false )
            local y = self:DataLayout()
            self.pnlCanvas:SetTall( y )

            -- Layout again, since stuff has changed..
            self:InvalidateLayout( true )

        end

    end

    function PANEL:OnScrollbarAppear()

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:OnRequestResize( SizingColumn, iSize )

        -- Find the column to the right of this one
        local Passed = false
        local RightColumn = nil
        for k, Column in pairs( self.Columns ) do

            if ( Passed ) then
                RightColumn = Column
                break
            end

            if ( SizingColumn == Column ) then Passed = true end

        end

        -- Alter the size of the column on the right too, slightly
        if ( RightColumn ) then

            local SizeChange = SizingColumn:GetWide() - iSize
            RightColumn:SetWide( RightColumn:GetWide() + SizeChange )

        end

        SizingColumn:SetWide( iSize )
        self:SetDirty( true )

        -- Invalidating will munge all the columns about and make it right
        self:InvalidateLayout()

    end

    function PANEL:DataLayout()

        local y = 0
        local h = self.m_iDataHeight

        local alt = false
        for k, Line in ipairs( self.Sorted ) do

            if ( !Line:IsVisible() ) then continue end

            Line:SetPos( 1, y )
            Line:SetSize( self:GetWide() - 2, h )
            Line:DataLayout( self )

            Line:SetAltLine( alt )
            alt = !alt

            y = y + Line:GetTall()

        end

        return y

    end

    PANEL.Cur = true
    function PANEL:AddLine( ... )

        self.Cur = not self.Cur

        self:SetDirty( true )
        self:InvalidateLayout()

        local Line = vgui.Create( "DListView_Line", self.pnlCanvas )
        local c = self.Cur and 48 or 32

        function Line:Paint( w, h )
            
            surface_SetDrawColor( c, c, c )
            surface_DrawRect( 0, 0, w, h )
        end

        local ID = table.insert( self.Lines, Line )

        Line:SetListView( self )
        Line:SetID( ID )

        -- This assures that there will be an entry for every column
        for k, v in pairs( self.Columns ) do
            Line:SetColumnText( k, "" )
        end

        for k, v in pairs( {...} ) do
            Line:SetColumnText( k, v )
        end

        -- Make appear at the bottom of the sorted list
        local SortID = table.insert( self.Sorted, Line )

        if ( SortID % 2 == 1 ) then
            Line:SetAltLine( true )
        end

        return Line

    end

    function PANEL:OnMouseWheeled( dlta )

        if ( !IsValid( self.VBar ) ) then return end

        return self.VBar:OnMouseWheeled( dlta )

    end

    function PANEL:ClearSelection( dlta )

        for k, Line in pairs( self.Lines ) do
            Line:SetSelected( false )
        end

    end

    function PANEL:GetSelectedLine()

        for k, Line in pairs( self.Lines ) do
            if ( Line:IsSelected() ) then return k, Line end
        end

    end

    function PANEL:GetLine( id )

        return self.Lines[ id ]

    end

    function PANEL:GetSortedID( line )

        for k, v in pairs( self.Sorted ) do

            if ( v:GetID() == line ) then return k end

        end

    end

    function PANEL:OnClickLine( Line, bClear )

        local bMultiSelect = self:GetMultiSelect()
        if ( !bMultiSelect && !bClear ) then return end

        --
        -- Control, multi select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LCONTROL ) ) then
            bClear = false
        end

        --
        -- Shift block select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LSHIFT ) ) then

            local Selected = self:GetSortedID( self:GetSelectedLine() )
            if ( Selected ) then

                local LineID = self:GetSortedID( Line:GetID() )

                local First = math.min( Selected, LineID )
                local Last = math.max( Selected, LineID )

                -- Fire off OnRowSelected for each non selected row
                for id = First, Last do
                    local line = self.Sorted[ id ]
                    if ( !line:IsLineSelected() ) then self:OnRowSelected( line:GetID(), line ) end
                    line:SetSelected( true )
                end

                -- Clear the selection and select only the required rows
                if ( bClear ) then self:ClearSelection() end

                for id = First, Last do
                    local line = self.Sorted[ id ]
                    line:SetSelected( true )
                end

                return

            end

        end

        --
        -- Check for double click
        --
        if ( Line:IsSelected() && Line.m_fClickTime && ( !bMultiSelect || bClear ) ) then

            local fTimeDistance = SysTime() - Line.m_fClickTime

            if ( fTimeDistance < 0.3 ) then
                self:DoDoubleClick( Line:GetID(), Line )
                return
            end

        end

        --
        -- If it's a new mouse click, or this isn't
        -- multiselect we clear the selection
        --
        if ( !bMultiSelect || bClear ) then
            self:ClearSelection()
        end

        if ( Line:IsSelected() ) then return end

        Line:SetSelected( true )
        Line.m_fClickTime = SysTime()

        self:OnRowSelected( Line:GetID(), Line )

    end

    function PANEL:SortByColumns( c1, d1, c2, d2, c3, d3, c4, d4 )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( !IsValid( a ) ) then return true end
            if ( !IsValid( b ) ) then return false end

            if ( c1 && a:GetColumnText( c1 ) != b:GetColumnText( c1 ) ) then
                if ( d1 ) then a, b = b, a end
                return a:GetColumnText( c1 ) < b:GetColumnText( c1 )
            end

            if ( c2 && a:GetColumnText( c2 ) != b:GetColumnText( c2 ) ) then
                if ( d2 ) then a, b = b, a end
                return a:GetColumnText( c2 ) < b:GetColumnText( c2 )
            end

            if ( c3 && a:GetColumnText( c3 ) != b:GetColumnText( c3 ) ) then
                if ( d3 ) then a, b = b, a end
                return a:GetColumnText( c3 ) < b:GetColumnText( c3 )
            end

            if ( c4 && a:GetColumnText( c4 ) != b:GetColumnText( c4 ) ) then
                if ( d4 ) then a, b = b, a end
                return a:GetColumnText( c4 ) < b:GetColumnText( c4 )
            end

            return true
        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SortByColumn( ColumnID, Desc )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( Desc ) then
                a, b = b, a
            end

            local aval = a:GetSortValue( ColumnID ) || a:GetColumnText( ColumnID )
            local bval = b:GetSortValue( ColumnID ) || b:GetColumnText( ColumnID )

            -- Maintain nicer sorting for numbers
            if ( isnumber( aval ) && isnumber( bval ) ) then return aval < bval end

            return tostring( aval ) < tostring( bval )

        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SelectItem( Item )

        if ( !Item ) then return end

        Item:SetSelected( true )
        self:OnRowSelected( Item:GetID(), Item )

    end

    function PANEL:SelectFirstItem()

        self:ClearSelection()
        self:SelectItem( self.Sorted[ 1 ] )

    end

    function PANEL:DoDoubleClick( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowSelected( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowRightClick( LineID, Line )

        -- For Override

    end

    function PANEL:Clear()

        for k, v in pairs( self.Lines ) do
            v:Remove()
        end

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

    end

    function PANEL:GetSelected()

        local ret = {}

        for k, v in pairs( self.Lines ) do
            if ( v:IsLineSelected() ) then
                table.insert( ret, v )
            end
        end

        return ret

    end

    function PANEL:SizeToContents()

        self:SetHeight( self.pnlCanvas:GetTall() + self:GetHeaderHeight() )

    end

    vgui_Register( "UListView", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface_SetDrawColor( hvhobkak.Colors[24] )
        surface_DrawRect( 0, 0, w, h )

        surface_SetDrawColor( hvhobkak.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui_Register( "USettingsPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 18 )
        self:SetText( "..." )
    end

    vgui_Register( "USPanelButton", PANEL, "UButton" )
end

do
    local PANEL = {}

    function PANEL:Init()

        self.ButtonPanel = vgui_Create( "DPanel", self )
        self.ButtonPanel:Dock( TOP )
        self.ButtonPanel:DockMargin(3,3,3,2)
        self.ButtonPanel:SetTall(18)

        self.ItemPanel = vgui_Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 0, 3, 3 )

        self.ButtonPanel.Paint = nil
        self.ItemPanel.Paint = nil

        self.ActiveTab = "NIL"

        function self.ItemPanel:OnMousePressed()
            hvhobkak.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            hvhobkak.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface_SetDrawColor( hvhobkak.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
   
        surface_SetFont( "tbfont" )
        surface_SimpleText( 8, 2, self.txt, hvhobkak.Colors[165] )

        surface_SimpleRect( 6, 20, w-12, 1, hvhobkak.Colors[54] )
    end

    function PANEL:OnMousePressed()
        hvhobkak.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        hvhobkak.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    function PANEL:GetButtonPanel()
        return self.ButtonPanel
    end

    vgui_Register( "UButtonBarPanel", PANEL, "Panel" )
end




// GUI FUNCS

hvhobkak.ui.ColorWindow = false
hvhobkak.ui.SettingsPan = false
hvhobkak.ui.MultiComboP = false

function hvhobkak.ui.RemovePanel( pan )
    if not pan then return end 

    pan:Remove()
    pan = false
end

function hvhobkak.ui.Binder( cfg, par )
    local b = vgui_Create( "UBinder", par )
    b:SetValue( hvhobkak.cfg.binds[ cfg ] )

    function b:OnChange()
        hvhobkak.cfg.binds[ cfg ] = b:GetValue()
    end

    return b
end

function hvhobkak.ui.ColorPicker( cfg, par, onChange )
    local b = vgui_Create( "UCPicker", par )

    function b:DoClick()
        local x, y = self:LocalToScreen( 0, self:GetTall() )

        hvhobkak.ui.RemovePanel( hvhobkak.ui.ColorWindow )

        hvhobkak.ui.ColorWindow = vgui_Create( "UColorPanel" )
        hvhobkak.ui.ColorWindow:SetPos( x+25, y-100 )

        local c = vgui_Create( "UColorMixer", hvhobkak.ui.ColorWindow )
        c:SetColor( string_ToColor( hvhobkak.cfg.colors[cfg] ) )

        c.HSV.Knob:SetSize( 5, 5 )

        function c.HSV.Knob:Paint( w, h )
            surface_SimpleRect( 0, 0, w, h, b.Color )

            surface_SetDrawColor( hvhobkak.Colors[255] )
            surface_DrawOutlinedRect( 0, 0, w, h, 1 )
        end

        function c:ValueChanged( col )
            b.Color = col 
            hvhobkak.cfg.colors[cfg] = tostring(col.r) .. " " .. tostring(col.g) .. " " .. tostring(col.b) .. " " .. tostring(col.a)
            if onChange then onChange( col ) end
        end

    end

    b.Color = string_ToColor( hvhobkak.cfg.colors[cfg] )
end

function hvhobkak.ui.SPanel( func, p )
    local b = vgui_Create( "USPanelButton", p )

    function b:DoClick()
        local mx, my = input_GetCursorPos()

        hvhobkak.ui.RemovePanel( hvhobkak.ui.SettingsPan )

        hvhobkak.ui.SettingsPan = vgui_Create( "USettingsPanel" )
        hvhobkak.ui.SettingsPan:SetPos( mx+25, my-10 )

        func()
    end
end

function hvhobkak.ui.Label( pan, str, postCreate )
    local p = vgui_Create( "UCBPanel", pan )

    local lbl = vgui_Create( "DLabel", p )
    lbl:SetText( str )
    lbl:SetFont( "tbfont" )
    lbl:SetTextColor( hvhobkak.Colors[165] )
    lbl:Dock( LEFT )
    lbl:DockMargin( 4, 2, 4, 0 )
    lbl:SizeToContents()

    if postCreate then postCreate( p ) end
end
    
function hvhobkak.ui.CheckBox( par, lbl, cfg, hint, bind, color, spanel, onToggle, postCreate )
    local p = vgui_Create( "UCBPanel", par )

    local c = vgui_Create( "UCheckboxLabel", p )
    c:SetText( lbl )
    c:SetPos( 0, 0 )
    c:SetValue( hvhobkak.cfg.vars[cfg] )

    function c:OnChange( bval )
        hvhobkak.cfg.vars[cfg] = bval

        if onToggle then onToggle(bval) end
    end

    if postCreate then postCreate( p ) end

    if bind then hvhobkak.ui.Binder( cfg, p ) end
    if color then hvhobkak.ui.ColorPicker( cfg, p ) end
    if spanel then hvhobkak.ui.SPanel( spanel, p ) end

    if hint then
        function c.Label:Paint()
            if self:IsHovered() then
                local x, y = input_GetCursorPos()

                hvhobkak.hint = true
                hvhobkak.hintText = hint
                hvhobkak.hintX = x + 45
                hvhobkak.hintY = y - 5
            end
        end
    end
end

function hvhobkak.ui.Slider( p, str, cfg, min, max, dec, onChange )
    local pan = vgui_Create( "DPanel", p )
    pan:Dock( TOP )
    pan:DockMargin( 4, 2, 4, 0 )
    pan:SetTall( 20 )

    function pan:Paint( w, h )
        surface_SetFont("tbfont")

        local s = hvhobkak.cfg.vars[cfg]
        local tw, th = surface_GetTextSize(s)
        
        surface_SimpleText(2,4,str,hvhobkak.Colors[165])

        surface_SimpleText(w-tw-2,4,hvhobkak.cfg.vars[cfg],hvhobkak.Colors[165])
    end

    local c = vgui_Create( "USlider", p )
    c:Dock( TOP )
    c:DockMargin( 4, 2, 4, 0 )
    c:SetMax( max )
    c:SetMin( min )
    c:SetDecimals( dec )

    c:SetValue( hvhobkak.cfg.vars[cfg] )

    local value, min, max = c:GetValue(), c:GetMin(), c:GetMax()

	c:SetSlideX((value - min) / (max - min))

    function c:OnValueChanged( val )
        hvhobkak.cfg.vars[cfg] = val

        if onChange then onChange(val) end
    end
end

function hvhobkak.ui.Button( str, func, p ) 
    local b = vgui_Create( "UButton", p )
    b:SetText( str )

    function b:DoClick()
        func()
    end
end

function hvhobkak.ui.TextEntry( str, cfg, pan, chars, postCreate )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,2,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(hvhobkak.Colors[165])

    local p = vgui_Create("DPanel",pan)
    p:SetTall(25)
    p:Dock(TOP)
    p:DockMargin(4,2,4,0)

    p.Paint = function(s,w,h)
        surface_SetDrawColor(hvhobkak.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h)
    end
	
	local txt = vgui_Create("DTextEntry",p)
	txt:Dock(FILL)
	txt:DockMargin(4,4,4,4) 
	txt:IsMultiline( false )
	txt:SetMaximumCharCount(chars)
	txt:SetPlaceholderText(str)
	txt:SetFont( "tbfont" )
    txt:SetPaintBackground(false)
    txt:SetTextColor(hvhobkak.Colors[165])

	if hvhobkak.cfg.vars[cfg] != nil and hvhobkak.cfg.vars[cfg] != "" then
		txt:SetValue(hvhobkak.cfg.vars[cfg])
	end

	function txt.Think()
		if txt:IsEditing() then return end
        if hvhobkak.cfg.vars[cfg] == txt:GetValue() then return end

		hvhobkak.cfg.vars[cfg] = txt:GetValue()
	end 

	function txt.OnValueChange()
		hvhobkak.cfg.vars[cfg] = txt:GetValue()
	end

    if postCreate then postCreate(p) end
end

function hvhobkak.ui.dropdownButton( str, v, p, a )
    local b = p:Add("DButton")
    b:Dock(TOP)
    b:SetTall(20)
    b:DockMargin(2,2,2,0)
    b:SetText("")
    
    function b:Paint(w,h)
        if self:IsHovered() then 
            surface_SimpleRect(1,1,w-2,h-2,hvhobkak.Colors[32])
        end

        surface_SetTextColor(hvhobkak.Colors[165])

        if hvhobkak.cfg.vars[str.."-"..v] then
            surface_SetTextColor(hvhobkak.Colors[235]) 
        end

        surface_SetTextPos(5,3)
        surface_SetFont("tbfont")
        surface_DrawText(v)
    end

    function b:DoClick()
        hvhobkak.cfg.vars[str.."-"..v] = not hvhobkak.cfg.vars[str.."-"..v] 
    end
end

function hvhobkak.ui.MultiCombo( pan, str, choices )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(hvhobkak.Colors[165])

    local d = vgui_Create("DButton",pan)
    d:Dock(TOP)
    d:DockMargin(4,1,4,0)
    d:SetTall(20)
    d:SetText("")
    
    d.preview = {}

    function d:Paint(w,h)
        local preview = ""

        for k, v in pairs(choices) do
            if hvhobkak.cfg.vars[str.."-"..v] == true and (d.preview[v] == false or d.preview[v] == nil) and not table.HasValue(d.preview, v) then
                table_insert(d.preview,v) 
            elseif hvhobkak.cfg.vars[str.."-"..v] == false and (d.preview[v] == true or d.preview[v] == nil) and table.HasValue(d.preview, v) then
                table_RemoveByValue(d.preview,v)
            elseif d.preview[v] == false then 
                table_RemoveByValue(d.preview,v)
            end
        end

        preview = table_concat(d.preview,", ")

        surface_SetDrawColor(hvhobkak.Colors[25])
        surface_DrawRect(0,0,w,h)
    
        surface_SetTextColor(hvhobkak.Colors[165])
        surface_SetTextPos(8,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText(preview)
    
        surface_SetDrawColor(hvhobkak.Colors[32])
        surface_DrawRect(w-25,0,25,25)
    
        surface_SetTextColor(hvhobkak.Colors[165])
        surface_SetTextPos(w-20,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText("▼")

        surface_SetDrawColor(hvhobkak.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h,1)
    end

    function d:DoClick()
        local x,y = self:LocalToScreen( 0, self:GetTall() )

        hvhobkak.ui.RemovePanel( hvhobkak.ui.MultiComboP )

        local ctoh = #choices
    
        hvhobkak.ui.MultiComboP = vgui_Create( "ULifeTimeBase" )
        hvhobkak.ui.MultiComboP:SetPos( x, y - 1 )
        hvhobkak.ui.MultiComboP:SetSize( 243, ctoh * 22 + 2 )
    
        for k, v in pairs(choices) do
            hvhobkak.ui.dropdownButton( str, v, hvhobkak.ui.MultiComboP, d.preview )
        end
    end
end

function hvhobkak.ui.ComboBox( pan, str, cfg, choices )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(hvhobkak.Colors[165])

    local dropdown = vgui_Create("UComboBox",pan)
    dropdown:Dock(TOP)
    dropdown:DockMargin(4,1,4,0)
    
    if hvhobkak.presets[ cfg ] then
        choices = hvhobkak.presets[ cfg ]
    end 
    
    for k, v in ipairs( choices ) do
        dropdown:AddChoice( v )
    end
    
    dropdown:SetSortItems(false)

    if hvhobkak.cfg.vars[cfg] <= #choices then
        dropdown:ChooseOptionID(hvhobkak.cfg.vars[cfg])
    else
        dropdown:ChooseOptionID(1)
    end

    function dropdown:OnSelect(index, value, data)
        hvhobkak.cfg.vars[cfg] = index
    end

    return lbl, dropdown
end

function hvhobkak.ui.InitMT( p, postCreate )
    p.ItemPanel:Remove()

    p.ItemPanel = vgui_Create( "DPanel", p )
    p.ItemPanel:Dock( FILL )
    p.ItemPanel:DockMargin( 3, 0, 3, 3 )

    p.ItemPanel.Paint = nil

    if postCreate then postCreate( p.ItemPanel ) end
end

function hvhobkak.ui.MTButton( p, str, postCreate )
    surface_SetFont("tbfont")
    local w, h = surface_GetTextSize(str)

    local fw = w + 5

    local tx, ty = fw/2 - w/2, 18 / 2-h / 2 - 1

    local b = p:GetButtonPanel():Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        p.ActiveTab = str
        hvhobkak.ui.InitMT( p, postCreate )
    end

    function b:Paint(width,height)
        if p.ActiveTab == str then
            surface_SetTextColor(235,235,235,255)
        else
            surface_SetTextColor(165,165,165,255)
        end
        
        surface_DrawRect(0,0,width,height)

        surface_SetFont("tbfont")
        surface_SetTextPos(tx,ty)
        surface_DrawText(str)
    end

    p.ActiveTab = str
    hvhobkak.ui.InitMT( p, postCreate )
end

hvhobkak.pty = { 5, 5, 5 }
do
    local xt = { 
        [1] = 5,
        [2] = 267,
        [3] = 529
    }

    function hvhobkak.itemPanel( str, tbl, h )
        local p = vgui_Create( "UPanel", hvhobkak.scrollpanel )
        p:SetPos( xt[tbl], hvhobkak.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        hvhobkak.pty[ tbl ] = hvhobkak.pty[ tbl ] + h + 5

        return p
    end

    function hvhobkak.itemPanelB( str, tbl, h, buttonsFunc )
        local p = vgui_Create( "UButtonBarPanel", hvhobkak.scrollpanel )
        p:SetPos( xt[tbl], hvhobkak.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        if buttonsFunc then buttonsFunc( p ) end

        hvhobkak.pty[ tbl ] = hvhobkak.pty[ tbl ] + h + 5

        return p
    end

end

/*
    Drag n drop 
*/

hvhobkak.espposes = {"Up","Down","Right","Left"}
hvhobkak.espelements = {"Name pos","Usergroup pos","Health pos","Armor pos","Money pos","Weapon pos","Team pos","Break LC pos","Simtime pos"}
hvhobkak.lastdrag = ""
hvhobkak.esppans = {}

hvhobkak.esppansposes = {
    [1] = {
        x = 85,
        y = 0,
    },
    [2] = {
        x = 85,
        y = 250,
    },
    [3] = {
        x = 170,
        y = 125,
    },
    [4] = {
        x = 0,
        y = 125,
    },
}

for i = 1, 4 do
    hvhobkak.esppans[i] = {}
end

function hvhobkak.DoDrop( self, panels, bDoDrop, Command, x, y )
    if ( bDoDrop ) then
        local newpos = self.pos
        
        for i = 1, #panels do
            local v = panels[i]

            hvhobkak.cfg.vars[ v:GetText() ] = newpos
            v:SetParent( self )
        end
    end
end
    
hvhobkak.spfuncs = {}

// PANEL CREATION

hvhobkak.frame = vgui_Create("UFrame")
hvhobkak.scrollpanel = vgui_Create("UScroll",hvhobkak.frame)

hvhobkak.tabs = {}

// Aimbot

hvhobkak.spfuncs[30] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,200)

    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Force seed", "Force seed" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Wait for seed", "Wait for seed" )

    
end

hvhobkak.spfuncs[32] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,200)

    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Max simulation time", "Crossbow max simtime", 1, 10, 2 )

end

function hvhobkak.tabs.Aimbot()

    local p = hvhobkak.itemPanel("Main",1,160):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Enable aimbot", "Enable aimbot", false, false, false, false, false, function( p ) hvhobkak.ui.Binder( "Aim on key", p ) end )
    hvhobkak.ui.CheckBox( p, "Silent aim", "Silent aim" )
    hvhobkak.ui.CheckBox( p, "pSilent", "pSilent", "Make aim completely invisible." )
    hvhobkak.ui.CheckBox( p, "Auto fire", "Auto fire", "Automatically fires when targets can be damaged.", false, false, hvhobkak.spfuncs[2] )
    hvhobkak.ui.CheckBox( p, "Auto reload", "Auto reload", "Automatically reloads weapon when clip is empty." )

    local p = hvhobkak.itemPanel("Legit",1,120):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Aimbot smoothing", "Aimbot smoothing", false, false, false, hvhobkak.spfuncs[4] )
    hvhobkak.ui.CheckBox( p, "Fov limit", "Fov limit", false, false, false, hvhobkak.spfuncs[5] )
    hvhobkak.ui.CheckBox( p, "Triggerbot", "Trigger bot", false, true )

    local p = hvhobkak.itemPanel( "Visualisation", 1, 100 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "FOV Circle", "Show FOV", false, false, true )
    hvhobkak.ui.CheckBox( p, "Snapline", "Aimbot snapline", false, false, true )
    hvhobkak.ui.CheckBox( p, "Marker", "Aimbot marker", false, false, true )

    local p = hvhobkak.itemPanel( "Accuracy", 2, 80 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Compensate recoil", "Norecoil" )
    hvhobkak.ui.CheckBox( p, "Compensate spread", "Nospread", "Supported HL2, M9K, FAS2, CW2, SWB", false, false, hvhobkak.spfuncs[30] )

    local p = hvhobkak.itemPanel( "Prediction", 2, 100 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Crossbow prediction", "Crossbow prediction" )
    hvhobkak.ui.Slider( p, "Simulation limit", "Simulation limit", 1, 10, 2 )

    local p = hvhobkak.itemPanel("Knife bot",2,120):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Knife bot", "Knifebot", false, false, false )
    hvhobkak.ui.ComboBox( p, "Knifebot mode", "Knifebot mode"  )
    hvhobkak.ui.CheckBox( p, "Facestab", "Facestab" )




    //hvhobkak.ui.CheckBox( p, "Prop aimbot", "Prop aimbot" )
    //hvhobkak.ui.CheckBox( p, "Auto throw", "PA thrower" )
    //hvhobkak.ui.Slider( p, "Throw distance", "PA thrower dist", 1, 640, 0 )
    //hvhobkak.ui.Slider( p, "Max simulation time", "Prop max simtime", 1, 10, 2 )
    //hvhobkak.ui.CheckBox( p, "Projectile aimbot", "Projectile aimbot" )

    local p = hvhobkak.itemPanel( "Target selection", 3, 175 ):GetItemPanel()

    hvhobkak.ui.ComboBox( p, "Target selection", "Target selection", { "Distance", "FOV" } )
    hvhobkak.ui.MultiCombo( p, "Ignores", { "Friends", "Steam friends", "Teammates", "Driver", "Head unhitable", "God time", "Nocliping", "Nodraw", "Frozen", "Bots", "Admins" } )
    hvhobkak.ui.CheckBox( p, "Wallz", "Wallz" ) 
    hvhobkak.ui.Slider( p, "Max targets", "Max targets", 0, 10, 0 )

    local p = hvhobkak.itemPanel( "Hitbox selection", 3, 280 ):GetItemPanel()

    hvhobkak.ui.ComboBox( p, "Hitbox selection", "Hitbox selection", { "Head", "Chest", "Penis" } )
    hvhobkak.ui.CheckBox( p, "Hitscan", "Hitscan" ) 
    //hvhobkak.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )
    hvhobkak.ui.MultiCombo( p, "Hitscan groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    hvhobkak.ui.CheckBox( p, "Multipoint", "Multipoint" ) 
    hvhobkak.ui.MultiCombo( p, "Multipoint groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    hvhobkak.ui.Slider( p, "Multipoint scale", "Multipoint scale", 0.5, 1, 1 )

    

    

    /*


    
    
    

    hvhobkak.ui.CheckBox( p, "", "Disable interpolation", false, false, false, hvhobkak.spfuncs[9])
    

    local p = hvhobkak.itemPanel("Prediction",2,200):GetItemPanel()

    
    hvhobkak.ui.CheckBox( p, "Crossbow prediction", "Crossbow prediction", false, false, false, hvhobkak.spfuncs[32] )


*/

    /*
    func = function()
        hvhobkak.settingspan:SetSize(250,64)

        hvhobkak.slider("Forwardtrack time","",0,200,0,hvhobkak.settingspan)
    end
    
    //hvhobkak.checkbox("Backshoot","Backshoot",p) 
    hvhobkak.checkbox("Auto healthkit","Auto healthkit",p:GetItemPanel())
    hvhobkak.multiCombo("Healthkit",{"Self heal","Heal closest"},p:GetItemPanel())
    */
end



hvhobkak.spfuncs[22] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,200)

    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Lag limit","Lag limit",1,23,0 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Random min","Lag randomisation",1,23,0 )
    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Lag mode", "Lag mode", {"Static","Adaptive","Hybrid"})
    hvhobkak.ui.MultiCombo( hvhobkak.ui.SettingsPan, "Fake lag options", {"Disable on ladder","Disable in attack","Randomise","On peek"} )
end

hvhobkak.spfuncs[24] = function( p )
   

    // "Runs act command to make your model dance for other clients"
    //"Forcing istyping for animation desync"
end

hvhobkak.spfuncs[36] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,200)
    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Material", "Antiaim material", hvhobkak.chamsMaterials)
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Fullbright", "Antiaim fullbright" )
end

function hvhobkak.tabs.Rage()
    local p = hvhobkak.itemPanel( "Angles", 1, 245 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Enable Anti-Aim", "Anti aim", false, true )
    hvhobkak.ui.CheckBox( p, "Inverter", "Inverter", false, true )
    hvhobkak.ui.ComboBox( p, "Yaw base", "Yaw base" )
    hvhobkak.ui.ComboBox( p, "Yaw", "Yaw" )
    hvhobkak.ui.ComboBox( p, "Pitch", "Pitch" )
    hvhobkak.ui.ComboBox( p, "Edge", "Edge", { "Disabled", "Hide", "Show", "Jitter" } )

    local p = hvhobkak.itemPanel( "Tweaks", 1, 185 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "On shot aa", "On shot aa" )
    hvhobkak.ui.CheckBox( p, "Yaw randomisation", "Yaw randomisation" )
    hvhobkak.ui.CheckBox( p, "Freestanding", "Freestanding" )
    hvhobkak.ui.CheckBox( p, "Micromovement", "Micromovement" )

    local p = hvhobkak.itemPanel( "Custom angles", 1, 400 ):GetItemPanel()

    hvhobkak.ui.Slider( p, "Custom real","Custom real", -180, 180, 0 )
    hvhobkak.ui.Slider( p, "Custom fake","Custom fake", -180, 180, 0 )
    hvhobkak.ui.Slider( p, "Custom pitch","Custom pitch", -360, 360, 0 )
    hvhobkak.ui.Slider( p, "Spin speed","Spin speed", -50, 50, 0 )
    hvhobkak.ui.Slider( p, "Min Lby Delta","LBY min delta", 0, 360, 0 )
    hvhobkak.ui.Slider( p, "Break Lby Delta","LBY break delta", 0, 360, 0 )
    hvhobkak.ui.Slider( p, "Sin delta","Sin delta", -360, 360, 0 )
    hvhobkak.ui.Slider( p, "Sin add","Sin add", -180, 180, 0 )
    hvhobkak.ui.Slider( p, "Jitter delta","Jitter delta", -180, 180, 0 )

    local p = hvhobkak.itemPanel( "Fake lag",2,110 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Fake lag", "Fake lag", false, false, false, hvhobkak.spfuncs[22] )
    hvhobkak.ui.CheckBox( p, "Fake duck", "Fake duck", false, true )
    hvhobkak.ui.CheckBox( p, "Mohammad exploit", "Air lag duck" )
    hvhobkak.ui.CheckBox( p, "Jesus exploit", "Jesus lag" )

    local p = hvhobkak.itemPanel( "Visualisation", 2,75 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Fake angle chams", "Anti aim chams", false, false, false, hvhobkak.spfuncs[36], false, function( p ) hvhobkak.ui.ColorPicker( "Real chams", p ) end ) 
    hvhobkak.ui.CheckBox( p, "Angle arrows", "Angle arrows" )

    local p = hvhobkak.itemPanel( "Animation breaker", 2, 160 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Taunt spam", "Taunt spam" )
    hvhobkak.ui.ComboBox( p, "Taunt", "Taunt", hvhobkak.actCommands )
    hvhobkak.ui.CheckBox( p, "Handjob", "Handjob" )
    hvhobkak.ui.ComboBox( p, "Handjob mode", "Handjob mode", {"Up","Parkinson","Ultra cum"} )

    local p = hvhobkak.itemPanel( "Tickbase", 2, 265 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Enable shift", "Tickbase shift", false, true, false, false, function(b) ded.EnableTickbaseShifting(b) end )

    hvhobkak.ui.ComboBox( p, "Fakelag comp", "Fakelag comp", {"Disable","Compensate"} )
    hvhobkak.ui.CheckBox( p, "Warp on peek", "Warp on peek" )
    hvhobkak.ui.CheckBox( p, "Double tap", "Double tap" )
    //hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Passive recharge", "Passive recharge" )
    hvhobkak.ui.CheckBox( p, "Dodge projectiles", "Dodge projectiles" )
    //hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Wait for charge", "Wait for charge", false, false, false, false, function(b) ded.WaitForCharge(b) end ) 
    hvhobkak.ui.CheckBox( p, "Auto recharge", "Auto recharge", false, true ) 
    
    hvhobkak.ui.Slider( p, "Shift ticks", "Shift ticks", 1, 99, 0, function( val ) ded.SetMinShift(val) end )
    hvhobkak.ui.Slider( p, "Charge ticks", "Charge ticks", 1, 99, 0, function( val ) ded.SetMaxShift(val) end )

    local p = hvhobkak.itemPanel( "Sequence", 2, 175 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Sequence manip", "Sequence manip", false, true )
    hvhobkak.ui.Slider( p, "Out Sequence", "OutSequence", 1, 5000, 0 )
    hvhobkak.ui.CheckBox( p, "Randomise", "Sequence min random" )
    hvhobkak.ui.Slider( p, "Min sequence", "Sequence min", 1, 5000, 0 )
    hvhobkak.ui.CheckBox( p, "Animation freezer", "Animation freezer", false, true )

    local p = hvhobkak.itemPanel( "Player adjustments", 3, 185 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Interpolation", "Disable interpolation", false, false, false, false, function( bval ) ded.SetInterpolation( bval ) end )
    hvhobkak.ui.CheckBox( p, "Sequence interpolation", "Disable Sequence interpolation", false, false, false, false, function( bval ) ded.SetSequenceInterpolation( bval ) end )
    hvhobkak.ui.CheckBox( p, "Disable animations", "Disable animations" )
    hvhobkak.ui.CheckBox( p, "Fix bones", "Bone fix", false, false, false, false, function( bval ) ded.EnableBoneFix( bval ) end )
    hvhobkak.ui.CheckBox( p, "Fix animations", "Update Client Anim fix", false, false, false, false, function( bval ) ded.EnableAnimFix( bval ) end )
    hvhobkak.ui.CheckBox( p, "Extrapolation", "Extrapolation" )

    local p = hvhobkak.itemPanel( "Resolver", 3, 95 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Resolver", "Resolver" )
    hvhobkak.ui.CheckBox( p, "Pitch resolver", "Pitch resolver" )
    hvhobkak.ui.CheckBox( p, "Taunt resolver", "Taunt resolver" )

    local p = hvhobkak.itemPanel( "Position adjustment", 3, 215 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Adjust tickcount", "Adjust tickcount" )
    hvhobkak.ui.CheckBox( p, "Backtrack", "Backtrack" )
    hvhobkak.ui.ComboBox( p, "Backtrack mode", "Backtrack mode", { "Last ticks", "Closest", "Scan" } ) // , "Backshoot"
    hvhobkak.ui.Slider( p, "Sampling interval", "Sampling interval", 0, 200, 0 )
    hvhobkak.ui.Slider( p, "Backtrack time", "Backtrack time", 0, 1000, 0 )
    hvhobkak.ui.CheckBox( p, "Always backtrack", "Always backtrack" )

    local p = hvhobkak.itemPanel( "Misc", 3, 215 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Auto detonator", "Auto detonator" )
    hvhobkak.ui.Slider( p, "Detonation distance", "AutoD distance", 16, 128, 0 )
    

    hvhobkak.ui.CheckBox( p, "Gun switch", "Gun switch" )
    /*
    local function func( p )
        hvhobkak.ui.MTButton( p, "Custom", hvhobkak.spfuncs[37] )
        hvhobkak.ui.MTButton( p, "Anim breakers", hvhobkak.spfuncs[24] )
        hvhobkak.ui.MTButton( p, "Angles", hvhobkak.spfuncs[23] )
    end

    hvhobkak.itemPanelB( "Anti aim",1,300, func )




    local p = hvhobkak.itemPanel("Fake lag",2,105):GetItemPanel()

    

    



    

   

   


    
*/

    //end
    

     /*
hvhobkak.cfg.vars["Resolver"] = false
hvhobkak.cfg.vars["Yaw mode"] = 1
hvhobkak.cfg.vars["Pitch resolver"] = false
hvhobkak.cfg.vars["Invert first shot"] = false
hvhobkak.cfg.vars["Resolver max misses"] = 2

    hvhobkak.combobox("Edge", {"None","Hide","Jitter"}, "Edge", p:GetItemPanel())

    hvhobkak.checkbox("Show AA","Anti aim chams",p:GetItemPanel())

    local p = hvhobkak.itemPanel("Animation breakers",1,200)

    
    

    local p = hvhobkak.itemPanel("Animfix",3,223)

    hvhobkak.cfg.vars["Interpolation-Disable interpolation"] = false
    hvhobkak.cfg.vars["Interpolation-Fast sequences"] = false


    hvhobkak.checkbox("Disable taunts","Disable taunts",p:GetItemPanel())
    hvhobkak.checkbox("Extrapolation","Extrapolation",p:GetItemPanel())
    hvhobkak.checkbox("test","last update",p:GetItemPanel())
    

    

    local p = hvhobkak.itemPanel("Fake lag",2,320)



    

    hvhobkak.checkbox("Fly hacks","Allah fly",p:GetItemPanel())

    //hvhobkak.checkbox("Fake lag","Fake lag",p:GetItemPanel())
    //hvhobkak.slider("Lag limit","Lag limit",0,23,0,p:GetItemPanel())
    //hvhobkak.slider("Lag randomisation","Lag randomisation",0,23,0,p:GetItemPanel())
    //hvhobkak.combobox("Lag mode", {"Static","Adaptive"}, "Lag mode", p:GetItemPanel())
   
    hvhobkak.checkbox("Michael Jackson exploit","Allah walk",p:GetItemPanel(),"allahwalk")
    hvhobkak.checkbox("","Fake duck",p:GetItemPanel(),"Fake duck")
   
    local p = hvhobkak.itemPanel("Tickbase",2,250)


    hvhobkak.multiCombo("Triggers",{"In Attack","On Peek","After peek"},p:GetItemPanel())

    // hvhobkak.checkbox("Skip fire tick","Skip fire tick",p:GetItemPanel())
    

    local p = hvhobkak.itemPanel( "Resolver", 3, 178 )

    hvhobkak.checkbox( "Enable resolver", "Resolver", p:GetItemPanel() )
    hvhobkak.combobox( "Yaw mode", { "Step", "Delta brute" }, "Yaw mode", p:GetItemPanel() )
    hvhobkak.slider( "Max misses", "Resolver max misses", 1, 6, 0, p:GetItemPanel() )
    hvhobkak.checkbox( "Pitch resolver", "Pitch resolver", p:GetItemPanel() )
    hvhobkak.checkbox( "Invert first shot", "Invert first shot", p:GetItemPanel() )
*/
end

/*local p = vgui_Create("UPanel",hvhobkak.scrollpanel)
    p:SetPos(5,y[1])
    p:SetSize(257,200)
    p.txt = "LBY Settings"

    hvhobkak.slider("LBY min delta","LBY min delta",0,360,0,p:GetItemPanel())
    hvhobkak.slider("LBY break delta","LBY break delta",0,360,0,p:GetItemPanel())
    */


hvhobkak.spfuncs[2] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,100)
        
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Rapid fire", "Rapid fire", "Allows to quickly fire semi-automatic weapons." )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Bullet time", "Bullet time", "Aim will not work until weapon can fire." )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Wait for simtime update", "Wait for simtime update" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Alt Rapid fire", "Alt Rapid fire" )
end

hvhobkak.spfuncs[4] = function()
    hvhobkak.ui.SettingsPan:SetSize( 250, 85 )

    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Smooth amount", "Smoothing", 0, 1, 2 )
end

hvhobkak.spfuncs[5] = function()
    hvhobkak.ui.SettingsPan:SetSize( 250, 68 )

    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Dynamic fov", "Fov dynamic" )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Aimbot FOV", "Aimbot FOV", 0, 180, 0 )
end

hvhobkak.spfuncs[11] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,200)
    
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Team color", "Box team color" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Gradient", "Box gradient" )
    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Style", "Box style", { "Default", "Corner", "Hex", "Poly", "3D" })


end

hvhobkak.spfuncs[12] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,48)
    
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Health bar", "Health bar" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Gradient", "Health bar gradient" )
end

hvhobkak.spfuncs[666] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,48)
    
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Armor bar", "Armor bar" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Gradient", "Armor bar gradient" )
end

hvhobkak.spfuncs[14] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)
    
    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Visible material", "Visible mat", hvhobkak.chamsMaterials)
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Weapon chams", "Visible chams w" )

    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Invisible material", "inVisible mat", hvhobkak.chamsMaterials)
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "inVisible chams", "inVisible chams" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Weapon chams", "inVisible chams w" )

    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Fullbright", "Supress lighting" )
end

hvhobkak.spfuncs[229] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,360)
    
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Brightness","Color Modify Brightness", 0, 3, 4 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Contrast","Color Modify Contrast", 0, 5, 4 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Saturation","Color Modify Saturation", 0, 5, 4 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Add red","Color Modify Add Red", 0, 10, 4 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Add green","Color Modify Add Green", 0, 10, 4 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Add blue","Color Modify Add Blue", 0, 10, 4 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Mul red","Color Modify Mul Red", 0, 255, 4 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Mul green","Color Modify Mul Green", 0, 255, 4 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Mul blue","Color Modify Mul Blue", 0, 255, 4 )
end

hvhobkak.spfuncs[15] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Material", "Self mat", hvhobkak.chamsMaterials)
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Weapon chams", "Self chams w" )

    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Fullbright", "Supress self lighting" )
end

hvhobkak.spfuncs[16] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Material", "Backtrack material", hvhobkak.chamsMaterials)

    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Fullbright", "Backtrack fullbright" )
end

hvhobkak.spfuncs[17] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Material", "Entity material", hvhobkak.chamsMaterials)

    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Fullbright", "Entity fullbright" )
end

hvhobkak.spfuncs[18] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Die time","Tracers die time",1,10,0 )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Bullet tracers muzzle", "Bullet tracers muzzle" )
    
end

hvhobkak.spfuncs[19] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Material", "Viewmodel chams type", hvhobkak.chamsMaterials)
    
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Fullbright", "Fullbright viewmodel" )
end

hvhobkak.spfuncs[20] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Smoothing", "Third person smoothing" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Collision", "Third person collision" )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Distance","Third person distance",50,220,0 )
end

hvhobkak.spfuncs[21] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Freecam speed","Free camera speed",5,100,0 )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Ghetto mode", "Ghetto free cam" )
end

hvhobkak.spfuncs[31] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,48)

    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Style", "Ent box style", { "Default", "Corner", "3D" })
end


hvhobkak.spfuncs[35] = function( p )
    local mdl = vgui.Create( "DModelPanel", p )
    mdl:SetPos(85,125)
    mdl:SetSize(85,125)
    mdl:SetModel( "models/props_vehicles/truck001a.mdl" ) 

    mdl:SetCamPos(Vector(0,0,148))

    function mdl:LayoutEntity( Entity ) return end 
    
    for i = 1,4 do
        local poses = hvhobkak.esppansposes

        hvhobkak.esppans[i].panel = vgui_Create( "UPaintedPanel", p )
        hvhobkak.esppans[i].panel:SetPos(poses[i].x,poses[i].y)
        hvhobkak.esppans[i].panel:SetSize(85,125)
        hvhobkak.esppans[i].panel:Receiver( "SwagCock$", hvhobkak.DoDrop )
        hvhobkak.esppans[i].panel.pos = i
    end

    for i = 1, #hvhobkak.espelements do
        local cfgstr = hvhobkak.espelements[i]
        local panel = hvhobkak.esppans[hvhobkak.cfg.vars[cfgstr]].panel

        local b = vgui_Create("UESPPButton")
        b:SetText( cfgstr )
		b:SetSize( 36, 24 )
		b:Dock( TOP )
        b:Droppable( "SwagCock$" ) 

        b:SetParent( panel )
    end
end

hvhobkak.spfuncs[33] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Show ammo", "Show ammo" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Print name", "Weapon printname" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Show reloading", "Show reloading" )
    
end

hvhobkak.spfuncs[34] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)


end

function hvhobkak.tabs.Visuals()

    local p = hvhobkak.itemPanel("Player",1,380):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Box", "Box esp", false, false, true, hvhobkak.spfuncs[11] )

    hvhobkak.ui.CheckBox( p, "Name", "Name", false, false, false, false, false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Name pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    hvhobkak.ui.CheckBox( p, "Usergroup", "Usergroup", false, false, false, false, false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Usergroup pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    hvhobkak.ui.CheckBox( p, "Health", "Health", false, false, true, hvhobkak.spfuncs[12], false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Health pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) hvhobkak.ui.ColorPicker( "Health bar gradient", p ) end )
    hvhobkak.ui.CheckBox( p, "Armor", "Armor", false, false, true, hvhobkak.spfuncs[666], false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Armor pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) hvhobkak.ui.ColorPicker( "Armor bar gradient", p ) end )
    hvhobkak.ui.CheckBox( p, "Weapon", "Weapon", false, false, false, hvhobkak.spfuncs[33], false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Weapon pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    hvhobkak.ui.CheckBox( p, "Team", "Team", false, false, false, false, false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Team pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    hvhobkak.ui.CheckBox( p, "Money", "DarkRP Money", false, false, false, false, false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Money pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    hvhobkak.ui.CheckBox( p, "Lag compensation", "Break LC", false, false, false, false, false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Break LC pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    hvhobkak.ui.CheckBox( p, "Packets ( Fake lag )", "Simtime updated", false, false, false, false, false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "Simtime pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    hvhobkak.ui.CheckBox( p, "Show records", "Show records" )
    hvhobkak.ui.CheckBox( p, "Skeleton", "Skeleton" )
    hvhobkak.ui.CheckBox( p, "Sight lines", "Sight lines" )
    hvhobkak.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, false, false, function(p)
        local lbl, drop = hvhobkak.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) 
        lbl:Remove() 
        drop:Dock(RIGHT) 
        drop:DockMargin(0,0,0,0) 
    end )
    // hvhobkak.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, hvhobkak.spfuncs[34], false, function(p) local lbl, drop = hvhobkak.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )

    hvhobkak.ui.Slider( p, "Max distance","ESP Distance",0,100000,0 )

    local p = hvhobkak.itemPanel("Entity",1,135):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Box", "Ent box", false, false, false, hvhobkak.spfuncs[31] )
    hvhobkak.ui.CheckBox( p, "Class", "Ent class" )
    hvhobkak.ui.Slider( p, "Max distance","Ent ESP Distance",0,100000,0 )
    hvhobkak.ui.Label( p, "Add entity key", function( p ) hvhobkak.ui.Binder( "Ent add", p ) end )

    local p = hvhobkak.itemPanel( "Misc", 1, 220 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Hide name", "Hide name" )
    hvhobkak.ui.TextEntry( "Custom name", "Custom name", p, 999 )
    hvhobkak.ui.CheckBox( p, "Disable sensivity adjustment", "Disable SADJ" )
    hvhobkak.ui.CheckBox( p, "Screengrab image", "Screengrab image" )
    hvhobkak.ui.ComboBox( p, "ESP Font", "ESP Font", { "Outlined", "Shadow" } )
    
    local p = hvhobkak.itemPanel("Colored models",2,150):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Player chams", "Visible chams", false, false, true, hvhobkak.spfuncs[14], false, function(p) hvhobkak.ui.ColorPicker( "inVisible chams", p ) end )
    hvhobkak.ui.CheckBox( p, "Self chams", "Self chams", false, false, true, hvhobkak.spfuncs[15] )
    hvhobkak.ui.CheckBox( p, "Backtrack chams", "Backtrack chams", false, false, true, hvhobkak.spfuncs[16] )
    hvhobkak.ui.CheckBox( p, "Entity chams", "Entity chams", false, false, true, hvhobkak.spfuncs[17], false )
    hvhobkak.ui.CheckBox( p, "Viewmodel chams", "Viewmodel chams", false, false, true, hvhobkak.spfuncs[19], false )

    local p = hvhobkak.itemPanel("Material customisation",2,150):GetItemPanel()

    hvhobkak.ui.Slider( p, "Min illumination", "Fresnel minimum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = hvhobkak.chamMats.vis[3], hvhobkak.chamMats.vis[4], hvhobkak.chamMats.invis[3], hvhobkak.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, hvhobkak.cfg.vars["Fresnel maximum illum"], hvhobkak.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, hvhobkak.cfg.vars["Fresnel maximum illum"], hvhobkak.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, hvhobkak.cfg.vars["Fresnel maximum illum"], hvhobkak.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, hvhobkak.cfg.vars["Fresnel maximum illum"], hvhobkak.cfg.vars["Fresnel exponent"] ) )
    end )
    
    hvhobkak.ui.Slider( p, "Max illumination", "Fresnel maximum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = hvhobkak.chamMats.vis[3], hvhobkak.chamMats.vis[4], hvhobkak.chamMats.invis[3], hvhobkak.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( hvhobkak.cfg.vars["Fresnel minimum illum"], v, hvhobkak.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( hvhobkak.cfg.vars["Fresnel minimum illum"], v, hvhobkak.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( hvhobkak.cfg.vars["Fresnel minimum illum"], v, hvhobkak.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( hvhobkak.cfg.vars["Fresnel minimum illum"], v, hvhobkak.cfg.vars["Fresnel exponent"] ) )
    end )
 
    hvhobkak.ui.Slider( p, "Fresnel exponent", "Fresnel exponent", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = hvhobkak.chamMats.vis[3], hvhobkak.chamMats.vis[4], hvhobkak.chamMats.invis[3], hvhobkak.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( hvhobkak.cfg.vars["Fresnel minimum illum"], hvhobkak.cfg.vars["Fresnel maximum illum"], v ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( hvhobkak.cfg.vars["Fresnel minimum illum"], hvhobkak.cfg.vars["Fresnel maximum illum"], v ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( hvhobkak.cfg.vars["Fresnel minimum illum"], hvhobkak.cfg.vars["Fresnel maximum illum"], v ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( hvhobkak.cfg.vars["Fresnel minimum illum"], hvhobkak.cfg.vars["Fresnel maximum illum"], v ) )
    end )

    local p = hvhobkak.itemPanel("Outlines",2,115):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Player outline", "Player outline", false, false, true )
    hvhobkak.ui.CheckBox( p, "Entity outline", "Entity outline", false, false, true )
    hvhobkak.ui.ComboBox( p, "Style", "Outline style", { "Default", "Subtractive", "Additive" } )

    local p = hvhobkak.itemPanel( "Indicators", 2, 145 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Hitmarker", "Hitmarker", false, false, true )
    hvhobkak.ui.CheckBox( p, "Hitnumbers", "Hitnumbers", false, false, true, false, false, function(p) hvhobkak.ui.ColorPicker( "Hitnumbers krit", p ) end )
    //hvhobkak.ui.CheckBox( p, "Hit particles", "Hit particles", false, false, true, hvhobkak.spfuncs[31] )
    hvhobkak.ui.CheckBox( p, "On screen logs", "On screen logs", false, false, true, false, false, function(p) hvhobkak.ui.ColorPicker( "Miss lagcomp", p ) hvhobkak.ui.ColorPicker( "Miss spread", p ) hvhobkak.ui.ColorPicker( "Miss fail", p ) end )
    hvhobkak.ui.CheckBox( p, "Spectator list", "Spectator list" )
    hvhobkak.ui.CheckBox( p, "Tickbase", "Tickbase indicator" )

    local p = hvhobkak.itemPanel("World",3,420):GetItemPanel()

    hvhobkak.ui.TextEntry( "Skybox texture", "Custom sky", p, 420 )
    hvhobkak.ui.CheckBox( p, "Sky color", "Sky color", false, false, true )
    hvhobkak.ui.CheckBox( p, "Wall color", "Wall color", false, false, true )

    hvhobkak.ui.CheckBox( p, "Fullbright", "Fullbright", false, true )
    hvhobkak.ui.ComboBox( p, "Mode", "Fullbright mode", { "Default", "Corvus extreme" } )
    hvhobkak.ui.CheckBox( p, "Disable shadows", "Disable shadows" )

    hvhobkak.ui.CheckBox( p, "Fog changer", "FogChanger", false, false, true )
    hvhobkak.ui.Slider( p, "Fog start","FogStart", 1, 4200, 0 )
    hvhobkak.ui.Slider( p, "Fog end","FogEnd", 1, 9000, 0 )

    hvhobkak.ui.CheckBox( p, "Color modify", "Color Modify", false, false, false, hvhobkak.spfuncs[229] )

    hvhobkak.ui.CheckBox( p, "Bullet tracers", "Bullet tracers", false, false, true, hvhobkak.spfuncs[18] )
    hvhobkak.ui.TextEntry( "Material", "Bullet tracers material", p, 420 )


    local p = hvhobkak.itemPanel("View",3,192):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Third person", "Third person", false, true, false, hvhobkak.spfuncs[20] )
    hvhobkak.ui.CheckBox( p, "Free camera", "Free camera", false, true, false, hvhobkak.spfuncs[21] )

    hvhobkak.ui.Slider( p, "Fov override","Fov override",75,160,0 )
    hvhobkak.ui.Slider( p, "Viewmodel fov","Viewmodel fov",50,180,0 )
    hvhobkak.ui.Slider( p, "Aspect ratio","Aspect ratio",0,2,3,function(val) gRunCmd("r_aspectratio",val) end )


    
    

   



    





    

    





    
    /*





    hvhobkak.checkbox("Kill sound","Killsound",p:GetItemPanel())
    

    local p = hvhobkak.itemPanel("World",2,123)

    

    local p = hvhobkak.itemPanel("Effects",2,142)


    
    

    local p = hvhobkak.itemPanel("View",3,275)




    // hvhobkak.ESPPP:Show()
*/
end

hvhobkak.spfuncs[25] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.ComboBox( hvhobkak.ui.SettingsPan, "Strafe mode", "Strafe mode", {"Legit","Rage","Multidir"})
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Ground strafer", "Ground strafer" )
    hvhobkak.ui.CheckBox( hvhobkak.ui.SettingsPan, "Sin ( snake ) strafe", "Z Hop", false, true )
end

hvhobkak.spfuncs[26] = function()
    hvhobkak.ui.SettingsPan:SetSize(250,256)

    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Predict ticks", "CStrafe ticks", 16, 128, 0 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Angle step", "CStrafe angle step", 1, 10, 0 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Angle max step", "CStrafe angle max step", 5, 50, 0 )
    hvhobkak.ui.Slider( hvhobkak.ui.SettingsPan, "Ground diff", "CStrafe ground diff", 1, 65, 0 )
end

hvhobkak.spfuncs[27] = function( p )
    hvhobkak.ui.TextEntry( "Name", "Name Convar", p, 250 )
    hvhobkak.ui.Button( "Change name", function() ded.NetSetConVar("name",hvhobkak.cfg.vars["Name Convar"]) end, p )
    hvhobkak.ui.CheckBox( p, "Name stealer", "Name stealer" )

    hvhobkak.ui.TextEntry( "Disconnect reason", "Disconnect reason", p, 250 )
    hvhobkak.ui.Button( "Disconnect", function() ded.NetDisconnect(hvhobkak.cfg.vars["Disconnect reason"]) end, p )
end 

function hvhobkak.CustomCvarVal( net )
    local m = net == 1 and "Net Convar mode" or "Cvar mode"
    local n = net == 1 and "Net Convar int" or "Cvar int"
    local s = net == 1 and "Net Convar str" or "Cvar str"

    local mode = hvhobkak.cfg.vars[m] 
    local num = hvhobkak.cfg.vars[n]
    local set = mode == 2 and math_Round( num ) or num

    if mode == 1 then set = hvhobkak.cfg.vars[s] end

    return set
end

hvhobkak.spfuncs[28] = function( p )
    hvhobkak.ui.TextEntry( "Cvar name", "Net Convar", p, 250 )
    hvhobkak.ui.Slider( p, "Cvar int", "Net Convar int", 1, 100, 2 )
    hvhobkak.ui.TextEntry( "Cvar str", "Net Convar str", p, 250 )

    hvhobkak.ui.ComboBox( p, "Set mode", "Net Convar mode", {"String","Int","Float"})

    hvhobkak.ui.Button( "Send new val", function() ded.NetSetConVar( hvhobkak.cfg.vars["Net Convar"] ,hvhobkak.CustomCvarVal( 1 ) ) end, p )
end 

hvhobkak.FCVAR = {
    str = {
        "Archive", "Archive XBOX", "Cheat", "Client can execute", "Client DLL", "Demo", "Dont record",
        "Game DLL", "Lua client", "Lua server", "Never as string", "None", "Notify", "Not connected",
        "Printable only", "Protected", "Replicated", "Server cannot query", "Server can execute",
        "Sponly", "Unlogged", "Unregistered", "35"
    },
    int = {
        128, 16777216, 16384, 1073741824, 8, 65536, 131072, 4, 262144, 524288, 4096, 0, 256, 4194304,
        1024, 32, 8192, 536870912, 268435456, 64, 2048, 1, 512
    }
}

hvhobkak.spfuncs[29] = function( p )
    hvhobkak.ui.TextEntry( "Enter cvar name", "Cvar name", p, 500 )
    hvhobkak.ui.Slider( p, "Custom number", "Cvar int", 1, 1000, 2 )
    hvhobkak.ui.TextEntry( "Custom string", "Cvar str", p, 500 )

    hvhobkak.ui.ComboBox( p, "Cvar mode", "Cvar mode", {"String","Int","Float"})
    
    hvhobkak.ui.Button( "Change cvar", function()
        local s = hvhobkak.CustomCvarVal( 0 )
        local n = hvhobkak.cfg.vars["Cvar name"]
        
        local flag = GetConVar(n):GetFlags()

        ded.ConVarSetFlags( n, 0 )

        gRunCmd( n, s )

        ded.ConVarSetFlags( n, flag )
    end, p )

    hvhobkak.ui.ComboBox( p, "Cvar flag", "Cvar flag", hvhobkak.FCVAR.str)

    hvhobkak.ui.Button( "Change flag", function()
        ded.ConVarSetFlags( hvhobkak.cfg.vars["Cvar name"], hvhobkak.FCVAR.int[ hvhobkak.cfg.vars["Cvar flag"] ] )
        print( hvhobkak.cfg.vars["Cvar name"], hvhobkak.FCVAR.int[ hvhobkak.cfg.vars["Cvar flag"] ] )
    end, p )

end 

function hvhobkak.tabs.Misc()

    local function func( p )
        hvhobkak.ui.MTButton( p, "Cvar", hvhobkak.spfuncs[29] )
        hvhobkak.ui.MTButton( p, "Net cvar", hvhobkak.spfuncs[28] )
        hvhobkak.ui.MTButton( p, "Net", hvhobkak.spfuncs[27] )
    end

    local p = hvhobkak.itemPanel("Movement",1,205):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Bunny hop", "Bhop" )
    hvhobkak.ui.CheckBox( p, "Air strafer", "Air strafer", false, false, false, hvhobkak.spfuncs[25] )
    hvhobkak.ui.CheckBox( p, "Circle strafe", "Circle strafe", false, true, false, hvhobkak.spfuncs[26] )
    hvhobkak.ui.CheckBox( p, "Keep sprint", "Sprint" )
    hvhobkak.ui.CheckBox( p, "Fast stop", "Fast stop" )
    hvhobkak.ui.CheckBox( p, "Auto peak", "Auto peak", false, true )
    hvhobkak.ui.CheckBox( p, "Auto teleport back", "Auto peak tp" )
    hvhobkak.ui.CheckBox( p, "Water walk", "Water jump" )

    local p = hvhobkak.itemPanel("Key spam",1,185):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Use spam", "Use spam" )
    hvhobkak.ui.CheckBox( p, "Flashlight spam", "Flashlight spam" )
    hvhobkak.ui.CheckBox( p, "Auto GTA", "Auto GTA" )
    hvhobkak.ui.CheckBox( p, "Camera spam", "Camera spam" )
    hvhobkak.ui.CheckBox( p, "Vape spam", "Vape spam" )

    local p = hvhobkak.itemPanel( "Sounds", 2, 173 ):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Hitsound", "Hitsound" )
    hvhobkak.ui.TextEntry( "Sound path", "Hitsound str", p, 420 )
    hvhobkak.ui.CheckBox( p, "Killsound", "Killsound" )
    hvhobkak.ui.TextEntry( "Sound path", "Killsound str", p, 420 )

    local p = hvhobkak.itemPanel("Chat",2,282):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Spammer", "Chat spammer" )
    hvhobkak.ui.ComboBox( p, "Mode", "Chat mode", { "Sacred quotes", "Domestic terrorist", "Butthole licker", "White nationalist" })
    hvhobkak.ui.ComboBox( p, "Group", "Chat group", { "Default", "OOC", "Advert", "PM", "ULX" })
    hvhobkak.ui.Slider( p, "Delay", "Chat delay", 0,20,0 )
    
    hvhobkak.ui.CheckBox( p, "Killsay", "Killsay" )
    hvhobkak.ui.ComboBox( p, "Mode", "Killsay mode", { "Sacred quotes", "Domestic terrorist", "Butthole licker", "White nationalist" })
    hvhobkak.ui.ComboBox( p, "Group", "Killsay group", { "Default", "OOC", "Advert", "PM", "ULX" })

    hvhobkak.itemPanelB( "Net / Cvar", 3, 310, func )

    local p = hvhobkak.itemPanel("Memes",3,250):GetItemPanel()

    hvhobkak.ui.CheckBox( p, "Follow Player", "Ghost follower" )
    hvhobkak.ui.TextEntry( "Steam ID", "GFID", p, 500 )
    hvhobkak.ui.CheckBox( p, "Auto Затяг ( Vape )", "Auto Vape" )
    hvhobkak.ui.CheckBox( p, "Fast lockpick", "Fast lockpick" )

   /*
        hvhobkak.checkbox("Safe hop","Safe hop",p:GetItemPanel())
        hvhobkak.checkbox("Edge jump","Edge jump",p:GetItemPanel())
        hvhobkak.checkbox("Air duck","Air duck",p:GetItemPanel())
    */
end

/*
function hvhobkak.updateMenuColor( col )
    local r, g, b = col.r, col.g, col.b 

    for i = 1,255 do 
        hvhobkak.Colors[i] = Color( i + r, i + g, i + b, 255 )
    end
end
*/


function hvhobkak.tabs.Config()
    local p = hvhobkak.itemPanel("Settings",1,230):GetItemPanel()

    hvhobkak.ui.ComboBox( p, "Choice", "Selected config", hvhobkak.cfgTable)

    hvhobkak.ui.Button( "Load", function() hvhobkak.LoadConfig() end, p )
    hvhobkak.ui.Button( "Save", function() hvhobkak.SaveConfig() end, p )
    hvhobkak.ui.Button( "Delete", function() hvhobkak.DeleteConfig() end, p )

    hvhobkak.ui.TextEntry( "Name", "Config name", p, 64 )
    hvhobkak.ui.Button( "Create", function() hvhobkak.CreateConfig() end, p )

    //hvhobkak.ui.Label( p, "Menu color", function( p ) hvhobkak.ui.ColorPicker( "Menu color", p, hvhobkak.updateMenuColor ) end )
end

function hvhobkak.tabs.Players()
    local playerlist = vgui.Create( "UListView", hvhobkak.scrollpanel )

    playerlist:SetPos( 5, 5 )
    playerlist:SetSize( 500, 775 )
    playerlist:SetMultiSelect( false )
    playerlist:AddColumn( "Name" )
    playerlist:AddColumn( "SID" )
    playerlist:AddColumn( "SID64" )
    playerlist:AddColumn( "Team" )
    playerlist:AddColumn( "Group" )

    local plys = player_GetAll()

    for i = 1, #plys do
        local ply = plys[i]

        local TeamIndex, TeamName, TeamColor = hvhobkak.GetTeam( ply )
    
        playerlist:AddLine(ply:Name(), ply:SteamID(), ply:SteamID64(), TeamName, hvhobkak.GetUserGroup(ply))
    end


end

hvhobkak.ttable = {}

hvhobkak.ttable["Aimbot"]   = hvhobkak.tabs.Aimbot
hvhobkak.ttable["Rage"]     = hvhobkak.tabs.Rage
hvhobkak.ttable["Visuals"]  = hvhobkak.tabs.Visuals
hvhobkak.ttable["Misc"]     = hvhobkak.tabs.Misc
hvhobkak.ttable["Config"] = hvhobkak.tabs.Config
hvhobkak.ttable["Players"]  = hvhobkak.tabs.Players

function hvhobkak.initTab(tab)
    if hvhobkak.scrollpanel != nil then hvhobkak.scrollpanel:Remove() end

    hvhobkak.scrollpanel = vgui_Create("UScroll",hvhobkak.frame)

    hvhobkak.pty = { 5, 5, 5 }
    // hvhobkak.ESPPP:Hide()
    hvhobkak.ttable[tostring(tab)]()
end

function hvhobkak.tabButton(tab,par) 
    surface_SetFont("tbfont")
    local w, h = surface_GetTextSize(tab)

    local fw = w + 35

    local tx, ty = fw/2 - w/2, 25/2-h/2 - 1

    local b = par:Add("DButton")
    b:Dock(LEFT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        hvhobkak.activetab = tab
        hvhobkak.initTab(tab)
    end

    function b:Paint(width,height)
        if hvhobkak.activetab == tab or self:OnDepressed() then
            surface_SetDrawColor(hvhobkak.Colors[54])
            surface_SetTextColor(245,245,245,255)
        elseif self:IsHovered() then
            surface_SetDrawColor(hvhobkak.Colors[40])
            surface_SetTextColor(225,225,225,255)
        else
            surface_SetDrawColor(hvhobkak.Colors[30])
            surface_SetTextColor(200,200,200,255)
        end
        
        surface_DrawRect(0,0,width,height)

        surface_SetFont("tbfont")
        surface_SetTextPos(tx,ty)
        surface_DrawText(tab)
    end
end

hvhobkak.tabButton( "Aimbot",        hvhobkak.frame:GetTopPanel() ) 
hvhobkak.tabButton( "Rage",          hvhobkak.frame:GetTopPanel() ) 
hvhobkak.tabButton( "Visuals",       hvhobkak.frame:GetTopPanel() ) 
hvhobkak.tabButton( "Misc",          hvhobkak.frame:GetTopPanel() ) 
hvhobkak.tabButton( "Config",        hvhobkak.frame:GetTopPanel() ) 
hvhobkak.tabButton( "Players",       hvhobkak.frame:GetTopPanel() ) 

hvhobkak.ttable["Aimbot"]()

// Input 

function hvhobkak.IsKeyDown( key )
    if key >= 107 then
        return input_IsMouseDown( key )
    end

    return input_IsKeyDown( key )
end

/*
    Create Move start
*/

// cm stuff

hvhobkak.target             = false  
hvhobkak.aimingrn           = false 

hvhobkak.targetVector       = Vector()
hvhobkak.predictedVector    = Vector()
hvhobkak.backtrackVector    = Vector()
hvhobkak.nullVec            = Vector() * -1

hvhobkak.SilentAngle        = me:EyeAngles()

hvhobkak.SkipCommand        = false
hvhobkak.SendPacket         = true

hvhobkak.traceStruct        = { mask = MASK_SHOT, filter = me }
hvhobkak.badSweps           = { ["gmod_camera"] = true, ["manhack_welder"] = true, ["weapon_medkit"] = true, ["gmod_tool"] = true, ["weapon_physgun"] = true, ["weapon_physcannon"] = true, ["weapon_bugbait"] = true, }
hvhobkak.badSeqs            = { [ACT_VM_RELOAD] = true, [ACT_VM_RELOAD_SILENCED] = true, [ACT_VM_RELOAD_DEPLOYED] = true, [ACT_VM_RELOAD_IDLE] = true, [ACT_VM_RELOAD_EMPTY] = true, [ACT_VM_RELOADEMPTY] = true, [ACT_VM_RELOAD_M203] = true, [ACT_VM_RELOAD_INSERT] = true, [ACT_VM_RELOAD_INSERT_PULL] = true, [ACT_VM_RELOAD_END] = true, [ACT_VM_RELOAD_END_EMPTY] = true, [ACT_VM_RELOAD_INSERT_EMPTY] = true, [ACT_VM_RELOAD2] = true }
hvhobkak.cones              = {}
hvhobkak.parsedbones        = {}

hvhobkak.swbNormal          = bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
hvhobkak.swbWall            = bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
hvhobkak.swbPen             = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
hvhobkak.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

hvhobkak.m9kPenetration     = { ["SniperPenetratedRound"] = 20, ["pistol"] = 9, ["357"] = 12, ["smg1"] = 14, ["ar2"] = 16, ["buckshot"] = 5, ["slam"] = 5, ["AirboatGun"] = 17, }
hvhobkak.m9kMaxRicochet     = { ["SniperPenetratedRound"] = 10, ["pistol"] = 2, ["357"] = 5, ["smg1"] = 4, ["ar2"] = 5, ["buckshot"] = 0, ["slam"] = 0, ["AirboatGun"] = 9, }
hvhobkak.m9kCanRicochet     = { ["SniperPenetratedRound"] = true, ["pistol"] = true, ["buckshot"] = true, ["slam"] = true }
hvhobkak.m9kPenMaterial     = { [MAT_GLASS] = true, [MAT_PLASTIC] = true, [MAT_WOOD] = true, [MAT_FLESH] = true, [MAT_ALIENFLESH] = true }

hvhobkak.activeWeapon       = false 
hvhobkak.activeWeaponClass  = false 
hvhobkak.moveType           = me:GetMoveType() 

hvhobkak.myaw               = GetConVar("m_yaw"):GetFloat()

hvhobkak.backtracktick      = 0










function hvhobkak.AutoWall( dir, plyTarget )
	if not hvhobkak.activeWeapon or hvhobkak.swbShit[ hvhobkak.activeWeaponClass ] then return false end 

	local eyePos = me:EyePos()
	
	local function SWBAutowall()

        hvhobkak.traceStruct.start = eyePos
        hvhobkak.traceStruct.endpos = eyePos + dir * hvhobkak.activeWeapon.PenetrativeRange
        hvhobkak.traceStruct.filter = me
        hvhobkak.traceStruct.mask = hvhobkak.swbNormal

		local tr = TraceLine( hvhobkak.traceStruct )
		
		if tr.Hit and !tr.HitSky then
			local dot = -dir:Dot(tr.HitNormal)
			
			if hvhobkak.activeWeapon.CanPenetrate and dot > 0.26 then

                hvhobkak.traceStruct.start = tr.HitPos
                hvhobkak.traceStruct.endpos = tr.HitPos + dir * hvhobkak.activeWeapon.PenStr * ( hvhobkak.swbPen[tr.MatType] or 1 ) * hvhobkak.activeWeapon.PenMod
                hvhobkak.traceStruct.filter = me
                hvhobkak.traceStruct.mask = hvhobkak.swbWall

				tr = TraceLine( hvhobkak.traceStruct )

                hvhobkak.traceStruct.start = tr.HitPos
                hvhobkak.traceStruct.endpos = tr.HitPos + dir * 0.1
                hvhobkak.traceStruct.filter = me
                hvhobkak.traceStruct.mask = hvhobkak.swbNormal

				tr = TraceLine( hvhobkak.traceStruct) 
				
				if tr.Hit then return false end

                hvhobkak.traceStruct.start = tr.HitPos
                hvhobkak.traceStruct.endpos = tr.HitPos + dir * 32768
                hvhobkak.traceStruct.filter = me
                hvhobkak.traceStruct.mask = MASK_SHOT

				tr = TraceLine( hvhobkak.traceStruct )
				
                if hvhobkak.cfg.vars["Ignores-Head unhitable"] then
                    return tr.Entity == plyTarget and tr.HitGroup == 1
                else
                    return tr.Entity == plyTarget
                end
			end
		end
		
		return false
	end
	
	local function M9KAutowall()
		if !hvhobkak.activeWeapon.Penetration then
			return false
		end

		local function BulletPenetrate( tr, bounceNum, damage )
			if damage < 1 then
				return false
			end
			
			local maxPenetration    = 14
            local maxRicochet       = 0
            local isRicochet        = false

            if hvhobkak.m9kPenetration[ hvhobkak.activeWeapon.Primary.Ammo ] then
                maxPenetration = hvhobkak.m9kPenetration[ hvhobkak.activeWeapon.Primary.Ammo ]
            end
			
            if hvhobkak.m9kMaxRicochet[ hvhobkak.activeWeapon.Primary.Ammo ] then
                maxRicochet = hvhobkak.m9kMaxRicochet[ hvhobkak.activeWeapon.Primary.Ammo ]
            end

            if hvhobkak.m9kCanRicochet[ hvhobkak.activeWeapon.Primary.Ammo ] then
                isRicochet = hvhobkak.m9kMaxRicochet[ hvhobkak.activeWeapon.Primary.Ammo ]
            end

			if tr.MatType == MAT_METAL and isRicochet and hvhobkak.activeWeapon.Primary.Ammo != "SniperPenetratedRound" then
				return false
			end

			if bounceNum > maxRicochet then
				return false
			end

			local penetrationDir = tr.Normal * maxPenetration

			if hvhobkak.m9kPenMaterial[ tr.MatType ] then
				penetrationDir = tr.Normal * ( maxPenetration * 2 ) 
			end

			if tr.Fraction <= 0 then
				return false
			end

			hvhobkak.traceStruct.endpos    = tr.HitPos
			hvhobkak.traceStruct.start     = tr.HitPos + penetrationDir
			hvhobkak.traceStruct.mask      = MASK_SHOT
			hvhobkak.traceStruct.filter    = me

			local trace = TraceLine( hvhobkak.traceStruct )

			if trace.StartSolid or trace.Fraction >= 1 then
				return false
			end

			hvhobkak.traceStruct.endpos = trace.HitPos + tr.Normal * 32768
			hvhobkak.traceStruct.start  = trace.HitPos
			hvhobkak.traceStruct.mask   = MASK_SHOT
			hvhobkak.traceStruct.filter = me

			local penTrace = TraceLine( hvhobkak.traceStruct )

            if hvhobkak.cfg.vars["Ignores-Head unhitable"] then
                return penTrace.Entity == plyTarget and penTrace.HitGroup == 1
            else
                return penTrace.Entity == plyTarget
            end

			local damageMulti = 0.5
			if hvhobkak.activeWeapon.Primary.Ammo == "SniperPenetratedRound" then
				damageMulti = 1
			elseif tr.MatType == MAT_CONCRETE or tr.MatType == MAT_METAL then
				damageMulti = 0.3
			elseif tr.MatType == MAT_WOOD or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_GLASS then
				damageMulti = 0.8
			elseif tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH then
				damageMulti = 0.9
			end
			
			if penTrace.MatType == MAT_GLASS then
				bounceNum = bounceNum - 1
			end

			return BulletPenetrate( penTrace, bounceNum + 1, damage * damageMulti )
		end

        hvhobkak.traceStruct.start = eyePos
        hvhobkak.traceStruct.endpos = eyePos + dir * 32768
        hvhobkak.traceStruct.filter = me
        hvhobkak.traceStruct.mask = MASK_SHOT

		local trace = TraceLine( hvhobkak.traceStruct )

		return BulletPenetrate( trace, 0, hvhobkak.activeWeapon.Primary.Damage )
	end
	
    if StartsWith( hvhobkak.activeWeaponClass, "m9k_" ) then
		return M9KAutowall()
	elseif StartsWith( hvhobkak.activeWeaponClass, "swb_" ) then
		return SWBAutowall()
	end
	
	return false
end

function hvhobkak.VisibleCheck( who, where, predticks, awalldir )
    local start = me:EyePos()

    if predticks then start = start + ( me:GetVelocity() * TickInterval ) * predticks end

    hvhobkak.traceStruct.start = start
	hvhobkak.traceStruct.endpos = where
	hvhobkak.traceStruct.mask = MASK_SHOT
    hvhobkak.traceStruct.filter = me

    local tr = TraceLine( hvhobkak.traceStruct )

    local canhit = tr.Entity == who or tr.Fraction == 1

    if !canhit and awalldir and hvhobkak.cfg.vars["Wallz"] then 
        return hvhobkak.AutoWall( awalldir, who )
    end

    if hvhobkak.cfg.vars["Ignores-Head unhitable"] and tr.HitGroup != 1 then return false end

    return canhit
end

function hvhobkak.CanShoot( cmd )
	if not hvhobkak.activeWeapon then return false end
	local seq = hvhobkak.activeWeapon:GetSequence()

    if hvhobkak.cfg.binds["Aim on key"] != 0 and not hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Aim on key"] ) then
        return false
    end

	if hvhobkak.badSweps[ hvhobkak.activeWeaponClass ] then
		return false
	end

    if hvhobkak.moveType == MOVETYPE_NOCLIP then
        return false
    end

    if hvhobkak.cfg.vars["Auto fire"] and cmd:KeyDown(IN_ATTACK) then
        return false
    end

	if hvhobkak.cfg.vars["Bullet time"] and hvhobkak.activeWeapon:GetNextPrimaryFire() >= ded.GetServerTime(cmd) then
		return false
	end

    // print(ded.GetRandomSeed( cmd ))
    if hvhobkak.cfg.vars["Wait for seed"] and ded.GetRandomSeed( cmd ) != 134 then
        return false 
    end

	return hvhobkak.activeWeapon:Clip1() != 0 and !hvhobkak.badSeqs[ seq ] 
end 

function hvhobkak.Spread( cmd, ang, spread )
	if not hvhobkak.activeWeapon or not hvhobkak.cones[ hvhobkak.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()

	return newangle
end

/*
    Nospread 
*/

hvhobkak.CustomSpread = {}

function hvhobkak.CustomSpread.swb( cmd, ang )
    /*
    local vel = me:GetVelocity():Length()
    local dir = ang:Forward()
    
    if !me.LastView then
        me.LastView = dir
        me.ViewAff = 0
    else
        me.ViewAff = Lerp( 0.25, me.ViewAff, ( dir - me.LastView ):Length() * 0.5 )
    end
    
    if hvhobkak.activeWeapon.dt and hvhobkak.activeWeapon.meSpread and hvhobkak.activeWeapon.dt.State == SWB_AIMING then
        hvhobkak.activeWeapon.BaseCone = hvhobkak.activeWeapon.meSpread
        
        if hvhobkak.activeWeapon.Owner.Expertise then
            hvhobkak.activeWeapon.BaseCone = hvhobkak.activeWeapon.BaseCone * ( 1 - hvhobkak.activeWeapon.Owner.Expertise["steadyme"].val * 0.0015 )
        end
    else
        hvhobkak.activeWeapon.BaseCone = hvhobkak.activeWeapon.HipSpread
        
        if hvhobkak.activeWeapon.Owner.Expertise then
            hvhobkak.activeWeapon.BaseCone = hvhobkak.activeWeapon.BaseCone * ( 1 - hvhobkak.activeWeapon.Owner.Expertise["wepprof"].val * 0.0015 )
        end
    end
    
    if me:Crouching() then
        hvhobkak.activeWeapon.BaseCone = hvhobkak.activeWeapon.BaseCone * ( hvhobkak.activeWeapon.dt.State == SWB_AIMING and 0.9 or 0.75 )
    end
    
    hvhobkak.activeWeapon.CurCone = math_Clamp( hvhobkak.activeWeapon.BaseCone + hvhobkak.activeWeapon.AddSpread + ( vel / 10000 * hvhobkak.activeWeapon.VelocitySensitivity ) * ( hvhobkak.activeWeapon.dt.State == SWB_AIMING and hvhobkak.activeWeapon.meMobilitySpreadMod or 1 ) + me.ViewAff, 0, 0.09 + hvhobkak.activeWeapon.MaxSpreadInc )
    
    if CurTime() > hvhobkak.activeWeapon.SpreadWait then
        hvhobkak.activeWeapon.AddSpread = math_Clamp( hvhobkak.activeWeapon.AddSpread - 0.005 * hvhobkak.activeWeapon.AddSpreadSpeed, 0, hvhobkak.activeWeapon.MaxSpreadInc )
        hvhobkak.activeWeapon.AddSpreadSpeed = math_Clamp( hvhobkak.activeWeapon.AddSpreadSpeed + 0.05, 0, 1 )
    end
    */

    local cone = hvhobkak.activeWeapon.CurCone
    if !cone then return ang end

    if me:Crouching() then
        cone = cone * 0.85
    end

    math_randomseed( cmd:CommandNumber() )
    return ang - Angle( math_Rand(-cone, cone), math_Rand(-cone, cone), 0 ) * 25
end

function hvhobkak.CustomSpread.cw( cmd, ang )
    local cone = hvhobkak.activeWeapon.CurCone
    if !cone then return ang end

    math_randomseed( cmd:CommandNumber() )
    return ang - Angle( math_Rand(-cone, cone), math_Rand(-cone, cone), 0 ) * 25
end

function hvhobkak.CustomSpread.fas2( cmd, ang )
    math_randomseed( CurTime() )

    local dir = Angle( math_Rand( -hvhobkak.activeWeapon.CurCone, hvhobkak.activeWeapon.CurCone ), math_Rand( -hvhobkak.activeWeapon.CurCone, hvhobkak.activeWeapon.CurCone ), 0 ) * 25
    local dir2 = dir 
            
    if hvhobkak.activeWeapon.ClumpSpread and hvhobkak.activeWeapon.ClumpSpread > 0 then
        dir2 = dir + Vector( math_Rand(-1, 1), math_Rand(-1, 1), math_Rand(-1, 1)) * hvhobkak.activeWeapon.ClumpSpread
    end

    return ang - dir2
end

function hvhobkak.CustomSpread.tfa( cmd, ang )

    
    return ang
end

hvhobkak.SpreadComps = {}

hvhobkak.SpreadComps["swb"]     = hvhobkak.CustomSpread.swb
hvhobkak.SpreadComps["cw"]      = hvhobkak.CustomSpread.cw
hvhobkak.SpreadComps["fas2"]    = hvhobkak.CustomSpread.fas2
hvhobkak.SpreadComps["tfa"]     = hvhobkak.CustomSpread.tfa










function hvhobkak.NoSpread(cmd, ang)
    if not hvhobkak.activeWeapon or hvhobkak.swbShit[ hvhobkak.activeWeaponClass ] then return ang end
    local base = string.Split( hvhobkak.activeWeaponClass, "_" )[ 1 ]

    if hvhobkak.SpreadComps[ base ] then
        ang = hvhobkak.SpreadComps[ base ]( cmd, ang )
    elseif hvhobkak.cones[ hvhobkak.activeWeaponClass ] then
        local spread = hvhobkak.cones[ hvhobkak.activeWeaponClass ]
        return hvhobkak.Spread( cmd, ang, spread ) 
    end

    return ang
end

function hvhobkak.NoRecoil( ang )  
	if hvhobkak.activeWeaponClass == "weapon_pistol" or StartsWith( hvhobkak.activeWeaponClass,"m9k_" ) or StartsWith( hvhobkak.activeWeaponClass,"bb_" ) or StartsWith( hvhobkak.activeWeaponClass,"unclen8_" ) then
		return ang
	else
	    ang = ang - me:GetViewPunchAngles()
    end

	return ang
end

/*
hvhobkak.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )

*/

function hvhobkak.ParseBones( ply, bone )
    local mdl = ply:GetModel()

    if hvhobkak.parsedbones[ mdl ] and hvhobkak.parsedbones[ mdl ][ bone ] then 
        return hvhobkak.parsedbones[ mdl ][ bone ]
    end

    if not hvhobkak.parsedbones[ mdl ] then
        hvhobkak.parsedbones[ mdl ] = {}
    end
        
    local set = ply:GetHitboxSet()
    local bonecount = ply:GetBoneCount()

    for i = 0, bonecount - 1 do 
		local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

		if bone == group then
			hvhobkak.parsedbones[ mdl ][ bone ] = i

            return i
        end
	end

    for i = 0, bonecount - 1 do 
        local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

        if bone > 1 and group == 0 then
            hvhobkak.parsedbones[ mdl ][ bone ] = i

            return i
        end
    end

    return 0
end

function hvhobkak.MultipointGroupCheck( group )
    if group == 1 and not hvhobkak.cfg.vars["Multipoint groups-Head"] then return false end
    if group == 2 and not hvhobkak.cfg.vars["Multipoint groups-Chest"] then return false end
    if group == 3 and not hvhobkak.cfg.vars["Multipoint groups-Stomach"] then return false end
    if group == 4 or group == 5 and not hvhobkak.cfg.vars["Multipoint groups-Arms"] then return false end
    if group == 6 or group == 7 and not hvhobkak.cfg.vars["Multipoint groups-Legs"] then return false end
    if group == 0 and not hvhobkak.cfg.vars["Multipoint groups-Generic"] then return false end

    return true 
end

function hvhobkak.GetBones( ply )
    local scale = hvhobkak.cfg.vars["Multipoint scale"]
    local pos = ply:LocalToWorld( ply:OBBCenter() )
    local set = ply:GetHitboxSet()

    if hvhobkak.cfg.vars["Hitscan"] then
        local set = ply:GetHitboxSet()
        local bonecount = ply:GetBoneCount()

        pos = {}

        for i = 0, bonecount - 1 do 
            local group = ply:GetHitBoxHitGroup( i, set )

            if group == nil then continue end

            if group == 1 and not hvhobkak.cfg.vars["Hitscan groups-Head"] then continue end
            if group == 2 and not hvhobkak.cfg.vars["Hitscan groups-Chest"] then continue end
            if group == 3 and not hvhobkak.cfg.vars["Hitscan groups-Stomach"] then continue end
            if group == 4 or group == 5 and not hvhobkak.cfg.vars["Hitscan groups-Arms"] then continue end
            if group == 6 or group == 7 and not hvhobkak.cfg.vars["Hitscan groups-Legs"] then continue end
            if group == 0 and not hvhobkak.cfg.vars["Hitscan groups-Generic"] then continue end

            pos[ #pos + 1 ] = { bone = i, hitgroup = group }
        end

        if not pos or not istable( pos ) then return end

        local valid = {}

        for i = 1, #pos do
            local bone = pos[ i ].bone
            local hitboxbone = ply:GetHitBoxBone( bone, set )

            if hitboxbone == nil then 
                continue 
            end 

            local mins, maxs = ply:GetHitBoxBounds( bone, set )

            if not mins or not maxs then 
                continue
            end 

            local bonepos, ang = ply:GetBonePosition( hitboxbone )
            
            if hvhobkak.cfg.vars["Multipoint"] and hvhobkak.MultipointGroupCheck( pos[ i ].hitgroup ) then
                local points = {
                    ( ( mins + maxs ) * 0.5 ),
                    Vector( mins.x, mins.y, mins.z ),
                    Vector( mins.x, maxs.y, mins.z ),
                    Vector( maxs.x, maxs.y, mins.z ),
                    Vector( maxs.x, mins.y, mins.z ),
                    Vector( maxs.x, maxs.y, maxs.z ),
                    Vector( mins.x, maxs.y, maxs.z ),
                    Vector( mins.x, mins.y, maxs.z ),
                    Vector( maxs.x, mins.y, maxs.z )
                }

                for i = 1, #points do
                    points[ i ]:Rotate( ang )
                    points[ i ] = points[ i ] + bonepos

                    if i == 1 then continue end 

                    points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
                    valid[ #valid + 1 ] = points[ i ]
                end
            end 

            mins:Rotate( ang )
            maxs:Rotate( ang )

            valid[ #valid + 1 ] = bonepos + ( ( mins + maxs ) * 0.5 )
        end

        return valid
    else
        local bone = hvhobkak.ParseBones( ply, hvhobkak.cfg.vars["Hitbox selection"] ) 

        local hitboxbone = ply:GetHitBoxBone( bone, set )

        if hitboxbone == nil then 
            return { pos }  
        end 

        local mins, maxs = ply:GetHitBoxBounds( bone, set )

        if not mins or not maxs then 
            return { pos } 
        end 

        local bonepos, ang = ply:GetBonePosition( hitboxbone )  

        if hvhobkak.cfg.vars["Multipoint"] then
            local points = {
                ( ( mins + maxs ) * 0.5 ),
                Vector( mins.x, mins.y, mins.z ),
                Vector( mins.x, maxs.y, mins.z ),
                Vector( maxs.x, maxs.y, mins.z ),
                Vector( maxs.x, mins.y, mins.z ),
                Vector( maxs.x, maxs.y, maxs.z ),
                Vector( mins.x, maxs.y, maxs.z ),
                Vector( mins.x, mins.y, maxs.z ),
                Vector( maxs.x, mins.y, maxs.z )
            }

            for i = 1, #points do
                points[ i ]:Rotate( ang )
                points[ i ] = points[ i ] + bonepos

                if i == 1 then continue end 

                points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
            end

            return points
        else 
            mins:Rotate( ang )
            maxs:Rotate( ang )

            pos = bonepos + ( ( mins + maxs ) * 0.5 )
        end
    end

    return { pos }
end

function hvhobkak.GetSortedPlayers( mode, selfpred, plypred, vischeck )
    local players   = player_GetAll()   
    local eyepos    = me:EyePos()       
    local valid     = {}                // sorted lady and gentleman goes here ( niggers and faggots goes to hell )

	if selfpred then
		eyepos = eyepos + (me:GetVelocity() * TickInterval) * selfpred
	end

    local iTeamLocal = hvhobkak.GetTeam( me )

        for i = 1, #players do
            local v = players[i]

            if v == me then continue end 
            if not v:Alive() or v:IsDormant() then continue end 
            if hvhobkak.cfg.vars["Ignores-Bots"] and v:IsBot() then continue end 
            if hvhobkak.cfg.vars["Ignores-Friends"] and hvhobkak.cfg.friends[v:SteamID64()] then continue end 
            if hvhobkak.cfg.vars["Ignores-Steam friends"] and v:GetFriendStatus() == "friend" then continue end 
            if hvhobkak.cfg.vars["Ignores-Admins"] and v:IsAdmin() then continue end 
            if hvhobkak.cfg.vars["Ignores-Frozen"] and v:IsFlagSet( FL_FROZEN ) then continue end 
            if hvhobkak.cfg.vars["Ignores-Nodraw"] and v:IsEffectActive( EF_NODRAW ) then continue end 
            if hvhobkak.cfg.vars["Ignores-God time"] and v:GetColor().a < 255 then continue end 
            if hvhobkak.cfg.vars["Ignores-Driver"] and v:InVehicle() then continue end 

            local iTeamEnemy = hvhobkak.GetTeam( v )
            if st == TEAM_SPECTATOR or hvhobkak.cfg.vars["Ignores-Teammates"] and iTeamLocal == iTeamEnemy then continue end 
            if hvhobkak.cfg.vars["Ignores-Nocliping"] and v:GetMoveType() == MOVETYPE_NOCLIP then continue end 

            if vischeck then
                local bone = hvhobkak.GetBones( v )[1]
                local dir = me:GetShootPos() - bone
                dir:Normalize()

                if !hvhobkak.VisibleCheck( v, bone, selfpred, dir ) then
                    continue
                end
            end

        local pos = v:GetPos()
        if plypred then 
            pos = pos + (v:GetVelocity() * TickInterval) * plypred
        end

        valid[#valid+1] = { v, pos }
    end

    if mode == 1 then
        table_sort(valid, function( a, b )
            return ( a[2] - eyepos ):LengthSqr() < ( b[2] - eyepos ):LengthSqr()       
        end)
    elseif mode == 2 then
        table_sort(valid, function( a, b )
            local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()

            local aDist
            do
                local dx = scrwc - aScr.x
                local dy = scrhc - aScr.y
                aDist = dx * dx + dy * dy
            end
    
            local bDist
            do
                local dx = scrwc - bScr.x
                local dy = scrhc - bScr.y
                bDist = dx * dx + dy * dy
            end
    
            return aDist < bDist
        end)
    end

    if #valid == 0 then return end

    return valid
end

function hvhobkak.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - hvhobkak.btrecords[ ply ][ tick ].simulationtime

    if diff > hvhobkak.cfg.vars["Backtrack time"] / 1000 then return false end

    return true
end

function hvhobkak.FindBacktrack( cmd, ply )
    local ticks = #hvhobkak.btrecords[ ply ]
    local canhit = {}

    for i = 1, ticks do
        if hvhobkak.IsTickHittable( ply, cmd, i ) then
            canhit[ #canhit + 1 ] = i
        end
    end

    return canhit
end

function hvhobkak.FindFirstHittableTicks( ply, cmd )
    local tickcount = #hvhobkak.btrecords[ ply ]

    if !tickcount then return 1 end

    for i = 1, tickcount do
        if hvhobkak.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end
end

do
    local lastdist, lasttick = 1337, 1

    function hvhobkak.FindClosestHittableTicks( ply, cmd )
        local mypos = me:EyePos()
        local records = hvhobkak.btrecords[ ply ]
        local firstticks = hvhobkak.FindFirstHittableTicks( ply, cmd )
        local tickcount = #records

        if !tickcount or !firstticks then return 1 end

        lastdist = math_huge
    
        for i = 1, tickcount - firstticks do
            local mt = i + firstticks

            if ( records[ mt ].aimpos ):DistToSqr( mypos ) < lastdist then
                lastdist = ( records[ mt ].aimpos ):DistToSqr( mypos )
                lasttick = mt
            end
        end

        return lasttick
    end
end

function hvhobkak.SelectTarget( cmd )
    local plys = hvhobkak.GetSortedPlayers( hvhobkak.cfg.vars["Target selection"] )
    hvhobkak.target     = false


    if !plys then return end 

    local maxplys       = hvhobkak.cfg.vars["Max targets"]
    local curplys       = #plys

    if maxplys != 0 and curplys > maxplys then
        curplys = maxplys
    end

    local aimAng
    for i = 1, curplys do
		local ply = plys[i][1]

        if not hvhobkak.cfg.vars["Always backtrack"] then
            local bones = hvhobkak.GetBones( ply )

            for o = 1, #bones do
                local bone = bones[o]
                aimAng = ( bone - me:EyePos() ):Angle()

                if hvhobkak.VisibleCheck( ply, bone, nil, aimAng:Forward() ) then 
                    hvhobkak.target = ply
                    return ply, bone, aimAng, false, 0
                end
            end
        /*elseif hvhobkak.cfg.vars["Extrapolation"] and hvhobkak.predicted[ ply ] then
            if not hvhobkak.predicted[ ply ].pos then return end

            aimAng = ( hvhobkak.predicted[ ply ].pos - me:EyePos() ):Angle()

            hvhobkak.traceStruct.start = me:EyePos()
            hvhobkak.traceStruct.endpos = hvhobkak.predicted[ ply ].pos
            hvhobkak.traceStruct.filter = me
            hvhobkak.traceStruct.mask = MASK_SHOT

            local tr = TraceLine( hvhobkak.traceStruct )

            if !tr.Hit or tr.Entity == ply then
                hvhobkak.target = ply
                return ply, hvhobkak.predicted[ ply ].pos, aimAng, false, 0
            end*/
        end

        if hvhobkak.cfg.vars["Backtrack"] then
            local ticks = hvhobkak.FindBacktrack( cmd, ply )

            if hvhobkak.btrecords[ ply ] and not ply.break_lc then 
                local ts = 0 
                
                if hvhobkak.cfg.vars["Backtrack mode"] == 3 then
                    for p = 1, #ticks do
                        if not hvhobkak.btrecords[ ply ][ p ] then continue end

                        aimAng = ( hvhobkak.btrecords[ ply ][ p ].aimpos - me:EyePos() ):Angle()

                        hvhobkak.traceStruct.start = me:EyePos()
                        hvhobkak.traceStruct.endpos = hvhobkak.btrecords[ ply ][ p ].aimpos
                        hvhobkak.traceStruct.filter = me
                        hvhobkak.traceStruct.mask = MASK_SHOT

                        local tr = TraceLine( hvhobkak.traceStruct )

                        if !tr.Hit or tr.Entity == ply then
                            hvhobkak.target = ply
                            hvhobkak.backtracktick = p

                            return ply, hvhobkak.btrecords[ ply ][ p ].aimpos, aimAng, true, p
                        end
                    end
                end

                if hvhobkak.cfg.vars["Backtrack mode"] == 3 then return end

                if hvhobkak.cfg.vars["Backtrack mode"] == 1 then
                    ts = hvhobkak.FindFirstHittableTicks( ply, cmd )
                elseif hvhobkak.cfg.vars["Backtrack mode"] == 2 then
                    ts = hvhobkak.FindClosestHittableTicks( ply, cmd )
                end

                if not hvhobkak.btrecords[ ply ][ ts ] then return end

                aimAng = ( hvhobkak.btrecords[ ply ][ ts ].aimpos - me:EyePos() ):Angle()

                hvhobkak.traceStruct.start = me:EyePos()
                hvhobkak.traceStruct.endpos = hvhobkak.btrecords[ ply ][ ts ].aimpos
                hvhobkak.traceStruct.filter = me
                hvhobkak.traceStruct.mask = MASK_SHOT

                local tr = TraceLine( hvhobkak.traceStruct )

                if !tr.Hit or tr.Entity == ply then
                    hvhobkak.target = ply
                    hvhobkak.backtracktick = ts

                    return ply, hvhobkak.btrecords[ ply ][ ts ].aimpos, aimAng, true, ts
                end
            end
        end
	end
end

function hvhobkak.IsMovementKeysDown( cmd )

    if cmd:KeyDown( IN_MOVERIGHT ) then
        return true 
    end 
    
    if cmd:KeyDown( IN_MOVELEFT ) then
        return true 
    end 

    if cmd:KeyDown( IN_FORWARD ) then
        return true 
    end 

    if cmd:KeyDown( IN_BACK ) then
        return true 
    end 

    return false
end

function hvhobkak.MovementFix( cmd, wish_yaw )

	local pitch = math_NormalizeAngle( cmd:GetViewAngles().x )
	local inverted = -1
	
	if ( pitch > 89 || pitch < -89 ) then
		inverted = 1
	end

	local ang_diff = math_rad( math_NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw ) * inverted ) )

	local forwardmove = cmd:GetForwardMove()
	local sidemove = cmd:GetSideMove()

	local new_forwardmove = forwardmove * -math_cos( ang_diff ) * inverted + sidemove * math_sin( ang_diff )
	local new_sidemove = forwardmove * math_sin( ang_diff ) * inverted + sidemove * math_cos( ang_diff )

	cmd:SetForwardMove( new_forwardmove )
	cmd:SetSideMove( new_sidemove )
end

function hvhobkak.SilentAngles(cmd)
	if !hvhobkak.SilentAngle then hvhobkak.SilentAngle = cmd:GetViewAngles() end

	hvhobkak.SilentAngle = hvhobkak.SilentAngle + Angle( cmd:GetMouseY() * hvhobkak.myaw, cmd:GetMouseX() * -hvhobkak.myaw, 0)
	hvhobkak.SilentAngle.p = math_Clamp( hvhobkak.SilentAngle.p, -89, 89 )
    hvhobkak.SilentAngle.r = 0
    
    hvhobkak.SilentAngle:Normalize()
end





















// Knife bot ( Etot zaichik knifer )

hvhobkak.knifes = {}

hvhobkak.knifes[1] = {
    str = "csgo_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

hvhobkak.knifes[2] = {
    str = "swb_",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

hvhobkak.knifes[3] = {
    str = "weapon_crowba",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 75*75,

    rightdmg = 10,
    rightdmgb = 10,
    rightdist = 75*75,
}

hvhobkak.knifes[4] = {
    str = "knife_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

hvhobkak.knifes[5] = {
    str = "umb_",

    canbackstab = false,

    leftdmg = 1000,
    leftdmgb = 1000,
    leftdist = 300*300,

    rightdmg = 1000,
    rightdmgb = 1000,
    rightdist = 300*300,
}

function hvhobkak:EntityFaceBack( ent )
    local angle = me:GetAngles().y - ent:GetAngles().y

    if angle < -180 then angle = 360 + angle end

    if angle <= 90 and angle >= -90 then return true end

    return false
end

function hvhobkak.CanStab( ent, pos, health )
    local mypos = me:GetShootPos()
    local tbl = hvhobkak.knifes[1]
    local wc = me:GetActiveWeapon():GetClass()
    local canuse = false 

    for i = 1, #hvhobkak.knifes do
        if StartsWith(wc,hvhobkak.knifes[i].str) then
            canuse = true 
            tbl = hvhobkak.knifes[i]
            break
        end
    end 

    if not canuse then return false, false end

    if hvhobkak.canBacktrack( ent ) and hvhobkak.btrecords[ent][hvhobkak.backtracktick] then
        pos = hvhobkak.btrecords[ ent ][ hvhobkak.backtracktick ].aimpos
    end

    local backstab = tbl.canbackstab and hvhobkak:EntityFaceBack( ent ) or false
    local dist = mypos:DistToSqr( pos )
    local mode = hvhobkak.cfg.vars["Knifebot mode"]
    
    if mode == 1 then // Damage mode - tries to inflict biggest possible damage
        if backstab and dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist or  ( dist < tbl.rightdist and health - tbl.leftdmg > 0 )  then 
            return true, true
        end
    elseif mode == 2 then // Fast - tries to hit fast as possible
        if dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist then
            return true, false
        end
    elseif mode == 3 then // Fatal - deals only fatal damage
        if dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist and ( ( backstab and health - tbl.rightdmgb <= 0 ) or ( health - tbl.rightdmg <= 0 ) ) then
            return true, true
        end
    end

    return false, false
end

function hvhobkak.simtimeCheck( v )
    if not hvhobkak.cfg.vars["Wait for simtime update"] then return true end

    return v.simtime_updated
end

// Crossbow prediction 

function hvhobkak.CrossbowPred( cmd )
    if not hvhobkak.CanShoot( cmd ) then return end

    local plys = hvhobkak.GetSortedPlayers( hvhobkak.cfg.vars["Target selection"] )

    if !plys then return end

    for i = 1, #plys do
        local ply = plys[i][1]

        local eyePos        = me:EyePos()

        local plyPos        = ply:GetPos()
        local plyCenter     = ply:OBBCenter()

        local aimPos        = plyPos + plyCenter
        local aimAngle      = ( aimPos - eyePos ):Angle()
        local aimVector     = aimAngle:Forward()

        local velStart      = aimVector * 3500

        local distance      = eyePos:Distance( aimPos )
        local travelTime    = distance / 3500

        // Movement simulation 
        local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if predTime > hvhobkak.cfg.vars["Simulation limit"] then continue end

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, hvhobkak.TIME_TO_TICKS( predTime ) do
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()

        aimPos              = data.m_vecAbsOrigin + plyCenter
        distance            = eyePos:Distance( aimPos )
        travelTime          = distance / 3500

        ded.FinishSimulation()

        // Gravity simulation
        local gravity       = GetConVar("sv_gravity"):GetFloat() * 0.05
        gravity             = ( gravity * TickInterval ) * hvhobkak.TIME_TO_TICKS( travelTime )

        aimPos.z            = aimPos.z + gravity

        // Aimbot 

        local finalVec = Vector( aimPos.x, aimPos.y, aimPos.z )
        local finalAng = ( finalVec - eyePos ):Angle()
        finalAng:Normalize()

        debugoverlay.Line( plyPos + plyCenter, finalVec, 0.1, color_white, true )

        cmd:SetViewAngles( finalAng )
    end
end

// Propkill aimbot

hvhobkak.grabbingEnt = false 

function hvhobkak.DrawPhysgunBeam( ply, wep, e, tar, bone, hitpos )
    if ply != me then return end 

    hvhobkak.grabbingEnt = IsValid( tar ) and tar or false
end

hvhobkak.predictedPoint = {}
function hvhobkak.PropAim( cmd )
    if not hvhobkak.grabbingEnt or not IsValid( hvhobkak.grabbingEnt ) or not cmd:KeyDown( IN_ATTACK ) then return end

    local plys = hvhobkak.GetSortedPlayers( hvhobkak.cfg.vars["Target selection"] )
    hvhobkak.target = false
    hvhobkak.targetVector = false

    if !plys then return end

    for i = 1, #plys do
        local ply           = plys[i][1]

        local eyePos        = me:EyePos() 

        local plyPos        = ply:GetPos()
        local plyVel        = ply:GetVelocity()
        local plyCenter     = ply:OBBCenter()
        local plySpeed      = plyVel:Length()
        //local plyPred       = plyPos + plyVel * TickInterval

        local propPos       = hvhobkak.grabbingEnt:GetPos()
        local propVel       = hvhobkak.grabbingEnt:GetVelocity()
        local propSpeed     = propVel:Length()

        local distance      = plyPos:Distance( propPos )
        local plydist       = plyPos:Distance( eyePos )

        if plydist >= 4096 then continue end

        local travelTime    = distance / propSpeed
        //local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if travelTime > hvhobkak.cfg.vars["Simulation limit"] then continue end // predTime

        // Prediction

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, hvhobkak.TIME_TO_TICKS( travelTime ) do // predTime
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()
        local aimPos        = data.m_vecAbsOrigin + plyCenter

        distance            = aimPos:Distance( propPos )
        travelTime          = distance / propSpeed

        ded.FinishSimulation()

        // Mouse wheel shit

        local deltaDistance = plydist - distance
        local scrollDelta = -deltaDistance

        // Aim

        local aimAng        = ( aimPos - me:EyePos() ):Angle()
        aimAng:Normalize()

        cmd:SetMouseWheel( scrollDelta ) 
        cmd:SetViewAngles( aimAng )

        /* Method 1
        local scrollDelta = 0

        if distance == 0 then
            scrollDelta = 0
        elseif propSpeed > plySpeed then
            scrollDelta = - ( distance / propSpeed )
        else
            scrollDelta = distance / plySpeed
        end
        */


        /*



        
        local predticks = hvhobkak.TIME_TO_TICKS( ded.GetLatency(0) + ded.GetLatency(1) ) + 1

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, predticks do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()

        pos = data.m_vecAbsOrigin + ply:OBBCenter()

        ded.FinishSimulation()

        local dist = pos:DistToSqr( me:EyePos() )

        local clr = dist < 16777216 and Color( 0, 255, 0 ) or Color( 255, 0, 0 )

        debugoverlay.Line( pos, hvhobkak.grabbingEnt:GetPos(), 0.1, clr, true )
        debugoverlay.Box( pos - ply:OBBCenter(), ply:OBBMins(), ply:OBBMaxs(), 0.1, Color( 255, 15, 15, 32 ) )

        if dist >= 16777216 then continue end

        local aimAng = ( pos - me:EyePos() ):Angle()
        local ppd = hvhobkak.grabbingEnt:GetPos():DistToSqr( pos )

        local cd = hvhobkak.cfg.vars["PA thrower dist"]
        if ppd < ( cd * cd ) and hvhobkak.cfg.vars["PA thrower"] then
            cmd:RemoveKey( IN_ATTACK )
        end

        local bmd = math_sqrt( dist - ppd )

        if ( dist - ppd ) < 0 then bmd = 0 end 

        local scrollDelta = math_ceil( bmd > 0 and -ppd or ppd )

        if scrollDelta > 5000 then
            scrollDelta = 5000
        elseif scrollDelta < -5000 then
            scrollDelta = -5000
        end

        print( "SDelta", scrollDelta, "BMD", bmd, "PPD", ppd )

        cmd:SetMouseWheel( scrollDelta )
        cmd:SetViewAngles( aimAng )
        */
    end
end

function hvhobkak.Aim(cmd)
    hvhobkak.AntiAim(cmd)

    if hvhobkak.SendPacket then
        hvhobkak.fakeAngles.angle = cmd:GetViewAngles()
        hvhobkak.fakeAngles.movex = me:GetPoseParameter("move_x")
        hvhobkak.fakeAngles.movey = me:GetPoseParameter("move_y")

        local layers = {}

        for i = 0, 13 do
            if me:IsValidLayer(i) then
                layers[i] = {
                    cycle = me:GetLayerCycle(i),
                    sequence = me:GetLayerSequence(i),
                    weight = me:GetLayerWeight(i)
                }
            end
        end

        hvhobkak.fakeAngles.origin = me:GetNetworkOrigin()
        hvhobkak.fakeAngles.seq = me:GetSequence()
        hvhobkak.fakeAngles.cycle = me:GetCycle()
    else
        hvhobkak.realAngle = cmd:GetViewAngles()
    end

    local ply, bone, aimang, backtracking, bttick = hvhobkak.SelectTarget(cmd)

    hvhobkak.targetVector = bone 

    if not aimang then return end

    aimang:Normalize()  

    if not hvhobkak.cfg.vars["Enable aimbot"] or not ply then return end

    /*local targetTime = ded.GetSimulationTime( ply:EntIndex() )
    local timeOffset = ded.GetServerTime(cmd) - targetTime

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - targetTime

    if diff > 1 and hvhobkak.cfg.vars["Adjust tickcount"] then return end*/

    local oldangs = Angle(aimang)

    if hvhobkak.cfg.vars["Always backtrack"] and not backtracking then return end

    if hvhobkak.cfg.vars["Fov limit"] then
        local fov = hvhobkak.cfg.vars["Aimbot FOV"]

		local view = hvhobkak.cfg.vars["Silent aim"] and hvhobkak.SilentAngle or cmd:GetViewAngles()
		local ang = aimang - view

		ang:Normalize()

		ang = math_sqrt(ang.x * ang.x + ang.y * ang.y)

        if ang > fov then
            hvhobkak.targetVector = false
		    return 
        end
    end

    if not hvhobkak.CanShoot(cmd) or not hvhobkak.simtimeCheck( ply ) then return end
    if not hvhobkak.cfg.vars["Aimbot smoothing"] and hvhobkak.SkipCommand then return end

    hvhobkak.aimingrn = true

    // Knife bot 
    local altfire = false
    local canstab, rightstab = hvhobkak.CanStab( ply, bone, ply:Health() )

    if hvhobkak.cfg.vars["Knifebot"] and canstab then
        altfire = rightstab
    elseif hvhobkak.cfg.vars["Knifebot"] and not canstab then
        return 
    end

    local oldAimAng = aimang
    local finalAngle = aimang

    if hvhobkak.cfg.vars["Norecoil"] then
        finalAngle = hvhobkak.NoRecoil(finalAngle)
    end

    if hvhobkak.cfg.vars["Force seed"] then
        //ded.ForceSeed( cmd )
    end

    if hvhobkak.cfg.vars["Nospread"] then
        finalAngle = hvhobkak.NoSpread(cmd,finalAngle)
    end

    if hvhobkak.cfg.vars["On shot aa"] then
        finalAngle.p = -finalAngle.p - 180
        finalAngle.y = finalAngle.y + 180
    end
    
    if hvhobkak.cfg.vars["Facestab"] then
        local angles = ply:EyeAngles()

        finalAngle.y = angles.y
        finalAngle.p = angles.p

        altfire = true
    end

    if hvhobkak.cfg.vars["Aimbot smoothing"] then
        local va = cmd:GetViewAngles()
        va.r = 0

        local rat = hvhobkak.cfg.vars["Smoothing"] * 100
        local ret = LerpAngle( FrameTime()*rat, va, finalAngle )
        
        finalAngle = ret
    end

    if hvhobkak.cfg.vars["Projectile aimbot"] then
        local predTime = math.ceil( ( me:EyePos() ):DistToSqr( ply:GetPos() ) / 3600 )

        //print( predTime )

        //if predTime > 15 then return end

        ded.StartSimulation( ply:EntIndex() )

        for tick = 1, predTime do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()
        local vec = data.m_vecAbsOrigin

        ded.FinishSimulation()

        local g = predTime * 0.111

        print( vec.z, g )

        vec.z = vec.z + g 

        finalAngle = ( vec - me:EyePos() ):Angle()
        finalAngle:Normalize()  
    end

    //ded.SetContextMenu( cmd, hvhobkak.cfg.vars["pSilent"] or hvhobkak.cfg.vars["Facestab"] )
    if hvhobkak.cfg.vars["Facestab"] then
        cmd:SetViewAngles( finalAngle )
        ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    elseif hvhobkak.cfg.vars["pSilent"] then
        ded.SetContextVector( cmd, finalAngle:Forward(), true )
        //ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    else
        cmd:SetViewAngles( finalAngle )
    end

    if backtracking then
        targetTime = hvhobkak.btrecords[ply][bttick].simulationtime
        timeOffset = ded.GetServerTime(cmd) - targetTime

        serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
        diff = serverArriveTick - hvhobkak.btrecords[ply][bttick].simulationtime

        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            local tick = hvhobkak.TIME_TO_TICKS(targetTime)
            ded.SetCommandTick(cmd, tick)
        else
            ded.NetSetConVar("cl_interpolate","1")
            ded.NetSetConVar("cl_interp",tostring(ded.GetServerTime(cmd) - targetTime))
            local tick = hvhobkak.TIME_TO_TICKS(ded.GetServerTime(cmd))
            ded.SetCommandTick(cmd, tick - 1)
        end
    elseif hvhobkak.cfg.vars["Adjust tickcount"] then
        //if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")

            ded.SetCommandTick(cmd, hvhobkak.TIME_TO_TICKS( ded.GetSimulationTime( ply:EntIndex() ) ) )
        //else
        //    ded.NetSetConVar("cl_interpolate","1")
        //    ded.NetSetConVar("cl_interp",tostring(ded.GetServerTime(cmd) - targetTime))

        //    local tick = hvhobkak.TIME_TO_TICKS(ded.GetServerTime(cmd))
        //    ded.SetCommandTick(cmd, tick - 1)
        //end
    end

    if hvhobkak.cfg.vars["Auto fire"] then
        if StartsWith( hvhobkak.activeWeaponClass, "m9k_" ) then
            cmd:RemoveKey( IN_SPEED )
        end

        hvhobkak.SendPacket = true
        me.simtime_updated = true
        ded.UpdateClientAnimation( me:EntIndex() )

        if hvhobkak.cfg.vars["Resolver"] then 
            ply.aimshots = (ply.aimshots or 0) + 1
        end

        local isAutomatic = true

        if hvhobkak.activeWeapon.Primary then
            isAutomatic = hvhobkak.activeWeapon.Primary.Automatic
        else
            if class == "weapon_pistol" then
                isAutomatic = false
            end
        end

        if altfire or ( hvhobkak.cfg.vars["Alt Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
            cmd:AddKey(IN_ATTACK2)
        else
            if isAutomatic or ( hvhobkak.cfg.vars["Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
                cmd:AddKey(IN_ATTACK)
            end
        end

        hvhobkak.SkipCommand = true 
    end
end

function hvhobkak.autoReload(cmd)
    if !hvhobkak.cfg.vars["Auto reload"] then return end

	local wep = me:GetActiveWeapon()

	if IsValid(wep) then
		if wep.Primary then
			if wep:Clip1() == 0 and wep:GetMaxClip1() > 0 and me:GetAmmoCount(wep:GetPrimaryAmmoType()) > 0 then
				cmd:AddKey(IN_RELOAD)
			end
		end
	end
end

// adaptive Cstrafe

hvhobkak.last_ground_pos = 0
hvhobkak.cstrafe_dir = 0

function hvhobkak.PredictVelocity( velocity, viewangles, dir, maxspeed, accel )

	local forward = viewangles:Forward()
	local right = viewangles:Right()
	
	local fmove = 0
	local smove = ( dir == 1 ) && -10000 || 10000
	
	forward.z = 0
	right.z = 0
	
	forward:Normalize()
	right:Normalize()

	local wishdir = Vector( forward.x*fmove + right.x*smove, forward.y*fmove + right.y*smove, 0 )
	local wishspeed = wishdir:Length()
	
	wishdir:Normalize()
	
	if ( wishspeed != 0 && wishspeed > maxspeed ) then
		wishspeed = maxspeed
	end
	
	local wishspd = wishspeed
	
	if ( wishspd > 30 ) then
		wishspd = 30
	end
	
	local currentspeed = velocity:Dot( wishdir )
	local addspeed = wishspd - currentspeed
	
	if ( addspeed <= 0 ) then
		return velocity
	end
	
	local accelspeed = accel * wishspeed * TickInterval
	
	if ( accelspeed > addspeed ) then
		accelspeed = addspeed
	end
	
	return velocity + ( wishdir * accelspeed )

end
    
function hvhobkak.PredictMovement( viewangles, dir, angle )

	local pm

	local sv_airaccelerate = GetConVarNumber( "sv_airaccelerate" )
	local sv_gravity = GetConVarNumber( "sv_gravity" )
	local maxspeed = me:GetMaxSpeed()
	local jump_power = me:GetJumpPower()

	local origin = me:GetNetworkOrigin()
	local velocity = me:GetAbsVelocity()
	
	local mins = me:OBBMins()
	local maxs = me:OBBMaxs()

    local pticks = math_Round(hvhobkak.cfg.vars["CStrafe ticks"])
	
	local on_ground = me:IsFlagSet( FL_ONGROUND )
	
	for i = 1, pticks do

		viewangles.y = math_NormalizeAngle( math_deg( math_atan2( velocity.y, velocity.x ) ) + angle )

		velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )

		if ( on_ground ) then
		
			velocity.z = jump_power
			velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )
			
		end

		velocity = hvhobkak.PredictVelocity( velocity, viewangles, dir, maxspeed, sv_airaccelerate )
		
		local endpos = origin + ( velocity * TickInterval )

		pm = TraceHull( {
			start = origin,
			endpos = endpos,
			filter = me,
			maxs = maxs,
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		if ( ( pm.Fraction != 1 && pm.HitNormal.z <= 0.9 ) || pm.AllSolid || pm.StartSolid ) then
			return false
		end
		
		if ( pm.Fraction != 1 ) then
		
			local time_left = TickInterval

			for j = 1, 2 do
			
				time_left = time_left - ( time_left * pm.Fraction )

				local dot = velocity:Dot( pm.HitNormal )
				
				velocity = velocity - ( pm.HitNormal * dot )

				dot = velocity:Dot( pm.HitNormal )

				if ( dot < 0 ) then
					velocity = velocity - ( pm.HitNormal * dot )
				end

				endpos = pm.HitPos + ( velocity * time_left )

				pm = TraceHull( {
					start = pm.HitPos,
					endpos = endpos,
					filter = me,
					maxs = maxs,
					mins = mins,
					mask = MASK_PLAYERSOLID
				} )

				if ( pm.Fraction == 1 || pm.AllSolid || pm.StartSolid ) then
					break
				end
			
			end
			
		end
		
		origin = pm.HitPos
		
		if ( ( hvhobkak.last_ground_pos - origin.z ) > math_Round(hvhobkak.cfg.vars["CStrafe ground diff"]) ) then
			return false
		end
		
		pm = TraceHull( {
			start =  Vector( origin.x, origin.y, origin.z + 2 ),
			endpos = Vector( origin.x, origin.y, origin.z - 1 ),
			filter = me,
			maxs = Vector( maxs.x, maxs.y, maxs.z * 0.5 ),
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		on_ground = ( ( pm.Fraction < 1 || pm.AllSolid || pm.StartSolid ) && pm.HitNormal.z >= 0.7 )
		
		velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )
		
		if ( on_ground ) then
			velocity.z = 0
		end


	end

	return true

end

function hvhobkak.CircleStrafe( cmd )

	local angle = 0
	
	while ( hvhobkak.cstrafe_dir < 2 ) do
	
		angle = 0
		local path_found = false
		local step = ( hvhobkak.cstrafe_dir == 1 ) && math_Round(hvhobkak.cfg.vars["CStrafe angle step"]) || -math_Round(hvhobkak.cfg.vars["CStrafe angle step"])
		
		while ( true ) do
		
			if ( hvhobkak.cstrafe_dir == 1 ) then
			
				if ( angle > math_Round(hvhobkak.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			else
			
				if ( angle < -math_Round(hvhobkak.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			end

			if ( hvhobkak.PredictMovement( cmd:GetViewAngles(), hvhobkak.cstrafe_dir, angle ) ) then
			
				path_found = true
				break
			
			end

			angle = angle + step
		
		end
		
		if ( path_found ) then
			break
		end
		
		hvhobkak.cstrafe_dir = hvhobkak.cstrafe_dir + 1
	
	end
	
	if ( hvhobkak.cstrafe_dir < 2 ) then
	
		local velocity = me:GetAbsVelocity()
		local viewangles = cmd:GetViewAngles()
		
		viewangles.y = math_NormalizeAngle( math_deg( math_atan2( velocity.y, velocity.x ) ) + angle )
		
		cmd:SetViewAngles( viewangles )
		cmd:SetSideMove( ( hvhobkak.cstrafe_dir == 1 ) && -10000 || 10000 )
	
	else
	
		hvhobkak.cstrafe_dir = 0
	
	end

end

do
    local ztick = 0
    local prev_yaw = 0
    local old_yaw = 0.0

    function hvhobkak.AutoStrafe( cmd )
        ztick = ztick + 1

        if ( hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Circle strafe"]) and hvhobkak.cfg.vars["Circle strafe"] ) then
        
            hvhobkak.CircleStrafe( cmd )
    
        elseif ( hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Z Hop"]) and hvhobkak.cfg.vars["Z Hop"] ) then
            local handler = ztick / 3.14
            
            cmd:SetSideMove( 5000 * math_sin(handler) )
        elseif hvhobkak.cfg.vars["Air strafer"] and hvhobkak.cfg.vars["Strafe mode"] == 3 then
    
            local get_velocity_degree = function(velocity)
                local tmp = math_deg(math_atan(30.0 / velocity))
                    
                if (tmp > 90.0) then
                    return 90.0
                elseif (tmp < 0.0) then
                    return 0.0
                else
                    return tmp
                end
            end
    
            local M_RADPI = 57.295779513082
            local side_speed = 10000
            local velocity = me:GetVelocity()
            velocity.z = 0.0
    
            local forwardmove = cmd:GetForwardMove()
            local sidemove = cmd:GetSideMove()
    
            if (!forwardmove || !sidemove) then
                return
            end
    
            if(velocity:Length2D() <= 15.0 && !(forwardmove != 0 || sidemove != 0)) then
                return
            end
    
            local flip = cmd:TickCount() % 2 == 0
    
            local turn_direction_modifier = flip && 1.0 || -1.0
            local viewangles = Angle(hvhobkak.SilentAngle.x, hvhobkak.SilentAngle.y, hvhobkak.SilentAngle.z)
    
            if (forwardmove || sidemove) then
                cmd:SetForwardMove(0)
                cmd:SetSideMove(0)
    
                local turn_angle = math_atan2(-sidemove, forwardmove)
                viewangles.y = viewangles.y + (turn_angle * M_RADPI)
            elseif (forwardmove) then
                cmd:SetForwardMove(0)
            end
    
            local strafe_angle = math_deg(math_atan(15 / velocity:Length2D()))
    
            if (strafe_angle > 90) then
                strafe_angle = 90
            elseif (strafe_angle < 0) then
                strafe_angle = 0
            end
    
            local temp = Vector(0, viewangles.y - old_yaw, 0)
            temp.y = math_NormalizeAngle(temp.y)
    
            local yaw_delta = temp.y
            old_yaw = viewangles.y
    
            local abs_yaw_delta = math_abs(yaw_delta)
    
            if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
                local velocity_angles = velocity:Angle()
    
                temp = Vector(0, viewangles.y - velocity_angles.y, 0)
                temp.y = math_NormalizeAngle(temp.y)
    
                local velocityangle_yawdelta = temp.y
                local velocity_degree = get_velocity_degree(velocity:Length2D() * 128)
    
                if (velocityangle_yawdelta <= velocity_degree || velocity:Length2D() <= 15) then
                    if (-velocity_degree <= velocityangle_yawdelta || velocity:Length2D() <= 15) then
                        viewangles.y = viewangles.y + (strafe_angle * turn_direction_modifier)
                        cmd:SetSideMove(side_speed * turn_direction_modifier)
                    else
                        viewangles.y = velocity_angles.y - velocity_degree
                        cmd:SetSideMove(side_speed)
                    end
                else
                    viewangles.y = velocity_angles.y + velocity_degree
                    cmd:SetSideMove(-side_speed)
                end
            elseif (yaw_delta > 0) then
                cmd:SetSideMove(-side_speed)
            elseif (yaw_delta < 0) then
                cmd:SetSideMove(side_speed)
            end
    
            local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
            local speed = move:Length()
    
            local angles_move = move:Angle()
    
            local normalized_x = math.modf(hvhobkak.SilentAngle.x + 180, 360) - 180
            local normalized_y = math.modf(hvhobkak.SilentAngle.y + 180, 360) - 180
    
            local yaw = math_rad(normalized_y - viewangles.y + angles_move.y)
    
            if (normalized_x >= 90 || normalized_x <= -90 || hvhobkak.SilentAngle.x >= 90 && hvhobkak.SilentAngle.x <= 200 || hvhobkak.SilentAngle.x <= -90 && hvhobkak.SilentAngle.x <= 200) then
                cmd:SetForwardMove(-math_cos(yaw) * speed)
            else
                cmd:SetForwardMove(math_cos(yaw) * speed)
            end
    
            cmd:SetSideMove(math_sin(yaw) * speed)

        elseif hvhobkak.cfg.vars["Air strafer"] and hvhobkak.cfg.vars["Strafe mode"] == 2 then
            cmd:SetForwardMove(0)

            if me:IsFlagSet( FL_ONGROUND ) then
                cmd:SetForwardMove(10000)
            else
                cmd:SetForwardMove(5850 / me:GetVelocity():Length2D())
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && -400 || 400)
            end

            /*

local ang_diff = math_NormalizeAngle( hvhobkak.SilentAngle.y - prev_yaw )
            
            if ( math_abs( ang_diff ) > 0 ) then
            
                if ( ang_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end
            
            else
            
                local vel = me:GetAbsVelocity()
                local vel_yaw = math_NormalizeAngle( math_deg( math_atan2( vel.y, vel.x ) ) )
                local vel_yaw_diff = math_NormalizeAngle( hvhobkak.SilentAngle.y - vel_yaw )
                
                if ( vel_yaw_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end
    
                local viewangles = cmd:GetViewAngles() //hvhobkak.SilentAngle //Angle( hvhobkak.SilentAngle.x, hvhobkak.SilentAngle.y, 0 )
                viewangles.y = vel_yaw
                cmd:SetViewAngles( viewangles )
                
            end
    
            prev_yaw = hvhobkak.SilentAngle.y
            */
            
            
        end
    end
end

/*
    Anti aim

*/

hvhobkak.aatarget = nil

function hvhobkak.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * TickInterval
end

function hvhobkak.PredictedEyePos()
    return me:EyePos() + me:GetVelocity() * TickInterval
end

function hvhobkak.GetBaseYaw()
    if not IsValid( hvhobkak.aatarget ) or hvhobkak.cfg.vars["Yaw base"] != 2 then
        return hvhobkak.SilentAngle.y
    end

    return math_NormalizeAngle( (hvhobkak.PredictedPos(hvhobkak.aatarget) - hvhobkak.PredictedEyePos()):Angle().y )
end

function hvhobkak.Freestand(cmd)
	if !IsValid(hvhobkak.aatarget) then return false end

	local headpos = me:GetBonePosition(me:LookupBone("ValveBiped.Bip01_Head1"))
	if !headpos then return end

	local selfpos = me:GetPos()
	local headoffset = Vector(selfpos.x, selfpos.y, headpos.z):Distance(headpos) + 5

	local found = true

	local pos = hvhobkak.aatarget:WorldToLocal(selfpos)
	local bearing = math_deg(-math_atan2(pos.y, pos.x)) + 180 + 90
	local left, right = bearing - 180 - 90, bearing - 180 + 90

	local function CheckYaw(yaw)
		yaw = math_rad(yaw)
		local x, y = math_sin(yaw), math_cos(yaw)

		local headoffsetvec = Vector(x, y, 0) * headoffset
		headoffsetvec.z = headpos.z - selfpos.z

		local tr = TraceLine({
			start = hvhobkak.aatarget:EyePos() + hvhobkak.aatarget:GetVelocity() * TickInterval * 4,
			endpos = selfpos + headoffsetvec,
			filter = hvhobkak.aatarget
		})

		return tr.Fraction < 1 and tr.Entity != me
	end

	local function Normalize(ang) return 360 - ang + 90 end

	local leftcheck, rightcheck = CheckYaw(left), CheckYaw(right)

	left, right = Normalize(left), Normalize(right)

	do
		local headlocal = me:WorldToLocal(headpos)
		if headlocal.x > 0 then
			left, right = right, left
		end
	end

	if leftcheck and rightcheck then
		return false
	elseif leftcheck then
		return true, left , right
	elseif rightcheck then
		return true, right, left
	end

	return false
end

hvhobkak.realAngle = me:EyeAngles()
hvhobkak.inverted = false
hvhobkak.oldYaw = 0
hvhobkak.SwaySide = 1

local baseyaw = 0

hvhobkak.CalcYaw = {
    // Backward
    [1] = function( cmd ) 
        return baseyaw - 178 
    end, 
    // Fake forward
    [2] = function( cmd )
        return hvhobkak.SendPacket and baseyaw or baseyaw + 178 
    end, 
    // Legit Delta
    [3] = function( cmd )     
        return hvhobkak.SendPacket and baseyaw or baseyaw + ( hvhobkak.inverted and 43 or - 43 )
    end,
    // Sideways 
    [4] = function( cmd )     
        local delta = hvhobkak.inverted and 89 or -89
        return baseyaw - ( hvhobkak.SendPacket and delta or -delta ) 
    end,
    // Half Sideways
    [5] = function( cmd )     
        local delta = hvhobkak.inverted and 89 or -89
        return baseyaw - ( hvhobkak.SendPacket and delta or 178 ) 
    end,
    // Fake Spin
    [6] = function( cmd )     
        local add = math_NormalizeAngle( CurTime() * hvhobkak.cfg.vars["Spin speed"] * 10 )
        return hvhobkak.SendPacket and ( hvhobkak.inverted and ( baseyaw - 178 ) or add ) or ( hvhobkak.inverted and add or ( baseyaw - 178 ) )
    end,
    // LBY Spin
    [7] = function( cmd )     
        return ded.GetCurrentLowerBodyYaw( me:EntIndex() ) + ( hvhobkak.SendPacket and 180 or 0)
    end,
    // LBY Breaker
    [8] = function( cmd )   
        local yaw = baseyaw - 178

        if me:GetVelocity():Length2D() > 1 then
            yaw = ded.GetCurrentLowerBodyYaw( me:EntIndex() ) + ( hvhobkak.SendPacket and 180 or 0)
        elseif not hvhobkak.SendPacket then
            local side = hvhobkak.inverted and -1 or 1
            local lbyTarget = ded.GetTargetLowerBodyYaw( me:EntIndex() )

            if math_abs( math_NormalizeAngle( lbyTarget - hvhobkak.oldYaw ) ) < hvhobkak.cfg.vars["LBY min delta"] then
                yaw = math_NormalizeAngle( hvhobkak.oldYaw + hvhobkak.cfg.vars["LBY break delta"] * side)
            else
                yaw = math_NormalizeAngle( ded.GetCurrentLowerBodyYaw( me:EntIndex() ) - 44 * side )
            end
        end
        
        return yaw
    end,
    // Sin Sway
    [9] = function( cmd )     
        local add = hvhobkak.cfg.vars["Sin add"]
        local sin = math_sin( CurTime() ) * hvhobkak.cfg.vars["Sin delta"]
        return hvhobkak.SendPacket and baseyaw + sin + add or baseyaw - sin - add
    end,
    // Pendulum Sway
    [10] = function( cmd )
        local ct = CurTime()
        local delta = hvhobkak.cfg.vars["Sin delta"]
        local ct1 = ( ct % 0.9 )
        local ct2 = ( ct % 2 )

        local x1 = ct2 * math_sin(ct1)
        local y1 = ct2 * -1 * math_cos(ct1)
    
        local x2 = x1 + ct1 * math_sin(ct2)
        local y2 = y1 - ct1 * math_cos(ct2)

        local sin = hvhobkak.SendPacket and x2 * delta or y2 * delta
        return baseyaw + sin
    end,
    // Lag Sway
    [11] = function( cmd )     
        local swaySpeed = (hvhobkak.fakeLagTicks + 1) / 12 * math.pi
        local swayAmount = math_sin(CurTime() * swaySpeed) * 45
    
        return ( baseyaw - 180 ) + 55 * hvhobkak.SwaySide + swayAmount * hvhobkak.SwaySide * -1
    end,
    // Fake Jitter
    [12] = function( cmd )     
        local delta = hvhobkak.cfg.vars["Jitter delta"]
        
        local a = hvhobkak.SendPacket and baseyaw - 178 or baseyaw - 178 + math_random( -delta, delta )
        local b = hvhobkak.SendPacket and baseyaw - 178 + math_random( -delta, delta ) or baseyaw - 178

        return hvhobkak.inverted and a or b
    end,
    // Kappa Jitter 
    [13] = function( cmd )    
        local delta = hvhobkak.cfg.vars["Jitter delta"]

        local a = hvhobkak.SendPacket and baseyaw - 178 or baseyaw + ( delta * hvhobkak.SwaySide )
        local b = hvhobkak.SendPacket and baseyaw + ( delta * hvhobkak.SwaySide ) or baseyaw - 178

        return hvhobkak.inverted and a or b
    end,
    // Abu Jitter 
    [14] = function( cmd )   
        local ctjit = math_sin( CurTime() * 30 ) * 25

        return ctjit + ( hvhobkak.SendPacket and baseyaw - 160 * hvhobkak.SwaySide or baseyaw - 160 * -hvhobkak.SwaySide )
    end,
    // Satanic spinner 
    [15] = function( cmd ) 
        local side = hvhobkak.inverted and 1 or -1
        local satanicvalue = math_sin( CurTime() * 666 ) * 666

        return math_NormalizeAngle( hvhobkak.SendPacket and satanicvalue * side or satanicvalue * -side )
    end,
    // Custom aa
    [16] = function( cmd )   
        return hvhobkak.SendPacket and baseyaw + hvhobkak.cfg.vars["Custom real"] or baseyaw + hvhobkak.cfg.vars["Custom fake"]
    end,
    // Hand block 
    [17] = function( cmd )  








    end,
} 







do
    local pitch, yaw = 0, 0 

    local pitches = { 
        [1] = 89,
        [2] = -89,
        [3] = 0,
        [4] = -180,
        [5] = 180,
    }







 






    local mm_side = false
    local side = false
    local pitchflip = false

    local side = 1

    local function CalcPitch()
        local cfg = hvhobkak.cfg.vars["Pitch"]
        local x = 0

        if cfg <= 5 then return pitches[cfg] end

        if hvhobkak.SendPacket then
            pitchflip = not pitchflip
        end
        
        if cfg == 6 then
            x = pitchflip and 180 or -180
        elseif cfg == 7 then
            x = hvhobkak.SendPacket and 89 or -180
        elseif cfg == 8 then
            x = hvhobkak.cfg.vars["Custom pitch"] 
        end

        return x
    end

    /*




        elseif cfg == 7 then
            
        elseif cfg == 8 then
            
        elseif cfg == 9 then
            local sin = math_sin( CurTime() ) * 89
            y = hvhobkak.SendPacket and baseyaw + sin or baseyaw - sin
        elseif cfg == 10 then
            local side = ded.GetPreviousTick() % 2 == 1

            y = hvhobkak.SendPacket and baseyaw - 180 or baseyaw + ( side and -89 or 89 )    
        elseif cfg == 11 then

        elseif cfg == 12 then
            y = baseyaw + ( hvhobkak.SendPacket && hvhobkak.cfg.vars["Custom fake"] || hvhobkak.cfg.vars["Custom real"] )
        end

"Backward", 
        "Fake forward", 
        "Sideways", 
        "Half sideways", 
        "Fake spin", 
        "LBY", 
        "Kappa", 
        "Sway",
        "VDiff",
        "القضيب الطويل",
        "Lisp",
        "Custom",

if hvhobkak.cfg.vars["Jitter"] == 2 and hvhobkak.SendPacket then
            local r = math_random(-45,45)
            local lbydiff = ded.GetTargetLBY(me:EntIndex()) - ded.GetCurrentLBY(me:EntIndex())

            if y + r > ded.GetTargetLBY(me:EntIndex()) then
                y = y + math_random(-lbydiff,lbydiff)
            else
                y = y + r
            end
             
        elseif hvhobkak.cfg.vars["Jitter"] == 3 and hvhobkak.SendPacket then
            y = y + math_random(ded.GetCurrentLBY(me:EntIndex()),ded.GetTargetLBY(me:EntIndex()))
        end

        */
    
    local function micromovement(cmd)
        if !hvhobkak.cfg.vars["Micromovement"] then return end
        if !me:Alive() then return end
        if !me:IsFlagSet( FL_ONGROUND ) then return end
        if cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then return end

        cmd:SetSideMove(mm_side and -15.0 or 15.0)
        mm_side = !mm_side
    end

    local function aacheck(cmd)
        if !hvhobkak.cfg.vars["Anti aim"] then return false end
        if cmd:KeyDown(IN_ATTACK) then return false end
        if cmd:KeyDown(IN_USE) then return false end
        if hvhobkak.moveType == MOVETYPE_LADDER then return false end
        if hvhobkak.moveType == MOVETYPE_NOCLIP then return false end

        if hvhobkak.cfg.binds["Anti aim"] != 0 and not hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Anti aim"]) then
            return false
        end

        return true 
    end

    function hvhobkak.AntiAim(cmd)
        local freestandsucc, freestandsafe, freestandunsafe 

        if hvhobkak.cfg.vars["Freestanding"] then
            freestandsucc, freestandsafe, freestandunsafe = hvhobkak.Freestand(cmd)
        end

        if hvhobkak.SendPacket then
            hvhobkak.SwaySide = hvhobkak.SwaySide * -1 
        end

        baseyaw = hvhobkak.GetBaseYaw()
        pitch = CalcPitch()
        yaw = hvhobkak.CalcYaw[hvhobkak.cfg.vars["Yaw"] ](cmd)

        if hvhobkak.cfg.vars["Yaw randomisation"] then
            yaw = yaw + math_random( -0.9, 0.9 ) 
        end 

        if freestandsucc then
            yaw = hvhobkak.SendPacket and freestandunsafe or freestandsafe
        end

        if aacheck(cmd) then
            local pyAngle = Angle(pitch,yaw,0)

            micromovement(cmd)

            cmd:SetViewAngles(pyAngle)
            hvhobkak.oldYaw = pyAngle.y
        end
    end
end

/*
    Fake lag  
*/
hvhobkak.fakeLagTicks = 0
hvhobkak.fakeLagfactor = 0
hvhobkak.chokedTicks = 0

hvhobkak.peeked = false 
hvhobkak.peeking = false 

function hvhobkak.FakeLagOnPeek()
    hvhobkak.fakeLagTicks = 21 - hvhobkak.chokedTicks - 1 

    if hvhobkak.chokedTicks >= 20 then
        hvhobkak.peeked = true
		hvhobkak.peeking = false
		hvhobkak.SendPacket = true
        me.simtime_updated = true
        ded.UpdateClientAnimation( me:EntIndex() )
		return
    end
end

function hvhobkak.WarpOnPeek()
	ded.StartShifting( true )

	hvhobkak.peeked = true
	hvhobkak.peeking = false
end

function hvhobkak.CheckPeeking()
	local plys

	for extr = 1, 8 do
        plys = hvhobkak.GetSortedPlayers( 1, extr, 1, true ) 
		if plys then break end
	end

	if plys and !hvhobkak.peeking and !hvhobkak.peeked then
		hvhobkak.peeking = true
		hvhobkak.peeked = false
	elseif !plys then
		hvhobkak.peeking = false
		hvhobkak.peeked = false
	end

	if hvhobkak.peeking and !hvhobkak.peeked then
		if !ded.GetIsShifting() and ded.GetCurrentCharge() >= hvhobkak.cfg.vars["Shift ticks"] and hvhobkak.cfg.vars["Warp on peek"] then
			hvhobkak.WarpOnPeek()
        elseif hvhobkak.cfg.vars["Freeze on peek"] then
            ded.SetOutSequenceNr( ded.GetOutSequenceNr() + hvhobkak.maxFreezeTicks - 1 ) 
		//elseif hvhobkak.cfg.vars["Fake lag options-On peek"] then
		//	hvhobkak.FakeLagOnPeek()
		end
	end
end




do
    
    local function shouldlag(cmd)
        if not hvhobkak.cfg.vars["Fake lag"] then return false end
        if not me:Alive() then return false end
        if hvhobkak.cfg.vars["Fakelag comp"] == 1 and ded.GetCurrentCharge() > 0 then return false end
        if hvhobkak.cfg.vars["Fake lag options-Disable on ladder"] and hvhobkak.moveType == MOVETYPE_LADDER then return false end
        if hvhobkak.cfg.vars["Fake lag options-Disable in attack"] and cmd:KeyDown(IN_ATTACK) then return false end

        if hvhobkak.cfg.vars["Allah fly"] and not me:IsFlagSet( FL_ONGROUND ) then
            return false
        end

        return true
    end

    function hvhobkak.FakeLag(cmd)
        local factor = math_Round(hvhobkak.cfg.vars["Lag limit"])

        if hvhobkak.cfg.vars["Fake lag options-Randomise"] then 
            factor =  math_random(hvhobkak.cfg.vars["Lag randomisation"],factor) 
        end

        local velocity = me:GetVelocity():Length2D()
        local pertick = velocity * TickInterval
        local adaptive_factor = math_Clamp(math_ceil(64 / pertick),1,factor)

        if hvhobkak.cfg.vars["Lag mode"] == 1 or hvhobkak.cfg.vars["Lag mode"] == 3 then
            hvhobkak.fakeLagfactor = factor
        elseif hvhobkak.cfg.vars["Lag mode"] == 2 then
            hvhobkak.fakeLagfactor = adaptive_factor
        end

        if hvhobkak.cfg.vars["Allah walk"] and me:IsFlagSet( FL_ONGROUND ) and hvhobkak.IsKeyDown(hvhobkak.cfg.binds["allahwalk"]) then
            hvhobkak.fakeLagfactor = 21
        end

        //if hvhobkak.cfg.vars["Fakelag comp"] == 2 and ded.GetCurrentCharge() > 0 then 
        //    local nfactor = hvhobkak.fakeLagfactor - ded.GetMaxShiftTicks() - 1
        //    hvhobkak.fakeLagfactor = math_Clamp( nfactor, 0, 21 )
        //end

        if shouldlag(cmd) then
            hvhobkak.SendPacket = false

            if hvhobkak.fakeLagTicks <= 0 then
                hvhobkak.fakeLagTicks = hvhobkak.fakeLagfactor
                hvhobkak.SendPacket = true
                me.simtime_updated = true
                ded.UpdateClientAnimation( me:EntIndex() )
            else
                hvhobkak.fakeLagTicks = hvhobkak.fakeLagTicks - 1
            end

        else
            if hvhobkak.fakeLagfactor > 0 then hvhobkak.fakeLagfactor = 0 end
            hvhobkak.SendPacket = true
            me.simtime_updated = true
            ded.UpdateClientAnimation( me:EntIndex() )
        end
    end
end

function hvhobkak.ClampMovementSpeed(cmd, speed)
	local final_speed = speed;

	local squirt = math_sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

	if (squirt > speed) then
		local squirt2 = math_sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

		local cock1 = cmd:GetForwardMove() / squirt2;
		local cock2 = cmd:GetSideMove() / squirt2;

		local Velocity = me:GetVelocity():Length2D();

		if (final_speed + 1.0 <= Velocity) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
		else
			cmd:SetForwardMove(cock1 * final_speed)
			cmd:SetSideMove(cock2 * final_speed)
        end
    end
end

function hvhobkak.FastWalk( cmd )
    if not hvhobkak.cfg.vars["Ground strafer"] then return end 
    if math_abs(cmd:GetSideMove()) > 1 or math_abs(cmd:GetForwardMove()) < 1 then return end 
    if not me:IsFlagSet( FL_ONGROUND ) then return end

    if hvhobkak.moveType == MOVETYPE_NOCLIP or hvhobkak.moveType == MOVETYPE_LADDER then return end

    local waterLevel = me:WaterLevel()

    if waterLevel >= 2 then return end
    
	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function hvhobkak.validMoveType()
    return hvhobkak.moveType != MOVETYPE_LADDER and hvhobkak.moveType != MOVETYPE_NOCLIP and hvhobkak.moveType != MOVETYPE_OBSERVER 
end

function hvhobkak.isMoving(cmd)
    if not cmd then
        return false
    end

    return hvhobkak.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

function hvhobkak.Stop(cmd)
    if hvhobkak.validMoveType() and me:IsFlagSet( FL_ONGROUND ) then

        local moving = hvhobkak.isMoving(cmd)

        if not moving then

            local vel = me:GetVelocity()
            local dir = vel:Angle()
                
            dir.yaw = hvhobkak.SilentAngle.y - dir.yaw
                
            local newmove = dir:Forward() * vel:Length2D()
        
            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

// Slidewalk 

function hvhobkak.SlideWalk( cmd )
    local ticksToStop = hvhobkak.fakeLagfactor





end








// Auto peak 

hvhobkak.startedPeeking = false 
hvhobkak.needToMoveBack = false
hvhobkak.startPeekPosition = Vector(0,0,0)

function hvhobkak.MoveTo( cmd, pos )
    local ang = ( pos - me:GetPos() ):Angle().y

    cmd:SetForwardMove(1000)
    cmd:SetSideMove(0)

    cmd:AddKey(IN_SPEED)

    hvhobkak.MovementFix( cmd, ang )
end

function hvhobkak.checkAutopeak( cmd )
    if hvhobkak.startedPeeking and cmd:KeyDown(IN_ATTACK) then 
        hvhobkak.needToMoveBack = true
    elseif !hvhobkak.startedPeeking and !cmd:KeyDown(IN_ATTACK) then
        hvhobkak.needToMoveBack = false
    end  
end

do
    local colorA = Color( 235, 75, 75 )
    local colorB = Color( 75, 235, 75 )

    local apmat = Material( "gui/npc.png" )

    local nullangle = Angle(0,0,0)

    function hvhobkak.drawAutopeak()
        local col = hvhobkak.needToMoveBack and colorA or colorB
    
        cam_Start3D2D( hvhobkak.startPeekPosition, nullangle, 0.5 )
            cam_IgnoreZ( true )

            surface_SetDrawColor( col )
            surface_SetMaterial( apmat )
            surface_DrawTexturedRect( -32, -32, 64, 64 )

            cam_IgnoreZ( false )
        cam_End3D2D()
    end
end

function hvhobkak.autopeakThink()
    if hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Auto peak"]) then
        if not hvhobkak.startedPeeking then
            hvhobkak.startPeekPosition = me:GetPos()     
        end

        hvhobkak.startedPeeking = true
    else
        hvhobkak.startedPeeking = false
    end
end







/*// Movement 
hvhobkak.holdingOnGround = false 
hvhobkak.badMoveTypes = { 
    ["MOVETYPE_NOCLIP"] = true, ["MOVETYPE_LADDER"] = true, ["MOVETYPE_OBSERVER"] = true 
}

function hvhobkak.BunnyHop(cmd)
    local moveType = me:GetMoveType()
    local waterLevel = me:WaterLevel()

    if hvhobkak.badMoveTypes[moveType] then return end 

    if me:IsFlagSet( FL_ONGROUND ) then

        --[[if hvhobkak.holdingOnGround then 
            hvhobkak.holdingOnGround = false

            cmd:RemoveKey(IN_JUMP)
        end

        if cmd:KeyDown(IN_JUMP) then
            hvhobkak.holdingOnGround = true 
        end

        return ]]
    else 
        cmd:RemoveKey(IN_JUMP)
        return
    end

    //if waterLevel >= 2 then return end 
end
*/

// Sequence Manipulation 

hvhobkak.freezedTicks = 0
hvhobkak.maxFreezeTicks = math_Round( 1 / TickInterval ) 
function hvhobkak.AnimationFreezer()
    if not hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Animation freezer"] ) then return end

    if hvhobkak.freezedTicks < hvhobkak.maxFreezeTicks then
        ded.SetOutSequenceNr( ded.GetOutSequenceNr() + hvhobkak.maxFreezeTicks - 1 ) 

        hvhobkak.freezedTicks = hvhobkak.freezedTicks + 1
    else
        hvhobkak.freezedTicks = 0
    end
end

hvhobkak.seqshit = false
function hvhobkak.SequenceShit(cmd)
    if not hvhobkak.cfg.vars["Sequence manip"] or not hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Sequence manip"]) then
        
        if hvhobkak.seqshit then
            hvhobkak.seqshit = false 
        end

        return 
    end

    local amt = hvhobkak.cfg.vars["Sequence min random"] and math_random(hvhobkak.cfg.vars["Sequence min"],hvhobkak.cfg.vars["OutSequence"]) or hvhobkak.cfg.vars["OutSequence"] 

    hvhobkak.seqshit = true
    hvhobkak.SendPacket = true
    ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)
end

// Handjob ( arm breaker )
 
function hvhobkak.PerformHandjob( cmd )
    local mode = hvhobkak.cfg.vars["Handjob mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math_random(0, 1) == 0 
    end

    ded.SetTyping(cmd, shouldjerk)
end 

// create move hook 

hvhobkak.norf = {
    ["laserjetpack"] = true,
    ["weapon_physgun"] = true,
}

hvhobkak.vapecd = false
hvhobkak.tyaga = 0
hvhobkak.maxvape = hvhobkak.TIME_TO_TICKS(5)
hvhobkak.hoppin = false
local ic = false

hvhobkak.slams = {}

function hvhobkak.OnEntityCreated(ent)
    if ent:GetClass() == "npc_satchel" and ent:GetOwner() == me then 
        hvhobkak.slams[ #hvhobkak.slams + 1 ] = ent
    end
end






function hvhobkak.CreateMove(cmd)
    hvhobkak.SilentAngles(cmd)

    hvhobkak.aimingrn = false

    //if ( ded.GetChokedPackets() > 14 ) then ded.SetChokedPackets( 14 ) end

    if cmd:CommandNumber() == 0 then return end

    //if ded.GetIsShifting() then hvhobkak.shiftedTicks = hvhobkak.shiftedTicks + 1 end

    local w = me:GetActiveWeapon()
    hvhobkak.activeWeapon       = IsValid( w ) and w or false
    hvhobkak.activeWeaponClass  = IsValid( w ) and w:GetClass() or false 
    hvhobkak.moveType           = me:GetMoveType() 

    //if hvhobkak.cfg.vars["Passive recharge"] and ded.GetCurrentCharge() < ded.GetMaxShiftTicks() and not me:Alive() then
    //    ded.SetReloadKeyPressed( true )
    //end


    if hvhobkak.cfg.vars["Silent aim"] then cmd:SetViewAngles(hvhobkak.SilentAngle) end

    //if ded.GetIsShifting() then
        //  ded.AdjustTickbase()
    //    print("shifting")
    //end

    if hvhobkak.cfg.vars["Flashlight spam"] and input_IsKeyDown( KEY_F ) then
        cmd:SetImpulse(100)
    end

    if hvhobkak.cfg.vars["Auto Vape"] then
        if cmd:KeyDown( IN_ATTACK ) then
            if hvhobkak.tyaga >= hvhobkak.maxvape then
                cmd:RemoveKey( IN_ATTACK )
                hvhobkak.tyaga = 0
            elseif hvhobkak.tyaga < hvhobkak.maxvape then
                hvhobkak.tyaga = hvhobkak.tyaga + 1 
            end
        else
            hvhobkak.tyaga = 0
        end
    end 


    if hvhobkak.vapecd then 
        hvhobkak.vapecd = false 
        cmd:RemoveKey( IN_ATTACK2 ) 
    elseif hvhobkak.cfg.vars["Vape spam"] and hvhobkak.activeWeapon and not hvhobkak.vapecd and StartsWith( hvhobkak.activeWeaponClass, "weapon_vape" ) then
        cmd:AddKey( IN_ATTACK2 )
        hvhobkak.vapecd = true
    end   

    if hvhobkak.cfg.vars["Handjob"] then
        hvhobkak.PerformHandjob( cmd )
    end 

    //if hvhobkak.cfg.vars["Fake latency"] then
    //    local amt = hvhobkak.cfg.vars["Max latency"]
    //    ded.SetInSequenceNr(ded.GetInSequenceNr() - amt)
    //end

    if hvhobkak.SkipCommand then 
        cmd:RemoveKey( IN_ATTACK ) 
    
        hvhobkak.SkipCommand = !hvhobkak.SkipCommand 
    end

    if ( me:IsFlagSet( FL_ONGROUND ) ) then
		hvhobkak.last_ground_pos = me:GetNetworkOrigin().z
	end

    if hvhobkak.cfg.vars["Animation freezer"] then hvhobkak.AnimationFreezer() end
    
	hvhobkak.SequenceShit(cmd)

    if not hvhobkak.seqshit then
        hvhobkak.FakeLag(cmd)

        if hvhobkak.cfg.vars["Allah walk"] and me:IsFlagSet( FL_ONGROUND ) and hvhobkak.IsKeyDown(hvhobkak.cfg.binds["allahwalk"]) then
            
            if hvhobkak.fakeLagTicks != 20 then
                hvhobkak.ClampMovementSpeed(cmd, 0)
            else
                hvhobkak.ClampMovementSpeed(cmd, me:GetWalkSpeed())
            end

            //if(hvhobkak.fakeLagTicks <= 20) then
            //    hvhobkak.ClampMovementSpeed(cmd, 0)
            //    hvhobkak.Stop(cmd)
                //me:SetPoseParameter("move_x", 0)
	            //me:SetPoseParameter("move_y", 0)
            //else
             //   hvhobkak.ClampMovementSpeed(cmd, me:GetWalkSpeed())
            //end

            --print(hvhobkak.fakeLagTicks,me:GetVelocity():Length2D())
        end
    end

    if hvhobkak.cfg.vars["Fake lag options-On peek"] or hvhobkak.cfg.vars["Warp on peek"] or hvhobkak.cfg.vars["Freeze on peek"] then
        hvhobkak.CheckPeeking()
    end
    
    // Movement
    
    hvhobkak.FastWalk( cmd )

    if hvhobkak.cfg.vars["Sprint"] then cmd:AddKey(IN_SPEED) end

    hvhobkak.hoppin = false

    if me:GetMoveType() != MOVETYPE_NOCLIP and me:GetMoveType() != MOVETYPE_LADDER and me:GetMoveType() != MOVETYPE_OBSERVER then
        if ( cmd:KeyDown( IN_JUMP ) ) then
    
            if ( !me:IsFlagSet( FL_ONGROUND ) ) and hvhobkak.cfg.vars["Bhop"] then
                cmd:RemoveKey( IN_JUMP )
                hvhobkak.hoppin = true
            end
    
            hvhobkak.AutoStrafe( cmd )
        end
    end
    
	if hvhobkak.cfg.vars["Fast stop"] then
        hvhobkak.Stop(cmd)
    end

    if hvhobkak.cfg.vars["Water jump"] and me:WaterLevel() > 1 then
        cmd:AddKey( IN_JUMP )

    elseif hvhobkak.cfg.vars["Jesus lag"] and hvhobkak.SendPacket and me:WaterLevel() == 1 then
        cmd:AddKey( IN_DUCK )
    end

    if hvhobkak.cfg.vars["Fake duck"] and hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Fake duck"]) then
        if hvhobkak.fakeLagTicks > (hvhobkak.fakeLagfactor / 2) then
            cmd:AddKey(IN_DUCK)
        else
            cmd:RemoveKey(IN_DUCK)
        end
    end

    hvhobkak.targetVector = false

	ded.StartPrediction(cmd)

        local wish_yaw = hvhobkak.SilentAngle.y 

        if ( hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Circle strafe"]) and hvhobkak.cfg.vars["Circle strafe"] ) then
            wish_yaw = cmd:GetViewAngles().y
        end

        if hvhobkak.cfg.vars["Crossbow prediction"] and hvhobkak.activeWeaponClass == "weapon_crossbow" then
            hvhobkak.CrossbowPred( cmd )
        elseif hvhobkak.cfg.vars["Prop aimbot"] then
            hvhobkak.PropAim(cmd)
        else
            hvhobkak.Aim(cmd)
        end 
        
        if hvhobkak.cfg.vars["Silent aim"] then
            hvhobkak.MovementFix( cmd, wish_yaw )
        end

    ded.FinishPrediction() 

    if hvhobkak.cfg.vars["Trigger bot"] and hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Trigger bot"] ) then
        local tr = me:GetEyeTrace().Entity 
        
        if tr and tr:IsPlayer() then
            cmd:AddKey( IN_ATTACK )
        end
    end

    if hvhobkak.cfg.vars["Double tap"] and hvhobkak.cfg.vars["Tickbase shift"] and cmd:KeyDown( IN_ATTACK ) then
        //hvhobkak.shiftedTicks = 0
        ded.StartShifting( true )
    end

    if hvhobkak.cfg.vars["Auto detonator"] and #hvhobkak.slams > 0 then
        local d = hvhobkak.cfg.vars["AutoD distance"]
        d = d * d 

        local plys = player_GetAll()

        for jjj = 1, #plys do
            if plys[ jjj ] == me then continue end
            
            for k, v in pairs(hvhobkak.slams) do
                if not IsValid(v) then hvhobkak.slams[k] = nil continue end
    
                local pos = v:GetPos()
    
                if pos:DistToSqr( plys[ jjj ]:GetPos() + plys[ jjj ]:GetVelocity() * ( TickInterval * 4 ) ) < d then
                    cmd:AddKey( IN_ATTACK2 )
                    break
                end
            end
        end
    end

    if hvhobkak.cfg.vars["Auto peak"] then
        local ppos = hvhobkak.startPeekPosition
        local pposd = me:GetPos():DistToSqr(ppos)

        if hvhobkak.needToMoveBack and pposd < 1024 then //or hvhobkak.IsMovementKeysDown( cmd )
            hvhobkak.needToMoveBack = false
        end

        if hvhobkak.startedPeeking then
            //if not hvhobkak.IsMovementKeysDown( cmd ) then
            //    hvhobkak.needToMoveBack = true
            //end

            if hvhobkak.needToMoveBack then
                hvhobkak.MoveTo( cmd, ppos )

                if hvhobkak.cfg.vars["Auto peak tp"] and hvhobkak.cfg.vars["Tickbase shift"] then
                    //hvhobkak.shiftedTicks = 0
                    ded.StartShifting( true )
                end
            end
        end

        hvhobkak.checkAutopeak( cmd )
    end

    hvhobkak.autoReload(cmd)

    if hvhobkak.cfg.vars["Use spam"] then
        if cmd:KeyDown(IN_USE) then
            cmd:RemoveKey(IN_USE)
        else
            cmd:AddKey(IN_USE)
        end
    end

    if hvhobkak.cfg.vars["Auto GTA"] then
        local tr = me:GetEyeTrace().Entity

        if IsValid( tr ) and tr:IsVehicle() then
            cmd:AddKey(IN_USE)
        end
    end

    if hvhobkak.cfg.vars["Ghost follower"] then
        local tar = player.GetBySteamID( hvhobkak.cfg.vars["GFID"] )

        if IsValid( tar ) then 
            local pDriving = me:GetDrivingEntity()

            if ( IsValid( pDriving ) and not pDriving:IsOnFire() ) then
                net.Start( "properties" )
                    net.WriteString( "ignite" )
                    net.WriteEntity( pDriving )
                net.SendToServer()
            end
            local tang = ( tar:GetPos() - me:EyePos() ):Angle()

            cmd:ClearMovement()
            cmd:ClearButtons()

            cmd:SetForwardMove( 10000 )
            cmd:SetSideMove(0)

            cmd:AddKey(IN_SPEED)

            cmd:SetViewAngles( tang )
            hvhobkak.MovementFix( cmd, tang.y )
        end
    end

    if hvhobkak.cfg.vars["Air lag duck"] and hvhobkak.SendPacket then
        local startPosUnducked = me:GetPos()
        local isDucking = bit.band(me:GetFlags(), FL_DUCKING) != 0
        if isDucking then
            startPosUnducked.z = startPosUnducked.z - (72 - 36)
        end

        ded.StartSimulation( me:EntIndex() )

        local shouldduck = true 

        for i = 1, 4 do
            ded.SimulateTick()

            local simData = ded.GetSimulationData()

            local maxs = me:OBBMaxs()
            maxs.z = 72 

            if isDucking then
                simData.m_vecAbsOrigin.z = simData.m_vecAbsOrigin.z - (72 - 36)
            end

            local trace = TraceHull({
                start = startPosUnducked,
                endpos = simData.m_vecAbsOrigin,
                mins = me:OBBMins(),
                maxs = maxs,
                filter = me,
                mask = MASK_PLAYERSOLID
            })

            if me:IsOnGround() and trace.Hit then
                shouldduck = false 
                break
            end
        end

        ded.FinishSimulation()

        if shouldduck and !me:IsFlagSet( FL_ONGROUND ) then 
            cmd:AddKey( IN_DUCK )   
        end
    end

    if hvhobkak.fcenabled then
        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetViewAngles(hvhobkak.fcangles)
    end

    /*if hvhobkak.cfg.vars["Dodge projectiles"] and ded.GetCurrentCharge() >= ded.GetMaxShiftTicks() and not ded.GetIsShifting() then
        local entitys = ents_GetAll()

        for i = 1, #entitys do
            local v = entitys[ i ]

            if v:GetClass() != "crossbow_bolt" then continue end 

            local mypos = me:GetPos() + me:GetVelocity() * TickInterval 
            local entpos = v:GetPos() + ( v:GetAngles():Forward() * 3500 ) * TickInterval

            if mypos:DistToSqr( entpos ) > 320 then
                cmd:ClearMovement()
                cmd:ClearButtons()

                cmd:AddKey( IN_SPEED )
                cmd:SetSideMove( 10000 )
                ded.StartShifting( true )
            end
        end
    end*/

    if hvhobkak.SendPacket then
        hvhobkak.chokedTicks = 0 
    else
        hvhobkak.chokedTicks = hvhobkak.chokedTicks + 1
    end

    if not hvhobkak.cfg.vars["Silent aim"] then hvhobkak.SilentAngle = cmd:GetViewAngles() end

    ded.SetBSendPacket( hvhobkak.SendPacket )

    if hvhobkak.cfg.vars["Lag mode"] == 3 and hvhobkak.SendPacket then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 8)
    end
end 
 
/* 
    Render Scene / Anti screengrab 
*/
hvhobkak.UnSafeFrame = false
hvhobkak.renderTarget = GetRenderTarget( "YaPidoras" .. os.time(), scrw, scrh )

do
    local oldsky, oldskycolor, oldwallcolor = hvhobkak.cfg.vars["Custom sky"], hvhobkak.cfg.vars["Sky color"], hvhobkak.cfg.vars["Wall color"]
    local oldskyclr, oldwallclr = hvhobkak.cfg.colors["Sky color"], hvhobkak.cfg.colors["Wall color"]

    local worldcollerp = string_ToColor( hvhobkak.cfg.colors["Wall color"] )
    local worldmats = Entity( 0 ):GetMaterials()

    local origsky = GetConVar("sv_skyname"):GetString()
    local tsides = {"lf", "ft", "rt", "bk", "dn", "up"}
    local skymat = {}

    for i = 1, 6 do 
        skymat[i] = Material("skybox/" .. origsky .. tsides[i]) 
    end

    local function setSkyboxTexture( skyname )
        for i = 1, 6 do
            local t = Material("skybox/" .. skyname .. tsides[i]):GetTexture("$basetexture")
            skymat[i]:SetTexture("$basetexture", t)
        end
    end

    local function setSkyColor( setcolor )
        local cfg = string_ToColor( hvhobkak.cfg.colors["Sky color"] )
        local vector = setcolor and Vector( cfg.r/255, cfg.g/255, cfg.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, 6 do
            skymat[i]:SetVector( "$color", vector )
        end
    end

    local function setWallColor( setcolor )
        local cfg = string_ToColor( hvhobkak.cfg.colors["Wall color"] )
        worldcollerp = hvhobkak.ColorLerp( worldcollerp, cfg )
        local vector = setcolor and Vector( worldcollerp.r/255, worldcollerp.g/255, worldcollerp.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, #worldmats do
            local value = worldmats[i]

            Material( value ):SetVector( "$color", vector )
            Material( value ):SetFloat( "$alpha", setcolor and (cfg.a / 255) or 255 )
        end
    end

    function hvhobkak.RenderScene()

        local newname, newcolor, newcolor2 = hvhobkak.cfg.vars["Custom sky"], hvhobkak.cfg.vars["Sky color"], hvhobkak.cfg.vars["Wall color"]
        local newskyclr, newwallclr = hvhobkak.cfg.colors["Sky color"],hvhobkak.cfg.colors["Wall color"]
        
        if newskyclr != oldskyclr or newcolor != oldskycolor then
            setSkyColor( newcolor )

            oldskyclr = newskyclr
            oldskycolor = newcolor
        end

        if newwallclr != tostring( worldcollerp ) or newcolor2 != oldwallcolor then
            setWallColor( newcolor2 )

            oldwallcolor = newcolor2
        end

        if newname != oldsky then
            setSkyboxTexture( newname )
            oldsky = newname
        end

        // Esp shit

        if ( !gui.IsConsoleVisible() && !gui.IsGameUIVisible() ) || hvhobkak.UnSafeFrame then
            local view = {
                x = 0,
                y = 0,
                w = scrw,
                h = scrh,
                dopostprocess = true,
                origin = vOrigin,
                angles = vAngle,
                fov = vFOV,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            }
         
            render.RenderView( view )
            render.CopyTexture( nil, hvhobkak.renderTarget )
         
            cam_Start2D()
                hook_Run( "Ungrabbable2D" )
            cam_End2D()

            cam_Start3D()
                hook_Run( "Ungrabbable3D" )
            cam_End3D()
    
            render.SetRenderTarget( hvhobkak.renderTarget )
         
            return true
        end
    end

end

function hvhobkak.PreScreenGrab()
    if hvhobkak.UnSafeFrame then return end
	hvhobkak.UnSafeFrame = true
 
	render_Clear( 0, 0, 0, 255, true, true )
	render_RenderView( {
		origin = me:EyePos(),
		angles = me:EyeAngles(),
		x = 0,
		y = 0,
		w = scrw,
		h = scrh,
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )
 
	hvhobkak.UnSafeFrame = false
end

hvhobkak.prikol = Material( "a/prikol" ):GetTexture( "$basetexture" ) //  Material( file_Read( "prikol.png", "DATA" ) )

function render.Capture( data )
    hvhobkak.PreScreenGrab()

    if hvhobkak.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( hvhobkak.prikol )
        cam.End2D()
    end

	return render_Capture( data )
end

function _G.render.Capture( data )
    hvhobkak.PreScreenGrab()

    if hvhobkak.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( hvhobkak.prikol )
        cam.End2D()
    end

	return render_Capture( data )
end


/*
    ESP, Chams
*/

function hvhobkak.IsValidPlayer(pl)
    if pl == me then return false end
    if not IsValid(pl) then return false end
    if not pl:Alive() then return false end


    return true
end

function hvhobkak.GetEntPos(ent)
    local min, max = ent:OBBMins(), ent:OBBMaxs()

    local points = {
        Vector( max.x, max.y, max.z ),
        Vector( max.x, max.y, min.z ),
        Vector( max.x, min.y, min.z ),
        Vector( max.x, min.y, max.z ),
        Vector( min.x, min.y, min.z ),
        Vector( min.x, min.y, max.z ),
        Vector( min.x, max.y, min.z ),
        Vector( min.x, max.y, max.z )
    }

    local MaxX, MinX, MaxY, MinY
    local isVisible = false

    for i = 1, #points do
        local v = points[i]
        local p = ent:LocalToWorld( v ):ToScreen()
        isVisible = p.visible 
        
		if MaxX != nil then
            MaxX, MaxY, MinX, MinY = math_max( MaxX, p.x ), math_max( MaxY, p.y), math_min( MinX, p.x ), math_min( MinY, p.y)
        else
            MaxX, MaxY, MinX, MinY = p.x, p.y, p.x, p.y
        end

    end

    return MaxX, MaxY, MinX, MinY, isVisible
end

function hvhobkak.getTextX(v,tw,pos)
    if pos == 1 or pos == 2 then
        return tw/2
    elseif pos == 3 then
        return 0
    elseif pos == 4 then 
        local f = tw
        if hvhobkak.cfg.vars["Health bar"] and v.Health > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        if hvhobkak.cfg.vars["Armor bar"] and v.Armor > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        return f
    end
end

function hvhobkak.getTextY(max,min,th,pos,tbpos)
    if pos == 1 then
        return min-th-th*tbpos
    elseif pos == 2 then
        return max+th*tbpos
    elseif pos == 3 then
        return min+th*tbpos - 1
    elseif pos == 4 then
        return min+th*tbpos - 1
    end
end

function hvhobkak.SortByDistance( f, s )
    return f[1]:GetPos():DistToSqr( EyePos() ) > s[1]:GetPos():DistToSqr( EyePos() )
end

function hvhobkak.GenerateArrowPoss(x, y, scale, ang)
    local ang1 = Angle(0, ang, 0):Forward() * scale
    local ang2 = Angle(0, ang + 120, 0):Forward() * (scale - 1)
    local ang3 = Angle(0, ang - 120, 0):Forward() * (scale - 1)

    local p0 = {x = x, y = y}
    local poly = {
        {x = p0.x + ang1.x, y = p0.y + ang1.y},
        {x = p0.x + ang2.x, y = p0.y + ang2.y},
        {x = p0.x + ang3.x, y = p0.y + ang3.y},
    }
    return poly
end

function hvhobkak.DrawOutlinedPoly( poly )
    local last = nil
    for i = 1, #poly do
        local v = poly[ i ]
        if last then
            surface_DrawLine(last.x, last.y, v.x, v.y)
            last = v
        else
            last = v
        end
    end
    surface_DrawLine(last.x, last.y, poly[1].x, poly[1].y)
end

hvhobkak.Fonts = {
    [1] = "veranda",
    [2] = "veranda_s",
}


hvhobkak.BarPadding = 0

function hvhobkak.DrawBar(MaxX, MaxY, MinX, MinY, Pos, Current, Max, BarColor, BackColor, Gradient, GradientColor)
    if hvhobkak.BarPadding == 0 then
        hvhobkak.BarPadding = 6
    else
        hvhobkak.BarPadding = 11
    end

    local BarX, BarY = MinX-hvhobkak.BarPadding, MinY-1
    local BarW, BarH = math_floor( MaxX - MinX ), 4
    local FillW, FillH = math.ceil(Current / Max * BarW), BarH

    if Pos > 2 then
        BarW, BarH = 4, math_floor( MaxY - MinY ) + 2
        FillW, FillH = BarW, math.ceil(Current / Max * BarH)
    end

    FillW = math.min(FillW, BarW)
    FillH = math.min(FillH, BarH)

    surface_SetDrawColor(BackColor)
    surface_DrawRect(BarX, BarY, BarW, BarH)

    BarX, BarY = BarX + 1, BarY + 1

    if Pos > 2 then
        BarY = BarY + BarH - FillH
    end

    BarW, BarH = BarW - 2, BarH - 2
    FillW, FillH = FillW - 2, FillH - 2

    surface_SetDrawColor(BarColor)
    surface_DrawRect(BarX, BarY, FillW, FillH)

    if Gradient then
        surface_SetDrawColor(GradientColor)
        surface_SetMaterial(hvhobkak.Materials["Gradient"])
        surface_DrawTexturedRect(BarX, BarY, FillW, FillH)
    end
end

function hvhobkak.DrawESP()
    local d = hvhobkak.cfg.vars["ESP Distance"]
    local ed = hvhobkak.cfg.vars["Ent ESP Distance"]
    local pos = me:GetPos()
    d = d * d
    ed = ed * ed

    surface_SetFont( hvhobkak.Fonts[ hvhobkak.cfg.vars["ESP Font"] ] )

    for i = 1, #hvhobkak.entityCache do
        local v = hvhobkak.entityCache[ i ]

        if not IsValid( v.entity ) then return end 

        if v.position:DistToSqr( pos ) > ed then continue end

        local MaxX, MaxY, MinX, MinY, isVisible = hvhobkak.GetEntPos( v.entity )
        local XLen, YLen = MaxX - MinX, MaxY - MinY

        if not isVisible then continue end

        surface_SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        surface_SetTextColor( hvhobkak.Colors[255] )

        if hvhobkak.cfg.vars["Ent class"] then
            local tw, th = surface_GetTextSize( v.class )

            surface_SetTextPos( ( MaxX + (MinX - MaxX) / 2 ) - tw / 2 , MinY - th )
            surface_DrawText( v.class )
        end

        if hvhobkak.cfg.vars["Ent box"] then
            if hvhobkak.cfg.vars["Ent box style"] == 1 then
                surface_SetDrawColor(hvhobkak.Colors[0])
                surface_DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface_SetDrawColor( hvhobkak.Colors[255] )
                surface_DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif hvhobkak.cfg.vars["Ent box style"] == 2 then
                local wlen, hlen = math_floor( XLen / 3 ), math_floor( YLen / 3 )
    
                surface_SetDrawColor(hvhobkak.Colors[0])
    
                // Left up
                surface_DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface_DrawRect( MinX - 1, MinY - 1, 3, hlen )
    
                // Right up
                surface_DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface_DrawRect( MaxX - 1, MinY - 1, 3, hlen )
    
                // Left down
                surface_DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface_DrawRect( MinX - 1, MaxY - hlen, 3, hlen )
    
                // Right down
                surface_DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface_DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )
    
                surface_SetDrawColor( hvhobkak.Colors[255] )
    
                wlen = wlen - 2
                hlen = hlen - 2 
    
                // Left up
                surface_DrawRect( MinX, MinY, wlen, 1 )
                surface_DrawRect( MinX, MinY, 1, hlen )
    
                // Right up
                surface_DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface_DrawRect( MaxX, MinY, 1, hlen )
    
                // Left down
                surface_DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface_DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
    
                // Right down
                surface_DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface_DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif hvhobkak.cfg.vars["Ent box style"] == 3 then
                cam_Start3D()
                render_DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), hvhobkak.Colors[255], true )
                cam_End3D()
            end
        end
    end

    local plys = player_GetAll()

    local color_box     = string_ToColor( hvhobkak.cfg.colors["Box esp"] )
    local color_box_g   = string_ToColor( hvhobkak.cfg.colors["Box gradient"] )

    local myEyePos = me:EyePos()

    for i = 1, #plys do
        local v = hvhobkak.playerCache[ plys[i] ]

        if not v or not hvhobkak.IsValidPlayer(v.entity) then continue end
        
        local vp = v.GetPos
        local distance = vp:DistToSqr(pos)
		if distance > d then continue end

        surface_SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        local MaxX, MaxY, MinX, MinY, isVisible = hvhobkak.GetEntPos( v.entity )
        local XLen, YLen = MaxX - MinX, MaxY - MinY

        local teamcolor = v.TeamColor

        if hvhobkak.cfg.vars["OOF Arrows"] then 
            local xScale, yScale = scrw / 250, scrh / 250
            local xScale, yScale = xScale * 50, yScale * 50
 
            local angle = ( v.entity:EyePos() - myEyePos ):Angle() 
            local addPos = Angle(0, (hvhobkak.SilentAngle.y - angle.y) - 90, 0):Forward()
            local pos = Vector(scrw / 2, scrh / 2, 0) + Vector(addPos.x * xScale, addPos.y * yScale, 0)

            if math.abs( math.NormalizeAngle(angle.y - hvhobkak.SilentAngle.y) ) >= 60 then
                local poly = hvhobkak.GenerateArrowPoss(pos.x, pos.y, 16, (hvhobkak.SilentAngle.y - angle.y) - 90)
                local poly1 = hvhobkak.GenerateArrowPoss(pos.x, pos.y, 17, (hvhobkak.SilentAngle.y - angle.y) - 90)
                local poly2 = hvhobkak.GenerateArrowPoss(pos.x, pos.y, 15, (hvhobkak.SilentAngle.y - angle.y) - 90)
                
                if hvhobkak.cfg.vars["OOF Style"] == 1 then
                    surface_SetDrawColor( hvhobkak.Colors[0] )
                    hvhobkak.DrawOutlinedPoly( poly1 )
                    hvhobkak.DrawOutlinedPoly( poly2 )

                    surface_SetDrawColor( teamcolor ) 
                    hvhobkak.DrawOutlinedPoly( poly )
                else
                    local ang2 = Angle(0, (hvhobkak.SilentAngle.y - angle.y) - 90 + 120, 0):Forward() * (scale - 1)
                    surface_SetDrawColor( teamcolor ) 
                    
                    surface_DrawLine( pos.x, pos.y, pos.x, pos.y + ang2.y )
                    //surface_DrawLine(last.x, last.y, v.x, v.y)
                    //surface_DrawLine(last.x, last.y, v.x, v.y)
                    //surface_DrawLine(last.x, last.y, v.x, v.y)
                end
                
            end
        end

        if not isVisible then continue end

        if hvhobkak.cfg.vars["Box esp"] then
            if hvhobkak.cfg.vars["Box style"] == 1 then
                surface_SetDrawColor(hvhobkak.Colors[0])
                surface_DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface_SetDrawColor( hvhobkak.cfg.vars["Box team color"] and teamcolor or color_box )
                surface_DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif hvhobkak.cfg.vars["Box style"] == 2 then
                local wlen, hlen = math_floor( XLen / 3 ), math_floor( YLen / 3 )

                surface_SetDrawColor(hvhobkak.Colors[0])

                // Left up
                surface_DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface_DrawRect( MinX - 1, MinY - 1, 3, hlen )

                // Right up
                surface_DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface_DrawRect( MaxX - 1, MinY - 1, 3, hlen )

                // Left down
                surface_DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface_DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface_DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface_DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                surface_SetDrawColor( hvhobkak.cfg.vars["Box team color"] and teamcolor or color_box )

                wlen = wlen - 2
                hlen = hlen - 2 

                // Left up
                surface_DrawRect( MinX, MinY, wlen, 1 )
                surface_DrawRect( MinX, MinY, 1, hlen )
 
                // Right up
                surface_DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface_DrawRect( MaxX, MinY, 1, hlen )
 
                // Left down
                surface_DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface_DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
 
                // Right down
                surface_DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface_DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif hvhobkak.cfg.vars["Box style"] == 3 then
                local wlen, hlen = math_floor( XLen / 3 ), math_floor( YLen / 3 )
                local xc = math_floor( XLen / 2 )

                surface_SetDrawColor(hvhobkak.Colors[0])

                // Left
                surface_DrawRect( MinX - 1, MinY - 1 + hlen, 3, hlen )

                surface_DrawLine( MinX - 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )
                surface_DrawLine( MinX + 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )

                surface_DrawLine( MinX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )
                surface_DrawLine( MinX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )

                // Right
                surface_DrawRect( MaxX - 1, MinY - 1 + hlen, 3, hlen )

                surface_DrawLine( MaxX - 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )
                surface_DrawLine( MaxX + 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )

                surface_DrawLine( MaxX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )
                surface_DrawLine( MaxX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )

                surface_SetDrawColor( hvhobkak.cfg.vars["Box team color"] and teamcolor or color_box )

                // Left
                surface_DrawRect( MinX, MinY + hlen - 1, 1, hlen )
                surface_DrawLine( MinX, MinY - 1 + hlen, MinX + xc, MinY )
                surface_DrawLine( MinX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )

                // Right
                surface_DrawRect( MaxX, MinY + hlen - 1, 1, hlen )
                surface_DrawLine( MaxX, MinY - 1 + hlen, MinX + xc, MinY )
                surface_DrawLine( MaxX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )
            elseif hvhobkak.cfg.vars["Box style"] == 4 then
                local wlen, hlen = math_floor( XLen / 3 ) + 3, math_floor( YLen / 3 ) + 3
                local x, y, xw, xh = MinX - 3, MinY - 3, MaxX + 3, MaxY + 3
                local polys = {}

                for i = 1, 3 do
                    polys = {
                        { x = x + wlen, y = y },
                        { x = xw - wlen, y = y },
                        { x = xw, y = y + hlen },
                        { x = xw, y = xh - hlen },
                        { x = xw - wlen, y = xh },
                        { x = x + wlen, y = xh },
                        { x = x, y = xh - hlen },
                        { x = x, y = y + hlen },
                    }
    
                    surface_SetDrawColor( i == 2 and teamcolor or hvhobkak.Colors[0] ) 
                    hvhobkak.DrawOutlinedPoly( polys )
                    
                    wlen, hlen = wlen - i, hlen - i

                    y, x = y + i, x + i
                    xw, xh = xw - i, xh - i
                end
            elseif hvhobkak.cfg.vars["Box style"] == 5 then
                cam_Start3D()
                render_DrawWireframeBox(v.entity:GetPos(), v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), hvhobkak.cfg.vars["Box team color"] and teamcolor or color_box, true)
                cam_End3D()
            end
        end

        // Sight lines 

        if hvhobkak.cfg.vars["Sight lines"] then 
            local tr = v.entity:GetEyeTrace()
            local startpos, hitpos = tr.StartPos:ToScreen(), tr.HitPos:ToScreen()

            surface_SetDrawColor( teamcolor )
            surface_DrawLine( startpos.x, startpos.y, hitpos.x, hitpos.y )
        end

        // text 

        local ttbl = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }
        local poses = { [1] = MaxX + (MinX - MaxX) / 2, [3] = MaxX+5, [4] = MinX-5 }
        poses[2] = poses[1]

        surface_SetTextColor( hvhobkak.Colors[255] )

        if hvhobkak.cfg.vars["Name"] then 
            local name = v.Name
            local pos = hvhobkak.cfg.vars["Name pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos), hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if hvhobkak.cfg.vars["Usergroup"] then 
            local name = v.GetUserGroup
            local pos = hvhobkak.cfg.vars["Usergroup pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos),hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if hvhobkak.cfg.vars["Weapon"] then 
            local name = hvhobkak.cfg.vars["Show ammo"] and v.WeaponClass .. " (" .. v.WeaponAmmo .. ")" or v.WeaponClass
           
            if hvhobkak.cfg.vars["Show reloading"] then
                for i = 0, 13 do
                    if v.entity:IsValidLayer(i) then
                        if v.entity:GetSequenceActivityName(v.entity:GetLayerSequence(i)):find("RELOAD") then
                            name = "RELOADING"
                            break
                        end
                    end
                end
            end

            local pos = hvhobkak.cfg.vars["Weapon pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos),hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if hvhobkak.cfg.vars["Team"] then 
            local name = v.TeamName
            local pos = hvhobkak.cfg.vars["Team pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos),hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if hvhobkak.cfg.vars["DarkRP Money"] then 
            local name = v.MoneyVar
            local pos = hvhobkak.cfg.vars["Money pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos),hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
        
        hvhobkak.BarPadding = 0
        
        local health = v.Health
        local maxhealth = v.GetMaxHealth

        if health > 0 then
            if hvhobkak.cfg.vars["Health"] then 
                local pos = hvhobkak.cfg.vars["Health pos"]
                local tw, th = surface_GetTextSize(health)
    
                surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos),hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface_DrawText(health)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if hvhobkak.cfg.vars["Health bar"] then 
                hvhobkak.DrawBar( MaxX, MaxY, MinX, MinY, 4, health, maxhealth, string_ToColor( hvhobkak.cfg.colors["Health"] ), Color(0, 0, 0), hvhobkak.cfg.vars["Health bar gradient"], string_ToColor( hvhobkak.cfg.colors["Health bar gradient"] ) )
            end
        end

        local armor = v.Armor
        local maxarmor = v.GetMaxArmor

        if armor > 0 then
            if hvhobkak.cfg.vars["Armor"] then 
                local pos = hvhobkak.cfg.vars["Armor pos"]
                local tw, th = surface_GetTextSize(armor)
    
                surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos),hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface_DrawText(armor)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if hvhobkak.cfg.vars["Armor bar"] then 
                hvhobkak.DrawBar( MaxX, MaxY, MinX, MinY, 4, armor, maxarmor, string_ToColor( hvhobkak.cfg.colors["Armor"] ), Color(0, 0, 0), hvhobkak.cfg.vars["Armor bar gradient"], string_ToColor( hvhobkak.cfg.colors["Armor bar gradient"] ) )
            end
        end

        if hvhobkak.cfg.vars["Break LC"] and v.break_lc then
            local name = "Breaking LC"
            local pos = hvhobkak.cfg.vars["Break LC pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos),hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if hvhobkak.cfg.vars["Simtime updated"] then
            local name = v.simtime_updated and "Updated" or "Same"
            local pos = hvhobkak.cfg.vars["Simtime pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextPos(poses[pos]-hvhobkak.getTextX(v,tw,pos),hvhobkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
 
        if hvhobkak.cfg.vars["Skeleton"] then
            surface_SetDrawColor( string_ToColor( hvhobkak.cfg.colors["Skeleton"] ) )

		    for i = 0, v.entity:GetBoneCount() - 1 do
                if (!v.entity:BoneHasFlag(i, BONE_USED_BY_HITBOX)) then continue end

			    local ParentId = v.entity:GetBoneParent(i)

			    if (!ParentId) then continue end

                if (!v.entity:BoneHasFlag(ParentId, BONE_USED_BY_HITBOX)) then continue end

                local BoneMatrix = v.entity:GetBoneMatrix(i)
                local ParentMatrix = v.entity:GetBoneMatrix(ParentId)

                if (!BoneMatrix or !ParentMatrix) then continue end

			    local BonePos = BoneMatrix:GetTranslation()

			    if (BonePos == v.entity:GetPos()) then continue end
                
			    local ParentPos = ParentMatrix:GetTranslation()

			    if (!BonePos or !ParentPos) then continue end

			    local screen1, screen2 = BonePos:ToScreen(), ParentPos:ToScreen()

			    surface_DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
		    end
        end

        if hvhobkak.cfg.vars["Show records"] and hvhobkak.canBacktrack(v) then
            local len = #hvhobkak.btrecords[ v ]

            for i = 1, len do
                local pos = ( hvhobkak.btrecords[v][i].aimpos ):ToScreen()
                surface_SetDrawColor( hvhobkak.backtracktick == i and hvhobkak.Colors["Red"] or hvhobkak.Colors[255] )
                surface_DrawRect(pos.x,pos.y,2,2)
            end
        end

        if hvhobkak.cfg.vars["Backtrack skeleton"] and hvhobkak.canBacktrack(v) then
            local len = #hvhobkak.btrecords[ v ]

            surface_SetDrawColor( hvhobkak.Colors[255] )

            for i = 1, len do
                local data = hvhobkak.btrecords[ v ][ i ].skeleton

                for nbone = 1, #data do
                    local screen1, screen2 = data[nbone][1]:ToScreen(), data[nbone][2]:ToScreen()
        
                    surface_DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
                end
            end
        end
    end

    surface_SetAlphaMultiplier(1)
end


surface.CreateFont("DTFont", { font = "Verdana", size = 15, antialias = false, outline = true } )
surface.CreateFont("XVIDEOS FONT", { font = "Verdana", size = 45, antialias = false, shadow = true } )

hvhobkak.fovColor = Color( 255, 255, 255 )
hvhobkak.gradFov = false






//hvhobkak.bgmaterial = Material( "a/paws.png", "noclamp smooth" )



do
    local lc, blc = Color(125,255,64), Color(255,64,125)

    local indx, indy = scrw / 2 - 100, scrh/2 + 250
    local charge = 0

    local gradcolor, chargedcolor, unchargedcolor = Color(200,200,200,128), Color(0,255,128), Color(255,155,0)

    local chargestate, ccharge, chargecolor = "NO CHARGE", 200, chargedcolor

    -- local watermarkx = scrw + 245
    -- local watermarkc = Color( 232, 232, 232, 235)

    function hvhobkak.DrawSomeShit()

        //if hvhobkak.frame:IsVisible() then
        //    surface_SetDrawColor( hvhobkak.accent )
        //    surface_SetMaterial( hvhobkak.bgmaterial )
        //    surface_DrawTexturedRect( 0, 0, scrw, scrh )
        //end

        surface_SetFont("DTFont")

        //local os_date = os.date("%d.%m.%Y # %H:%M:%S")
        //surface_SimpleText(10,10, os_date, Color(243, 252, 134))
        
        local latency = math_Round( ( ded.GetLatency(0) + ded.GetLatency(1) ) * 1000 ) 
        local currentlby = math_Round( ded.GetCurrentLowerBodyYaw( me:EntIndex() ) ) 
        local targetlby = math_Round( ded.GetTargetLowerBodyYaw( me:EntIndex() ) ) 

        surface_SimpleText(38,scrh-200, "VEL: " .. math_Round(me:GetVelocity():Length2D()), lc)
        surface_SimpleText(38,scrh-180, "LBY: " .. currentlby .. " (" .. targetlby .. ")", currentlby != targetlby and blc or lc)
        surface_SimpleText(38,scrh-160, "AT: " .. latency .. " ms",latency > 50 and blc or lc)
        surface_SimpleText(38,scrh-140, "FT: " .. hvhobkak.fakeLagTicks,hvhobkak.SendPacket and blc or lc)
        surface_SimpleText(38,scrh-120, "LC", me.break_lc and blc or lc)
        
        if hvhobkak.cfg.vars["Auto Vape"] then
            surface_SimpleText(38,scrh-220,"Vape: ", hvhobkak.tyaga == 0 and blc or lc)
            
            surface_SetDrawColor( 0, 0, 0 )
            surface_DrawRect( 78, scrh-219, 60, 14 )

            surface_SetDrawColor( lc )
            surface_DrawRect( 79, scrh-218, hvhobkak.tyaga / hvhobkak.maxvape * 58, 12 )
        end
        

        if hvhobkak.cfg.vars["Tickbase shift"] and hvhobkak.cfg.vars["Tickbase indicator"] then
            /*local max, cur = hvhobkak.cfg.vars["Charge ticks"], ded.GetCurrentCharge()
            local dtw = cur / max * 30

            local x, y = scrwc - 7, scrhc + 10

            surface_SimpleText( x, y, "DT", blc ) // 

            render.SetScissorRect( x, y, x + dtw, y + 30, true )
                surface_SimpleText( x, y, "DT", lc )
            render.SetScissorRect( 0, 0, 0, 0, false )*/

            if ded.GetCurrentCharge() <= hvhobkak.cfg.vars["Shift ticks"] then
                ccharge = ded.GetCurrentCharge() * 196 / hvhobkak.cfg.vars["Shift ticks"]
            end

            charge = math_Approach(charge,ccharge,FrameTime()*700)

            if ded.GetCurrentCharge() == 0 then
                chargestate = "NO CHARGE"
                chargecolor = unchargedcolor
            elseif ded.GetCurrentCharge() < hvhobkak.cfg.vars["Shift ticks"] and hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Auto recharge"] ) then
                chargestate = "CHARGING"
                chargecolor = unchargedcolor
            else
                chargestate = "READY"
                chargecolor = chargedcolor
            end

            local tw, th = surface_GetTextSize(chargestate)

            surface_SetDrawColor(hvhobkak.Colors[12])
            surface_DrawRect(indx,indy,200,30)

            surface_SetDrawColor(chargecolor) 
            surface_DrawRect(indx+2,indy+2,charge,26)

            surface_SimpleTexturedRect(indx+2,indy+2,charge,26,gradcolor,hvhobkak.Materials["Gradient right"])

            surface_SimpleText(indx+2,indy-20,"CHARGE "..ded.GetCurrentCharge(),hvhobkak.Colors[245])
            surface_SimpleText(indx+196-tw,indy-20,chargestate,hvhobkak.Colors[245])
        end

        

        
        
        -- watermarkx = watermarkx - 1

        -- if watermarkx < -925 then
        --     watermarkx = scrw + 100
        -- end

        -- surface_SetFont("XVIDEOS FONT")
        -- surface_SimpleText(watermarkx,10,"This video was uploaded to WWW.XVIDEOS.COM",watermarkc)
        
        local CT = CurTime()
        local FT = FrameTime() * 128

        if hvhobkak.cfg.vars["Hitmarker"] and #hvhobkak.hitmarkers > 0 then
            local hm = string_ToColor( hvhobkak.cfg.colors["Hitmarker"] ) 
    
            surface_SetDrawColor( hm )

            for i = #hvhobkak.hitmarkers, 1, -1  do
                local v = hvhobkak.hitmarkers[ i ]
    
                if v.time < CT - 1 then table_remove( hvhobkak.hitmarkers, i ) continue end 
    
                v.add = math_Approach( v.add, v.add - (CT - 1) * 5, FT )

                surface_DrawLine( scrwc - v.add, scrhc - v.add, scrwc - 10 - v.add, scrhc - 10 - v.add )
                surface_DrawLine( scrwc + v.add, scrhc - v.add, scrwc + 10 + v.add, scrhc - 10 - v.add )
                surface_DrawLine( scrwc - v.add, scrhc + v.add, scrwc - 10 - v.add, scrhc + 10 + v.add )
                surface_DrawLine( scrwc + v.add, scrhc + v.add, scrwc + 10 + v.add, scrhc + 10 + v.add )
            end
        end

        if hvhobkak.cfg.vars["Hitnumbers"] and #hvhobkak.hitnums > 0 then 
            local n, c = string_ToColor( hvhobkak.cfg.colors["Hitnumbers"] ), string_ToColor( hvhobkak.cfg.colors["Hitnumbers krit"] )
        
            surface_SetFont( "veranda_scr" )

            for i = #hvhobkak.hitnums, 1, -1 do
                local v = hvhobkak.hitnums[ i ]

                if v.time < CT - 1 then table_remove( hvhobkak.hitnums, i ) continue end 

                surface_SetTextColor( v.crit and c or n )

                v.add = math_Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface_SetTextPos( scrwc - v.add * v.xdir, scrhc - v.add * v.ydir )
                surface_DrawText( v.dmg )
            end
        end

        if hvhobkak.cfg.vars["Fov limit"] and hvhobkak.cfg.vars["Show FOV"] then 
            local col = string_ToColor( hvhobkak.cfg.colors["Show FOV"] )
            
            local radius = hvhobkak.GetFovRadius()
        
            surface_SetDrawColor( 0, 0, 0, 128 )
            surface_DrawCircle( scrwc, scrhc, radius + 1 )

            surface_SetDrawColor( col.r, col.g, col.b )
            surface_DrawCircle( scrwc, scrhc, radius )

            surface_SetDrawColor( 0, 0, 0, 128 )
            surface_DrawCircle( scrwc, scrhc, radius - 1 )
        end

        if hvhobkak.target and hvhobkak.targetVector then
            if hvhobkak.cfg.vars["Aimbot snapline"] then 
                local pos = hvhobkak.targetVector:ToScreen()
                surface_SetDrawColor( string_ToColor( hvhobkak.cfg.colors["Aimbot snapline"] ) )
                surface_DrawLine( pos.x, pos.y, scrwc, scrhc )
            end
    
            if hvhobkak.cfg.vars["Aimbot marker"] then 
                local pos = hvhobkak.targetVector:ToScreen()

                surface_SetDrawColor( 0, 0, 0 )
                surface_DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
                surface_DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

                surface_DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
                surface_DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

                surface_DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
                surface_DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

                surface_DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
                surface_DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

                surface_SetDrawColor( string_ToColor( hvhobkak.cfg.colors["Aimbot marker"] ) )
                
                surface_DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
                surface_DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

                surface_DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
                surface_DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

                surface_DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
                surface_DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

                surface_DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
                surface_DrawRect( pos.x + 5, pos.y + 3, 1, 3 )

            end
        end
        
        surface_SetFont( "veranda" )

        if hvhobkak.cfg.vars[ "On screen logs" ] and table.Count( hvhobkak.onScreenLogs ) > 0 then
            local tick = engine.TickCount()
            local x, y = scrw / 2, scrh / 2 + 45 
    
            for k, v in pairs( hvhobkak.onScreenLogs ) do

                if hvhobkak.TICKS_TO_TIME( tick - hvhobkak.onScreenLogs[ k ].tick ) > 8 then
                    hvhobkak.onScreenLogs[ k ] = nil
                    continue 
                end

                local data = hvhobkak.onScreenLogs[ k ]
                local fstr = ""
    
                for o = 1, #data[ 1 ] do
                    fstr = fstr .. data[ 1 ][ o ]
                end
    
                local tw, th = surface_GetTextSize( fstr )
    
                x = x - tw / 2
                
                for p = 1, #data[ 1 ] do
                    local str = data[ 1 ][ p ]
                    tw, th = surface_GetTextSize( str )
    
                    surface_SetTextPos( x, y )
                    surface_SetTextColor( data[ 2 ][ p ] )
                    surface_DrawText( str )
    
                    x = x + tw
                end
    
                x, y = scrw / 2, y + th
            end
        end

        local plys = player_GetAll()

        if hvhobkak.cfg.vars[ "Spectator list" ] then
            local y = scrh / 2

            for i = 1, #plys do
                local v = hvhobkak.playerCache[ plys[ i ] ]

                if not v or not IsValid(v.entity) or not IsValid(v.ObserverTarget) then continue end
                if v.ObserverMode == 0 then continue end 

                surface_SetTextPos( 15, y )
                surface_SetTextColor( hvhobkak.Colors[255] )
                surface_DrawText( v.entity:Name() .. " spectating " .. v.ObserverTarget:Name() )
            
                y = y + 15
            end
        end 

        



        
    end
    
   
    
end



/*
hook.Add( "PostDrawTranslucentRenderables", "test", function()
    if hvhobkak.targetVector then
        render.DrawWireframeSphere( hvhobkak.targetVector, 0.5, 10, 10, Color( 255, 0, 64 ) )
    end
end)
*/


hvhobkak.kd = false
function hvhobkak.togglevisible()
    if hvhobkak.frame:IsVisible() then
        hvhobkak.frame:SetVisible(false)

        if hvhobkak.ui.MultiComboP then hvhobkak.ui.RemovePanel( hvhobkak.ui.MultiComboP ) end
        if hvhobkak.ui.ColorWindow then hvhobkak.ui.RemovePanel( hvhobkak.ui.ColorWindow ) end
        if hvhobkak.ui.SettingsPan then hvhobkak.ui.RemovePanel( hvhobkak.ui.SettingsPan ) end

        RememberCursorPosition()

        if hvhobkak.validsnd then hvhobkak.validsnd:Pause() end
    else
        hvhobkak.frame:SetVisible(true)

        RestoreCursorPosition()
        if hvhobkak.validsnd then hvhobkak.validsnd:Play() end
    end
end

// dormant esp 
--[[]

function hvhobkak.SetEntPos(ent,pos)
    if not IsValid(ent) or ent == me or not ent:IsDormant() then return end

    ent:SetNetworkOrigin(pos)
    ent:SetRenderOrigin(pos)
end

hook.Add( "EntityEmitSound", "EntSounds", function( data )
    local ent = data.Entity 
    local pos = data.Pos

    if ent:IsPlayer() and ent:Alive() and ent:IsDormant() then
        hvhobkak.SetEntPos(ent,pos)
        print(ent,pos)
    elseif ent:IsWeapon() then
        print(ent)
    end
end)

hook.Add( "PlayerStepSoundTime", "StepSounds", function( ent, type, walking )
    local pos = ent:GetPos()

    if ent:Alive() and ent:IsDormant() then
        hvhobkak.SetEntPos(ent,pos)
        print("steps ",ent,pos)
    end
end)
]]



function hvhobkak.PrePlayerDraw(ply, falgs)
	if ply != me then
        ply:AnimResetGestureSlot( GESTURE_SLOT_VCD )
        ply:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM )

        ply:SetPoseParameter( "head_pitch", 0 )
        ply:SetPoseParameter( "head_yaw", 0 )

        ply:InvalidateBoneCache()
        ply:SetupBones()

        ply.ChatGestureWeight = 0
    end

    if hvhobkak.cfg.vars["Visible chams"] then
        //ply:SetNoDraw( true )
    end
end


// Chams

CreateMaterial("flat", "VertexLitGeneric") 
CreateMaterial("flat_z", "VertexLitGeneric", {
    ["$ignorez"] = 1
} )

CreateMaterial( "selfillum", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial( "selfillum_a", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_a_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial("wireframe", "VertexLitGeneric", {
	["$wireframe"] = 1,
})
CreateMaterial("wireframe_z", "VertexLitGeneric", {
	["$wireframe"] = 1,
    ["$ignorez"] = 1,
})

CreateMaterial("metallic", "VertexLitGeneric", {
	["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
})

CreateMaterial("metallic_z", "VertexLitGeneric", {
    ["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
    ["$ignorez"] = 1,
})

hvhobkak.chamMats = {
    vis = {
        Material("!flat"), -- flat
        Material("!wireframe"), -- wireframe
        Material("!selfillum"), -- glow
        Material("!selfillum_a"), -- glow outline
        Material("!metallic"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    },
    invis = {
        Material("!flat_z"), -- flat
        Material("!wireframe_z"), -- wireframe
        Material("!selfillum_z"), -- glow
        Material("!selfillum_a_z"), -- glow outline
        Material("!metallic_z"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    }
}
 
do
    local f = (1/255)

    function hvhobkak.RenderScreenspaceEffects()
        if hvhobkak.UnSafeFrame then return end

        if hvhobkak.cfg.vars["Color Modify"] then 
            local rse = {
                [ "$pp_colour_addr" ] = hvhobkak.cfg.vars["Color Modify Add Red"],
                [ "$pp_colour_addg" ] = hvhobkak.cfg.vars["Color Modify Add Green"],
                [ "$pp_colour_addb" ] = hvhobkak.cfg.vars["Color Modify Add Blue"],
                [ "$pp_colour_brightness" ] = hvhobkak.cfg.vars["Color Modify Brightness"],
                [ "$pp_colour_contrast" ] = hvhobkak.cfg.vars["Color Modify Contrast"],
                [ "$pp_colour_colour" ] = hvhobkak.cfg.vars["Color Modify Saturation"],
                [ "$pp_colour_mulr" ] = hvhobkak.cfg.vars["Color Modify Mul Red"],
                [ "$pp_colour_mulg" ] = hvhobkak.cfg.vars["Color Modify Mul Green"],
                [ "$pp_colour_mulb" ] = hvhobkak.cfg.vars["Color Modify Mul Blue"]
            }
            DrawColorModify( rse )
        end

        local vm, invm = hvhobkak.cfg.vars["Visible mat"], hvhobkak.cfg.vars["inVisible mat"]
        local sin = math_floor( math_sin( CurTime() * 4 ) * 45 )

        local vc = string_ToColor(hvhobkak.cfg.colors["Visible chams"])
        local invc = string_ToColor(hvhobkak.cfg.colors["inVisible chams"])
        local sc = string_ToColor(hvhobkak.cfg.colors["Self chams"])
        
        cam_Start3D()
            for k, v in pairs(player_GetAll()) do
                if not IsValid(v) or v == me or not v:Alive() or v:IsDormant() then continue end 

                if hvhobkak.cfg.vars["Supress lighting"] then
                    render_SuppressEngineLighting(true)
                end

                if hvhobkak.cfg.vars["inVisible chams"] then
                    hvhobkak.chamMats.invis[6]:SetVector( "$envmaptint", Vector( invc.r / 255, invc.g / 255, invc.b / 255 ) )
                    render_MaterialOverride(hvhobkak.chamMats.invis[invm])
                    render_SetColorModulation(invc.r/255,invc.g/255,invc.b/255) 

                    if invm == 7 then
                        render_SetBlend( (sin + 100) / 255 )
                    end

                    v:SetRenderMode(1)
                    v:DrawModel()

                    if hvhobkak.cfg.vars["inVisible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if hvhobkak.cfg.vars["Visible chams"] then
                    hvhobkak.chamMats.vis[6]:SetVector( "$envmaptint", Vector( vc.r / 255, vc.g / 255, vc.b / 255 ) )
                    render_MaterialOverride(hvhobkak.chamMats.vis[vm])
                    render_SetColorModulation(vc.r/255,vc.g/255,vc.b/255)

                    if vm == 7 then
                        render_SetBlend( (sin + 100) / 255 )
                    end

                    v:DrawModel()

                    if hvhobkak.cfg.vars["Visible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if hvhobkak.cfg.vars["Supress lighting"] then
                    render_SuppressEngineLighting(false)
                end

            end

            if hvhobkak.cfg.vars["Self chams"] and IsValid(me) and me:Alive() then

                if hvhobkak.cfg.vars["Supress self lighting"] then
                    render_SuppressEngineLighting(true)
                end

                hvhobkak.chamMats.invis[6]:SetVector( "$envmaptint", Vector( sc.r / 255, sc.g / 255, sc.b / 255 ) )
                render_MaterialOverride(hvhobkak.chamMats.vis[hvhobkak.cfg.vars["Self mat"]])
                render_SetColorModulation(sc.r/255,sc.g/255,sc.b/255)

                if hvhobkak.cfg.vars["Self mat"] == 7 then
                    render_SetBlend( (sin + 100) / 255 )
                end

                me:SetRenderMode(1)
                me:DrawModel()

                if hvhobkak.cfg.vars["Self chams w"] then 
                    local w = me:GetActiveWeapon()
                    if IsValid(w) then w:DrawModel() end
                end
              
                if hvhobkak.cfg.vars["Supress self lighting"] then
                    render_SuppressEngineLighting(false)
                end

            end

            


        cam_End3D()

        render_SetColorModulation(1, 1, 1)
        render_SetBlend(1)
        render_MaterialOverride()
    end
end


// Client side models 

function hvhobkak.CS_Model(mdl)
    local model = ClientsideModel(mdl)
	model:SetNoDraw(true)

    return model
end

function hvhobkak.CS_Model_update(ply,model,tbl)
    if !ply or !model or !tbl then return end

    local mdl = model
    local playerModel = ply:GetModel()
    local layers = tbl.layers 

    for i = 0, 13 do
        if mdl:IsValidLayer(i) then
            local l = layers[i]
            mdl:SetLayerCycle(l.cycle)
            mdl:SetLayerSequence(l.sequence)
            mdl:SetLayerWeight(l.weight)
        end
    end

    mdl:SetSequence(tbl.sequence)
    mdl:SetCycle(tbl.cycle)

    mdl:SetPoseParameter("aim_pitch", tbl.angles.p)
	mdl:SetPoseParameter("head_pitch", 0)
	mdl:SetPoseParameter("body_yaw", tbl.angles.y)
	mdl:SetPoseParameter("aim_yaw", 0)
		
	mdl:SetPoseParameter("move_x", tbl.movex)
	mdl:SetPoseParameter("move_y", tbl.movey)

    mdl:SetAngles( Angle( 0, tbl.angles.y, 0 ) )
    mdl:SetModel( playerModel )
	mdl:SetPos( tbl.origin )
end

function hvhobkak.PostDrawTranslucentRenderables()
    if hvhobkak.UnSafeFrame then return end

    hvhobkak.drawCSModels_backtrack()
    hvhobkak.drawCSModels_real()

    render_SetBlend(1)
    render_MaterialOverride()
end


// Backtracking 

hvhobkak.btrecords = {}
hvhobkak.predicted = {}

















function hvhobkak.canBacktrack(ply)
    if not hvhobkak.cfg.vars["Backtrack"] then return false end 
    if not IsValid(ply) then return false end
    if not hvhobkak.btrecords[ply] then return false end 
    if ply.break_lc then return false end 

    return true 
end

function hvhobkak.recordBacktrack(ply)
	local deadtime = CurTime() - hvhobkak.cfg.vars["Backtrack time"] / 1000
	
	local records = hvhobkak.btrecords[ply]

	if !records then
        records = {}
		hvhobkak.btrecords[ply] = records
	end
	
	local i = 1
	while i < #records do
		local record = records[i]
		
		if record.simulationtime < deadtime then
			table_remove(records, i)
			i = i - 1
		end
		
		i = i + 1
	end
	
	if !ply:Alive() then return end
    if ply.break_lc then return end
	
	local simulationtime = ded.GetSimulationTime(ply:EntIndex())
	local len = #records
	local simtimechanged = true

	if len > 0 then
		simtimechanged = records[len].simulationtime < simulationtime
	end
	
	if !simtimechanged then return end

	local layers = {}
	for i = 0, 13 do
		if ply:IsValidLayer(i) then
			layers[i] = {
				cycle = ply:GetLayerCycle(i),
				sequence = ply:GetLayerSequence(i),
				weight = ply:GetLayerWeight(i)
			}
		end
	end

    local eyeAngles = ply:EyeAngles()
    local x,y = eyeAngles.x, eyeAngles.y

    local bdata = {}
    for i = 0, ply:GetBoneCount() - 1 do
        local v, a = ply:GetBonePosition( i )
        bdata[i] = { vec = v, ang = a }
    end

    local hdata = {}
    local hset = ply:GetHitboxSet()
    local hnum = ply:GetHitBoxCount( hset )
    
    for hitbox = 0, hnum - 1 do
        local bone = ply:GetHitBoxBone( hitbox, hset )
  
        if bone == nil then continue end

        local mins, maxs = ply:GetHitBoxBounds( bone, hset )

        if not mins or not maxs then continue end 

        local bonepos, ang = ply:GetBonePosition( bone )  
        mins:Rotate( ang )
        maxs:Rotate( ang )

        hdata[ #hdata + 1 ] = { pos = bonepos, mins = mins, maxs = maxs }
    end

    local skeletondata = {}

    /*
    for i = 0, ply:GetBoneCount() - 1 do

        local parent = ply:GetBoneParent(i)

        if(!parent) then continue end

        local bonepos = ply:GetBonePosition(i)

        if(bonepos == ply:GetPos() ) then continue end

        local parentpos = ply:GetBonePosition(parent)

        if(!bonepos or !parentpos) then continue end

        skeletondata[ 1 ] = bonepos:ToScreen()
        skeletondata[ 2 ] = parentpos:ToScreen()
    end
    */

	records[len + 1] = {
		simulationtime =    ded.GetSimulationTime(ply:EntIndex()),
		angles =            Angle(x,y,0),
		origin =            ply:GetNetworkOrigin(),
		aimpos =            hvhobkak.GetBones( ply )[1],
		sequence =          ply:GetSequence(),
		cycle =             ply:GetCycle(),
		layers =            layers,
        movex =             ply:GetPoseParameter("move_x"),
        movey =             ply:GetPoseParameter("move_y"),
        bonedata =          bdata,
        //hitboxdata =        hdata,
        //skeleton =          skeletondata
    }
end

hvhobkak.btmodel = hvhobkak.CS_Model("models/player/kleiner.mdl")

function hvhobkak.drawCSModels_backtrack()
    if not hvhobkak.cfg.vars["Backtrack chams"] then return end 
    if not hvhobkak.canBacktrack(hvhobkak.target) then return end

    local len = #hvhobkak.btrecords[hvhobkak.target]
    local tbl = hvhobkak.btrecords[hvhobkak.target][hvhobkak.backtracktick]
    local m = hvhobkak.btmodel

    hvhobkak.CS_Model_update(hvhobkak.target,m,tbl)

    if hvhobkak.cfg.vars["Backtrack fullbright"] then
        render_SuppressEngineLighting(true)
    end

    local col = string_ToColor(hvhobkak.cfg.colors["Backtrack chams"])
    hvhobkak.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render_MaterialOverride(hvhobkak.chamMats.invis[hvhobkak.cfg.vars["Backtrack material"]]) 
    render_SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if hvhobkak.cfg.vars["Backtrack fullbright"] then
        render_SuppressEngineLighting(false)
    end
end

hvhobkak.hitmarkers = {}
hvhobkak.hitnums = {}

gameevent.Listen( "player_hurt" )

function hvhobkak.player_hurt(data)
    local health = data.health
	local priority = SERVER and data.Priority or 5
	local hurted = Player( data.userid )
	local attackerid = data.attacker

	if attackerid == me:UserID() then
        
        if hvhobkak.cfg.vars[ "On screen logs" ] then
            local hlcolor = string_ToColor( hvhobkak.cfg.colors[ "On screen logs" ] )
            local data = {
                tick = engine.TickCount(),
                {
                    "Hit ",
                    hurted:Name(),
                    " for ",
                    hurted:Health() - health,
                    " damage"
                },
                {
                    hvhobkak.HitLogsWhite,
                    hlcolor,
                    hvhobkak.HitLogsWhite,
                    hlcolor,
                    hvhobkak.HitLogsWhite,
                }
            }
            
            hvhobkak.onScreenLogs[ engine.TickCount() ] = data
            //print( "hurt", engine.TickCount() )
        end

        if hvhobkak.cfg.vars["Hitmarker"] then
            hvhobkak.hitmarkers[ #hvhobkak.hitmarkers + 1 ] = { time = CurTime(), add = 0 }
        end

        if hvhobkak.cfg.vars["Hitnumbers"] then
            local hp = hurted:Health() - health
            hvhobkak.hitnums[ #hvhobkak.hitnums + 1 ] = { time = CurTime(), add = 0, xdir = math_random(-1,1), ydir = math_random(-1,1), dmg = hp, crit = health <= 0 }
        end

        if hvhobkak.cfg.vars["Hitsound"] then
            surface_PlaySound( hvhobkak.cfg.vars["Hitsound str"] )
        end

        if hvhobkak.cfg.vars["Resolver"] then 
            hurted.aimshots = (hurted.aimshots or 0) - 1
        end

    end
end

/*
    Player vars 
*/

function hvhobkak.initPlayerVars( v )
    v.ult_prev_pos = Vector()

    v.ult_prev_simtime = 0 
    v.flticks = 0 
    v.aimshots = 0
    v.missedanimticks = 0

    v.break_lc = false 
    v.simtime_updated = false 
    v.fakepitch = false

    hvhobkak.btrecords[ v ] = {}
    hvhobkak.predicted[ v ] = {}
end

for k, v in ipairs(player_GetAll()) do
	hvhobkak.initPlayerVars( v )
end


hvhobkak.chatmsg = 
{
        [1] = {
            "I am the way and the truth and the life. No one comes to the Father except through me. -Jesus",
            "Do to others as you would have them do to you. -Jesus",
            "With man this is impossible, but with God all things are possible. -Jesus",
            "Do not judge, or you too will be judged. -Jesus",
            "No one can serve two masters.You cannot serve both God and money. -Jesus",
            "And whoever wants to be first must be slave of all. -Jesus",
            "And whoever welcomes one such child in my name welcomes me. -Jesus",
            "For where your treasure is, there your heart will be also. -Jesus",
            "Greater love has no one than this: to lay down one’s life for one’s friends. -Jesus",
            "Whoever drinks the water I give them will never thirst. -Jesus",
            "That which does not kill us makes us stronger. -Friedrich Nietzsche",
            "In the middle of every difficulty lies opportunity. -Albert Einstein",
            "Don’t cry because it’s over, smile because it happened. -Dr Suess",
            "If you want something done right, do it yourself. -Charles-Guillaume Étienne",
            "The unexamined life is not worth living. -Socrates",
            "Better to have loved and lost, than to have never loved at all. -St Augustine",
            "An eye for an eye leaves the whole world blind. -Mahatma Gandhi",
            "In three words I can sum up everything I’ve learned about life: it goes on. -Robert Frost",
            "Necessity is the mother of invention. -Plato",
            "To err is human; to forgive, divine. -Alexander Pope",
            "Imagination is more important than knowledge. -Albert Einstein",
            "With great power comes great responsibility. -Voltaire",
            "Believe you can and you’re halfway there. -Theodore Roosevelt",
            "The pen is mightier than the sword. -Proverb",
            "Life is like a box of chocolates. You never know what you’re gonna get. -Forrest Gump’s Mom",
            "Familiarity breeds contempt. -Aesop",
            "It is always darkest just before the dawn. -Thomas Fuller",
            "The ballot is stronger than the bullet. -Lincoln",
            "If you are going through hell, keep going. -Winston Churchill",
            "I am not removing the debug library, calm down. -Rubat",
            "加里-纽曼（Garry Newman）请把我们从 rubat 拯救出来，他正在摆脱 debug.getregistry。-Lavrentiy Bandera",
            "Use hvhobkak™️, not exechack. -Jesus",
            "A rose by any other name would smell as sweet. -Juliet",
            "Don't cry because it's over, smile because it happened. -Dr. Seuss",
            "You miss 100% of the shots you don't take. -Wayne Gretzky",
            "Happiness is not something ready made. It comes from your own actions. -Dalai Lama",
            "My account details layo2021 - JNYLEQbgpiwv. -Donald Dicks $$$",
            "I WANT TO BE BANGED HARD. -Serejaga",
            "Um, I wonder if I am being hacked. -Ramzi",
            "Connections... no hackers. -Ramzi",
            "We love death. The U.S. loves life. That is the difference between us two. -Osama bin Laden",
            "I don't regret what happened there. -Osama bin Laden",
            "For God and country - Geronimo, Geronimo, Geronimo. -Osama bin Laden",
            "I support any Muslims, whether here or abroad. -Osama bin Laden",
            "An ounce of prevention is better than a pound of cure. -Osama bin Laden",
            "There is no dialogue except with weapons. -Osama bin Laden",
            "Russia does not have a great deal of experience building democratic institutions. -Putin",
            "Those who fight corruption should be clean themselves. -Putin",
            "The question isn't who is going to let me; it's who is going to stop me. -Putin",
            "There are no grounds to suggest that Russia will return to the Cold War. -Putin",
            "The 21st century will be defined by the fight against terrorism. -Putin",
            "Russia has never been surrounded by so many friends as it is today. -Putin",
            "Nobody should pin their hopes on a miracle. -Putin",
            "Russia is a country of free people who can ensure their prosperity and well-being. -Putin",
            "I believe in the people and the wisdom of our elites. -Putin",
            "In Russia, the state, in a proper sense, returned only recently. -Putin",
            "Why don't you make me a Double-expresso -- Macchiato -- with extra foam? -Bill Williamson",
            "Everyone's gotta live, everyone's gotta be happy - It's a joke. -Bill Williamson",
            "Buy a grandfather's penis and fuck everyone!",
            "All you need is Grandpa's penis! Trust me",
            "Buy a grandfather's penis and you can live not in a shoe box",
            "Grandfather's penis is the best solution",
            "Would you choose to be raped in prison or buy grandfather's penis?",
            "Do you have a small penis? It doesn't matter! Buy a grandfather's penis",
            "Tired of playing with a bad cheat? Buy grandfather's penis",
            "I want to sleep but can't get up from the table? There is a solution - GRANDFATHER'S PENIS!",
            "Tired of dying from grandfather's penis? Buy Grandfather's penis and kill everyone!",
        },
        [2] = {
            "1 нищий упал",
            "$$$ кешбек по зубам $$$",
            "╭∩╮( ⚆ ʖ ⚆)╭∩╮ ДоПрыГался(ت)ДрУжоЧеК",
            "·٠●•۩۞۩ОтДыХаЙ (ٿ) НуБяРа۩۞۩•●٠·",
            "але , а противники то где???",
            "ты по легиту играешь ?",
            "ебать ты красиво на бутылку присел , тебе дать альт ?",
            "пробил тикбазу головой твоей жирной матухи",
            "АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК [XML-RPC] No-Spread 24/7 | aim_ag_texture_2 ONLY!",
            "на мыло и веревку то деньги есть????",
            "продам оффсеты на гмод цена 100 рублей российских",
            "Я прямо как Ильназ Галяиев",
            "Я муслим мне похуй на кризис мой пенис вырос",
            "Вот тебе паяльник , запаяй себе ебальник",
            "оттарабанен армянская королева",
            "сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
            "Я твою маму дуже сильно поважаю , нехай береже її Степан Бендера",
            "Loading… ██████████ Lifehack.cfg Activated",
            "упавший на медию никогда не встанет с колен.",
            "Черные глаза Вспоминаю — умираю Черные глаза Я только о тебе мечтаю",
            "алло это скорая? тут такая ситуация парню который упал нужна скорая)",
            "Извини дорогая , не хотел на лицо",
            "прости что без смазки)",
            "лол ору ты прямо как 𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸",
            "обе чернокожие головы превратились в кубики льда… Бере.",
            "Ало скорая тут такой случай шкiла упала в месорубку",
            "ты то куда лезешь сын фантомного стационарного спец изолированого металлформовочного механизма",
            "99 имен Аллаhа для детей",
            "у тебя член не конский не по масти эпик фейл",
            "гелим гелим гелим на валике",
            "Приходи один работёнка есть!, координаты: 55.8653382,49.304329",
            "юид полиция подьехала открывай дверь уебыч",
            "Disgusting tranny holzed",
            "але ты там из хрущевки выеди а потом вырыгивай блять", 
            "как там с мамкой комнату разделять АХАХАХХАХА как ты на акк накопил блять",
            "найс 0.5х0.5м комната блять ХАХАХАХА ТЫ ТАМ ЖЕ ДАЖЕ ПОВЕСИТЬСЯ НЕ МОЖЕШЬ МЕСТА НЕТ ПХПХПХППХ", 
            "на мыло и веревку то деньги есть нищ????", 
            "опущены стяги, легион и.. А БЛЯТЬ ТЫЖ ТУТ ОПУЩ НАХУЙ ПХГАХААХАХАХАХА)))))))",
            "але какая с юидом ситуация)))", 
            "че тут эта нищая собака заскулила", 
            "не хотелось даже руки об тебя марать нищ сука", 
            "ебать ты красиво на бутылку упал",
            "прости что без смазки)))", 
            "алло это скорая? тут такая ситуация нищ упал))) ОЙ А ВЫ НИЩАМ ТО НЕ ПОМОГАЕТЕ?? ПОНЯТНО Я ПОЙДУ ТОГДА))))))))", 
            "вырыгнись из окна нахуй боберхук юзер",
            "тяжело с мемсенсом наверно????", 
            "nice chromosome count you sell??", 
            "как ты на пк накопил даже не знаю )))))))))",
            "iq больше двух будет пмнешь ок????", 
            "НИХУЯ ТАМ НЬЮКАМЫЧА ОРОШИЛИ СТРУЕЙ МОЧИ АХАХХАХАХАХАХАХАХА",
            "дал юид за щеку проверяй",
        },
        [3] = {
            "Девочки пишите мне в телеграм обменяемся интимками",
            "Кто в Барнауле?) Телеграмм вверху. Пишите(я пацан) поебёмся",
            "Девушки, накидайте интимок в тг aexcasas буду вам очень благодарен)",
            "Скиньте пизду плиз телега fruti",
            "Кто нибудь скиньте мне хуй я гей",
            "Скиньте киску свою в тг _The_best_",
            "Дамы и господа присылайте свои половые органы в телеграмм имя сверху жду.",
            "Скиньте свои интимками я вам хуй) только девушки @FaresFaru",
            "Хочю трахаца! Мой тг @zxc_Youpeser",
            "девочки давайте обменяемся интим фото вот мои тг matvejb1",
            "давайте перекинемся интим фото",
            "Кто может скинуть свои сиськи в тг",
            "Я лезбиянка скинть свою пизду и грудь",
            "Кто обмен интимками я мальчик тгDad Anime",
            "Я бы жоска выебал амбер и кончил ей на лицо",
            "Кто хочет быть трахнутым пишите тг:@shhhegx",
            "Кто скинет интимку из девочек, пишите",
            "Девочки давайте вы скините мне пизду. А я вам член?",
            "давай я тебе сиськи ты мне член?",
            "Долбите членом меня в задницу и засуньте мне глубоко в рот",
            "Скинь попку, зайчик",
            "Го обмен член на член",
            "я професионал трахаю так шо до смерти на трахаюсь амбер я хочу",
            "до трахаю до смерти ",
            "Оттрахайте меня пожалуйста могу и пососать кончити в меня сколько хотите",
            "Я могу тебя оттрахать, согласна?",
            "Хах могу отсосать))",
            "Я срадастью дам пососать свой член",
            "Оо го мне вот мой тг:Ivan_123455 у меня хуй 17 см так что он войдёт в твой рот",
            "Го скину хуй,а ты мне пизду??",
            "Кто будет ебаться с презиком",
            "Выебите меня во все щели! Ах ааа я кончаю!!!!!!! Кончи мне на лицо!!!! Твоя сперма такая вкусная!!!!!",
            "Выеби меня в жопу!!!!!! Ещё не ещё!! Сука да блядь! Я снова кончаю!!!!",
            "У меня большооооой",
            "Кто хочет у меня отсосать",
            "Амбер ты гаряча давай ка мне первому пжжжж!",
            "Пж девочки скиньте свою пизду",
            "Скинте мне слив брока. :((",
            "Изнасилуйте меня пожалуста хочу глотать сперму хочу хуй в жопу и хуй между сисек",
            "Девчонки обмен интимками в вк ekazarin99  жду)",
            "Девочки скиньте мне свою пизду в вк ekazarin99 обмен интимками",
            "ООО хорошо подрочил",
            "Скиньте сиськи",
            "Скинь жопу пж",
            "мальчики я хочу трахаться и подрочить ваши члены скидывайте мне в телеграмм @aaalinaaa69",
        },
        [4] = {
            "как мать %s ? жива ?",
            "иди мать чекни %s",
            "как там шлюха мать %s поживает?",
            "вчера шлюху на трассе выбеал, вроде мать %s была",
            "мне тут птичка на ухо напела что у %s мать сгнила нахуй",
            "я недавно тут услышал что у %s мать сдохла xD",
            "бля %s убери свою дохлую мать, гнилью воняет пиздец",
            "вчера мать %s ебал норм темка",
            "ебать мать %s жирная свинья",
            "вчера мать %s топором захуярил",
            "мать %s настолько жирная что её грузовиком переехать мало",
            "у %s батя за хлебом ушел",
            "%s ебать лох ливни нахуй",
            "забавный факт, мать %s весит 500кг :)",
            "смотри в садик не опоздай %s",
            "%s у тебя утренник скоро",
            "%s ты как блять из палаты выбрался?",
            "кто сука интернет в палату к %s провёл?)",
            "%s тебе завтра вроде в школу...",
            "%s не забудь дз сделать :)",
            "нахуя к %s в деревню интернет провели...",
            "какой далбаеб додумался в деревню %s инет провести...",
            "%s ливни нахуй пж",
            "%s quit в консоль пж",
            "%s сьеби чмошник",
            "вчера шлюху отьебал. вроде %s звали",
            "пиздец %s лох ебаный ливни пж",
            "лол ебать у %s хуёв в жопе",
            "ебать у матери %s пизда размером с 10 этажный дом :)",
            "%s не обижайся конечно но я твою мать ебал xD",
            "%s когда думаешь из жизни ливать?",
            "сосни хуйца %s",
            "хуесос чмо пидр лох -> %s",
            "%s ебанись головой об стену пж",
            "%s смотри на первый урок не опоздай :)",
            "%s завтра в школу вроде",
            "%s как мать?)",
            "П|/|3ДЕЦ /\0Х -> %s",
            "%s с мамой и папой регулярно играл в снежки :)",
            "%s всегда такой далбаеб или сегодня особый день?",
            "%s задумался?! что то новенькое",
            "таких лохов как %s давно не видел",
            "поговаривают что %s отчим трахает :)",
            "вчера на могилу матери %s насрал :D",
            "мать %s стоя на коленях у меня сосала :)",
            "мать %s сдохла пока мой хуй сосала xD",
            "недавно выебал бабушку %s, было вкусно ˙ ͜ʟ˙",
            "вчера сжег деда %s ˙ ͜ʟ˙",
            "ебал все поколения родственников %s ツ",
            "ронял кирпич на голову матери %s ◝(ᵔᵕᵔ)◜",
            "%s по секрету скажу я твоего деда трахал ( ͡° ͜ʖ ͡°)",
            "выцарапал глаза матери %s. сори у меня лапки ฅ^•ﻌ•^ฅ",
            "%s скажи арбуз! твоя мать шлюха ◉‿◉",
            "( ＾◡＾)っ✂╰⋃╯ отцу %s хуй отрезал хахахахаах",
            "у %s сдохла мать и мне некого больше ебать (つ╥﹏╥)つ",
            "☠ у %s мать сдохла +шлюха +спидозная +похуй всем ☠",
            "( ◡̀_◡́) крепись брат %s у тебя мать сдохла",
            "%s тут такое дело... твоя мать такая милая когда ласкает мой член =^◕⩊◕^=",
            "%s дай сиськи потрогац ฅ՞•ﻌ•՞ฅ",
            "%s далбаеб ◡̈ ◡̈ ◡̈",
            "зуб даю у мамки %s самые мягкие сиськи ˶ᵔ ᵕ ᵔ˶",
        },
    }


// Init player vars 
gameevent.Listen( "player_spawn" )
gameevent.Listen( "player_activate" )
gameevent.Listen( "entity_killed" )

function hvhobkak.entity_killed(data)
	local aid = Entity(data.entindex_attacker)	
	local vid = Entity(data.entindex_killed)

    if aid == me and aid != vid and !vid:IsNPC() and (vid:IsPlayer() or vid:IsBot() ) then
        if hvhobkak.cfg.vars["Killsay"] then
            local chatPrefixes = {
                [2] = "/ooc ",
                [3] = "/ad "
            }
            
            local chatGroup = hvhobkak.cfg.vars["Killsay group"]
            
            local prefix = chatPrefixes[chatGroup] or ""
        
            local tbl = hvhobkak.chatmsg[ hvhobkak.cfg.vars["Killsay mode"] ]
            local str = prefix .. tbl[ math_random( 1, #tbl ) ]
            
            if str:find("%s") then str = str:format(vid:Nick()) end

            gRunCmd( "say", str )
        end
        
        if hvhobkak.cfg.vars["Killsound"] then
            surface_PlaySound( hvhobkak.cfg.vars["Killsound str"] )
        end

     
    end
end



function hvhobkak.updatePlayerVars( data )
    local id = data.userid  

    local ply = Player( id )

    ply.ult_prev_pos = Vector()
    // ply.ult_prev_hitbox_pos = Vector()
    
    ply.ult_prev_simtime = 0
    ply.flticks = 0
        
    ply.simtime_updated = false
    ply.break_lc = false
    ply.fakepitch = false

    hvhobkak.btrecords[ ply ] = {}
    hvhobkak.predicted[ ply ] = {}
end



















// Menu hints 

function hvhobkak.DrawMenuHints()
    if not hvhobkak.frame:IsVisible() then return end

    if not hvhobkak.hint then
        hvhobkak.hintText = ""
        return
    end

    surface_SetTextColor(hvhobkak.Colors[165])
    surface_SetFont("tbfont")

    local tw, th = surface_GetTextSize(hvhobkak.hintText)

    surface_SetDrawColor(hvhobkak.Colors[35])
    surface_DrawRect(hvhobkak.hintX,hvhobkak.hintY,tw+20,th+10)
    surface_SetDrawColor(hvhobkak.Colors[54])
    surface_DrawOutlinedRect(hvhobkak.hintX,hvhobkak.hintY,tw+20,th+10,1)    

    surface_SetTextPos(hvhobkak.hintX+10,hvhobkak.hintY+5)
    surface_DrawText(hvhobkak.hintText)

    hvhobkak.hint = false
end

function hvhobkak.DrawOverlay()
    if hvhobkak.UnSafeFrame then return end

    hvhobkak.DrawMenuHints()
end


// Gamemode UpdateClientsideAnimation
--[[]
local function RunSandboxAnims(ply, velocity, maxseqgroundspeed)
    local len = velocity:Length()
	local movement = 1.0

	if ( len > 0.2 ) then
		movement = ( len / maxseqgroundspeed )
	end

	local rate = math.min( movement, 2 )

	-- if we're under water we want to constantly be swimming..
	if ( ply:WaterLevel() >= 2 ) then
		rate = math.max( rate, 0.5 )
	elseif ( !ply:IsOnGround() && len >= 1000 ) then
		rate = 0.1
	end

	ply:SetPlaybackRate( rate )

	-- We only need to do this clientside..
	if ( CLIENT ) then
		if ( ply:InVehicle() ) then
			--
			-- This is used for the 'rollercoaster' arms
			--
			local Vehicle = ply:GetVehicle()
			local Velocity = Vehicle:GetVelocity()
			local fwd = Vehicle:GetUp()
			local dp = fwd:Dot( Vector( 0, 0, 1 ) )

			ply:SetPoseParameter( "vertical_velocity", ( dp < 0 && dp || 0 ) + fwd:Dot( Velocity ) * 0.005 )

			-- Pass the vehicles steer param down to the player
			local steer = Vehicle:GetPoseParameter( "vehicle_steer" )
			steer = steer * 2 - 1 -- convert from 0..1 to -1..1
			if ( Vehicle:GetClass() == "prop_vehicle_prisoner_pod" ) then steer = 0 ply:SetPoseParameter( "aim_yaw", math.NormalizeAngle( ply:GetAimVector():Angle().y - Vehicle:GetAngles().y - 90 ) ) end
			ply:SetPoseParameter( "vehicle_steer", steer )

		end
	end
end

function GAMEMODE:UpdateAnimation(plr, velocity, maxSeqGroundSpeed)
    local hResult = self.BaseClass.UpdateAnimation(self, plr, velocity, maxSeqGroundSpeed)

    RunSandboxAnims(plr, velocity, maxSeqGroundSpeed)
    return hResult;
end
]]



/*
    Libs -> Color
*/



//function hvhobkak.


function hvhobkak.ColorLerp( first, second )
    local FT = FrameTime() * 350

    first.r = math_Approach( first.r, second.r, FT )
    first.g = math_Approach( first.g, second.g, FT )
    first.b = math_Approach( first.b, second.b, FT )
    first.a = math_Approach( first.a, second.a, FT )

    math_Round( first.r, 0 )
    math_Round( first.g, 0 )
    math_Round( first.b, 0 )
    math_Round( first.a, 0 )

    return first
end

function hvhobkak.ColorEqual( first, second )
    if first.r != second.r or first.g != second.g or first.b != second.b or first.a != second.a then
        return false
    end

    return true 
end





/* 
    hooks -> Think 
*/

hvhobkak.ekd = false
hvhobkak.fbkd = false

// Dancer ( act / taunt spam )

hvhobkak.nextact = 0
hvhobkak.actCommands = {"robot","muscle","laugh","bow","cheer","wave","becon","agree","disagree","forward","group","half","zombie","dance","pers","halt","salute"}

// Name changer 

do
    local cooldown = GetConVarNumber("sv_namechange_cooldown_seconds")
    local curtime = CurTime()
    local lastname = me:Name()
    local changed = 0

    local function check(pl,mn,ptbl)
        if pl == me then return false end 

        if pl:Name() == mn then return false end

        if #ptbl > 5 then
            if lastname == pl:Name() then return  false end
        end

        return true
    end

    local function changename(name)
        ded.NetSetConVar("name",name.." ")

        if changed >= 2 then
            changed = 0
            lastname = name
        else
            changed = changed + 1
        end

        curtime = CurTime() + cooldown
    end

    function hvhobkak.nameChanger() 
        if curtime > CurTime() then return end

        local pltbl = player_GetAll()

        local len = me:Name():len()

        local mname = string.sub(me:Name(),1,len-1)

        local i = math_random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
end

do
    local tply
    local chatdelay = CurTime()
    local inverterdown = false
        
    function hvhobkak.Think()
        if input_IsKeyDown(KEY_END) then 
            hvhobkak.Unload()
        end

        if input_IsKeyDown(KEY_INSERT) and not hvhobkak.kd then 
            hvhobkak.togglevisible()
    
            CloseDermaMenus()
        end

        hvhobkak.kd = input_IsKeyDown(KEY_INSERT)

        if hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Ent add"] ) and not hvhobkak.ekd then
            local tr = me:GetEyeTrace().Entity

            if IsValid( tr ) then 
                local class = tr:GetClass()

                //print( hvhobkak.allowedClasses[ class ] )

                if not hvhobkak.allowedClasses[ class ] then
                    hvhobkak.allowedClasses[ class ] = true
                else
                    hvhobkak.allowedClasses[ class ] = not hvhobkak.allowedClasses[ class ]
                end
            end
        end

        if hvhobkak.cfg.vars["Inverter"] and hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Inverter"] ) and not inverterdown then
            hvhobkak.inverted = !hvhobkak.inverted 
        end

        inverterdown = hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Inverter"] )

        hvhobkak.ekd = hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Ent add"] )

        if hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Fullbright"] ) and not hvhobkak.fbkd then
            hvhobkak.fbe = not hvhobkak.fbe
        end

        hvhobkak.fbkd = hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Fullbright"] )

        if hvhobkak.cfg.vars["FSpec ClickTP"] and hvhobkak.IsKeyDown( hvhobkak.cfg.binds["FSpec ClickTP"] ) then
            local pos = me:GetEyeTrace().HitPos
            
            //print(pos)

            //gRunCmd( "ba", "spec" )

            gRunCmd( "FTPToPos", string_format("%d, %d, %d", pos.x, pos.y, pos.z), string_format("%d, %d, %d", 0, 0, 0) )
        end

        
        
        // hvhobkak.cfg.vars["FSpec Teleport"] = false
        // hvhobkak.cfg.binds["FSpec Teleport"] = 0
        
        // hvhobkak.cfg.vars["FSpec Masskill"] = false
        // hvhobkak.cfg.binds["FSpec Masskill"] = 0
        
        // hvhobkak.cfg.vars["FSpec Velocity"] = false
        // hvhobkak.cfg.binds["FSpec Velocity"] = 0

        if hvhobkak.cfg.vars["Chat spammer"] and CurTime() > chatdelay then
            local chatPrefixes = {
                [2] = "/ooc ",
                [3] = "/ad "
            }
            
            local chatGroup = hvhobkak.cfg.vars["Chat group"]
            
            local prefix = chatPrefixes[chatGroup] or ""
        
            local tbl = hvhobkak.chatmsg[ hvhobkak.cfg.vars["Chat mode"] ]
            local str = prefix .. tbl[ math_random( 1, #tbl ) ]

            local players   = player_GetAll()

            local random_ply = players[ math_random( 1, #players ) ]
            if random_ply == me then return end

            str = string_format( str, hvhobkak.playerCache[ random_ply ].Name )

            gRunCmd("say", str)

            chatdelay = CurTime() + hvhobkak.cfg.vars["Chat delay"]
        end
    
        if hvhobkak.cfg.vars["Name stealer"] then hvhobkak.nameChanger() end
    
        if ded.GetCurrentCharge() < hvhobkak.cfg.vars["Shift ticks"] then ded.StartShifting( false ) end

        if hvhobkak.cfg.vars["Tickbase shift"] then 
            if hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Tickbase shift"] ) then
                ded.StartShifting( true )
            end
            
            local shouldcharge =  ded.GetCurrentCharge() < hvhobkak.cfg.vars["Charge ticks"] and hvhobkak.IsKeyDown( hvhobkak.cfg.binds["Auto recharge"] )
            
            ded.StartRecharging( shouldcharge )
        
            if shouldcharge then
                ded.StartShifting( false )
            end
        end
    
        if hvhobkak.cfg.vars["Taunt spam"] and hvhobkak.nextact < CurTime() and me:Alive() and !me:IsPlayingTaunt() then 
            local act = hvhobkak.actCommands[hvhobkak.cfg.vars["Taunt"]]
    
            gRunCmd("act", act)
            hvhobkak.nextact = CurTime() + 0.3
        end
    
        if hvhobkak.cfg.vars["Yaw base"] == 2 then
            tply = hvhobkak.GetSortedPlayers( 1, 0, 1, false ) 
    
            if tply then
                hvhobkak.aatarget = tply[1][1]
            end
        end

        if hvhobkak.cfg.vars["Auto peak"] then
            hvhobkak.autopeakThink()
        end
    end
end


/*
    hooks -> CalcView
*/

hvhobkak.vieworigin = me:EyePos()
hvhobkak.viewfov    = 0
hvhobkak.znear      = 0

hvhobkak.tpenabled = false
hvhobkak.tptoggled = false

hvhobkak.fcvector = me:EyePos()
hvhobkak.fcangles = me:EyeAngles()
hvhobkak.fcenabled = false
hvhobkak.fctoggled = false


/* // TODO
hvhobkak.checkbox("Collision","Third person collision",p:GetItemPanel())
hvhobkak.checkbox("Smoothing","Third person smoothing",p:GetItemPanel())

hvhobkak.slider("X","Viewmodel x",1,180,0,p:GetItemPanel())
hvhobkak.slider("Y","Viewmodel y",1,180,0,p:GetItemPanel())
hvhobkak.slider("Z","Viewmodel z",1,180,0,p:GetItemPanel())
hvhobkak.slider("Roll","Viewmodel r",1,360,0,p:GetItemPanel())
*/

hvhobkak.cameraHullMax = Vector( 3, 3, 3 )
hvhobkak.cameraHullMin = Vector( -3, -3, -3 )
function hvhobkak.CalcView( ply, origin, angles, fov, znear, zfar )

    if hvhobkak.UnSafeFrame then 
        return { origin = origin, angles = angles, fov = fov } 
    end

    local view = {}

    local tppressed = hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Third person"])
    local fcpressed = hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Free camera"])

    if hvhobkak.cfg.vars["Third person"] and tppressed and not hvhobkak.tptoggled then
        hvhobkak.tpenabled = not hvhobkak.tpenabled
    end

    if hvhobkak.cfg.vars["Free camera"] and fcpressed and not hvhobkak.fctoggled then
        hvhobkak.fcenabled = not hvhobkak.fcenabled
        hvhobkak.fcangles = me:EyeAngles()
    elseif hvhobkak.fcenabled and not hvhobkak.cfg.vars["Free camera"] then
        hvhobkak.fcenabled = false
    end

    hvhobkak.tptoggled = tppressed
    hvhobkak.fctoggled = fcpressed


    if hvhobkak.cfg.vars["Fake duck"] and hvhobkak.IsKeyDown(hvhobkak.cfg.binds["Fake duck"]) then
        origin.z = me:GetPos().z + 64
    end

    local fangs = hvhobkak.cfg.vars["Silent aim"] and hvhobkak.SilentAngle or angles

    //angles = fangs
    //if not hvhobkak.cfg.vars[ "Norecoil" ] then
    //    angles:Add( ply:GetViewPunchAngles() )
    //end

    if hvhobkak.fcenabled then
        local speed = hvhobkak.cfg.vars["Free camera speed"]
        
        if input_IsKeyDown(KEY_W) then
            hvhobkak.fcvector = hvhobkak.fcvector + hvhobkak.SilentAngle:Forward() * speed
        end

        if input_IsKeyDown(KEY_S) then
            hvhobkak.fcvector = hvhobkak.fcvector - hvhobkak.SilentAngle:Forward() * speed
        end

        if input_IsKeyDown(KEY_A) then
            hvhobkak.fcvector = hvhobkak.fcvector - hvhobkak.SilentAngle:Right() * speed
        end

        if input_IsKeyDown(KEY_D) then
            hvhobkak.fcvector = hvhobkak.fcvector + hvhobkak.SilentAngle:Right() * speed
        end

        if input_IsKeyDown(KEY_SPACE) then
            hvhobkak.fcvector.z = hvhobkak.fcvector.z + speed
        end

        if input_IsKeyDown(KEY_LSHIFT) then
            hvhobkak.fcvector.z = hvhobkak.fcvector.z - speed
        end

        view.origin = hvhobkak.fcvector
        view.angles = fangs
        view.fov = hvhobkak.cfg.vars["Fov override"]
        view.drawviewer = !hvhobkak.cfg.vars["Ghetto free cam"]
    else
        hvhobkak.fcvector = origin
        view.origin = hvhobkak.tpenabled and origin - ( (fangs):Forward() * hvhobkak.cfg.vars["Third person distance"] ) or origin

        if hvhobkak.tpenabled and hvhobkak.cfg.vars["Third person collision"] then
            local tr = {}

            tr.start = origin
            tr.endpos = origin - ( (fangs):Forward() * hvhobkak.cfg.vars["Third person distance"] )
            tr.mins = hvhobkak.cameraHullMin
            tr.maxs = hvhobkak.cameraHullMax
            tr.filter = ply
            tr.mask = MASK_BLOCKLOS

            local res = TraceHull( tr )

            view.origin = res.HitPos
        end

        view.angles = fangs
        view.fov = hvhobkak.cfg.vars["Fov override"]
        view.drawviewer = hvhobkak.tpenabled
    end

    hvhobkak.vieworigin = ( hvhobkak.cfg.vars["Ghetto free cam"] and hvhobkak.fcenabled ) and hvhobkak.fcvector or origin
    hvhobkak.viewfov    = view.fov
    hvhobkak.znear      = znear

	return view
end

function hvhobkak.GetFovRadius()
    local Radius = hvhobkak.cfg.vars["Aimbot FOV"]

    local Ratio = scrw / scrh
    local AimFOV = Radius * (math.pi / 180)
    local GameFOV = hvhobkak.viewfov * (math.pi / 180)
    local ViewFOV = 2 * math.atan(Ratio * (hvhobkak.znear / 2) * math.tan(GameFOV / 2))



    return (math.tan(AimFOV) / math.tan(ViewFOV / 2)) * scrw
end

/*
    hooks -> CalcViewModelView
*/

function hvhobkak.CalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)
    if wep.CalcViewModelView then wep.CalcViewModelView = nil end

    pos = hvhobkak.vieworigin 
	ang = hvhobkak.cfg.vars["Silent aim"] and hvhobkak.SilentAngle or ang

	return pos, ang
end

/*
    hooks -> Pre / Post DrawViewModel
*/

do
    local drawing = false

    function hvhobkak.PreDrawViewModel( vm, ply, w )
        if hvhobkak.UnSafeFrame then return end
        if ply != me then return end

        if hvhobkak.cfg.vars["Viewmodel chams"] then
            local col = string_ToColor( hvhobkak.cfg.colors["Viewmodel chams"] )
            hvhobkak.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = hvhobkak.chamMats.vis[hvhobkak.cfg.vars["Viewmodel chams type"]] 

            render_SetBlend(col.a/255)
            render_SetColorModulation(col.r/255,col.g/255,col.b/255)
            render_MaterialOverride(mat)
        end

        if hvhobkak.cfg.vars["Fullbright viewmodel"] then
            render_SuppressEngineLighting( true )
        end

        if hvhobkak.cfg.vars["Viewmodel fov"] != GetConVar("viewmodel_fov"):GetInt() and not drawing then 
            cam.IgnoreZ(true)
                cam.Start3D(nil, nil, hvhobkak.cfg.vars["Viewmodel fov"])
                drawing = true

                vm:DrawModel()

                drawing = false
                cam.End3D()
            cam.IgnoreZ(false)
        else
            return 
        end
        
        return true
    end

end

function hvhobkak.PostDrawViewModel( vm, ply, w )
    render_SetColorModulation(1, 1, 1)
    render_MaterialOverride()
    render_SetBlend(1)
    render_SuppressEngineLighting(false)
end

/*
    hooks -> OnImpact ( c++ module )
*/
hvhobkak.bulletImpacts = {}

function hvhobkak.OnImpact( data )
    local startpos = data.m_vStart 

    if hvhobkak.cfg.vars[ "Bullet tracers muzzle" ] and data.m_vStart == me:EyePos() then
        local vm = me:GetViewModel()
	    local wep = me:GetActiveWeapon()

        if vm && IsValid( wep ) && IsValid( vm ) then
            local muzzle = vm:LookupAttachment( "muzzle" )
			
		    if muzzle == 0 then
			    muzzle = vm:LookupAttachment( "1" )
		    end

            if vm:GetAttachment( muzzle ) then
                startpos = vm:GetAttachment( muzzle ).Pos
            end
        end
    end

    hvhobkak.bulletImpacts[#hvhobkak.bulletImpacts + 1] = {
        shootTime = CurTime(),
        startPos = startpos,
        endPos = data.m_vOrigin,
        hitbox = data.m_nHitbox,
        alpha = 255
    }
end


/*
    hooks -> PostDrawOpaqueRenderables
*/

do
    local oldtrmat = hvhobkak.cfg.vars["Bullet tracers material"]
    local tracemat = Material("sprites/tp_beam001")

    local realcolor, fakecolor, lbycolor = Color( 0, 255, 0 ), Color( 255, 0, 0 ), Color( 0, 0, 255 )

    function hvhobkak.PostDrawOpaqueRenderables()
        if hvhobkak.UnSafeFrame then return end

        if hvhobkak.cfg.vars["Angle arrows"] then
            local pos = me:GetPos()

            cam_IgnoreZ(true)

            cam_Start3D2D( pos, Angle(0, hvhobkak.realAngle.y + 45, 0), 1 )
                surface_SetDrawColor( realcolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()
    
            cam_Start3D2D( pos, Angle(0, hvhobkak.fakeAngles.angle.y + 45, 0), 1 )
                surface_SetDrawColor( fakecolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()
    
            local lby = ded.GetCurrentLowerBodyYaw( me:EntIndex() )
            cam_Start3D2D( pos, Angle(0, lby + 45, 0), 1 )
                surface_SetDrawColor( lbycolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()
    
            cam_IgnoreZ( false )
        end

        if hvhobkak.cfg.vars["Bullet tracers"] then
            local trmat = hvhobkak.cfg.vars["Bullet tracers material"] 
    

            //print( trmat, oldtrmat )
            if trmat != oldtrmat then
                tracemat = Material( trmat )
                oldtrmat = trmat
            end
    
            local tracercolor = string_ToColor(hvhobkak.cfg.colors["Bullet tracers"])
    
            local curTime = CurTime()
            local dieTime = hvhobkak.cfg.vars["Tracers die time"]
    
            for i = #hvhobkak.bulletImpacts, 1, -1 do
                local impact = hvhobkak.bulletImpacts[i]

                // impact.alpha = impact.alpha - 0.15

                if (curTime - impact.shootTime) > dieTime then
                    table_remove(hvhobkak.bulletImpacts, i)
                    continue
                end

                tracercolor.a = impact.alpha
    
                render_SetMaterial( tracemat ) 
                render_DrawBeam( impact.startPos, impact.endPos, 4, 1, 1, tracercolor )
            end
        end

        

        if hvhobkak.cfg.vars["Auto peak"] and hvhobkak.startedPeeking then
            hvhobkak.drawAutopeak()
        end


    end 
end

/*
    hooks -> FrameStageNotify ( c++ module )
*/

function hvhobkak.GetUserGroup(ply)
    if ply.GetUserGroup then
        return ply:GetUserGroup()
    elseif ply.GetRankTable and ply:GetRankTable().NiceName then
        // fix for RusEliteRP
        return ply:GetRankTable().NiceName
    else
        return "unknown"
    end
end

function hvhobkak.GetTeam( ply )
    local iTeam = ply:Team()

    if rp and rp.GetJobWithoutDisguise then
        local index = rp.GetJobWithoutDisguise( ply:EntIndex() ) 
        local tbl = rp.jobs.List[ index ]

        return index, tbl.Name, tbl.Color
    else
        return iTeam, team_GetName(iTeam), team_GetColor(iTeam)
    end
end

// Player data tables

hvhobkak.playerCache = {}

function hvhobkak.playerTableUpdate( ply )
    if not hvhobkak.playerCache[ ply ] then
        hvhobkak.playerCache[ ply ] = {}
    end
    
    local v = hvhobkak.playerCache[ ply ]

    v.entity = ply
    
    v.Name = ply:Name()

    local index, name, color = hvhobkak.GetTeam( ply )

    v.Team = index
    v.TeamColor = color
    v.TeamName = name

    v.GetUserGroup = hvhobkak.GetUserGroup(ply)

    v.Health = ply:Health()
    v.GetMaxHealth = ply:GetMaxHealth()

    v.Armor = ply:Armor()
    v.GetMaxArmor = ply:GetMaxArmor()

    v.GetPos = ply:GetPos()

    v.ObserverMode = ply:GetObserverMode()
    v.ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    v.WeaponClass = IsValid(w) and ( hvhobkak.cfg.vars["Weapon printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    v.WeaponAmmo = IsValid(w) and w:Clip1() or "-"
 
    v.MoneyVar = MetaPlayer.getDarkRPVar and DarkRP.formatMoney(ply:getDarkRPVar("money")) or "beggar"
end

function hvhobkak.playerDataUpdate( )

    hvhobkak.playerCache = {}

    local plys = player_GetAll()

    for i = 1, #plys do
        local v = plys[i]

        if v == me then continue end
    
        hvhobkak.playerTableUpdate( v )
    end
end

// Entity data

hvhobkak.entityCache = {}
hvhobkak.allowedClasses = {}

function hvhobkak.entTableUpdate()
    
    hvhobkak.entityCache = {}

    local entitys = ents_GetAll()

    for i = 1, #entitys do
        local v = entitys[ i ]

        if not IsValid( v ) then continue end 
        if not hvhobkak.allowedClasses[ v:GetClass() ] then continue end

        hvhobkak.entityCache[ #hvhobkak.entityCache + 1 ] = {
            entity = v,
            class = v:GetClass(),
            position = v:GetPos(),
        }
    end
end



// Resolver 

hvhobkak.bruteYaw = { -90, 0, 90, 180, -180, 180, 90, 0, -90 }

















do
    local localData = {}

    localData.origin = Vector()

    function hvhobkak.FillLocalNetworkData( netdata )
        localData.origin     =   netdata[1]
    end
    
    function hvhobkak.GetLocalNetworkData()
        return localData
    end
end


do
    local missedTicks = 0
    local lastSimTime = 0

    local FRAME_START = 0
    local FRAME_NET_UPDATE_START = 1
    local FRAME_NET_UPDATE_POSTDATAUPDATE_START = 2
    local FRAME_NET_UPDATE_POSTDATAUPDATE_END = 3
    local FRAME_NET_UPDATE_END = 4
    local FRAME_RENDER_START = 5
    local FRAME_RENDER_END = 6

    function hvhobkak.PreFrameStageNotify( stage )
        local plys = player.GetAll()

        if stage == FRAME_NET_UPDATE_POSTDATAUPDATE_END then

            hvhobkak.entTableUpdate()

            plys = player.GetAll()

            local orig = me:GetNetworkOrigin()

            local data = {}

            data[1] = orig      // last networked origin

            hvhobkak.FillLocalNetworkData( data )

            for i = 1, #plys do
                local v = plys[i]

                //if !v.ult_prev_pos then continue end

                local cur_simtime = ded.GetSimulationTime(v:EntIndex())
                local cur_pos = v:GetNetworkOrigin()

                --v.ult_cur_pos = cur_pos

                if not v.ult_prev_simtime then
                    v.ult_prev_simtime = cur_simtime
                    v.ult_prev_pos = cur_pos
                    // v.ult_prev_hitbox_pos = cur_pos
                    v.flticks = 0
                    v.missedanimticks = 0
                    v.simtime_updated = false 
                    v.break_lc = false

                    hvhobkak.btrecords[ v ] = {}
                    hvhobkak.predicted[ v ] = {}

                    v.aimshots = 0
                    v.fakepitch = v:EyeAngles().p > 90

                elseif v.ult_prev_simtime != cur_simtime then
                    local flticks = hvhobkak.TIME_TO_TICKS(cur_simtime-v.ult_prev_simtime)

                    // print(v,flticks )

                    ded.SetMissedTicks( flticks )
                    ded.AllowAnimationUpdate( true )

                    v.flticks = math_Clamp(flticks,1,24)

                    v.ult_prev_simtime = cur_simtime

                    v.break_lc = cur_pos:DistToSqr(v.ult_prev_pos) > 4096

                    --if v.ult_prev_pos != v.ult_cur_pos then
                    v.ult_prev_pos = cur_pos

                    // v.ult_prev_hitbox_pos = hvhobkak.getHitbox(v)
                    --end 
                    v.fakepitch = v:EyeAngles().p > 90

                    v.simtime_updated = true
                else
                    v.simtime_updated = false
                end

                if hvhobkak.canBacktrack(v) and v != me and v.simtime_updated then
                    hvhobkak.recordBacktrack(v)
                end

                if v.break_lc then
                    hvhobkak.btrecords[ v ] = {}
                end

                /*
                if hvhobkak.cfg.vars["Extrapolation"] and v.simtime_updated and v != me then
                    local predTime = ded.GetLatency(0) + ded.GetLatency(1)
                    local pos = v:GetNetworkOrigin()

                    ded.StartSimulation( v:EntIndex() )

                    for tick = 1, hvhobkak.TIME_TO_TICKS( predTime ) do
                        ded.SimulateTick()
                        local data = ded.GetSimulationData()

                        debugoverlay.Cross( data.m_vecAbsOrigin, 6, 0.1, hvhobkak.Colors["Red"], true )
                        pos = data.m_vecAbsOrigin
                    end

                    local data = ded.GetSimulationData()

                    v:SetRenderOrigin( data.m_vecAbsOrigin )
                    v:SetNetworkOrigin( data.m_vecAbsOrigin )

                    debugoverlay.Box( pos, v:OBBMins(), v:OBBMaxs(), 0.1, color_white )

                    local p = hvhobkak.GetBones( v )[ 1 ]

                    //v:SetRenderOrigin( v.ult_prev_pos )
                    //v:SetNetworkOrigin( v.ult_prev_pos )

                    hvhobkak.predicted[ v ] = { pos = p, tick = hvhobkak.TIME_TO_TICKS( ded.GetSimulationTime( v:EntIndex() ) + predTime  ) }

                    ded.FinishSimulation()

                    
                end
                */

                if hvhobkak.cfg.vars["Extrapolation"] and v != me then
                    local predTime = ( ded.GetLatency(0) + ded.GetLatency(1) )

                    ded.StartSimulation( v:EntIndex() )

                    local pos = v:GetNetworkOrigin()

                    //print( hvhobkak.TIME_TO_TICKS( predTime ) )

                    for tick = 1, hvhobkak.TIME_TO_TICKS( predTime ) do
                        ded.SimulateTick()
    
                        local data = ded.GetSimulationData()
                        debugoverlay.Box( data.m_vecAbsOrigin, v:OBBMins(), v:OBBMaxs(), 0.1, Color( 255, 25, 25, 8 ) )
                    end
    
                    local data = ded.GetSimulationData()
                    pos = data.m_vecAbsOrigin

                    ded.FinishSimulation()

                    v:SetRenderOrigin( pos )
                    v:SetNetworkOrigin( pos )  
                    v:InvalidateBoneCache()
                    v:SetupBones()
                end

            end
        elseif stage == FRAME_RENDER_START then
            plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[i]

                if v == me then continue end

                if hvhobkak.cfg.vars["Forwardtrack"] then
                    local predTime = ( ded.GetLatency(0) + ded.GetLatency(1) ) * hvhobkak.cfg.vars["Forwardtrack time"]
                    ded.StartSimulation( v:EntIndex() )
    
                    local prevPos = v:GetNetworkOrigin()
                    for tick = 1, hvhobkak.TIME_TO_TICKS(predTime) do
                        ded.SimulateTick()
    
                        local data = ded.GetSimulationData()
                        debugoverlay.Line(prevPos, data.m_vecAbsOrigin, 0.1, color_white, true)
    
                        prevPos = data.m_vecAbsOrigin
                    end
    
                    local data = ded.GetSimulationData()

                    
    
                    ded.FinishSimulation()
                end

                if hvhobkak.cfg.vars["Resolver"] then

                    local angs = Angle()
                    angs.y = hvhobkak.bruteYaw[ v.aimshots % #hvhobkak.bruteYaw + 1 ] + v:EyeAngles().y

                    v:SetRenderAngles( angs )
                    // v:SetNetworkAngles( angs )

                    ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )  

                    // hvhobkak.combobox( "Yaw mode", { "Step", "Delta brute" }, "Yaw mode", p:GetItemPanel() )
                    // hvhobkak.slider( "Max misses", "Resolver max misses", 1, 6, 0, p:GetItemPanel() )
                    // hvhobkak.checkbox( "Invert first shot", "Invert first shot", p:GetItemPanel() )      
                    // v:SetupBones()
                end

    

            end

            
            

	        
            // Extrapolate aim target vector 
            /*
if hvhobkak.cfg.vars["Extrapolation"] and hvhobkak.target and hvhobkak.targetVector then
                local t = hvhobkak.target 

                if t.break_lc then
                    local predTicks = hvhobkak.TIME_TO_TICKS( ded.GetLatency(0) + ded.GetLatency(1) ) // hvhobkak.TIME_TO_TICKS( ded.GetLatency(0) + ded.GetLatency(1) ) / t.flticks

                    ded.StartSimulation(t:EntIndex())
    
                    for tick = 1, predTicks do
                        ded.SimulateTick()
                    end
    
                    local data = ded.GetSimulationData()

                    print("[pre set] network" , t:GetNetworkOrigin(), "render", t:GetRenderOrigin())

                    t:SetRenderOrigin(data.m_vecAbsOrigin)
                    t:SetNetworkOrigin(data.m_vecAbsOrigin)    
    
                    // v:InvalidateBoneCache()
                    // v:SetupBones()

                    hvhobkak.extrapolatedVector = hvhobkak.getHitbox(t)

                    print("[pre finish] network" , t:GetNetworkOrigin(), "render", t:GetRenderOrigin())

                    ded.FinishSimulation()

                    print("[post finish] network" , t:GetNetworkOrigin(), "render", t:GetRenderOrigin())
               
               //hvhobkak.extrapolatedVector = t.ult_prev_hitbox_pos

                end
            end
            */
            


            // Anim fix 

            
            

            // [pre set] network	-453.500000 1271.375000 1.031250	render	-465.303375 1267.841431 1.031250
            // [pre finish] network	-465.303375 1267.841431 1.031250	render	-465.303375 1267.841431 1.031250
            // [post finish] network	-453.500000 1271.375000 1.000000	render	-465.303375 1267.841431 1.031250


         end
    end
end

function hvhobkak.PostFrameStageNotify( stage ) 
    if stage == 3 then
        hvhobkak.playerDataUpdate()
    end
end

/*
    hooks -> ShouldUpdateAnimation ( cpp )
*/

hvhobkak.fakeAngles = {
    angle = me:EyeAngles(),
    movex = 0,
    movey = 0,
    layers = {},
    seq = 0,
    cycle = 0,
    origin = me:GetPos(),
}

function hvhobkak.UpdateAnimation( v )
    v:SetPoseParameter( "head_pitch", 0 )
    v:SetPoseParameter( "head_yaw", 0 )

    if hvhobkak.cfg.vars["Pitch resolver"] and v.fakepitch then
        v:SetPoseParameter( "aim_pitch", -89 )
        v:SetPoseParameter( "head_pitch", -89 )
    end

    v:InvalidateBoneCache()
end

function hvhobkak.ShouldUpdateAnimation( entIndex ) 
    local ent = Entity( entIndex )

    if not ent.simtime_updated then return end

    ded.SetMissedTicks( ent.flticks )
    ded.AllowAnimationUpdate( true )
end

// AA shit
hvhobkak.realModel = hvhobkak.CS_Model( me:GetModel() )
hvhobkak.fakeModel = hvhobkak.CS_Model( me:GetModel() )

hvhobkak.newModel = me:GetModel()

function hvhobkak.drawCSModels_real()
    if not hvhobkak.cfg.vars["Anti aim chams"] or not hvhobkak.tpenabled then 
        return 
    end 
    if not me:Alive() then 
        return 
    end

    local mymodel = me:GetModel()

    if hvhobkak.newModel != mymodel then
        hvhobkak.CS_Model( mymodel )
        hvhobkak.newModel = mymodel
    end

    local tbl = {
        layers = hvhobkak.fakeAngles.layers,
        angles = hvhobkak.fakeAngles.angle,
        sequence = hvhobkak.fakeAngles.seq,
        cycle = hvhobkak.fakeAngles.cycle,
        origin = hvhobkak.fakeAngles.origin,
        movex = hvhobkak.fakeAngles.movex,
        movey = hvhobkak.fakeAngles.movey,
    }

    hvhobkak.CS_Model_update( me, hvhobkak.realModel, tbl )

    if hvhobkak.cfg.vars["Antiaim fullbright"] then
        render_SuppressEngineLighting(true)
    end

    local col = string_ToColor(hvhobkak.cfg.colors["Real chams"])
    hvhobkak.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render_MaterialOverride(hvhobkak.chamMats.invis[hvhobkak.cfg.vars["Antiaim material"]]) 
    render_SetColorModulation(col.r/255,col.g/255,col.b/255)
    render_SetBlend(col.a/255) 
    hvhobkak.realModel:SetRenderMode(1)
    hvhobkak.realModel:DrawModel()

    if hvhobkak.cfg.vars["Antiaim fullbright"] then
        render_SuppressEngineLighting(false)
    end
end

/*
    hooks -> PostDrawEffects
*/

do
    /*
            

    */

    local CopyMat		= Material("pp/copy")
    local AddMat		= Material( "pp/add" )
    local SubMat		= Material( "pp/sub" )
    local OutlineMat	= CreateMaterial("OutlineMat","UnlitGeneric",{["$ignorez"] = 1,["$alphatest"] = 1})

    local outline_mats = {
        [1] = OutlineMat,
        [2] = SubMat,
        [3] = AddMat,
        [4] = GradMat,
        [5] = BloomMat,
    }

    local subclear = {
        [2] = true,
        //[4] = true,
    }
    
    hvhobkak.cfg.vars["Player outline"] = false
    hvhobkak.cfg.vars["Entity outline"] = false
    hvhobkak.cfg.colors["Player outline"] = "45 255 86 255"
    hvhobkak.cfg.colors["Entity outline"] = "255 86 45 255"

    local StoreTexture	= render.GetScreenEffectTexture(0)
    local DrawTexture	= render.GetScreenEffectTexture(1)

    function hvhobkak.RenderOutline()
        local renderEnts = {}

        if hvhobkak.cfg.vars["Player outline"] then
            local plys = player.GetAll()

            for i = 1, #plys do 
                local v = plys[ i ]

                if not IsValid( v ) or v == me or not v:Alive() or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if hvhobkak.cfg.vars["Entity outline"] then
            for i = 1, #hvhobkak.entityCache do
                local v = hvhobkak.entityCache[ i ].entity 

                if not IsValid( v ) or v:IsDormant() then continue end
        
                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if #renderEnts == 0 then return end

        local scene = render.GetRenderTarget()
        render.CopyRenderTargetToTexture(StoreTexture)
        
        if subclear[ hvhobkak.cfg.vars["Outline style"] ] then
            render.Clear( 255, 255, 255, 255, true, true )
        else
            render.Clear( 0, 0, 0, 0, true, true )
        end

        render.SetStencilEnable(true)
            cam_IgnoreZ(true)
            render.SuppressEngineLighting(true)
        
            render.SetStencilWriteMask(255)
            render.SetStencilTestMask(255)
            
            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilPassOperation(STENCIL_REPLACE)
            
            cam_Start3D()
                for i = 1, #renderEnts do 
                    render.SetStencilReferenceValue( i )

                    renderEnts[i]:DrawModel()
                end
            cam_End3D()
            
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            cam_Start2D()
                for i = 1, #renderEnts do 
                    local c = renderEnts[i]:IsPlayer() and string_ToColor( hvhobkak.cfg.colors["Player outline"] ) or string_ToColor( hvhobkak.cfg.colors["Entity outline"] ) 

				    render.SetStencilReferenceValue( i )

                    surface_SetDrawColor( c )
                    surface_DrawRect( 0, 0, scrw, scrh )

                    // surface_SimpleTexturedRect( 0, 0, scrw, scrh, string_ToColor( hvhobkak.cfg.colors["Health bar gradient"] ) , hvhobkak.Materials["Gradient"] )
                end
            cam_End2D()
            
            render_SuppressEngineLighting(false)
            cam_IgnoreZ(false)
        render.SetStencilEnable(false)
        
        render.CopyRenderTargetToTexture(DrawTexture)

        if hvhobkak.cfg.vars["Outline style"] > 1 then 
            render.BlurRenderTarget( DrawTexture, 1, 1, 1 )
        end

        render.SetRenderTarget(scene)
        CopyMat:SetTexture("$basetexture",StoreTexture)
        render.SetMaterial(CopyMat)
        render.DrawScreenQuad()
        
        render.SetStencilEnable(true)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            local mat = outline_mats[ hvhobkak.cfg.vars["Outline style"] ]

            mat:SetTexture( "$basetexture", DrawTexture )
            render_SetMaterial( mat )
            
            for x=-1,1 do
                for y=-1,1 do
                    if x==0 and x==0 then continue end
                    
                    render.DrawScreenQuadEx(x,y,scrw,scrh)
                end
            end
        render.SetStencilEnable(false)
    end
end

function hvhobkak.PostDrawEffects()
    if hvhobkak.UnSafeFrame then return end
    if not hvhobkak.cfg.vars["Player outline"] and not hvhobkak.cfg.vars["Entity outline"] then return end

    hvhobkak.PostRender()
    hvhobkak.RenderOutline()
end
    
/*
    hooks -> FireBullets ( Player cpp ) 
*/

//function hvhobkak.hFireBullets( data )
//    PrintTable(data)
//end

/*
    Misc hooks
*/

function hvhobkak.DSADJ( s )
    return hvhobkak.cfg.vars["Disable SADJ"] and -1 or nil
end

hvhobkak.lmc = false 
hvhobkak.fbe = false

function hvhobkak.PreRender()
    if hvhobkak.cfg.vars["Fullbright"] and hvhobkak.fbe then
        render.SetLightingMode( hvhobkak.cfg.vars["Fullbright mode"] )
        hvhobkak.lmc = true
    end
end

function hvhobkak.PostRender()
    if hvhobkak.lmc then
        render.SetLightingMode( 0 )
        hvhobkak.lmc = false
    end
end


/*
    ConVar manipulation 
*/

ded.ConVarSetFlags( "mat_fullbright", 0 )
ded.ConVarSetFlags( "r_aspectratio", 0 )
ded.ConVarSetFlags( "cl_showhitboxes", 0 )


/*
    Gamemode hooks
*/

function GAMEMODE:CreateMove( cmd ) return true end
function GAMEMODE:CalcView( view )  return true end
function GAMEMODE:ShouldDrawLocal() return true end


GAMEMODE["EntityFireBullets"] = function( self, p, data ) 
    if not hvhobkak.activeWeapon then return end

    local tick = engine.TickCount()
    if hvhobkak.cfg.vars[ "On screen logs" ] and data.Src == me:EyePos() and hvhobkak.aimingrn and hvhobkak.target and not hvhobkak.onScreenLogs[ tick ] and IsFirstTimePredicted() then
        local reason = 1
        
        local tr = {}
        tr.filter = me 
        tr.start = data.Src 
        tr.endpos = data.Src + data.Dir * 13337
        tr.mask = MASK_SHOT

        tr = TraceLine( tr )

        if hvhobkak.target.break_lc then
            reason = 4
        elseif ded.GetLatency( 0 ) > 0.2 then
            reason = 3
        elseif tr.StartSolid or tr.Hit and tr.Entity != hvhobkak.target then
            reason = 2
        end
        
        local hlcolor = string_ToColor( hvhobkak.cfg.colors[ hvhobkak.MissReasons[ reason ].var ] )
        local data = {
            tick = tick,
            { "Shot at ", hvhobkak.target:Name(), " missed due to ", hvhobkak.MissReasons[ reason ].str, },
            { hvhobkak.HitLogsWhite, hlcolor, hvhobkak.HitLogsWhite, hlcolor, }
        }
            
        hvhobkak.onScreenLogs[ tick ] = data
    end
 
    local spread = data.Spread * -1
    
	if hvhobkak.cones[ hvhobkak.activeWeaponClass ] == spread or spread == hvhobkak.nullVec then return end

    hvhobkak.cones[ hvhobkak.activeWeaponClass ] = spread;
end



function hvhobkak.SetupWorldFog()
    if not hvhobkak.cfg.vars[ "FogChanger" ] then return end 

    local color = string_ToColor(hvhobkak.cfg.colors["FogChanger"])
    

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( hvhobkak.cfg.vars[ "FogStart" ] )
    render.FogEnd( hvhobkak.cfg.vars[ "FogEnd" ] ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function hvhobkak.SetupSkyboxFog( SkyboxSize )
    if not hvhobkak.cfg.vars[ "FogChanger" ] then return end 

    local color = string_ToColor(hvhobkak.cfg.colors["FogChanger"])

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( hvhobkak.cfg.vars[ "FogStart" ] * SkyboxSize )
    render.FogEnd( hvhobkak.cfg.vars[ "FogEnd" ] * SkyboxSize ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function hvhobkak.CalcMainActivity(ply, velocity)
    if hvhobkak.cfg.vars[ "Disable animations" ] then
        return -1, -1
    end
end

/*
    Hooks
*/

hvhobkak.hooks           = {}

function hvhobkak.AddHook( event, func )
    if func == nil and not hvhobkak[ event ] then print("Failed to find hook: " .. event) return end
    local name = util.Base64Encode( event ) .. CurTime()
    hook.Add( event, name, hvhobkak[ event ] or func )
    hvhobkak.hooks[ #hvhobkak.hooks + 1 ] = { event, name }
end

function hvhobkak.RemoveAllHooks()
    for i = #hvhobkak.hooks, 1, -1 do
        local chk = hvhobkak.hooks[i]
        hook.Remove(chk[1], chk[2])
        table.remove(hvhobkak.hooks, i)
    end
end

function hvhobkak.Unload()
    hvhobkak.frame:Remove()

    ded.SetBSendPacket( true )
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    hvhobkak.RemoveAllHooks() 
end

hvhobkak.AddHook( "CreateMove" )
hvhobkak.AddHook( "Think" )

hvhobkak.AddHook( "RenderScene" )
hvhobkak.AddHook( "DrawOverlay" )
hvhobkak.AddHook( "Ungrabbable2D", function() hvhobkak.DrawESP() hvhobkak.DrawSomeShit() end )   

hvhobkak.AddHook( "CalcView" )
hvhobkak.AddHook( "CalcViewModelView" )

hvhobkak.AddHook( "PreDrawViewModel" )
hvhobkak.AddHook( "PostDrawViewModel" )

hvhobkak.AddHook( "PostDrawOpaqueRenderables" )
hvhobkak.AddHook( "PostDrawEffects" )

hvhobkak.AddHook( "OnImpact" )

hvhobkak.AddHook( "PreFrameStageNotify" )
hvhobkak.AddHook( "PostFrameStageNotify" )

hvhobkak.AddHook( "UpdateAnimation" )
hvhobkak.AddHook( "ShouldUpdateAnimation" )

hvhobkak.AddHook( "AdjustMouseSensitivity",           hvhobkak.DSADJ )

hvhobkak.AddHook( "RenderScreenspaceEffects" )
hvhobkak.AddHook( "PostDrawTranslucentRenderables" )

hvhobkak.AddHook( "PreRender",                        hvhobkak.PreRender )
hvhobkak.AddHook( "PostRender",                       hvhobkak.PostRender )
hvhobkak.AddHook( "PreDrawHUD",                       hvhobkak.PostRender )

hvhobkak.AddHook( "DrawPhysgunBeam" )

hvhobkak.AddHook( "PrePlayerDraw" )

hvhobkak.AddHook( "OnEntityCreated" )  

hvhobkak.AddHook( "entity_killed" )  
hvhobkak.AddHook( "player_hurt" )  

hvhobkak.AddHook( "SetupWorldFog" )
hvhobkak.AddHook( "SetupSkyboxFog" )

hvhobkak.AddHook( "CalcMainActivity" )