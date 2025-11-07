xpcall(function()
	require("zxcmodule")
end,function()
	Derma_Message("need gmod x64 chromium brench, and gmod bin module gmcl_zxcmodule_win64.dll in Steam/steamapps/common/GarrysMod/garrysmod/lua/bin","hvh obkak","ok")
end)
require("zxcmodule")
ded.Write = nil
ded.Read = nil
local exechack_cc_hvh_obkak                          = {}
local MetaPlayer                        = FindMetaTable("Player")
local TraceHull                         = util.TraceHull    
local TraceLine                         = util.TraceLine
surface.CreateFont("Watermark_Bold", {
    font = "Verdana",
    size = 13,
    weight = 1000,
    antialias = true,
    shadow = true
})
surface.CreateFont("Watermark_Symbols", {
    font = "Verdana",
    size = 14,
    weight = 500,
    antialias = true
})
surface.CreateFont( "veranda", { font = "Verdana", size = 12, antialias = false, outline = true } )
surface.CreateFont( "veranda_s", { font = "Verdana", size = 12, antialias = false, shadow = true } )
surface.CreateFont( "veranda_scr", { font = "Verdana", size = ScreenScale( 9 ), antialias = false, outline = true } )
surface.CreateFont( "saddamhussein", { font = "Open Sans", size = 64, weight = 1000 } )
exechack_cc_hvh_obkak.Colors = {}
for i = 0,255 do  
    exechack_cc_hvh_obkak.Colors[i] = Color( i, i, i )
end
exechack_cc_hvh_obkak.Colors["Red"] = Color( 255, 0, 0)
exechack_cc_hvh_obkak.accent = Color( 255, 255, 255 )
local settings = {

}
local theme = {
    ["Frame background"] = Color(20, 10, 30),      
    ["Frame foreground"] = Color(40, 20, 60),     
    ["Frame title"] = Color(180, 120, 220),        
}
local pLocalPlayer = LocalPlayer()
local screenWidth = ScrW()
local screenHeight = ScrH()
local traceResult = {}
local traceStruct = { output = traceResult }
local flTickInterval = engine.TickInterval()
surface.CreateFont( "DermaSmall", {	
    font = "Comic Sans MS", 
    antialias = false,
    size = 15
} )
exechack_cc_hvh_obkak.cached = {}
exechack_cc_hvh_obkak.Materials = {}
exechack_cc_hvh_obkak.Materials["Gradient"] = Material("gui/gradient_up", "noclamp smooth")
exechack_cc_hvh_obkak.Materials["Gradient down"] = Material("gui/gradient_down", "noclamp smooth")
exechack_cc_hvh_obkak.Materials["Gradient right"] = Material("gui/gradient", "noclamp smooth")
exechack_cc_hvh_obkak.Materials["Alpha grid"] = Material("gui/alpha_grid.png", "noclamp smooth")
exechack_cc_hvh_obkak.blur = Material("pp/blurscreen")
exechack_cc_hvh_obkak.presets = {}
exechack_cc_hvh_obkak.cfg = { vars = {}, binds = {}, colors = {} }

exechack_cc_hvh_obkak.tesakParticles = {}
exechack_cc_hvh_obkak.particleCount = 15

exechack_cc_hvh_obkak.cfg.vars["Enable aimbot"]              = false
exechack_cc_hvh_obkak.cfg.binds["Aim on key"]                = 0

exechack_cc_hvh_obkak.cfg.vars["Silent aim"]                 = true
exechack_cc_hvh_obkak.cfg.vars["pSilent"]                    = false

exechack_cc_hvh_obkak.cfg.vars["Auto reload"]                = false
exechack_cc_hvh_obkak.cfg.vars["Auto fire"]                  = false
exechack_cc_hvh_obkak.cfg.vars["Auto reload"]                = false
exechack_cc_hvh_obkak.cfg.vars["Auto fire"]                  = false
exechack_cc_hvh_obkak.cfg.vars["Rapid fire"]                 = false
exechack_cc_hvh_obkak.cfg.vars["Alt Rapid fire"]             = false

exechack_cc_hvh_obkak.cfg.vars["Nospread"]                   = false
exechack_cc_hvh_obkak.cfg.vars["Force seed"]                 = false
exechack_cc_hvh_obkak.cfg.vars["Wait for seed"]              = false
exechack_cc_hvh_obkak.cfg.vars["Norecoil"]                   = false

exechack_cc_hvh_obkak.cfg.vars["Extrapolation"]              = false
exechack_cc_hvh_obkak.cfg.vars["last update"]                = false
exechack_cc_hvh_obkak.cfg.vars["Invalidate activity"]         = false
exechack_cc_hvh_obkak.cfg.vars["Bone fix"]                   = false
exechack_cc_hvh_obkak.cfg.vars["Update Client Anim fix"]     = false
exechack_cc_hvh_obkak.cfg.vars["Wait for simulation"]    = false
exechack_cc_hvh_obkak.cfg.vars["Disable interpolation"]      = true
exechack_cc_hvh_obkak.cfg.vars["Disable Sequence interpolation"] = true

exechack_cc_hvh_obkak.cfg.vars["Target selection"]           = 2 
exechack_cc_hvh_obkak.cfg.vars["Ignores-Friends"]            = false
exechack_cc_hvh_obkak.cfg.vars["Target-Priority-Only"]       = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Steam friends"]      = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Teammates"]          = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Admins"]             = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Bots"]               = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Frozen"]             = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Nodraw"]             = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Nocliping"]          = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-God time"]           = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Head unhitable"]     = false
exechack_cc_hvh_obkak.cfg.vars["Ignores-Driver"]             = false
exechack_cc_hvh_obkak.cfg.vars["Wallz"]                      = false

exechack_cc_hvh_obkak.cfg.vars["Max targets"]                = 0
exechack_cc_hvh_obkak.cfg.vars["Max distance"]               = 4096

exechack_cc_hvh_obkak.cfg.vars["Hitbox selection"]           = 1
exechack_cc_hvh_obkak.cfg.vars["Hitscan"]                    = false
exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Head"]        = false
exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Chest"]       = false
exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Stomach"]     = false
exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Arms"]        = false
exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Legs"]        = false
exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Generic"]     = false
exechack_cc_hvh_obkak.cfg.vars["Hitscan mode"]               = 1
exechack_cc_hvh_obkak.cfg.vars["Multipoint"]                 = false
exechack_cc_hvh_obkak.cfg.vars["Multipoint scale"]           = 0.8
exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Head"]     = false
exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Chest"]    = false
exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Stomach"]  = false
exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Arms"]     = false
exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Legs"]     = false
exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Generic"]  = false

exechack_cc_hvh_obkak.cfg.vars["Adjust tickcount"]           = false
exechack_cc_hvh_obkak.cfg.vars["Gun switch"]                 = false
exechack_cc_hvh_obkak.cfg.vars["Auto detonator"]             = false
exechack_cc_hvh_obkak.cfg.vars["AutoD distance"]             = 96

exechack_cc_hvh_obkak.cfg.vars["Backtrack"]                  = false
exechack_cc_hvh_obkak.cfg.vars["Always backtrack"]           = false
exechack_cc_hvh_obkak.cfg.vars["Backtrack mode"]             = 1
exechack_cc_hvh_obkak.cfg.vars["Sampling interval"]          = 0
exechack_cc_hvh_obkak.cfg.vars["Backtrack time"]             = 200

exechack_cc_hvh_obkak.cfg.vars["Aimbot smoothing"]           = false
exechack_cc_hvh_obkak.cfg.vars["Smoothing"]                  = 0.05

exechack_cc_hvh_obkak.cfg.vars["Fov limit"]                  = false
exechack_cc_hvh_obkak.cfg.vars["Fov dynamic"]                = false
exechack_cc_hvh_obkak.cfg.vars["Aimbot FOV"]                 = 30
exechack_cc_hvh_obkak.cfg.vars["Show FOV"]                   = false
exechack_cc_hvh_obkak.cfg.colors["Show FOV"]                 = "255 255 0 255"
exechack_cc_hvh_obkak.cfg.colors["WaterMarkColor"]           = "255 255 255 255"

exechack_cc_hvh_obkak.cfg.vars["Aimbot snapline"]                   = false
exechack_cc_hvh_obkak.cfg.colors["Aimbot snapline"]                 = "255 128 0 255"
exechack_cc_hvh_obkak.cfg.vars["Aimbot marker"]                   = false
exechack_cc_hvh_obkak.cfg.colors["Aimbot marker"]                 = "255 255 255 255"



exechack_cc_hvh_obkak.cfg.vars["Trigger bot"]                = false
exechack_cc_hvh_obkak.cfg.binds["Trigger bot"]               = 0

exechack_cc_hvh_obkak.cfg.vars["Prop aimbot"]                = false
exechack_cc_hvh_obkak.cfg.vars["PA thrower"]                 = false
exechack_cc_hvh_obkak.cfg.vars["PA thrower dist"]            = 128
exechack_cc_hvh_obkak.cfg.vars["Prop max simtime"]           = 4
exechack_cc_hvh_obkak.cfg.vars["Sync mode"]                  = 1

exechack_cc_hvh_obkak.cfg.vars["Crossbow prediction"]        = false
exechack_cc_hvh_obkak.cfg.vars["Smg grenade prediction"]     = false

exechack_cc_hvh_obkak.cfg.vars["Simulation limit"]           = 4

exechack_cc_hvh_obkak.cfg.vars["Baim low health"]            = false
exechack_cc_hvh_obkak.cfg.vars["Baim health"]                = 65

exechack_cc_hvh_obkak.cfg.vars["Auto healthkit"]             = false
exechack_cc_hvh_obkak.cfg.vars["Healthkit-Self heal"]        = false
exechack_cc_hvh_obkak.cfg.vars["Healthkit-Heal closest"]     = false

exechack_cc_hvh_obkak.cfg.vars["Knifebot"]                   = false
exechack_cc_hvh_obkak.cfg.vars["Knifebot mode"]              = 1
exechack_cc_hvh_obkak.presets["Knifebot mode"] = { "Damage", "Fast", "Fatal" }

exechack_cc_hvh_obkak.cfg.vars["Facestab"]                   = false

exechack_cc_hvh_obkak.cfg.vars["Knifebot Range"]             = false

exechack_cc_hvh_obkak.cfg.vars["Projectile aimbot"]          = false
exechack_cc_hvh_obkak.cfg.vars["Predict fist"]               = false
exechack_cc_hvh_obkak.cfg.vars["Debug mode"]                 = true

exechack_cc_hvh_obkak.cfg.vars["Forwardtrack"]               = false
exechack_cc_hvh_obkak.cfg.vars["Forwardtrack time"]          = 100

exechack_cc_hvh_obkak.cfg.vars["NoAimLag"] = false

exechack_cc_hvh_obkak.cfg.vars["Lag fix"]                    = false
exechack_cc_hvh_obkak.cfg.vars["Backshoot"]                  = false





// Resolver 

exechack_cc_hvh_obkak.cfg.vars["left"] = false
exechack_cc_hvh_obkak.cfg.vars["right"] = false
exechack_cc_hvh_obkak.cfg.vars["pitchres"] = false

exechack_cc_hvh_obkak.cfg.vars["Resolver"] = false
exechack_cc_hvh_obkak.cfg.vars["Yaw mode"] = 1
exechack_cc_hvh_obkak.cfg.vars["Pitch resolver"] = false
exechack_cc_hvh_obkak.cfg.vars["Taunt resolver"] = false
exechack_cc_hvh_obkak.cfg.vars["Memory bullets"] = false




exechack_cc_hvh_obkak.cfg.vars["Invert first shot"] = false
exechack_cc_hvh_obkak.cfg.vars["Resolver max misses"] = 2
exechack_cc_hvh_obkak.cfg.vars["add delta"] = 0
exechack_cc_hvh_obkak.cfg.vars["add pitch"] = 0

// Tickbase 
exechack_cc_hvh_obkak.cfg.vars["Tickbase shift"] = false
exechack_cc_hvh_obkak.cfg.vars["Wait for unlag"] = false

exechack_cc_hvh_obkak.cfg.vars["Fakelag comp"] = 2

exechack_cc_hvh_obkak.cfg.vars["Skip fire tick"] = false
exechack_cc_hvh_obkak.cfg.vars["Double tap"] = false
exechack_cc_hvh_obkak.cfg.vars["Dodge projectiles"] = false
exechack_cc_hvh_obkak.cfg.vars["Passive recharge"] = false

exechack_cc_hvh_obkak.cfg.vars["Auto recharge"] = false
exechack_cc_hvh_obkak.cfg.vars["Wait for charge"] = false
exechack_cc_hvh_obkak.cfg.vars["Warp on peek"] = false

exechack_cc_hvh_obkak.cfg.vars["Charge ticks"] = 48
exechack_cc_hvh_obkak.cfg.vars["Shift ticks"] = 48
exechack_cc_hvh_obkak.cfg.binds["Tickbase shift"] = 0
exechack_cc_hvh_obkak.cfg.binds["Auto recharge"] = 0


exechack_cc_hvh_obkak.cfg.vars["Engine pred"] = false
exechack_cc_hvh_obkak.cfg.vars["GetManipulateInterp"] = false
exechack_cc_hvh_obkak.cfg.vars["LerpTime"] = false
exechack_cc_hvh_obkak.cfg.vars["LagCompensation"] = false




exechack_cc_hvh_obkak.cfg.vars["Anti aim"]                   = false
exechack_cc_hvh_obkak.cfg.vars["Yaw randomisation"]          = false

exechack_cc_hvh_obkak.cfg.vars["Custom real"]                = 75
exechack_cc_hvh_obkak.cfg.vars["Custom fake"]                = 180
exechack_cc_hvh_obkak.cfg.vars["Fake switch"]                = 180
exechack_cc_hvh_obkak.cfg.vars["Real switch"]                = 180
exechack_cc_hvh_obkak.cfg.vars["Custom pitch"]               = 89
exechack_cc_hvh_obkak.cfg.vars["Spin speed"]                 = 30
exechack_cc_hvh_obkak.cfg.vars["LBY min delta"]              = 100
exechack_cc_hvh_obkak.cfg.vars["LBY break delta"]            = 120
exechack_cc_hvh_obkak.cfg.vars["Sin delta"]                  = 89
exechack_cc_hvh_obkak.cfg.vars["Sin add"]                    = 11
exechack_cc_hvh_obkak.cfg.vars["Jitter delta"]               = 45
exechack_cc_hvh_obkak.cfg.vars["Low delta value"]            = 0
exechack_cc_hvh_obkak.cfg.vars["Switch time"]                = 0.6

exechack_cc_hvh_obkak.cfg.vars["Anti-BruteForce"]            = false

exechack_cc_hvh_obkak.cfg.vars["Yaw base"]                   = 1
exechack_cc_hvh_obkak.presets["Yaw base"] = { "Viewangles", "At targets" }
exechack_cc_hvh_obkak.cfg.vars["Yaw"]                        = 1
exechack_cc_hvh_obkak.presets["Yaw"] = { 
    "Backward", "Fake Forward", "Legit Delta",
    "Sideways", "Half Sideways",
    "Fake Spin", "LBY", "LBY Breaker",
    "Sin Sway", "Pendulum Sway", "Lag Sway",
    "Fake Jitter", "Kappa Jitter", "Abu Jitter",
    "Satanic Spin", "Custom",
    "Hand Block", "Low delta",
    "Desync", "Tank AA", "Fake switch",
    "Dolphin Mode", "Freeze Frame",
    "Invisible Man", "Matrix Glitch",
    "Unhittable", "Unhittable2"
}
exechack_cc_hvh_obkak.cfg.vars["Pitch"]                      = 1
exechack_cc_hvh_obkak.presets["Pitch"] = { 
    "Down", "Up", "Zero", 
    "Fake down", "Fake fake down", 
    "Fake jitter","Fake down break", "Kizaru", 
    "Fake zero", "Fake Up jitter",
    "Up jitter","Flicker +Up","Fucker Flicker +Up",
    "Custom pitch"
}
exechack_cc_hvh_obkak.cfg.vars["Edge"]                       = 1

exechack_cc_hvh_obkak.cfg.binds["Anti aim"]                   = 0







exechack_cc_hvh_obkak.cfg.vars["Antiaim material"] = 1
exechack_cc_hvh_obkak.cfg.vars["Antiaim fullbright"] = false
exechack_cc_hvh_obkak.cfg.colors["Real chams"] = "128 128 255 255"

// Anim breakers 

exechack_cc_hvh_obkak.cfg.vars["Taunt spam"] = false
exechack_cc_hvh_obkak.cfg.vars["Taunt"] = 1
exechack_cc_hvh_obkak.cfg.vars["Taunt 2"] = false
exechack_cc_hvh_obkak.cfg.vars["Taunt 2.1"] = 1

exechack_cc_hvh_obkak.cfg.vars["Handjob"] = false
exechack_cc_hvh_obkak.cfg.vars["Handjob mode"] = 1


exechack_cc_hvh_obkak.cfg.vars["Micromovement"] = false
exechack_cc_hvh_obkak.cfg.vars["On shot aa"] = false
exechack_cc_hvh_obkak.cfg.vars["Freestanding"] = false
exechack_cc_hvh_obkak.cfg.binds["freestand"] = 0
exechack_cc_hvh_obkak.cfg.vars["Inverter"] = false
exechack_cc_hvh_obkak.cfg.binds["Inverter"] = 0
exechack_cc_hvh_obkak.cfg.vars["Anti aim chams"] = false

exechack_cc_hvh_obkak.cfg.vars["Angle arrows"] = false






exechack_cc_hvh_obkak.cfg.vars["Free standing"] = false
exechack_cc_hvh_obkak.cfg.vars["Dancer"] = false
    exechack_cc_hvh_obkak.cfg.vars["Dance"] = 1
    exechack_cc_hvh_obkak.cfg.vars["Arm breaker"] = false
    exechack_cc_hvh_obkak.cfg.vars["Arm breaker mode"] = 1
    exechack_cc_hvh_obkak.cfg.vars["Fake duck"] = false
    exechack_cc_hvh_obkak.cfg.vars["Fake duck mode"] = 1
    exechack_cc_hvh_obkak.cfg.vars["Fake walk"] = false
    exechack_cc_hvh_obkak.cfg.vars["Crimwalk"] = false

    exechack_cc_hvh_obkak.cfg.vars["Air crouch"] = false
    exechack_cc_hvh_obkak.cfg.vars["Air crouch mode"] = 1

// fake lag
exechack_cc_hvh_obkak.cfg.vars["Fake lag"] = false

exechack_cc_hvh_obkak.cfg.vars["Fake lag options-Disable on ladder"] = false
exechack_cc_hvh_obkak.cfg.vars["Fake lag options-Disable in attack"] = false
exechack_cc_hvh_obkak.cfg.vars["Fake lag options-On peek"] = false
exechack_cc_hvh_obkak.cfg.vars["Fake lag options-Randomise"] = false

exechack_cc_hvh_obkak.cfg.vars["Lag mode"] = 1

exechack_cc_hvh_obkak.cfg.vars["Lag limit"] = 1
exechack_cc_hvh_obkak.cfg.vars["Lag randomisation"] = 1

exechack_cc_hvh_obkak.cfg.vars["Fake duck"] = false
exechack_cc_hvh_obkak.cfg.binds["Fake duck"] = 0

exechack_cc_hvh_obkak.cfg.vars["Air lag duck"] = false
exechack_cc_hvh_obkak.cfg.vars["Jesus lag"] = false

exechack_cc_hvh_obkak.cfg.vars["Indicators"] = false


exechack_cc_hvh_obkak.cfg.vars["Allah fly"] = false

    
// Sequence manip
exechack_cc_hvh_obkak.cfg.vars["Sequence manip"] = false
exechack_cc_hvh_obkak.cfg.vars["OutSequence"] = 500
exechack_cc_hvh_obkak.cfg.binds["Sequence manip"] = 0
exechack_cc_hvh_obkak.cfg.vars["Sequence min random"] = false
exechack_cc_hvh_obkak.cfg.vars["Sequence min"] = 1

exechack_cc_hvh_obkak.cfg.binds["Animation freezer"] = 0
exechack_cc_hvh_obkak.cfg.vars["Animation freezer"] = false

exechack_cc_hvh_obkak.cfg.vars["Freeze on peek"] = false

exechack_cc_hvh_obkak.cfg.vars["Allah walk"] = false
exechack_cc_hvh_obkak.cfg.binds["allahwalk"] = 0

// Animfix 

exechack_cc_hvh_obkak.cfg.vars["Interpolation-Disable interpolation"] = false
exechack_cc_hvh_obkak.cfg.vars["Interpolation-Fast sequences"] = false





    // ESP
    exechack_cc_hvh_obkak.cfg.vars["Bounding box"] = false



// Movement
exechack_cc_hvh_obkak.cfg.vars["Bhop"] = false
exechack_cc_hvh_obkak.cfg.vars["Sprint"] = false
exechack_cc_hvh_obkak.cfg.vars["Safe hop"] = false
exechack_cc_hvh_obkak.cfg.vars["Edge jump"] = false
exechack_cc_hvh_obkak.cfg.vars["Air duck"] = false

exechack_cc_hvh_obkak.cfg.vars["Air strafer"] = false
exechack_cc_hvh_obkak.cfg.vars["Strafe mode"] = 1
exechack_cc_hvh_obkak.cfg.vars["Ground strafer"] = false
exechack_cc_hvh_obkak.cfg.vars["Fast stop"] = false
exechack_cc_hvh_obkak.cfg.vars["Z Hop"] = false
exechack_cc_hvh_obkak.cfg.binds["Z Hop"] = 0

exechack_cc_hvh_obkak.cfg.vars["Water jump"] = false

exechack_cc_hvh_obkak.cfg.vars["Auto peak"] = false
exechack_cc_hvh_obkak.cfg.binds["Auto peak"] = 0
exechack_cc_hvh_obkak.cfg.vars["Auto peak tp"] = false

exechack_cc_hvh_obkak.cfg.vars["Circle strafe"] = false
exechack_cc_hvh_obkak.cfg.binds["Circle strafe"] = 0
exechack_cc_hvh_obkak.cfg.vars["CStrafe ticks"] = 64
exechack_cc_hvh_obkak.cfg.vars["CStrafe angle step"] = 1
exechack_cc_hvh_obkak.cfg.vars["CStrafe angle max step"] = 10
exechack_cc_hvh_obkak.cfg.vars["CStrafe ground diff"] = 10

exechack_cc_hvh_obkak.cfg.vars["Cvar name"] = ""
exechack_cc_hvh_obkak.cfg.vars["Cvar int"] = "1"
exechack_cc_hvh_obkak.cfg.vars["Cvar str"] = ""
exechack_cc_hvh_obkak.cfg.vars["Cvar mode"] = 1
exechack_cc_hvh_obkak.cfg.vars["Cvar flag"] = 1

exechack_cc_hvh_obkak.cfg.vars["Net Convar"] = ""
exechack_cc_hvh_obkak.cfg.vars["Net Convar str"] = ""
exechack_cc_hvh_obkak.cfg.vars["Net Convar int"] = 1
exechack_cc_hvh_obkak.cfg.vars["Net Convar mode"] = 1

exechack_cc_hvh_obkak.cfg.vars["Name Convar"] = ""
exechack_cc_hvh_obkak.cfg.vars["Disconnect reason"] = "VAC banned from secure server"
exechack_cc_hvh_obkak.cfg.vars["Name stealer"] = false
exechack_cc_hvh_obkak.cfg.vars["Auto reconnect"] = false

exechack_cc_hvh_obkak.cfg.vars["Chat spammer"]       = false
exechack_cc_hvh_obkak.cfg.vars["Chat mode"]          = 1
exechack_cc_hvh_obkak.cfg.vars["Chat group"]         = 1
exechack_cc_hvh_obkak.cfg.vars["Chat delay"]         = 1

exechack_cc_hvh_obkak.cfg.vars["Killsay"]            = false
exechack_cc_hvh_obkak.cfg.vars["Killsay mode"]          = 1
exechack_cc_hvh_obkak.cfg.vars["Killsay group"]         = 1

exechack_cc_hvh_obkak.cfg.vars["Retry on handcuff"] = false

// FTPToPos abuse xd )))
exechack_cc_hvh_obkak.cfg.vars["FSpec Teleport"] = false
exechack_cc_hvh_obkak.cfg.binds["FSpec Teleport"] = 0

exechack_cc_hvh_obkak.cfg.vars["FSpec Masskill"] = false
exechack_cc_hvh_obkak.cfg.binds["FSpec Masskill"] = 0

exechack_cc_hvh_obkak.cfg.vars["FSpec ClickTP"] = false
exechack_cc_hvh_obkak.cfg.binds["FSpec ClickTP"] = 0

exechack_cc_hvh_obkak.cfg.vars["FSpec Velocity"] = false
exechack_cc_hvh_obkak.cfg.binds["FSpec Velocity"] = 0

// Player visuals 
exechack_cc_hvh_obkak.cfg.vars["Box esp"]                    = false
exechack_cc_hvh_obkak.cfg.vars["Box style"]                  = 1

exechack_cc_hvh_obkak.cfg.vars["Sight lines"]        = false

exechack_cc_hvh_obkak.cfg.vars["ESP Font"]                  = 1

exechack_cc_hvh_obkak.cfg.vars["Box gradient"]   = false

exechack_cc_hvh_obkak.cfg.colors["Box esp"]      = "255 0 255 255"
exechack_cc_hvh_obkak.cfg.colors["Box gradient"] = "0 255 255 255"

exechack_cc_hvh_obkak.cfg.vars["Box team color"] = false

exechack_cc_hvh_obkak.cfg.vars["Name"] = false
exechack_cc_hvh_obkak.cfg.vars["Name pos"] = 1

exechack_cc_hvh_obkak.cfg.vars["Mark"] = false
exechack_cc_hvh_obkak.cfg.vars["Mark pos"] = 1

exechack_cc_hvh_obkak.cfg.vars["Usergroup"] = false
exechack_cc_hvh_obkak.cfg.vars["Usergroup pos"] = 1

exechack_cc_hvh_obkak.cfg.vars["Team"] = false
exechack_cc_hvh_obkak.cfg.vars["Team pos"] = 1

exechack_cc_hvh_obkak.cfg.vars["Health"] = false
exechack_cc_hvh_obkak.cfg.vars["Health bar"] = false
exechack_cc_hvh_obkak.cfg.vars["Health bar gradient"] = false
exechack_cc_hvh_obkak.cfg.vars["Health pos"] = 4
exechack_cc_hvh_obkak.cfg.colors["Health"] = "75 255 0 255"
exechack_cc_hvh_obkak.cfg.colors["Health bar gradient"] = "255 45 0 255"


exechack_cc_hvh_obkak.cfg.vars["Armor"] = false
exechack_cc_hvh_obkak.cfg.vars["Armor bar"] = false
exechack_cc_hvh_obkak.cfg.vars["Armor bar gradient"] = false
exechack_cc_hvh_obkak.cfg.vars["Armor pos"] = 4
exechack_cc_hvh_obkak.cfg.colors["Armor"] = "72 72 255 255"
exechack_cc_hvh_obkak.cfg.colors["Armor bar gradient"] = "72 255 72 255"

exechack_cc_hvh_obkak.cfg.vars["DarkRP Money"] = false
exechack_cc_hvh_obkak.cfg.vars["Money pos"] = 1

exechack_cc_hvh_obkak.cfg.vars["Weapon"] = false
exechack_cc_hvh_obkak.cfg.vars["Weapon pos"] = 1

exechack_cc_hvh_obkak.cfg.vars["Show ammo"] = false
exechack_cc_hvh_obkak.cfg.vars["Weapon printname"] = false
exechack_cc_hvh_obkak.cfg.vars["Show reload"] = false 

exechack_cc_hvh_obkak.cfg.vars["FakeLag Show"] = false
exechack_cc_hvh_obkak.cfg.vars["FakeLag Show pos"] = 1
exechack_cc_hvh_obkak.cfg.colors["FakeLag Show"] = "255 255 0 255"

exechack_cc_hvh_obkak.cfg.vars["Break LC"] = false
exechack_cc_hvh_obkak.cfg.vars["Break LC pos"] = 1

exechack_cc_hvh_obkak.cfg.vars["Simtime updated"] = false
exechack_cc_hvh_obkak.cfg.vars["Simtime pos"] = 1

exechack_cc_hvh_obkak.cfg.colors["Skeleton"] = "255 255 255 255"
exechack_cc_hvh_obkak.cfg.vars["Skeleton"] = false

exechack_cc_hvh_obkak.cfg.vars["Player flags"] = false
exechack_cc_hvh_obkak.cfg.vars["Hitbox"] = false
exechack_cc_hvh_obkak.cfg.colors["Hitbox"] = "255 255 255 255"


exechack_cc_hvh_obkak.cfg.vars["WaterMark"] = false
exechack_cc_hvh_obkak.cfg.vars["Player Hat"]    = false


// Chams
exechack_cc_hvh_obkak.cfg.vars["Visible chams"] = false
exechack_cc_hvh_obkak.cfg.vars["Visible chams w"] = false
exechack_cc_hvh_obkak.cfg.vars["Visible mat"] = 1
exechack_cc_hvh_obkak.cfg.colors["Visible chams"] = "0 255 255 255"

exechack_cc_hvh_obkak.cfg.vars["inVisible chams"] = false
exechack_cc_hvh_obkak.cfg.vars["inVisible chams w"] = false
exechack_cc_hvh_obkak.cfg.vars["inVisible mat"] = 1
exechack_cc_hvh_obkak.cfg.colors["inVisible chams"] = "255 255 0 255"

exechack_cc_hvh_obkak.cfg.vars["Supress lighting"] = false

exechack_cc_hvh_obkak.cfg.vars["Self chams"] = false
exechack_cc_hvh_obkak.cfg.vars["Self chams w"] = false
exechack_cc_hvh_obkak.cfg.vars["Self mat"] = 1
exechack_cc_hvh_obkak.cfg.colors["Self chams"] = "255 0 255 255"

exechack_cc_hvh_obkak.cfg.vars["Supress self lighting"] = false

exechack_cc_hvh_obkak.cfg.vars["Show records"] = false

exechack_cc_hvh_obkak.cfg.vars["Backtrack chams"] = false
exechack_cc_hvh_obkak.cfg.vars["Backtrack material"] = 1
exechack_cc_hvh_obkak.cfg.vars["Backtrack fullbright"] = false
exechack_cc_hvh_obkak.cfg.colors["Backtrack chams"] = "255 128 255 255"
exechack_cc_hvh_obkak.cfg.vars["Backtrack skeleton"] = false
exechack_cc_hvh_obkak.cfg.vars["OOF Arrows"] = false
exechack_cc_hvh_obkak.cfg.vars["OOF Style"] = 1



exechack_cc_hvh_obkak.cfg.vars["On screen logs"] = false

exechack_cc_hvh_obkak.cfg.colors["On screen logs"] = "69 255 69 255"
exechack_cc_hvh_obkak.cfg.colors["Miss lagcomp"] = "69 69 255 255"
exechack_cc_hvh_obkak.cfg.colors["Miss spread"] = "255 255 69 255"
exechack_cc_hvh_obkak.cfg.colors["Miss fail"] = "255 69 69 255"

exechack_cc_hvh_obkak.cfg.vars["Entity chams"] = false
exechack_cc_hvh_obkak.cfg.vars["Entity material"] = 1
exechack_cc_hvh_obkak.cfg.vars["Entity fullbright"] = false
exechack_cc_hvh_obkak.cfg.colors["Entity chams"] = "255 89 89 255"

exechack_cc_hvh_obkak.cfg.vars["Player outline"] = false
exechack_cc_hvh_obkak.cfg.vars["Entity outline"] = false
exechack_cc_hvh_obkak.cfg.colors["Player outline"] = "45 255 86 255"
exechack_cc_hvh_obkak.cfg.colors["Entity outline"] = "255 86 45 255"

exechack_cc_hvh_obkak.cfg.vars["Outline style"] = 1 

exechack_cc_hvh_obkak.cfg.vars["ESP Distance"] = 3500

exechack_cc_hvh_obkak.cfg.binds["Player add"] = 0
exechack_cc_hvh_obkak.cfg.binds["Priority add"] = 0

// Entity Esp
exechack_cc_hvh_obkak.cfg.binds["Ent add"] = 0
exechack_cc_hvh_obkak.cfg.vars["Ent box"] = false
exechack_cc_hvh_obkak.cfg.vars["Ent box style"] = 1
exechack_cc_hvh_obkak.cfg.vars["Ent class"] = false
exechack_cc_hvh_obkak.cfg.vars["Ent ESP Distance"] = 3500

exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"] = 0
exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"] = 1
exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] = 1

// Hitmarker
exechack_cc_hvh_obkak.cfg.vars["Hitmarker"] = false
exechack_cc_hvh_obkak.cfg.vars["Hit particles"] = false
exechack_cc_hvh_obkak.cfg.vars["Hitnumbers"] = false
exechack_cc_hvh_obkak.cfg.vars["Headshot indicator"] = false

exechack_cc_hvh_obkak.cfg.vars["Hitsound"] = false
exechack_cc_hvh_obkak.cfg.vars["Killsound"] = false
exechack_cc_hvh_obkak.cfg.vars["Killstreak"] = false

exechack_cc_hvh_obkak.cfg.vars["Hitsound str"] = "phx/hmetal1.wav"
exechack_cc_hvh_obkak.cfg.vars["Killsound str"] = "ambient/levels/canals/windchime2.wav"

exechack_cc_hvh_obkak.cfg.colors["Hit particles"] = "255 128 235 255"
exechack_cc_hvh_obkak.cfg.colors["Hitmarker"] = "255 155 25 255"
exechack_cc_hvh_obkak.cfg.colors["Hitnumbers"] = "255 255 255 255"
exechack_cc_hvh_obkak.cfg.colors["Hitnumbers krit"] = "255 35 35 255"
exechack_cc_hvh_obkak.cfg.colors["Headshot indicator"] = "0 255 0 255"

// Name hide / visual misc

exechack_cc_hvh_obkak.cfg.vars["Hide name"] = false
exechack_cc_hvh_obkak.cfg.vars["Custom name"] = "Your mom"
exechack_cc_hvh_obkak.cfg.vars["Disable sensivity adjustment"] = false
exechack_cc_hvh_obkak.cfg.vars["Screengrab image"] = false


// Visuals 
exechack_cc_hvh_obkak.cfg.vars["Tickbase indicator"] = false
exechack_cc_hvh_obkak.cfg.vars["Spectator list"] = false

exechack_cc_hvh_obkak.cfg.vars["RusEliteDetector"]   = false

exechack_cc_hvh_obkak.cfg.vars["Killsound"] = false

// World 
exechack_cc_hvh_obkak.cfg.vars["Custom sky"] = GetConVar("sv_skyname"):GetString()
exechack_cc_hvh_obkak.cfg.vars["Sky color"] = false 
exechack_cc_hvh_obkak.cfg.colors["Sky color"] = "145 185 245 255"
exechack_cc_hvh_obkak.cfg.vars["Wall color"] = false 
exechack_cc_hvh_obkak.cfg.colors["Wall color"] = "50 45 65 255"
exechack_cc_hvh_obkak.cfg.vars["Fullbright"] = false 
exechack_cc_hvh_obkak.cfg.vars["Fullbright mode"] = 1
exechack_cc_hvh_obkak.cfg.binds["Fullbright"] = 0
exechack_cc_hvh_obkak.cfg.vars["Disable shadows"] = false
exechack_cc_hvh_obkak.cfg.vars["FogChanger"] = false
exechack_cc_hvh_obkak.cfg.colors["FogChanger"] = "255 255 255 255"
exechack_cc_hvh_obkak.cfg.vars["FogStart"] = 1500
exechack_cc_hvh_obkak.cfg.vars["FogEnd"] = 3000
exechack_cc_hvh_obkak.cfg.vars["Color Modify"] = false
exechack_cc_hvh_obkak.cfg.vars["Color Modify Brightness"] = 0
exechack_cc_hvh_obkak.cfg.vars["Color Modify Contrast"] = 1
exechack_cc_hvh_obkak.cfg.vars["Color Modify Saturation"] = 3
exechack_cc_hvh_obkak.cfg.vars["Color Modify Add Red"] = 0
exechack_cc_hvh_obkak.cfg.vars["Color Modify Add Green"] = 0
exechack_cc_hvh_obkak.cfg.vars["Color Modify Add Blue"] = 0
exechack_cc_hvh_obkak.cfg.vars["Color Modify Mul Red"] = 0
exechack_cc_hvh_obkak.cfg.vars["Color Modify Mul Green"] = 0
exechack_cc_hvh_obkak.cfg.vars["Color Modify Mul Blue"] = 0

// Effects
exechack_cc_hvh_obkak.cfg.vars["Bullet tracers"] = false 
exechack_cc_hvh_obkak.cfg.colors["Bullet tracers"] = "255 65 65 255"
exechack_cc_hvh_obkak.cfg.vars["Bullet tracers material"] = "sprites/tp_beam001" 
exechack_cc_hvh_obkak.cfg.vars["Tracers die time"] = 5 
exechack_cc_hvh_obkak.cfg.vars["Bullet tracers muzzle"] = false 

// View 
exechack_cc_hvh_obkak.cfg.vars["Third person"] = false
exechack_cc_hvh_obkak.cfg.binds["Third person"] = 0
exechack_cc_hvh_obkak.cfg.vars["Third person collision"] = false
exechack_cc_hvh_obkak.cfg.vars["Third person smoothing"] = false
exechack_cc_hvh_obkak.cfg.vars["Third person distance"] = 150

exechack_cc_hvh_obkak.cfg.vars["Free camera"] = false
exechack_cc_hvh_obkak.cfg.binds["Free camera"] = 0
exechack_cc_hvh_obkak.cfg.vars["Free camera speed"] = 25
exechack_cc_hvh_obkak.cfg.vars["Ghetto free cam"] = false

exechack_cc_hvh_obkak.cfg.vars["Override view"] = true

exechack_cc_hvh_obkak.cfg.vars["Fov override"] = GetConVarNumber("fov_desired")

exechack_cc_hvh_obkak.cfg.vars["Aspect ratio"] = 0

exechack_cc_hvh_obkak.cfg.vars["Viewmodel changer"] = false

exechack_cc_hvh_obkak.cfg.vars["Viewmodel fov"] = GetConVar("viewmodel_fov"):GetInt()

exechack_cc_hvh_obkak.cfg.vars["Viewmodel chams"] = false
exechack_cc_hvh_obkak.cfg.colors["Viewmodel chams"] = "75 95 128 255"
exechack_cc_hvh_obkak.cfg.vars["Viewmodel chams type"] = 1
exechack_cc_hvh_obkak.cfg.vars["Fullbright viewmodel"] = false


exechack_cc_hvh_obkak.cfg.vars["Viewmodel x"] = 0
exechack_cc_hvh_obkak.cfg.vars["Viewmodel y"] = 0
exechack_cc_hvh_obkak.cfg.vars["Viewmodel z"] = 0
exechack_cc_hvh_obkak.cfg.vars["Viewmodel r"] = 0

exechack_cc_hvh_obkak.cfg.vars["Modelchanger"]   = false
exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] = 1
exechack_cc_hvh_obkak.cfg.vars["Player_modelchanger"] = false
exechack_cc_hvh_obkak.cfg.vars["Player_modelchanger_agent"] = 1

exechack_cc_hvh_obkak.cfg.vars["Ghost follower"] = false
exechack_cc_hvh_obkak.cfg.vars["GFID"] = "SteamID"

// Misc

exechack_cc_hvh_obkak.cfg.vars["Use spam"] = false
exechack_cc_hvh_obkak.cfg.vars["Flashlight spam"] = false
exechack_cc_hvh_obkak.cfg.vars["Auto GTA"] = false
exechack_cc_hvh_obkak.cfg.vars["Camera spam"] = false
exechack_cc_hvh_obkak.cfg.vars["Fast lockpick"] = false


exechack_cc_hvh_obkak.cfg.vars["Config name"] = "new"
exechack_cc_hvh_obkak.cfg.vars["Selected config"] = 1

exechack_cc_hvh_obkak.cfg.vars["Russian Ultimate"] = false
exechack_cc_hvh_obkak.cfg.vars["Ukrainian Ultimate"] = false
exechack_cc_hvh_obkak.cfg.vars["Navalny Ultimate"] = false

exechack_cc_hvh_obkak.originalTitle = "EXECHACK.CC: HVH OBKAK"
exechack_cc_hvh_obkak.currentTitle = exechack_cc_hvh_obkak.originalTitle
exechack_cc_hvh_obkak.backgroundImage = nil
exechack_cc_hvh_obkak.musicChannel = nil

exechack_cc_hvh_obkak.cfg.colors["Menu color"] = "0 0 0 255"

exechack_cc_hvh_obkak.cfg.friends = {}
exechack_cc_hvh_obkak.cfg.priorityList = {}
exechack_cc_hvh_obkak.cfg.ents = {}


do 
    local maxshift = GetConVar("sv_maxusrcmdprocessticks"):GetInt() - 1
    local tickrate = tostring(math.Round(1 / flTickInterval))

	RunConsoleCommand("cl_cmdrate", tickrate)
	RunConsoleCommand("cl_updaterate", tickrate)

	RunConsoleCommand("cl_interp", "0")
	RunConsoleCommand("cl_interp_ratio", "0")

    exechack_cc_hvh_obkak.cfg.vars["Shift ticks"] = maxshift
    exechack_cc_hvh_obkak.cfg.vars["Charge ticks"] = maxshift
    
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ded.EnableAnimFix( false )
end




/*
    Miss / Hit logs
exechack_cc_hvh_obkak.onScreenLogs = {}
exechack_cc_hvh_obkak.firedShots = 0
exechack_cc_hvh_obkak.HitLogsWhite = Color( 225, 225, 225 )
exechack_cc_hvh_obkak.MissReasons = {
    [ 1 ] =     { str = "spread", var = "Miss spread" },
    [ 2 ] =     { str = "resolver", var = "Miss fail" },
    [ 3 ] =     { str = "fake lag", var = "Miss lagcomp" },
    [ 4 ] =     { str = "fast shooting", var = "Miss spread" },
    [ 5 ] =     { str = "taunt", var = "Miss fail" },
}

if not file.Exists( "data/exechack_cc_hvh_obkak", "GAME" ) then 
    file.CreateDir("exechack_cc_hvh_obkak") 
end

if not file.Exists( "exechack_cc_hvh_obkak/default.txt", "DATA" ) then 
    file.Write( "exechack_cc_hvh_obkak/default.txt", util.TableToJSON( exechack_cc_hvh_obkak.cfg, false ) ) 
end

exechack_cc_hvh_obkak.cfgTable = {}

function exechack_cc_hvh_obkak.fillConfigTable()
    local ftbl = file.Find("exechack_cc_hvh_obkak/*.txt", "DATA")
    exechack_cc_hvh_obkak.cfgTable = {}

    if not ftbl or #ftbl == 0 then return end

    for i = 1, #ftbl do
        local str = ftbl[i] 
        local len = string.len(str)
        local f = string.sub(str, 1, len - 4) -- Remove .txt extension

        exechack_cc_hvh_obkak.cfgTable[#exechack_cc_hvh_obkak.cfgTable + 1] = f
    end
end

exechack_cc_hvh_obkak.fillConfigTable()

function exechack_cc_hvh_obkak.SaveConfig()
    local tojs = util.TableToJSON(exechack_cc_hvh_obkak.cfg, false)
    local str = exechack_cc_hvh_obkak.cfgTable[exechack_cc_hvh_obkak.cfg.vars["Selected config"]]

    if str then
        file.Write("exechack_cc_hvh_obkak/" .. str .. ".txt", tojs)
    else
        print("Error: Selected config not found.")
    end
end

function exechack_cc_hvh_obkak.LoadConfig()
    local str = exechack_cc_hvh_obkak.cfgTable[exechack_cc_hvh_obkak.cfg.vars["Selected config"]]
    //print(exechack_cc_hvh_obkak.cfg.vars["Selected config"])

    if not str or not file.Exists("exechack_cc_hvh_obkak/" .. str .. ".txt", "DATA") then
        print("Error: Config file not found.")
        return
    end

    local read = file.Read("exechack_cc_hvh_obkak/" .. str .. ".txt", "DATA")
    local totbl = util.JSONToTable(read)
    if not totbl then
        print("Error: Failed to parse config file.")
        return
    end

    local ConfigName = exechack_cc_hvh_obkak.cfg.vars["Config name"]
    local SelectedConfig = exechack_cc_hvh_obkak.cfg.vars["Selected config"]

exechack_cc_hvh_obkak.cfg.friends = {}
exechack_cc_hvh_obkak.cfg.ents = {}
exechack_cc_hvh_obkak.cfg.binds = {}
exechack_cc_hvh_obkak.cfg.priorityList = {}

for k, v in pairs(totbl or {}) do  
    for key, value in pairs(v or {}) do 
        local tbl = exechack_cc_hvh_obkak.cfg
        
        if k == "vars" then
            tbl = exechack_cc_hvh_obkak.cfg.vars or {} 
        elseif k == "colors" then
            tbl = exechack_cc_hvh_obkak.cfg.colors or {}  
        elseif k == "binds" then
            tbl = exechack_cc_hvh_obkak.cfg.binds 
        elseif k == "friends" then
            tbl = exechack_cc_hvh_obkak.cfg.friends
        elseif k == "ents" then
            tbl = exechack_cc_hvh_obkak.cfg.ents
        elseif k == "priorityList" then
            tbl = exechack_cc_hvh_obkak.cfg.priorityList
        end
        
        tbl[key] = value 
    end
end

    exechack_cc_hvh_obkak.cfg.vars["Config name"] = ConfigName
    exechack_cc_hvh_obkak.cfg.vars["Selected config"] = SelectedConfig

    ded.SetInterpolation(exechack_cc_hvh_obkak.cfg.vars["Disable interpolation"])
    ded.SetSequenceInterpolation(exechack_cc_hvh_obkak.cfg.vars["Disable Sequence interpolation"])
    ded.EnableAnimFix(exechack_cc_hvh_obkak.cfg.vars["Update Client Anim fix"])
    ded.EnableBoneFix(exechack_cc_hvh_obkak.cfg.vars["Bone fix"])

    ded.SetMaxShift(exechack_cc_hvh_obkak.cfg.vars["Charge ticks"])
    ded.SetMinShift(exechack_cc_hvh_obkak.cfg.vars["Shift ticks"])
    ded.EnableTickbaseShifting(exechack_cc_hvh_obkak.cfg.vars["Tickbase shift"])
end

function exechack_cc_hvh_obkak.CreateConfig()
    local str = exechack_cc_hvh_obkak.cfg.vars["Config name"]

    if str then
        file.Write("exechack_cc_hvh_obkak/" .. str .. ".txt", "")
        exechack_cc_hvh_obkak.fillConfigTable()
        exechack_cc_hvh_obkak.initTab("Config")
    else
        print("Error: Config name not specified.")
    end
end

function exechack_cc_hvh_obkak.DeleteConfig()
    local selectedConfigId = exechack_cc_hvh_obkak.cfg.vars["Selected config"]
    local str = exechack_cc_hvh_obkak.cfgTable[selectedConfigId]

    if str then
        file.Delete("exechack_cc_hvh_obkak/" .. str .. ".txt")

        table.remove(exechack_cc_hvh_obkak.cfgTable, selectedConfigId)

        if #exechack_cc_hvh_obkak.cfgTable > 0 then
            exechack_cc_hvh_obkak.cfg.vars["Selected config"] = 1
        else
            exechack_cc_hvh_obkak.cfg.vars["Selected config"] = nil
        end

        exechack_cc_hvh_obkak.fillConfigTable()
        exechack_cc_hvh_obkak.initTab("Config")
    else
        print("Error: Config not found.")
    end
end

function exechack_cc_hvh_obkak.TIME_TO_TICKS(time)
	return math.floor(0.5 + time / flTickInterval)
end

function exechack_cc_hvh_obkak.TICKS_TO_TIME(ticks)
    return flTickInterval * ticks
end

function exechack_cc_hvh_obkak.ROUND_TO_TICK(time)
    return exechack_cc_hvh_obkak.TICKS_TO_TIME(exechack_cc_hvh_obkak.TIME_TO_TICKS(time))
end














local Utility = {}

function Utility.TimeToTicks( flTime )
    return math.floor( 0.5 + flTime / flTickInterval )
end


exechack_cc_hvh_obkak.chamsMaterials = {
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

        if exechack_cc_hvh_obkak.cfg.vars["Hide name"] and self == pLocalPlayer then
            return exechack_cc_hvh_obkak.cfg.vars["Custom name"]
        end

        return Name_( self )
    end

    function PLAYER:Nick()

        if exechack_cc_hvh_obkak.cfg.vars["Hide name"] and self == pLocalPlayer then
            return exechack_cc_hvh_obkak.cfg.vars["Custom name"]
        end

        return Nick_( self )
    end

    function PLAYER:GetName()

        if exechack_cc_hvh_obkak.cfg.vars["Hide name"] and self == pLocalPlayer then
            return exechack_cc_hvh_obkak.cfg.vars["Custom name"]
        end

        return GetName_( self )
    end
end


exechack_cc_hvh_obkak.ui = {}

exechack_cc_hvh_obkak.validsnd = false 


exechack_cc_hvh_obkak.activetab = "Aimbot"
exechack_cc_hvh_obkak.multicombo = false


exechack_cc_hvh_obkak.hint = false
exechack_cc_hvh_obkak.hintText = ""
exechack_cc_hvh_obkak.hintX = 0
exechack_cc_hvh_obkak.hintY = 0

do
    StoredCursorPos = {}

    function RememberCursorPosition()

        local x, y = input.GetCursorPos()

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

    local function LerpColor(frac, from, to)
        if not from or not to then return from or to end
        return Color(
            Lerp(frac, from.r or 255, to.r or 255),
            Lerp(frac, from.g or 255, to.g or 255),
            Lerp(frac, from.b or 255, to.b or 255),
            Lerp(frac, from.a or 255, to.a or 255)
        )
    end

    PANEL.FadeTime = 0
    PANEL.Animations = {}

    function PANEL:Init()
        self:SetFocusTopLevel(true)
        self:SetSize(800, 500)
        self:SetPaintBackgroundEnabled(false)
        self:SetPaintBorderEnabled(false)
        self:DockPadding(5, 60, 5, 5)
        self:MakePopup()
        self:Center(true)

        self:SetAlpha(0)
        self:SetSize(800, 0)
        self.Animations.FadeIn = Derma_Anim("FadeIn", self, function(p, anim, delta, data)
            p:SetAlpha(delta * 255)
            p:SetSize(800, 500 * delta)
            if delta == 1 then
                p:Center()
            end
        end)
        self.Animations.FadeIn:Start(0.3)

        PANEL.TopPanel = self:Add("DPanel")
        PANEL.TopPanel:SetPos(5, 30)
        PANEL.TopPanel:SetSize(790, 25)
        PANEL.TopPanel.lineProgress = 0
        
        function PANEL.TopPanel:Paint(w, h)
            self.lineProgress = Lerp(FrameTime() * 3, self.lineProgress or 0, 1)
            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
            surface.DrawRect(0, 24, w * self.lineProgress, 1)
        end
    end

    function PANEL:Think()
        for name, anim in pairs(self.Animations) do
            if anim:Active() then
                anim:Run()
            end
        end

        local x,y = input.GetCursorPos()
        local mousex = math.Clamp(x, 1, ScrW() - 1)
        local mousey = math.Clamp(y, 1, ScrH() - 1)

        if self.Dragging then
            local x = mousex - self.Dragging[1]
            local y = mousey - self.Dragging[2]
            self:SetPos(x, y)
        end

        self:SetCursor("arrow")

        if not self.Animations.ColorChange or not self.Animations.ColorChange:Active() then
            local target_color = HSVToColor((CurTime() * 20) % 360, 1, 1) or Color(255,255,255)
            target_color.r = math.Clamp(target_color.r, 150, 255)
            target_color.g = math.Clamp(target_color.g, 150, 255)
            target_color.b = math.Clamp(target_color.b, 150, 255)
            
            if not exechack_cc_hvh_obkak.accent then exechack_cc_hvh_obkak.accent = target_color end
            
            self.Animations.ColorChange = Derma_Anim("ColorChange", self, function(p, anim, delta, data)
                if exechack_cc_hvh_obkak.accent and target_color then
                    exechack_cc_hvh_obkak.accent = LerpColor(delta, exechack_cc_hvh_obkak.accent, target_color)
                end
            end)
            self.Animations.ColorChange:Start(0.8)
        end
    end
	local function surface_SimpleRect(x,y,w,h,c)
		surface.SetDrawColor(c)
		surface.DrawRect(x,y,w,h)
	end
	local function surface_SimpleText(x,y,s,c)
		surface.SetTextColor(c)
		surface.SetTextPos(x,y) 
		surface.DrawText(s) 
	end
	surface.CreateFont( "tbfont", {	font = "Open Sans", extended = false,size = 15,weight = 100,additive = false,} )
    function PANEL:Paint(w, h)
        surface_SimpleRect(0, 0, w, h, exechack_cc_hvh_obkak.Colors[24])
        
        if exechack_cc_hvh_obkak.backgroundMaterial then
            surface.SetDrawColor(255, 255, 255, 100)
            surface.SetMaterial(exechack_cc_hvh_obkak.backgroundMaterial)
            surface.DrawTexturedRect(0, 25, w, h - 25)
        elseif exechack_cc_hvh_obkak.backgroundType == "russian_flag" then
            local stripHeight = (h - 25) / 3
            surface.SetDrawColor(255, 255, 255, 150)
            surface.DrawRect(0, 25, w, stripHeight)
            surface.SetDrawColor(0, 57, 166, 150)
            surface.DrawRect(0, 25 + stripHeight, w, stripHeight)
            surface.SetDrawColor(213, 43, 30, 150)
            surface.DrawRect(0, 25 + stripHeight * 2, w, stripHeight)
        elseif exechack_cc_hvh_obkak.backgroundType == "ukrainian_flag" then
            local stripHeight = (h - 25) / 2
            surface.SetDrawColor(0, 87, 183, 150)
            surface.DrawRect(0, 25, w, stripHeight)
            surface.SetDrawColor(255, 215, 0, 150)
            surface.DrawRect(0, 25 + stripHeight, w, stripHeight)
        end
        
        surface_SimpleRect(0, 0, w, 25, exechack_cc_hvh_obkak.Colors[54])
        surface.SetFont("tbfont")
        surface_SimpleText(8,4,exechack_cc_hvh_obkak.currentTitle,color_white)
        
        if exechack_cc_hvh_obkak.cfg.vars["Tesak Ultimate"] then
            exechack_cc_hvh_obkak.UpdateTesakParticles()
            
            surface.SetFont("DermaLarge")
            for i, particle in ipairs(exechack_cc_hvh_obkak.tesakParticles) do
                local alpha = math.Clamp((particle.life / particle.maxLife) * 255, 0, 255)
                surface.SetTextColor(255, 0, 0, alpha)
                surface.SetTextPos(particle.x, particle.y)
                surface.DrawText("1488")
            end
        end
    end

    function PANEL:IsActive()
        if self:HasFocus() then return true end
        if vgui.FocusedHasParent(self) then return true end
        return false
    end

    function PANEL:OnMousePressed()
        local x,y = input.GetCursorPos()
        local screenX, screenY = self:LocalToScreen(0, 0)

        if y < (screenY + 850) then
            self.Dragging = {x - self.x, y - self.y}
            self:MouseCapture(true)
        end
    end

    function PANEL:OnMouseReleased()
        self.Dragging = nil
        self:MouseCapture(false)
    end

    function PANEL:GetTopPanel()
        return PANEL.TopPanel
    end

    vgui.Register("UFrame", PANEL, "EditablePanel")
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
            local target_color = self:IsHovered() and exechack_cc_hvh_obkak.Colors[255] or exechack_cc_hvh_obkak.Colors[54]
            if not self.current_color then self.current_color = target_color end
            
            if self.current_color ~= target_color then
                Derma_Anim("ScrollbarColor", self, function(panel, animation, delta, data)
                    panel.current_color = LerpColor(delta, panel.current_color, target_color)
                end):Start(0.15)
            end
            
            surface.SetDrawColor(self.current_color)
            surface.DrawRect(0, 0, w, h)
        end
    end       

    function PANEL:Paint( w, h )
    end

    function PANEL:OnMousePressed()
        exechack_cc_hvh_obkak.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        exechack_cc_hvh_obkak.frame:OnMouseReleased()
    end

    vgui.Register( "UScroll", PANEL, "DScrollPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.ItemPanel = vgui.Create("DPanel", self)
        self.ItemPanel:Dock(FILL)
        self.ItemPanel:DockMargin(3, 23, 3, 3)
        self.ItemPanel.Paint = nil

        self.ItemPanel.hover_progress = 0
        self.ItemPanel.wave = 0
        
        function self.ItemPanel:Think()
            local target = self:IsHovered() and 1 or 0
            self.hover_progress = Lerp(FrameTime() * 8, self.hover_progress or 0, target)
            
            if self:IsHovered() then
                self.wave = self.wave + FrameTime() * 2
            else
                self.wave = 0
            end
        end

        function self.ItemPanel:PaintOver(w, h)
            if self.hover_progress > 0 then
                local col = exechack_cc_hvh_obkak.Colors[35] or Color(50,50,50)
                
                surface.SetDrawColor(col.r, col.g, col.b, 50 * self.hover_progress)
                surface.DrawRect(0, 0, w, h)

                if self.wave > 0 and self.wave < 1 then
                    local waveHeight = h * 0.1
                    local waveY = h * self.wave
                    surface.SetDrawColor(col.r + 40, col.g + 40, col.b + 40, 80 * (1 - self.wave))
                    surface.DrawRect(0, waveY - waveHeight/2, w, waveHeight)
                end
            end
        end
    end

    function PANEL:Paint(w, h)
        local borderAlpha = Lerp(FrameTime() * 5, self.borderAlpha or 0, 255)
        self.borderAlpha = borderAlpha
        
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54].r, exechack_cc_hvh_obkak.Colors[54].g, exechack_cc_hvh_obkak.Colors[54].b, borderAlpha)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
   
        surface.SetFont("DermaSmall")
        local text = self.txt or ""
        local text_w, text_h = surface.GetTextSize(text)
        
        local textAlpha = 200 + math.sin(CurTime() * 2) * 55
        surface.SetTextColor(exechack_cc_hvh_obkak.Colors[165].r, exechack_cc_hvh_obkak.Colors[165].g, exechack_cc_hvh_obkak.Colors[165].b, textAlpha)
        surface.SetTextPos(8, 2)
        surface.DrawText(text)

        local lineProgress = Lerp(FrameTime() * 6, self.lineProgress or 0, 1)
        self.lineProgress = lineProgress
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54].r, exechack_cc_hvh_obkak.Colors[54].g, exechack_cc_hvh_obkak.Colors[54].b, borderAlpha)
        surface.DrawRect(6, 20, (w - 12) * lineProgress, 1)
    end

    function PANEL:OnMousePressed()
        exechack_cc_hvh_obkak.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        exechack_cc_hvh_obkak.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end
    
    vgui.Register("UPanel", PANEL, "Panel")
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[ 54 ] )
        surface.DrawRect( 0, 0, w, h )
    end
    
    vgui.Register( "UPaintedPanel", PANEL, "Panel" )
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
    
    vgui.Register( "UCBPanel", PANEL, "DPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.Label:SetFont("DermaSmall")
        self.Label:SetTextColor(exechack_cc_hvh_obkak.Colors[165])

        self.Button:SetSize( 18, 18 )

        function self.Button:Paint(w,h)
            local v = self:GetChecked()

            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])

            surface.DrawOutlinedRect(0,0,w,h,1)

            if !v and !self:IsHovered() then return end

            if v then
                surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
            else
                surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[40])
            end
                
            surface.DrawRect(3,3,w-6,h-6)
        end
    end

    function PANEL:PerformLayout()

        local x = self.m_iIndent || 0
    
        self.Button:SetSize( 18, 18 )
        self.Button:SetPos( x, math.floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )
    
        self.Label:SizeToContents()
        self.Label:SetPos( x + self.Button:GetWide() + 9, math.floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )
    
    end
    
    vgui.Register( "UCheckboxLabel", PANEL, "DCheckBoxLabel" )
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
    
        x = math.Clamp(x, 0, w) / w
        y = math.Clamp(y, 0, h) / h
    
        local value = self.Min + (self.Max - self.Min) * x
        value = math.Round(value, self:GetDecimals())
    
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

        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
        surface.DrawRect(2, 2, self:GetSlideX()*w-4, h-4)
    end
    
    vgui.Register("USlider", PANEL, "Panel")
end

do
    local PANEL = {}

    local function DrawCircle(x, y, radius, segments)
        local circle = {}
        for i = 1, segments do
            local angle = math.rad((i / segments) * -360)
            circle[i] = {
                x = x + math.sin(angle) * radius,
                y = y + math.cos(angle) * radius
            }
        end
        
        surface.DrawPoly(circle)
    end

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(4, 4, 4, 0)
        self:SetTall(18)
        
        self.click_progress = 0
        self.hover_progress = 0
        self.ripple = {progress = 0}
        
        self.textColor = exechack_cc_hvh_obkak.Colors[165] or Color(200, 200, 200)
        
        function self:Think()
            local clickTarget = self:IsDown() and 1 or 0
            self.click_progress = Lerp(FrameTime() * 15, self.click_progress or 0, clickTarget)
            
            local hoverTarget = self:IsHovered() and 1 or 0
            self.hover_progress = Lerp(FrameTime() * 6, self.hover_progress or 0, hoverTarget)
            
            if self:IsDown() then
                self.ripple.progress = math.min(self.ripple.progress + FrameTime() * 3, 1)
            else
                self.ripple.progress = 0
            end
        end
    end

    function PANEL:Paint(w, h)
        if self.hover_progress > 0 then
            local col = exechack_cc_hvh_obkak.Colors[35] or Color(50,50,50)
            surface.SetDrawColor(col.r, col.g, col.b, 100 * self.hover_progress)
            surface.DrawRect(0, 0, w, h)
        end
        
        if self.ripple.progress > 0 then
            local rippleSize = w * 1.5 * self.ripple.progress
            local rippleAlpha = (1 - self.ripple.progress) * 120
            surface.SetDrawColor(255, 255, 255, rippleAlpha)
            draw.NoTexture()
            DrawCircle(w/2, h/2, rippleSize, 24)
        end

        if self.click_progress > 0 then
            local pressCol = exechack_cc_hvh_obkak.Colors[54] or Color(100,100,100)
            surface.SetDrawColor(pressCol.r, pressCol.g, pressCol.b, 150 * self.click_progress)
            surface.DrawRect(0, 0, w, h)
        end

        local borderAlpha = Lerp(self.hover_progress, 150, 255)
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54].r, exechack_cc_hvh_obkak.Colors[54].g, exechack_cc_hvh_obkak.Colors[54].b, borderAlpha)
        surface.DrawOutlinedRect(0, 0, w, h, 1)
        
        local textGlow = math.sin(CurTime() * 3) * 30 * self.hover_progress
        local textCol = Color(
            math.Clamp(self.textColor.r + textGlow, 0, 255),
            math.Clamp(self.textColor.g + textGlow, 0, 255),
            math.Clamp(self.textColor.b + textGlow, 0, 255)
        )
        self:SetTextColor(textCol)
        self:SetFont("DermaSmall")
    end

    vgui.Register("UButton", PANEL, "DButton")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetTall(20)
        self.DropButton.Paint = nil
        
        self.open_progress = 0
        self.menu_alpha = 0
        self.text_alpha = 0

        self.item_appear_order = {}
        self.item_appear_timer = 0
        self.item_appear_speed = 0.15
        
        function self:Think()
            local target = self:IsMenuOpen() and 1 or 0
            self.open_progress = Lerp(FrameTime() * 10, self.open_progress, target)
            
            if IsValid(self.Menu) then
                local target_alpha = self:IsMenuOpen() and 255 or 0
                self.menu_alpha = Lerp(FrameTime() * 15, self.menu_alpha, target_alpha)
                self.Menu:SetAlpha(self.menu_alpha)
                
                if self:IsMenuOpen() then
                    self.item_appear_timer = self.item_appear_timer + FrameTime()
                    
                    for k, item in pairs(self.item_appear_order) do
                        if item and IsValid(item) then
                            local delay = (k-1) * 0.08
                            local progress = math.Clamp((self.item_appear_timer - delay) / self.item_appear_speed, 0, 1)
                            item.alpha = progress * 255
                            item.y_offset = Lerp(progress, 10, 0)
                        end
                    end
                end
            end
            
            self.text_alpha = Lerp(FrameTime() * 8, self.text_alpha, self:GetText() ~= "" and 255 or 0)
        end
    end

    function PANEL:Paint(w, h)
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[25])
        surface.DrawRect(0, 0, w, h)
    
        surface.SetTextColor(exechack_cc_hvh_obkak.Colors[222])
        surface.SetTextPos(w-20, h/2-7)
        surface.SetFont("DermaSmall")
        surface.DrawText(self.open_progress > 0.5 and "▲" or "▼")

        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
        surface.DrawOutlinedRect(0, 0, w, h)

        if self:GetText() ~= "" and self.text_alpha > 0 then
            surface.SetTextColor(exechack_cc_hvh_obkak.Colors[165].r, exechack_cc_hvh_obkak.Colors[165].g, exechack_cc_hvh_obkak.Colors[165].b, self.text_alpha)
            surface.SetFont("DermaSmall")
            surface.SetTextPos(8, h/2 - 7)
            surface.DrawText(self:GetText())
        end
    end

    function PANEL:OpenMenu(pControlOpener)
        if (pControlOpener and pControlOpener == self.TextEntry) then return end
        if (#self.Choices == 0) then return end
    
        if (IsValid(self.Menu)) then
            self.Menu:Remove()
            self.Menu = nil
        end
    
        local parent = self
        while (IsValid(parent) and not parent:IsModal()) do
            parent = parent:GetParent()
        end
        if (not IsValid(parent)) then parent = self end
    
        self.Menu = DermaMenu(false, parent)
        self.Menu:SetAlpha(0)
        self.item_appear_order = {}
        self.item_appear_timer = 0
        
        function self.Menu:Paint(w, h)
            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[24].r, exechack_cc_hvh_obkak.Colors[24].g, exechack_cc_hvh_obkak.Colors[24].b, self:GetAlpha())
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54].r, exechack_cc_hvh_obkak.Colors[54].g, exechack_cc_hvh_obkak.Colors[54].b, self:GetAlpha())
            surface.DrawOutlinedRect(0, 0, w, h)
        end

        for k, v in pairs(self.Choices) do
            local option = self.Menu:AddOption(v, function() 
                self:ChooseOption(v, k) 
            end)
            
            option.txt = option:GetText()
            option:SetText("")
            option.alpha = 0
            option.y_offset = 10
            
            table.insert(self.item_appear_order, option)

            function option:Paint(w, h)
                if self:IsHovered() then 
                    surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[32].r, exechack_cc_hvh_obkak.Colors[32].g, exechack_cc_hvh_obkak.Colors[32].b, self.alpha)
                    surface.DrawRect(1, 1, w-2, h-2)
                end
                
                surface.SetTextColor(exechack_cc_hvh_obkak.Colors[165].r, exechack_cc_hvh_obkak.Colors[165].g, exechack_cc_hvh_obkak.Colors[165].b, self.alpha)
                surface.SetTextPos(10, 4 + self.y_offset)
                surface.DrawText(self.txt)
            end

            if (self.Spacers[k]) then
                self.Menu:AddSpacer()
            end
        end

        local x, y = self:LocalToScreen(0, self:GetTall())
        self.Menu:SetMinimumWidth(self:GetWide())
        self.Menu:Open(x, y, false, self)
        
        self:OnMenuOpened(self.Menu)
    end
    
    function PANEL:PerformLayout(s)
        self:SetTextColor(exechack_cc_hvh_obkak.Colors[165])
        self:SetFont("DermaSmall")
    end

    vgui.Register("UComboBox", PANEL, "DComboBox")
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
        self:SetTextColor(exechack_cc_hvh_obkak.Colors[165])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
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

    vgui.Register( "UBinder", PANEL, "DButton" )
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
            surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[255] )
            surface.SetMaterial( exechack_cc_hvh_obkak.Materials["Alpha grid"] )
            surface.DrawTexturedRect( 0, 0, w, h )
        end

        surface.SetDrawColor(self.Color)
        surface.DrawRect(0,0,w,h)
    end

    vgui.Register( "UCPicker", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.lifeTime = 0

    function PANEL:Paint( w, h )
        surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[ 25 ] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
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

    vgui.Register( "ULifeTimeBase", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetSize(200, 200)
        self:SetAlpha(0)
        
        self.Animations = {}
        self.Animations.FadeIn = Derma_Anim("FadeIn", self, function(panel, animation, delta, data)
            panel:SetAlpha(delta * 255)
        end)
        self.Animations.FadeIn:Start(0.15)
    end 

    function PANEL:Paint(w, h)
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[25])
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
        surface.DrawOutlinedRect(0, 0, w, h, 1)
    end

    vgui.Register("UColorPanel", PANEL, "ULifeTimeBase")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )
        self:DockPadding(5, 5, 5, 5)
        self:SetPalette( false )
        self:SetWangs( false )
    end

    vgui.Register( "UColorMixer", PANEL, "DColorMixer" )
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
            
            surface.SetDrawColor( c, c, c )
            surface.DrawRect( 0, 0, w, h )
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

    vgui.Register( "UListView", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[24] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui.Register( "USettingsPanel", PANEL, "ULifeTimeBase" )
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

    vgui.Register( "USPanelButton", PANEL, "UButton" )
end

do
    local PANEL = {}

    function PANEL:Init()

        self.ButtonPanel = vgui.Create( "DPanel", self )
        self.ButtonPanel:Dock( TOP )
        self.ButtonPanel:DockMargin(3,3,3,2)
        self.ButtonPanel:SetTall(18)

        self.ItemPanel = vgui.Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 0, 3, 3 )

        self.ButtonPanel.Paint = nil
        self.ItemPanel.Paint = nil

        self.ActiveTab = "NIL"

        function self.ItemPanel:OnMousePressed()
            exechack_cc_hvh_obkak.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            exechack_cc_hvh_obkak.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
   
        surface.SetFont( "DermaSmall" )

        surface.SetTextColor( exechack_cc_hvh_obkak.Colors[165] )
        surface.SetTextPos( 8, 2 ) 
        surface.DrawText( self.txt ) 

        surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[ 54 ] )
        surface.DrawRect( 6, 20, w - 12, 1 )
    end

    function PANEL:OnMousePressed()
        exechack_cc_hvh_obkak.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        exechack_cc_hvh_obkak.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    function PANEL:GetButtonPanel()
        return self.ButtonPanel
    end

    vgui.Register( "UButtonBarPanel", PANEL, "Panel" )
end




// GUI FUNCS

exechack_cc_hvh_obkak.ui.ColorWindow = false
exechack_cc_hvh_obkak.ui.SettingsPan = false
exechack_cc_hvh_obkak.ui.MultiComboP = false

function exechack_cc_hvh_obkak.ui.RemovePanel( pan )
    if not pan then return end 

    pan:Remove()
    pan = false
end

function exechack_cc_hvh_obkak.ui.Binder( cfg, par )
    local b = vgui.Create( "UBinder", par )
    b:SetValue( exechack_cc_hvh_obkak.cfg.binds[ cfg ] )

    function b:OnChange()
        exechack_cc_hvh_obkak.cfg.binds[ cfg ] = b:GetValue()
    end

    return b
end

function exechack_cc_hvh_obkak.ui.ColorPicker(cfg, par, onChange)
    local b = vgui.Create("UCPicker", par)
    b.Color = string.ToColor(exechack_cc_hvh_obkak.cfg.colors[cfg] or "255 255 255 255")

    function b:DoClick()
        local x, y = self:LocalToScreen(0, self:GetTall())

        if IsValid(exechack_cc_hvh_obkak.ui.ColorWindow) then
            exechack_cc_hvh_obkak.ui.ColorWindow:Remove()
        end

        exechack_cc_hvh_obkak.ui.ColorWindow = vgui.Create("UColorPanel")
        exechack_cc_hvh_obkak.ui.ColorWindow:SetPos(x+25, y-100)
        exechack_cc_hvh_obkak.ui.ColorWindow:SetSize(200, 200)

        exechack_cc_hvh_obkak.ui.ColorWindow:SetAlpha(0)
        exechack_cc_hvh_obkak.ui.ColorWindow:AlphaTo(255, 0.2, 0, function() end)

        local c = vgui.Create("UColorMixer", exechack_cc_hvh_obkak.ui.ColorWindow)
        c:Dock(FILL)
        c:SetColor(b.Color)
        
        c.HSV.Knob:SetSize(5, 5)
        
        function c.HSV.Knob:Paint(w, h)
            surface.SetDrawColor(b.Color.r, b.Color.g, b.Color.b, 255)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[255] or color_white)
            surface.DrawOutlinedRect(0, 0, w, h, 1)
        end

        function c:ValueChanged(col)
            b.Color = col
            exechack_cc_hvh_obkak.cfg.colors[cfg] = string.format("%d %d %d %d", col.r, col.g, col.b, col.a)
            if onChange then 
                onChange(col) 
            end
            
            if IsValid(b) then
                b:SetColor(col)
            end
        end
    end

    function b:SetColor(col)
        self.Color = col
        self:SetTooltip(string.format("R: %d G: %d B: %d A: %d", col.r, col.g, col.b, col.a))
    end

    b:SetColor(b.Color)
    
    return b
end

function exechack_cc_hvh_obkak.ui.SPanel( func, p )
    local b = vgui.Create( "USPanelButton", p )

    function b:DoClick()
        local mx, my = input.GetCursorPos()

        exechack_cc_hvh_obkak.ui.RemovePanel( exechack_cc_hvh_obkak.ui.SettingsPan )

        exechack_cc_hvh_obkak.ui.SettingsPan = vgui.Create( "USettingsPanel" )
        exechack_cc_hvh_obkak.ui.SettingsPan:SetPos( mx+25, my-10 )

        func()
    end
end

function exechack_cc_hvh_obkak.ui.Label( pan, str, postCreate )
    local p = vgui.Create( "UCBPanel", pan )

    local lbl = vgui.Create( "DLabel", p )
    lbl:SetText( str )
    lbl:SetFont( "DermaSmall" )
    lbl:SetTextColor( exechack_cc_hvh_obkak.Colors[165] )
    lbl:Dock( LEFT )
    lbl:DockMargin( 4, 2, 4, 0 )
    lbl:SizeToContents()

    if postCreate then postCreate( p ) end
end
    
function exechack_cc_hvh_obkak.ui.CheckBox( par, lbl, cfg, hint, bind, color, spanel, onToggle, postCreate )
    local p = vgui.Create( "UCBPanel", par )

    local c = vgui.Create( "UCheckboxLabel", p )
    c:SetText( lbl )
    c:SetPos( 0, 0 )
    c:SetValue( exechack_cc_hvh_obkak.cfg.vars[cfg] )

    function c:OnChange( bval )
        exechack_cc_hvh_obkak.cfg.vars[cfg] = bval

        if onToggle then onToggle(bval) end
    end

    if postCreate then postCreate( p ) end

    if bind then exechack_cc_hvh_obkak.ui.Binder( cfg, p ) end
    if color then exechack_cc_hvh_obkak.ui.ColorPicker( cfg, p ) end
    if spanel then exechack_cc_hvh_obkak.ui.SPanel( spanel, p ) end

    if hint then
        function c.Label:Paint()
            if self:IsHovered() then
                local x, y = input.GetCursorPos()

                exechack_cc_hvh_obkak.hint = true
                exechack_cc_hvh_obkak.hintText = hint
                exechack_cc_hvh_obkak.hintX = x + 45
                exechack_cc_hvh_obkak.hintY = y - 5
            end
        end
    end
end

function exechack_cc_hvh_obkak.ui.Slider( p, str, cfg, min, max, dec, onChange )
    local pan = vgui.Create( "DPanel", p )
    pan:Dock( TOP )
    pan:DockMargin( 4, 2, 4, 0 )
    pan:SetTall( 20 )

    function pan:Paint( w, h )
        surface.SetFont("DermaSmall")

        local s = exechack_cc_hvh_obkak.cfg.vars[cfg]
        local tw, th = surface.GetTextSize(s)
        
        surface.SetTextColor( exechack_cc_hvh_obkak.Colors[165] )

        surface.SetTextPos( 2, 4 ) 
        surface.DrawText( str ) 

        surface.SetTextPos( w - tw - 2, 4 ) 
        surface.DrawText( exechack_cc_hvh_obkak.cfg.vars[cfg] ) 
    end

    local c = vgui.Create( "USlider", p )
    c:Dock( TOP )
    c:DockMargin( 4, 2, 4, 0 )
    c:SetMax( max )
    c:SetMin( min )
    c:SetDecimals( dec )

    c:SetValue( exechack_cc_hvh_obkak.cfg.vars[cfg] )

    local value, min, max = c:GetValue(), c:GetMin(), c:GetMax()

	c:SetSlideX((value - min) / (max - min))

    function c:OnValueChanged( val )
        exechack_cc_hvh_obkak.cfg.vars[cfg] = val

        if onChange then onChange(val) end
    end
end

function exechack_cc_hvh_obkak.ui.Button( str, func, p ) 
    local b = vgui.Create( "UButton", p )
    b:SetText( str )

    function b:DoClick()
        func()
    end
end

function exechack_cc_hvh_obkak.ui.TextEntry( str, cfg, pan, chars, postCreate )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,2,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(exechack_cc_hvh_obkak.Colors[165])

    local p = vgui.Create("DPanel",pan)
    p:SetTall(25)
    p:Dock(TOP)
    p:DockMargin(4,2,4,0)

    p.Paint = function(s,w,h)
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h)
    end
	
	local txt = vgui.Create("DTextEntry",p)
	txt:Dock(FILL)
	txt:DockMargin(4,4,4,4) 
	txt:IsMultiline( false )
	txt:SetMaximumCharCount(chars)
	txt:SetPlaceholderText(str)
	txt:SetFont( "DermaSmall" )
    txt:SetPaintBackground(false)
    txt:SetTextColor(exechack_cc_hvh_obkak.Colors[165])

	if exechack_cc_hvh_obkak.cfg.vars[cfg] != nil and exechack_cc_hvh_obkak.cfg.vars[cfg] != "" then
		txt:SetValue(exechack_cc_hvh_obkak.cfg.vars[cfg])
	end

	function txt.Think()
		if txt:IsEditing() then return end
        if exechack_cc_hvh_obkak.cfg.vars[cfg] == txt:GetValue() then return end

		exechack_cc_hvh_obkak.cfg.vars[cfg] = txt:GetValue()
	end 

	function txt.OnValueChange()
		exechack_cc_hvh_obkak.cfg.vars[cfg] = txt:GetValue()
	end

    if postCreate then postCreate(p) end
end

function exechack_cc_hvh_obkak.ui.dropdownButton( str, v, p, a )
    local b = p:Add("DButton")
    b:Dock(TOP)
    b:SetTall(20)
    b:DockMargin(2,2,2,0)
    b:SetText("")
    
    function b:Paint(w,h)
        if self:IsHovered() then 
            surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[ 32 ] )
            surface.DrawRect( 1, 1, w - 2, h - 2 )
        end

        surface.SetTextColor(exechack_cc_hvh_obkak.Colors[165])

        if exechack_cc_hvh_obkak.cfg.vars[str.."-"..v] then
            surface.SetTextColor(exechack_cc_hvh_obkak.Colors[235]) 
        end

        surface.SetTextPos(5,3)
        surface.SetFont("DermaSmall")
        surface.DrawText(v)
    end

    function b:DoClick()
        exechack_cc_hvh_obkak.cfg.vars[str.."-"..v] = not exechack_cc_hvh_obkak.cfg.vars[str.."-"..v] 
    end
end

function exechack_cc_hvh_obkak.ui.MultiCombo( pan, str, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(exechack_cc_hvh_obkak.Colors[165])

    local d = vgui.Create("DButton",pan)
    d:Dock(TOP)
    d:DockMargin(4,1,4,0)
    d:SetTall(20)
    d:SetText("")
    
    d.preview = {}

    function d:Paint(w,h)
        local preview = ""

        for k, v in pairs(choices) do
            if exechack_cc_hvh_obkak.cfg.vars[str.."-"..v] == true and (d.preview[v] == false or d.preview[v] == nil) and not table.HasValue(d.preview, v) then
                table.insert(d.preview,v) 
            elseif exechack_cc_hvh_obkak.cfg.vars[str.."-"..v] == false and (d.preview[v] == true or d.preview[v] == nil) and table.HasValue(d.preview, v) then
                table.RemoveByValue(d.preview,v)
            elseif d.preview[v] == false then 
                table.RemoveByValue(d.preview,v)
            end
        end

        preview = table.concat(d.preview,", ")

        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[25])
        surface.DrawRect(0,0,w,h)
    
        surface.SetTextColor(exechack_cc_hvh_obkak.Colors[165])
        surface.SetTextPos(8,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText(preview)
    
        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[32])
        surface.DrawRect(w-25,0,25,25)
    
        surface.SetTextColor(exechack_cc_hvh_obkak.Colors[165])
        surface.SetTextPos(w-20,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText("▼")

        surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function d:DoClick()
        local x,y = self:LocalToScreen( 0, self:GetTall() )

        exechack_cc_hvh_obkak.ui.RemovePanel( exechack_cc_hvh_obkak.ui.MultiComboP )

        local ctoh = #choices
    
        exechack_cc_hvh_obkak.ui.MultiComboP = vgui.Create( "ULifeTimeBase" )
        exechack_cc_hvh_obkak.ui.MultiComboP:SetPos( x, y - 1 )
        exechack_cc_hvh_obkak.ui.MultiComboP:SetSize( 243, ctoh * 22 + 2 )
    
        for k, v in pairs(choices) do
            exechack_cc_hvh_obkak.ui.dropdownButton( str, v, exechack_cc_hvh_obkak.ui.MultiComboP, d.preview )
        end
    end
end

function exechack_cc_hvh_obkak.ui.ComboBox( pan, str, cfg, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(exechack_cc_hvh_obkak.Colors[165])

    local dropdown = vgui.Create("UComboBox",pan)
    dropdown:Dock(TOP)
    dropdown:DockMargin(4,1,4,0)
    
    if exechack_cc_hvh_obkak.presets[ cfg ] then
        choices = exechack_cc_hvh_obkak.presets[ cfg ]
    end 
    
    if not choices then choices = {} end
    
    for k, v in ipairs( choices ) do
        dropdown:AddChoice( v )
    end
    
    dropdown:SetSortItems(false)

    if #choices > 0 then
        if exechack_cc_hvh_obkak.cfg.vars[cfg] <= #choices then
            dropdown:ChooseOptionID(exechack_cc_hvh_obkak.cfg.vars[cfg])
        else
            dropdown:ChooseOptionID(1)
        end
    end

    function dropdown:OnSelect(index, value, data)
        exechack_cc_hvh_obkak.cfg.vars[cfg] = index
    end

    return lbl, dropdown
end

function exechack_cc_hvh_obkak.ui.InitMT( p, postCreate )
    p.ItemPanel:Remove()

    p.ItemPanel = vgui.Create( "DPanel", p )
    p.ItemPanel:Dock( FILL )
    p.ItemPanel:DockMargin( 3, 0, 3, 3 )

    p.ItemPanel.Paint = nil

    if postCreate then postCreate( p.ItemPanel ) end
end

function exechack_cc_hvh_obkak.ui.MTButton( p, str, postCreate )
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(str)

    local fw = w + 5

    local tx, ty = fw/2 - w/2, 18 / 2-h / 2 - 1

    local b = p:GetButtonPanel():Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        p.ActiveTab = str
        exechack_cc_hvh_obkak.ui.InitMT( p, postCreate )
    end

    function b:Paint(width,height)
        if p.ActiveTab == str then
            surface.SetTextColor(235,235,235,255)
        else
            surface.SetTextColor(165,165,165,255)
        end
        
        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(str)
    end

    p.ActiveTab = str
    exechack_cc_hvh_obkak.ui.InitMT( p, postCreate )
end

exechack_cc_hvh_obkak.pty = { 5, 5, 5 }
do
    local xt = { 
        [1] = 5,
        [2] = 267,
        [3] = 529
    }

    function exechack_cc_hvh_obkak.itemPanel( str, tbl, h )
        local p = vgui.Create( "UPanel", exechack_cc_hvh_obkak.scrollpanel )
        p:SetPos( xt[tbl], exechack_cc_hvh_obkak.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        exechack_cc_hvh_obkak.pty[ tbl ] = exechack_cc_hvh_obkak.pty[ tbl ] + h + 5

        return p
    end

    function exechack_cc_hvh_obkak.itemPanelB( str, tbl, h, buttonsFunc )
        local p = vgui.Create( "UButtonBarPanel", exechack_cc_hvh_obkak.scrollpanel )
        p:SetPos( xt[tbl], exechack_cc_hvh_obkak.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        if buttonsFunc then buttonsFunc( p ) end

        exechack_cc_hvh_obkak.pty[ tbl ] = exechack_cc_hvh_obkak.pty[ tbl ] + h + 5

        return p
    end

end

/*
    Drag n drop 
*/

exechack_cc_hvh_obkak.espposes = {"Up","Down","Right","Left"}
exechack_cc_hvh_obkak.espelements = {"Name pos","Mark pos","Usergroup pos","Health pos","Armor pos","Money pos","Weapon pos","Team pos","Break LC pos","Simtime pos"}
exechack_cc_hvh_obkak.lastdrag = ""
exechack_cc_hvh_obkak.esppans = {}

exechack_cc_hvh_obkak.esppansposes = {
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
    exechack_cc_hvh_obkak.esppans[i] = {}
end

function exechack_cc_hvh_obkak.DoDrop( self, panels, bDoDrop, Command, x, y )
    if ( bDoDrop ) then
        local newpos = self.pos
        
        for i = 1, #panels do
            local v = panels[i]

            exechack_cc_hvh_obkak.cfg.vars[ v:GetText() ] = newpos
            v:SetParent( self )
        end
    end
end
    
exechack_cc_hvh_obkak.spfuncs = {}

// PANEL CREATION

exechack_cc_hvh_obkak.frame = vgui.Create("UFrame")
exechack_cc_hvh_obkak.scrollpanel = vgui.Create("UScroll",exechack_cc_hvh_obkak.frame)

exechack_cc_hvh_obkak.tabs = {}

// Aimbot

exechack_cc_hvh_obkak.spfuncs[30] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,200)

    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Force seed", "Force seed" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Wait for seed", "Wait for seed" )

    
end

exechack_cc_hvh_obkak.spfuncs[32] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,200)

    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Max simulation time", "Crossbow max simtime", 1, 10, 2 )

end

function exechack_cc_hvh_obkak.tabs.Aimbot()

    local p = exechack_cc_hvh_obkak.itemPanel("Main",1,145):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Enable aimbot", "Enable aimbot", false, false, false, false, false, function( p ) exechack_cc_hvh_obkak.ui.Binder( "Aim on key", p ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Silent aim", "Silent aim" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "pSilent", "pSilent", "Make aim completely invisible." )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Auto fire", "Auto fire", "Automatically fires when targets can be damaged.", false, false, exechack_cc_hvh_obkak.spfuncs[2] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Auto reload", "Auto reload", "Automatically reloads weapon when clip is empty." )

    local p = exechack_cc_hvh_obkak.itemPanel("Legit",1,100):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Aimbot smoothing", "Aimbot smoothing", false, false, false, exechack_cc_hvh_obkak.spfuncs[4] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fov limit", "Fov limit", false, false, false, exechack_cc_hvh_obkak.spfuncs[5] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Triggerbot", "Trigger bot", false, true )

    local p = exechack_cc_hvh_obkak.itemPanel( "Visualisation", 1, 120 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "FOV Circle", "Show FOV", false, false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Snapline", "Aimbot snapline", false, false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Marker", "Aimbot marker", false, false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Knifebot Range", "Knifebot Range" )

    local p = exechack_cc_hvh_obkak.itemPanel( "Accuracy", 2, 80 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Compensate recoil", "Norecoil" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Compensate spread", "Nospread", "Supported HL2, M9K, FAS2, CW2, SWB", false, false, exechack_cc_hvh_obkak.spfuncs[30] )

    local p = exechack_cc_hvh_obkak.itemPanel( "Prediction", 2, 100 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Crossbow prediction", "Crossbow prediction" )
    exechack_cc_hvh_obkak.ui.Slider( p, "Simulation limit", "Simulation limit", 1, 10, 2 )
    --exechack_cc_hvh_obkak.ui.CheckBox( p, "Predict fist", "Predict fist" )

    local p = exechack_cc_hvh_obkak.itemPanel("Knife bot",2,120):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Knife bot", "Knifebot", false, false, false )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Knifebot mode", "Knifebot mode"  )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Facestab", "Facestab" )

    --local p = exechack_cc_hvh_obkak.itemPanel( "Tickbase", 2, 100 ):GetItemPanel()

    --exechack_cc_hvh_obkak.ui.CheckBox( p, "Engine pred", "Engine pred" )
    //exechack_cc_hvh_obkak.ui.Slider( p, "TicksTime", "tickfix_time", 0, 6, 2 )
    --exechack_cc_hvh_obkak.ui.CheckBox( p, "NoPlyLag", "NoAimLag", "Off comp lag" )
    //exechack_cc_hvh_obkak.ui.CheckBox( p, "GetManipulateInterp", "GetManipulateInterp" )
    --exechack_cc_hvh_obkak.ui.CheckBox( p, "LagCompensation", "LagCompensation", "Compensate ping loss" )
    --exechack_cc_hvh_obkak.ui.CheckBox( p, "LerpTime abjust", "LerpTime", "abuse lerptime target" )



    local p = exechack_cc_hvh_obkak.itemPanel( "Target selection", 3, 260 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.ComboBox( p, "Target selection", "Target selection", { "Distance", "FOV" } )
    exechack_cc_hvh_obkak.ui.MultiCombo( p, "Ignores", { "Friends", "Steam friends", "Teammates", "Driver", "Head unhitable", "God time", "Nocliping", "Nodraw", "Frozen", "Bots", "Admins" } )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Wallz", "Wallz" ) 
    exechack_cc_hvh_obkak.ui.Slider( p, "Max targets", "Max targets", 0, 10, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Max distance", "Max distance", 0, 4096, 0 )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Target-Priority-Only", "Target-Priority-Only" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "auto dist for ruselit", "RusEliteDetector" )

    local p = exechack_cc_hvh_obkak.itemPanel( "Hitbox selection", 3, 240 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.ComboBox( p, "Hitbox selection", "Hitbox selection", { "Head", "Chest", "Penis" } )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Hitscan", "Hitscan" ) 
    //exechack_cc_hvh_obkak.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )
    exechack_cc_hvh_obkak.ui.MultiCombo( p, "Hitscan groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Multipoint", "Multipoint" ) 
    exechack_cc_hvh_obkak.ui.MultiCombo( p, "Multipoint groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    exechack_cc_hvh_obkak.ui.Slider( p, "Multipoint scale", "Multipoint scale", 0.5, 1, 1 )
end



exechack_cc_hvh_obkak.spfuncs[22] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,200)

    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Lag limit","Lag limit",1,23,0 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Random min","Lag randomisation",1,23,0 )
    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Lag mode", "Lag mode", {"Static","Adaptive","Hybrid"})
    exechack_cc_hvh_obkak.ui.MultiCombo( exechack_cc_hvh_obkak.ui.SettingsPan, "Fake lag options", {"Disable on ladder","Disable in attack","Randomise","On peek"} )
end

exechack_cc_hvh_obkak.spfuncs[24] = function( p )
   
end

exechack_cc_hvh_obkak.spfuncs[36] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,200)
    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Material", "Antiaim material", exechack_cc_hvh_obkak.chamsMaterials)
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Fullbright", "Antiaim fullbright" )
end

function exechack_cc_hvh_obkak.tabs.Rage()
    local p = exechack_cc_hvh_obkak.itemPanel( "Angles", 1, 245 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Enable Anti-Aim", "Anti aim", false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Inverter", "Inverter", false, true )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Yaw base", "Yaw base" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Yaw", "Yaw" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Pitch", "Pitch" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Edge", "Edge", { "Disabled", "Hide", "Show", "Jitter" } )

    local p = exechack_cc_hvh_obkak.itemPanel( "Tweaks", 1, 140 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "On shot aa", "On shot aa" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Yaw randomisation", "Yaw randomisation" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Freestanding", "Freestanding" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Micromovement", "Micromovement" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Anti BruteForce", "Anti-BruteForce" )

    local p = exechack_cc_hvh_obkak.itemPanel( "Custom angles", 1, 500 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.Slider( p, "Custom real","Custom real", -180, 180, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Custom fake","Custom fake", -180, 180, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Fake switch","Fake switch", -180, 180, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Switch time","Switch time", 0, 10, 1 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Custom pitch","Custom pitch", -360, 360, 0 )    
    exechack_cc_hvh_obkak.ui.Slider( p, "Spin speed","Spin speed", -50, 50, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Min Lby Delta","LBY min delta", 0, 360, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Break Lby Delta","LBY break delta", 0, 360, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Sin delta","Sin delta", -360, 360, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Sin add","Sin add", -180, 180, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Jitter delta","Jitter delta", -180, 180, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Low delta value","Low delta value", -180, 180, 0 )


    local p = exechack_cc_hvh_obkak.itemPanel( "Fake lag",2,120 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fake lag", "Fake lag", false, false, false, exechack_cc_hvh_obkak.spfuncs[22] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fake duck", "Fake duck", false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Mohammad exploit", "Air lag duck" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Jesus exploit", "Jesus lag" )

    local p = exechack_cc_hvh_obkak.itemPanel( "Visualisation", 2,125 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fake angle chams", "Anti aim chams", false, false, false, exechack_cc_hvh_obkak.spfuncs[36], false, function( p ) exechack_cc_hvh_obkak.ui.ColorPicker( "Real chams", p ) end ) 
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Angle arrows", "Angle arrows" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Hitbox", "Hitbox",false,false,true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Indicators", "Indicators" )

    local p = exechack_cc_hvh_obkak.itemPanel( "Animation breaker", 2, 230 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Taunt spam", "Taunt spam" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Taunt", "Taunt", exechack_cc_hvh_obkak.actCommands )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Handjob", "Handjob" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Handjob mode", "Handjob mode", {"Up","Parkinson","Ultra cum"} )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Taunt 2", "Taunt 2" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Taunt 2.1", "Taunt 2.1", exechack_cc_hvh_obkak.act2Commands )

    local p = exechack_cc_hvh_obkak.itemPanel( "Tickbase", 2, 265 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Enable shift", "Tickbase shift", false, true, false, false, function(b) ded.EnableTickbaseShifting(b) end )

    exechack_cc_hvh_obkak.ui.ComboBox( p, "Fakelag comp", "Fakelag comp", {"Disable","Compensate"} )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Warp on peek", "Warp on peek" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Double tap", "Double tap" )
    //exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Passive recharge", "Passive recharge" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Dodge projectiles", "Dodge projectiles" )
    //exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Wait for charge", "Wait for charge", false, false, false, false, function(b) ded.WaitForCharge(b) end ) 
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Auto recharge", "Auto recharge", false, true ) 
    
    exechack_cc_hvh_obkak.ui.Slider( p, "Shift ticks", "Shift ticks", 1, 99, 0, function( val ) ded.SetMinShift(val) end )
    exechack_cc_hvh_obkak.ui.Slider( p, "Charge ticks", "Charge ticks", 1, 99, 0, function( val ) ded.SetMaxShift(val) end )

    local p = exechack_cc_hvh_obkak.itemPanel( "Sequence", 2, 175 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Sequence manip", "Sequence manip", false, true )
    exechack_cc_hvh_obkak.ui.Slider( p, "Out Sequence", "OutSequence", 1, 128, 0 )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Randomise", "Sequence min random" )
    exechack_cc_hvh_obkak.ui.Slider( p, "Min sequence", "Sequence min", 1, 128, 0 )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Animation freezer", "Animation freezer", false, true )

    local p = exechack_cc_hvh_obkak.itemPanel( "Player adjustments", 3, 160 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Interpolation", "Disable interpolation", false, false, false, false, function( bval ) ded.SetInterpolation( bval ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Sequence interpolation", "Disable Sequence interpolation", false, false, false, false, function( bval ) ded.SetSequenceInterpolation( bval ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Invalidate activity", "Invalidate activity" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fix bones", "Bone fix", false, false, false, false, function( bval ) ded.EnableBoneFix( bval ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fix animations", "Update Client Anim fix", false, false, false, false, function( bval ) ded.EnableAnimFix( bval ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Extrapolation", "Extrapolation" )
    --exechack_cc_hvh_obkak.ui.CheckBox( p, "Lag fix" , "Lag fix", false, false, false, exechack_cc_hvh_obkak.spfuncs[254] )

    local p = exechack_cc_hvh_obkak.itemPanel( "Resolver | Fixed", 3, 120 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Resolver", "Resolver" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Pitch resolver", "Pitch resolver" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Taunt resolver", "Taunt resolver" )
    --exechack_cc_hvh_obkak.ui.CheckBox( p, "Memory bullets", "Memory bullets" )    
    --exechack_cc_hvh_obkak.ui.Slider( p, "Resolver max misses", "Resolver max misses", 0, 10, 0 )
    --exechack_cc_hvh_obkak.ui.Slider( p, "add delta", "add delta", -180, 180, 0 )
    --exechack_cc_hvh_obkak.ui.Slider( p, "add pitch", "add pitch", -90, 90, 0 )

    local p = exechack_cc_hvh_obkak.itemPanel( "Position adjustment", 3, 215 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Adjust tickcount", "Adjust tickcount" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Backtrack", "Backtrack" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Backtrack mode", "Backtrack mode", { "Last ticks", "Closest", "Scan" } ) // , "Backshoot"
    exechack_cc_hvh_obkak.ui.Slider( p, "Sampling interval", "Sampling interval", 0, 200, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Backtrack time", "Backtrack time", 0, 1000, 0 )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Always backtrack", "Always backtrack" )

    local p = exechack_cc_hvh_obkak.itemPanel( "Misc", 3, 120 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Auto detonator", "Auto detonator" )
    exechack_cc_hvh_obkak.ui.Slider( p, "Detonation distance", "AutoD distance", 16, 128, 0 )
    

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Gun switch", "Gun switch" )
   
end

exechack_cc_hvh_obkak.spfuncs[2] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,100)
        
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize( 300, 350 )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Rapid fire", "Rapid fire", "Allows to quickly fire semi-automatic weapons." )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Bullet time", "Bullet time", "Aim will not work until weapon can fire." )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Wait for simulation", "Wait for simulation" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Alt Rapid fire", "Alt Rapid fire" )
end

exechack_cc_hvh_obkak.spfuncs[4] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize( 250, 85 )

    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Smooth amount", "Smoothing", 0, 1, 2 )
end

exechack_cc_hvh_obkak.spfuncs[5] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize( 250, 68 )

    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Dynamic fov", "Fov dynamic" )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Aimbot FOV", "Aimbot FOV", 0, 180, 0 )
end

exechack_cc_hvh_obkak.spfuncs[11] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,200)
    
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Team color", "Box team color" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Gradient", "Box gradient" )
    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Style", "Box style", { "Default", "Corner", "Hex", "Poly", "3D" })


end

exechack_cc_hvh_obkak.spfuncs[12] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,48)
    
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Health bar", "Health bar" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Gradient", "Health bar gradient" )
end

exechack_cc_hvh_obkak.spfuncs[666] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,48)
    
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Armor bar", "Armor bar" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Gradient", "Armor bar gradient" )
end

exechack_cc_hvh_obkak.spfuncs[254] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,200)
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Backshoot", "Backshoot" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Fakelag comp new", "Fakelag comp new" )

end

exechack_cc_hvh_obkak.spfuncs[14] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)
    
    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Visible material", "Visible mat", exechack_cc_hvh_obkak.chamsMaterials)
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Weapon chams", "Visible chams w" )

    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Invisible material", "inVisible mat", exechack_cc_hvh_obkak.chamsMaterials)
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "inVisible chams", "inVisible chams" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Weapon chams", "inVisible chams w" )

    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Fullbright", "Supress lighting" )
end

exechack_cc_hvh_obkak.spfuncs[229] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,360)
    
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Brightness","Color Modify Brightness", 0, 3, 4 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Contrast","Color Modify Contrast", 0, 5, 4 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Saturation","Color Modify Saturation", 0, 5, 4 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Add red","Color Modify Add Red", 0, 10, 4 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Add green","Color Modify Add Green", 0, 10, 4 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Add blue","Color Modify Add Blue", 0, 10, 4 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Mul red","Color Modify Mul Red", 0, 255, 4 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Mul green","Color Modify Mul Green", 0, 255, 4 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Mul blue","Color Modify Mul Blue", 0, 255, 4 )
end

exechack_cc_hvh_obkak.spfuncs[15] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Material", "Self mat", exechack_cc_hvh_obkak.chamsMaterials)
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Weapon chams", "Self chams w" )

    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Fullbright", "Supress self lighting" )
end

exechack_cc_hvh_obkak.spfuncs[16] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Material", "Backtrack material", exechack_cc_hvh_obkak.chamsMaterials)

    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Fullbright", "Backtrack fullbright" )
end

exechack_cc_hvh_obkak.spfuncs[17] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Material", "Entity material", exechack_cc_hvh_obkak.chamsMaterials)

    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Fullbright", "Entity fullbright" )
end

exechack_cc_hvh_obkak.spfuncs[18] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Die time","Tracers die time",1,10,0 )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Bullet tracers muzzle", "Bullet tracers muzzle" )
    
end

exechack_cc_hvh_obkak.spfuncs[19] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Material", "Viewmodel chams type", exechack_cc_hvh_obkak.chamsMaterials)
    
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Fullbright", "Fullbright viewmodel" )
end

exechack_cc_hvh_obkak.spfuncs[20] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Smoothing", "Third person smoothing" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Collision", "Third person collision" )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Distance","Third person distance",50,220,0 )
end

exechack_cc_hvh_obkak.spfuncs[21] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Freecam speed","Free camera speed",5,100,0 )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Ghetto mode", "Ghetto free cam" )
end

exechack_cc_hvh_obkak.spfuncs[31] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,48)

    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Style", "Ent box style", { "Default", "Corner", "3D" })
end


exechack_cc_hvh_obkak.spfuncs[35] = function( p )
    local mdl = vgui.Create( "DModelPanel", p )
    mdl:SetPos(85,125)
    mdl:SetSize(85,125)
    mdl:SetModel( "models/props_vehicles/truck001a.mdl" ) 

    mdl:SetCamPos(Vector(0,0,148))

    function mdl:LayoutEntity( Entity ) return end 
    
    for i = 1,4 do
        local poses = exechack_cc_hvh_obkak.esppansposes

        exechack_cc_hvh_obkak.esppans[i].panel = vgui.Create( "UPaintedPanel", p )
        exechack_cc_hvh_obkak.esppans[i].panel:SetPos(poses[i].x,poses[i].y)
        exechack_cc_hvh_obkak.esppans[i].panel:SetSize(85,125)
        exechack_cc_hvh_obkak.esppans[i].panel:Receiver( "SwagCock$", exechack_cc_hvh_obkak.DoDrop )
        exechack_cc_hvh_obkak.esppans[i].panel.pos = i
    end

    for i = 1, #exechack_cc_hvh_obkak.espelements do
        local cfgstr = exechack_cc_hvh_obkak.espelements[i]
        local panel = exechack_cc_hvh_obkak.esppans[exechack_cc_hvh_obkak.cfg.vars[cfgstr]].panel

        local b = vgui.Create("UESPPButton")
        b:SetText( cfgstr )
		b:SetSize( 36, 24 )
		b:Dock( TOP )
        b:Droppable( "SwagCock$" ) 

        b:SetParent( panel )
    end
end

exechack_cc_hvh_obkak.spfuncs[33] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Show ammo", "Show ammo" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Print name", "Weapon printname" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Show reloading", "Show reloading" )
    
end

exechack_cc_hvh_obkak.spfuncs[34] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)


end

function exechack_cc_hvh_obkak.tabs.Visuals()

    local p = exechack_cc_hvh_obkak.itemPanel("Player",1,440):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Box", "Box esp", false, false, true, exechack_cc_hvh_obkak.spfuncs[11] )

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Name", "Name", false, false, false, false, false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Name pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Mark", "Mark", false, false, false, false, false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Mark pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Usergroup", "Usergroup", false, false, false, false, false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Usergroup pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Health", "Health", false, false, true, exechack_cc_hvh_obkak.spfuncs[12], false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Health pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) exechack_cc_hvh_obkak.ui.ColorPicker( "Health bar gradient", p ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Armor", "Armor", false, false, true, exechack_cc_hvh_obkak.spfuncs[666], false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Armor pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) exechack_cc_hvh_obkak.ui.ColorPicker( "Armor bar gradient", p ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Weapon", "Weapon", false, false, false, exechack_cc_hvh_obkak.spfuncs[33], false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Weapon pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Team", "Team", false, false, false, false, false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Team pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Money", "DarkRP Money", false, false, false, false, false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Money pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Lag compensation", "Break LC", false, false, false, false, false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Break LC pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Packets ( Fake lag )", "Simtime updated", false, false, false, false, false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "Simtime pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "FakeLag Show", "FakeLag Show", false, false, true, false, false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "FakeLag Show pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Show records", "Show records" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Skeleton", "Skeleton" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Sight lines", "Sight lines" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Player Hat", "Player Hat","Detect Screengrab" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, false, false, function(p)
        local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) 
        lbl:Remove() 
        drop:Dock(RIGHT) 
        drop:DockMargin(0,0,0,0) 
    end )
    // exechack_cc_hvh_obkak.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, exechack_cc_hvh_obkak.spfuncs[34], false, function(p) local lbl, drop = exechack_cc_hvh_obkak.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )

    exechack_cc_hvh_obkak.ui.Slider( p, "Max distance","ESP Distance", 0, 20000,0 )

    exechack_cc_hvh_obkak.ui.Label( p, "Add player key", function( p ) exechack_cc_hvh_obkak.ui.Binder( "Player add", p ) end )

    local p = exechack_cc_hvh_obkak.itemPanel("Entity",1,135):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Box", "Ent box", false, false, false, exechack_cc_hvh_obkak.spfuncs[31] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Class", "Ent class" )
    exechack_cc_hvh_obkak.ui.Slider( p, "Max distance","Ent ESP Distance",0, 20000,0 )
    exechack_cc_hvh_obkak.ui.Label( p, "Add entity key", function( p ) exechack_cc_hvh_obkak.ui.Binder( "Ent add", p ) end )

    local p = exechack_cc_hvh_obkak.itemPanel( "Misc", 1, 190 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Hide name", "Hide name" )
    exechack_cc_hvh_obkak.ui.TextEntry( "Custom name", "Custom name", p, 999 )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Disable sensivity adjustment", "Disable sensivity adjustment" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Screengrab image", "Screengrab image" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "ESP Font", "ESP Font", { "Outlined", "Shadow" } )
    
    local p = exechack_cc_hvh_obkak.itemPanel("Colored models",2,150):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Player chams", "Visible chams", false, false, true, exechack_cc_hvh_obkak.spfuncs[14], false, function(p) exechack_cc_hvh_obkak.ui.ColorPicker( "inVisible chams", p ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Self chams", "Self chams", false, false, true, exechack_cc_hvh_obkak.spfuncs[15] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Backtrack chams", "Backtrack chams", false, false, true, exechack_cc_hvh_obkak.spfuncs[16] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Entity chams", "Entity chams", false, false, true, exechack_cc_hvh_obkak.spfuncs[17], false )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Viewmodel chams", "Viewmodel chams", false, false, true, exechack_cc_hvh_obkak.spfuncs[19], false )

    local p = exechack_cc_hvh_obkak.itemPanel("Material customisation",2,150):GetItemPanel()

    exechack_cc_hvh_obkak.ui.Slider( p, "Min illumination", "Fresnel minimum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = exechack_cc_hvh_obkak.chamMats.vis[3], exechack_cc_hvh_obkak.chamMats.vis[4], exechack_cc_hvh_obkak.chamMats.invis[3], exechack_cc_hvh_obkak.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"], exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"], exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"], exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"], exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] ) )
    end )
    
    exechack_cc_hvh_obkak.ui.Slider( p, "Max illumination", "Fresnel maximum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = exechack_cc_hvh_obkak.chamMats.vis[3], exechack_cc_hvh_obkak.chamMats.vis[4], exechack_cc_hvh_obkak.chamMats.invis[3], exechack_cc_hvh_obkak.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"], v, exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"], v, exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"], v, exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"], v, exechack_cc_hvh_obkak.cfg.vars["Fresnel exponent"] ) )
    end )
 
    exechack_cc_hvh_obkak.ui.Slider( p, "Fresnel exponent", "Fresnel exponent", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = exechack_cc_hvh_obkak.chamMats.vis[3], exechack_cc_hvh_obkak.chamMats.vis[4], exechack_cc_hvh_obkak.chamMats.invis[3], exechack_cc_hvh_obkak.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"], exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"], v ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"], exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"], v ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"], exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"], v ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( exechack_cc_hvh_obkak.cfg.vars["Fresnel minimum illum"], exechack_cc_hvh_obkak.cfg.vars["Fresnel maximum illum"], v ) )
    end )

    local p = exechack_cc_hvh_obkak.itemPanel("Outlines",2,115):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Player outline", "Player outline", false, false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Entity outline", "Entity outline", false, false, true )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Style", "Outline style", { "Default", "Subtractive", "Additive" } )

    local p = exechack_cc_hvh_obkak.itemPanel( "Indicators", 2, 160 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Hitmarker", "Hitmarker", false, false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Hitnumbers", "Hitnumbers", false, false, true, false, false, function(p) exechack_cc_hvh_obkak.ui.ColorPicker( "Hitnumbers krit", p ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Headshot indicator", "Headshot indicator", false, false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "On screen logs", "On screen logs", false, false, true, false, false, function(p) exechack_cc_hvh_obkak.ui.ColorPicker( "Miss lagcomp", p ) exechack_cc_hvh_obkak.ui.ColorPicker( "Miss spread", p ) exechack_cc_hvh_obkak.ui.ColorPicker( "Miss fail", p ) end )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "WaterMark", "WaterMark")
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Spectator list", "Spectator list" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Tickbase", "Tickbase indicator" )

    local p = exechack_cc_hvh_obkak.itemPanel("World",3,400):GetItemPanel()

    exechack_cc_hvh_obkak.ui.TextEntry( "Skybox texture", "Custom sky", p, 420 )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Sky color", "Sky color", false, false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Wall color", "Wall color", false, false, true )

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fullbright", "Fullbright", false, true )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Mode", "Fullbright mode", { "Default", "Corvus extreme" } )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Disable shadows", "Disable shadows" )

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fog changer", "FogChanger", false, false, true )
    exechack_cc_hvh_obkak.ui.Slider( p, "Fog start","FogStart", 1, 4200, 0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Fog end","FogEnd", 1, 9000, 0 )

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Color modify", "Color Modify", false, false, false, exechack_cc_hvh_obkak.spfuncs[229] )

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Bullet tracers", "Bullet tracers", false, false, true, exechack_cc_hvh_obkak.spfuncs[18] )
    exechack_cc_hvh_obkak.ui.TextEntry( "Material", "Bullet tracers material", p, 420 )


    local p = exechack_cc_hvh_obkak.itemPanel("View",3,215):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Override view", "Override view" )

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Third person", "Third person", false, true, false, exechack_cc_hvh_obkak.spfuncs[20] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Free camera", "Free camera", false, true, false, exechack_cc_hvh_obkak.spfuncs[21] )

    exechack_cc_hvh_obkak.ui.Slider( p, "Fov override","Fov override",75,160,0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Viewmodel fov","Viewmodel fov",50,180,0 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Aspect ratio","Aspect ratio",0,2,3,function(val) RunConsoleCommand("r_aspectratio",val) end )


   



    





    

    





    
    /*





    exechack_cc_hvh_obkak.checkbox("Kill sound","Killsound",p:GetItemPanel())
    

    local p = exechack_cc_hvh_obkak.itemPanel("World",2,123)

    

    local p = exechack_cc_hvh_obkak.itemPanel("Effects",2,142)


    
    

    local p = exechack_cc_hvh_obkak.itemPanel("View",3,275)




    // exechack_cc_hvh_obkak.ESPPP:Show()
*/
end

exechack_cc_hvh_obkak.spfuncs[25] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.ComboBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Strafe mode", "Strafe mode", {"Legit","Rage","Multidir"})
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Ground strafer", "Ground strafer" )
    exechack_cc_hvh_obkak.ui.CheckBox( exechack_cc_hvh_obkak.ui.SettingsPan, "Sin ( snake ) strafe", "Z Hop", false, true )
end

exechack_cc_hvh_obkak.spfuncs[26] = function()
    exechack_cc_hvh_obkak.ui.SettingsPan:SetSize(250,256)

    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Predict ticks", "CStrafe ticks", 16, 128, 0 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Angle step", "CStrafe angle step", 1, 10, 0 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Angle max step", "CStrafe angle max step", 5, 50, 0 )
    exechack_cc_hvh_obkak.ui.Slider( exechack_cc_hvh_obkak.ui.SettingsPan, "Ground diff", "CStrafe ground diff", 1, 65, 0 )
end

exechack_cc_hvh_obkak.spfuncs[27] = function( p )
    exechack_cc_hvh_obkak.ui.TextEntry( "Name", "Name Convar", p, 250 )
    exechack_cc_hvh_obkak.ui.Button( "Change name", function() ded.NetSetConVar("name",exechack_cc_hvh_obkak.cfg.vars["Name Convar"]) end, p )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Name stealer", "Name stealer" )

    exechack_cc_hvh_obkak.ui.TextEntry( "Disconnect reason", "Disconnect reason", p, 250 )
    exechack_cc_hvh_obkak.ui.Button( "Disconnect", function() ded.NetDisconnect(exechack_cc_hvh_obkak.cfg.vars["Disconnect reason"]) end, p )
end 

function exechack_cc_hvh_obkak.CustomCvarVal( net )
    local m = net == 1 and "Net Convar mode" or "Cvar mode"
    local n = net == 1 and "Net Convar int" or "Cvar int"
    local s = net == 1 and "Net Convar str" or "Cvar str"

    local mode = exechack_cc_hvh_obkak.cfg.vars[m] 
    local num = exechack_cc_hvh_obkak.cfg.vars[n]
    local set = mode == 2 and math.Round( num ) or num

    if mode == 1 then set = exechack_cc_hvh_obkak.cfg.vars[s] end

    return set
end

exechack_cc_hvh_obkak.spfuncs[28] = function( p )
    exechack_cc_hvh_obkak.ui.TextEntry( "Cvar name", "Net Convar", p, 250 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Cvar int", "Net Convar int", 1, 100, 2 )
    exechack_cc_hvh_obkak.ui.TextEntry( "Cvar str", "Net Convar str", p, 250 )

    exechack_cc_hvh_obkak.ui.ComboBox( p, "Set mode", "Net Convar mode", {"String","Int","Float"})

    exechack_cc_hvh_obkak.ui.Button( "Send new val", function() ded.NetSetConVar( exechack_cc_hvh_obkak.cfg.vars["Net Convar"] ,exechack_cc_hvh_obkak.CustomCvarVal( 1 ) ) end, p )
end 

exechack_cc_hvh_obkak.FCVAR = {
    str = {
        "Archive", "Archive XBOX", "Cheat", "Client can execute", "Client DLL", "Demo", "Dont record",
        "Game DLL", "Lua client", "Lua server", "Never as string", "None", "Notify", "Not connected",
        "Printable only", "Protected", "Replicated", "Server cannot query", "Server can execute",
        "Sponly", "Unlogged", "Unregistered", "Userinfo"
    },
    int = {
        128, 16777216, 16384, 1073741824, 8, 65536, 131072, 4, 262144, 524288, 4096, 0, 256, 4194304,
        1024, 32, 8192, 536870912, 268435456, 64, 2048, 1, 512
    }
}

exechack_cc_hvh_obkak.spfuncs[29] = function( p )
    exechack_cc_hvh_obkak.ui.TextEntry( "Enter cvar name", "Cvar name", p, 500 )
    exechack_cc_hvh_obkak.ui.Slider( p, "Custom number", "Cvar int", 1, 1000, 2 )
    exechack_cc_hvh_obkak.ui.TextEntry( "Custom string", "Cvar str", p, 500 )

    exechack_cc_hvh_obkak.ui.ComboBox( p, "Cvar mode", "Cvar mode", {"String","Int","Float"})
    
    exechack_cc_hvh_obkak.ui.Button( "Change cvar", function()
        local s = exechack_cc_hvh_obkak.CustomCvarVal( 0 )
        local n = exechack_cc_hvh_obkak.cfg.vars["Cvar name"]
        
        local flag = GetConVar(n):GetFlags()

        ded.ConVarSetFlags( n, 0 )

        RunConsoleCommand( n, s )

        ded.ConVarSetFlags( n, flag )
    end, p )

    exechack_cc_hvh_obkak.ui.ComboBox( p, "Cvar flag", "Cvar flag", exechack_cc_hvh_obkak.FCVAR.str)

    exechack_cc_hvh_obkak.ui.Button( "Change flag", function()
        ded.ConVarSetFlags( exechack_cc_hvh_obkak.cfg.vars["Cvar name"], exechack_cc_hvh_obkak.FCVAR.int[ exechack_cc_hvh_obkak.cfg.vars["Cvar flag"] ] )
        print( exechack_cc_hvh_obkak.cfg.vars["Cvar name"], exechack_cc_hvh_obkak.FCVAR.int[ exechack_cc_hvh_obkak.cfg.vars["Cvar flag"] ] )
    end, p )

end 

function exechack_cc_hvh_obkak.tabs.Misc()

    local function func( p )
        exechack_cc_hvh_obkak.ui.MTButton( p, "Cvar", exechack_cc_hvh_obkak.spfuncs[29] )
        exechack_cc_hvh_obkak.ui.MTButton( p, "Net cvar", exechack_cc_hvh_obkak.spfuncs[28] )
        exechack_cc_hvh_obkak.ui.MTButton( p, "Net", exechack_cc_hvh_obkak.spfuncs[27] )
    end

    local p = exechack_cc_hvh_obkak.itemPanel("Movement",1,205):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Bunny hop", "Bhop" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Air strafer", "Air strafer", false, false, false, exechack_cc_hvh_obkak.spfuncs[25] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Circle strafe", "Circle strafe", false, true, false, exechack_cc_hvh_obkak.spfuncs[26] )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Keep sprint", "Sprint" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fast stop", "Fast stop" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Auto peak", "Auto peak", false, true )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Auto teleport back", "Auto peak tp" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Water walk", "Water jump" )

    local p = exechack_cc_hvh_obkak.itemPanel("Key spam",1,165):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Use spam", "Use spam" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Flashlight spam", "Flashlight spam" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Auto GTA", "Auto GTA" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Camera spam", "Camera spam" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Vape spam", "Vape spam" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Retry on handcuff", "Retry on handcuff" )

    local p = exechack_cc_hvh_obkak.itemPanel( "Sounds", 2, 200 ):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Hitsound", "Hitsound" )
    exechack_cc_hvh_obkak.ui.TextEntry( "Sound path", "Hitsound str", p, 420 )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Killsound", "Killsound" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Killstreak", "Killstreak" )
    exechack_cc_hvh_obkak.ui.TextEntry( "Sound path", "Killsound str", p, 420 )

    local p = exechack_cc_hvh_obkak.itemPanel("Chat",2,282):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Spammer", "Chat spammer" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Mode", "Chat mode", { "хвх деды", "кадилак", "cute femboy", "хвх", "pm", "ad cheat", "pm cheat", "hvh ad", "pm hvh" })
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Group", "Chat group", { "Default", "OOC", "Advert", "PM", "ULX" })
    exechack_cc_hvh_obkak.ui.Slider( p, "Delay", "Chat delay", 0,20,0 )
    
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Killsay", "Killsay" )
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Mode", "Killsay mode", { "хвх деды", "кадилак", "cute femboy", "хвх", "pm", "ad cheat", "pm cheat", "hvh ad", "pm hvh" })
    exechack_cc_hvh_obkak.ui.ComboBox( p, "Group", "Killsay group", { "Default", "OOC", "Advert", "PM", "ULX" })

    exechack_cc_hvh_obkak.itemPanelB( "Net / Cvar", 3, 310, func )

    local p = exechack_cc_hvh_obkak.itemPanel("Memes",3,150):GetItemPanel()

    exechack_cc_hvh_obkak.ui.CheckBox( p, "Follow Player", "Ghost follower" )
    exechack_cc_hvh_obkak.ui.TextEntry( "Steam ID", "GFID", p, 500 )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Auto Затяг ( Vape )", "Auto Vape" )
    exechack_cc_hvh_obkak.ui.CheckBox( p, "Fast lockpick", "Fast lockpick" )

   /*
        exechack_cc_hvh_obkak.checkbox("Safe hop","Safe hop",p:GetItemPanel())
        exechack_cc_hvh_obkak.checkbox("Edge jump","Edge jump",p:GetItemPanel())
        exechack_cc_hvh_obkak.checkbox("Air duck","Air duck",p:GetItemPanel())
    */
end

/*
function exechack_cc_hvh_obkak.updateMenuColor( col )
    local r, g, b = col.r, col.g, col.b 

    for i = 1,255 do 
        exechack_cc_hvh_obkak.Colors[i] = Color( i + r, i + g, i + b, 255 )
    end
end
*/



function exechack_cc_hvh_obkak.tabs.Config()
    local p = exechack_cc_hvh_obkak.itemPanel("Settings",1,270):GetItemPanel()

    exechack_cc_hvh_obkak.ui.ComboBox( p, "Choice", "Selected config", exechack_cc_hvh_obkak.cfgTable)

    exechack_cc_hvh_obkak.ui.Button( "Load", function() exechack_cc_hvh_obkak.LoadConfig() end, p )
    exechack_cc_hvh_obkak.ui.Button( "Save", function() exechack_cc_hvh_obkak.SaveConfig() end, p )
    exechack_cc_hvh_obkak.ui.Button( "Delete", function() exechack_cc_hvh_obkak.DeleteConfig() end, p )

    exechack_cc_hvh_obkak.ui.TextEntry( "Name", "Config name", p, 64 )
    exechack_cc_hvh_obkak.ui.Button( "Create", function() exechack_cc_hvh_obkak.CreateConfig() end, p )

end

function exechack_cc_hvh_obkak.tabs.Players()
    local playerlist = player.GetAll()


    for i = 1, #playerlist do
        local pEntity = playerlist[i]
        local pButton = vgui.Create("Panel", exechack_cc_hvh_obkak.scrollpanel)
        pButton:SetTall(25)
        pButton:Dock(TOP)

        function pButton:Paint(w, h)
            if not IsValid(pEntity) then self:Remove() return end
            local steamId = pEntity:SteamID()
            
            local isPriority = exechack_cc_hvh_obkak.cfg.priorityList and exechack_cc_hvh_obkak.cfg.priorityList[steamId]
            local isFriend = exechack_cc_hvh_obkak.cfg.friends and exechack_cc_hvh_obkak.cfg.friends[steamId]
            
            if isPriority then
                surface.SetDrawColor(50, 0, 0, 100) 
                surface.DrawRect(0, 0, w, h)
            end
            
            surface.SetFont("DermaSmall")
            
            local nameColor = Color(255, 255, 255) 
            if isPriority then
                nameColor = Color(255, 50, 50) 
            elseif isFriend then
                nameColor = Color(0, 255, 0) 
            end

            local nameStartX = 10

            surface.SetTextColor(nameColor.r, nameColor.g, nameColor.b)
            surface.SetTextPos(nameStartX, 5)
            surface.DrawText(pEntity:Name())
            
            local nameWidth = surface.GetTextSize(pEntity:Name())
            local indicatorX = nameStartX + nameWidth + 5

            if isPriority then
                surface.SetTextColor(255, 100, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[Piority]")
                indicatorX = indicatorX + surface.GetTextSize("[Piority]") + 3
            end

            if isFriend then
                surface.SetTextColor(0, 255, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[Friend]")
            end
            
            local teamIndex, teamName, teamColor = exechack_cc_hvh_obkak.GetTeam(pEntity)
            local textWidth, textHeight = surface.GetTextSize(teamName)
            surface.SetTextColor(teamColor)
            surface.SetTextPos(w / 2 - textWidth / 2, 5)
            surface.DrawText(teamName)
            
            local userGroup = exechack_cc_hvh_obkak.GetUserGroup(pEntity)
            local textWidth, textHeight = surface.GetTextSize(userGroup)
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(w - textWidth - 5, 5)
            surface.DrawText(userGroup)
            
            surface.SetDrawColor(45, 45, 45)
            surface.DrawRect(0, h - 1, w, 1)
        end

        function pButton:OnMousePressed(mouseCode)
            if not IsValid(pEntity) then self:Remove() return end

            local steamId = pEntity:SteamID()

            if mouseCode == MOUSE_LEFT then
                exechack_cc_hvh_obkak.cfg.friends[steamId] = not exechack_cc_hvh_obkak.cfg.friends[steamId]
            elseif mouseCode == MOUSE_RIGHT then
                exechack_cc_hvh_obkak.cfg.priorityList[steamId] = not exechack_cc_hvh_obkak.cfg.priorityList[steamId]
            end
        end
    end
end


function exechack_cc_hvh_obkak.tabs.Entities()
    local entitylist = ents.GetAll()
    local classes = {}

    for i = 1, #entitylist do
        local pEntity = entitylist[ i ]

        local class = pEntity:GetClass()
        
        if class == "player" then continue end

        if not classes[class] then
            classes[class] = true
        else
            continue
        end

        local pButton = vgui.Create( "Panel", exechack_cc_hvh_obkak.scrollpanel )
        pButton:SetTall( 25 )
        pButton:Dock( TOP )

        function pButton:Paint( w, h )
            if not IsValid(pEntity) then self:Remove() return end

            local class = pEntity:GetClass()

            surface.SetFont( "DermaSmall" )

            if ( exechack_cc_hvh_obkak.cfg.ents[ class ] ) then
                surface.SetTextColor( 0, 255, 0 )
            else
                surface.SetTextColor( 255, 255, 255 )
            end

            surface.SetTextPos( 10, 5 )
            surface.DrawText( class )

            surface.SetDrawColor( 45, 45, 45 )
            surface.DrawRect( 0, h - 1, w, 1 )
        end

        function pButton:OnMousePressed( mouseCode )
            if not IsValid(pEntity) then self:Remove() return end

            if ( mouseCode == MOUSE_LEFT ) then
                local class = pEntity:GetClass()

                if not exechack_cc_hvh_obkak.cfg.ents[ class ] then
                    exechack_cc_hvh_obkak.cfg.ents[ class ] = true
                else
                    exechack_cc_hvh_obkak.cfg.ents[ class ] = nil
                end
            end
        end
    end
end

function exechack_cc_hvh_obkak.tabs.resolver()

local p = exechack_cc_hvh_obkak.itemPanel("resolver",1,185):GetItemPanel()


end

function exechack_cc_hvh_obkak.SetUltimateMode(mode)
    exechack_cc_hvh_obkak.cfg.vars["Russian Ultimate"] = false
    exechack_cc_hvh_obkak.cfg.vars["Ukrainian Ultimate"] = false
    exechack_cc_hvh_obkak.cfg.vars["Navalny Ultimate"] = false
    exechack_cc_hvh_obkak.cfg.vars["Tesak Ultimate"] = false
    
    if exechack_cc_hvh_obkak.musicChannel then
        exechack_cc_hvh_obkak.musicChannel:Stop()
        exechack_cc_hvh_obkak.musicChannel = nil
    end
    
    exechack_cc_hvh_obkak.backgroundImage = nil
    exechack_cc_hvh_obkak.backgroundMaterial = nil
    exechack_cc_hvh_obkak.backgroundType = nil
    exechack_cc_hvh_obkak.currentTitle = exechack_cc_hvh_obkak.originalTitle
    
    if mode == "Russian" then
        exechack_cc_hvh_obkak.cfg.vars["Russian Ultimate"] = true
        exechack_cc_hvh_obkak.currentTitle = "Russian.Hack | Putin Edition"
        
        exechack_cc_hvh_obkak.backgroundType = "russian_flag"
        
        sound.PlayURL("https://millionskazok.ru/audiofile/a/vpered-rossiya.mp3", "noplay", function(station, errCode, errStr)
            if IsValid(station) then
                exechack_cc_hvh_obkak.musicChannel = station
                station:SetVolume(0.3)
                station:Play()
            end
        end)
    elseif mode == "Ukrainian" then
        exechack_cc_hvh_obkak.cfg.vars["Ukrainian Ultimate"] = true
        exechack_cc_hvh_obkak.currentTitle = "Bandera Hack | Zelensky Edition"
        
        exechack_cc_hvh_obkak.backgroundType = "ukrainian_flag"
        
        sound.PlayURL("https://rus.hitmotop.com/get/music/20250820/Masha_Kondratenko_-_Vanka-Vstanka_79508324.mp3", "noplay", function(station, errCode, errStr)
            if IsValid(station) then
                exechack_cc_hvh_obkak.musicChannel = station
                station:SetVolume(0.3)
                station:Play()
            end
        end)
    elseif mode == "Navalny" then
        exechack_cc_hvh_obkak.cfg.vars["Navalny Ultimate"] = true
        exechack_cc_hvh_obkak.currentTitle = "Navalny Hack | Z Edition"
        
        http.Fetch("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ2SP8RAgnSAm3RBJVyPHcp9P2X9XY70kt5Q&s", function(body, len, headers, code)
            if code == 200 then
                file.Write("exechack_cc_hvh_obkak_navalny.jpg", body)
                exechack_cc_hvh_obkak.backgroundMaterial = Material("../data/exechack_cc_hvh_obkak_navalny.jpg", "noclamp smooth")
            end
        end)
    elseif mode == "Tesak" then
        exechack_cc_hvh_obkak.cfg.vars["Tesak Ultimate"] = true
        exechack_cc_hvh_obkak.currentTitle = "1488 ULTIMATE | Ультраправая Edition"
        
        http.Fetch("https://i.ytimg.com/vi/l9pgC2oqZQM/sddefault.jpg?sqp=-oaymwEmCIAFEOAD8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gNCguMA8=&rs=AOn4CLAQJwDbnCRHbC0eWfEZFLflIoF82g", function(body, len, headers, code)
            if code == 200 then
                file.Write("exechack_cc_hvh_obkak_tesak.jpg", body)
                exechack_cc_hvh_obkak.backgroundMaterial = Material("../data/exechack_cc_hvh_obkak_tesak.jpg", "noclamp smooth")
            end
        end)
        exechack_cc_hvh_obkak.InitTesakParticles()
    end
end

function exechack_cc_hvh_obkak.InitTesakParticles()
    exechack_cc_hvh_obkak.tesakParticles = {}
    for i = 1, exechack_cc_hvh_obkak.particleCount do
        table.insert(exechack_cc_hvh_obkak.tesakParticles, {
            x = math.random(0, 800),
            y = math.random(0, 500),
            vx = math.random(-50, 50),
            vy = math.random(-50, 50),
            life = math.random(3, 6),
            maxLife = math.random(3, 6),
            size = math.random(12, 18)
        })
    end
end

function exechack_cc_hvh_obkak.UpdateTesakParticles()
    if not exechack_cc_hvh_obkak.cfg.vars["Tesak Ultimate"] then return end
    
    for i = #exechack_cc_hvh_obkak.tesakParticles, 1, -1 do
        local particle = exechack_cc_hvh_obkak.tesakParticles[i]
        
        particle.x = particle.x + particle.vx * FrameTime()
        particle.y = particle.y + particle.vy * FrameTime()
        particle.life = particle.life - FrameTime()
        
        if particle.life <= 0 or particle.x < -50 or particle.x > 850 or particle.y < -50 or particle.y > 550 then
            table.remove(exechack_cc_hvh_obkak.tesakParticles, i)
        end
    end
    
    while #exechack_cc_hvh_obkak.tesakParticles < exechack_cc_hvh_obkak.particleCount do
        table.insert(exechack_cc_hvh_obkak.tesakParticles, {
            x = math.random(-50, 850),
            y = math.random(-50, 550),
            vx = math.random(-30, 30),
            vy = math.random(-30, 30),
            life = math.random(4, 7),
            maxLife = math.random(4, 7),
            size = math.random(12, 18)
        })
    end
end

function exechack_cc_hvh_obkak.tabs.Fun()
    local p = exechack_cc_hvh_obkak.itemPanel("Info", 1, 300):GetItemPanel()
    
    local infoText = "HvH OBKAK: Coded by Exec,Top1HvHMedia.\n\nChange.Log: New WaterMark,Fixed resolver,pitch resolver,New Screen On Logs (Fixed),Angle Arrows (fixed),Fixed PM Killsays,Fake Lag Show,HeadShoot indicator,Fixed bug with lag compensation."
    
    local infoLabel = vgui.Create("DLabel", p)
    infoLabel:SetText(infoText)
    infoLabel:SetFont("DermaDefault")
    infoLabel:SetTextColor(Color(255, 255, 255))
    infoLabel:SetWrap(true)
    infoLabel:SetAutoStretchVertical(true)
    infoLabel:Dock(TOP)
    infoLabel:DockMargin(5, 5, 5, 10)
    
    exechack_cc_hvh_obkak.russianCB = exechack_cc_hvh_obkak.ui.CheckBox(p, "Russian Ultimate", "Russian Ultimate", false, false, false, false, function(val)
        if val then
            exechack_cc_hvh_obkak.SetUltimateMode("Russian")
        else
            exechack_cc_hvh_obkak.SetUltimateMode(nil)
        end
    end)
    
    exechack_cc_hvh_obkak.ukrainianCB = exechack_cc_hvh_obkak.ui.CheckBox(p, "Ukrainian Ultimate", "Ukrainian Ultimate", false, false, false, false, function(val)
        if val then
            exechack_cc_hvh_obkak.SetUltimateMode("Ukrainian")
        else
            exechack_cc_hvh_obkak.SetUltimateMode(nil)
        end
    end)
    
    exechack_cc_hvh_obkak.navalnyCB = exechack_cc_hvh_obkak.ui.CheckBox(p, "Navalny Ultimate", "Navalny Ultimate", false, false, false, false, function(val)
        if val then
            exechack_cc_hvh_obkak.SetUltimateMode("Navalny")
        else
            exechack_cc_hvh_obkak.SetUltimateMode(nil)
        end
    end)
    
    exechack_cc_hvh_obkak.tesakCB = exechack_cc_hvh_obkak.ui.CheckBox(p, "Tesak Ultimate", "Tesak Ultimate", false, false, false, false, function(val)
        if val then
            exechack_cc_hvh_obkak.SetUltimateMode("Tesak")
        else
            exechack_cc_hvh_obkak.SetUltimateMode(nil)
        end
    end)
    
    if IsValid(exechack_cc_hvh_obkak.tesakCB) then
        for k, v in pairs(exechack_cc_hvh_obkak.tesakCB:GetChildren()) do
            if v:GetName() == "UCheckboxLabel" then
                v.Label:SetTextColor(Color(255, 0, 0))
                function v.Button:Paint(w,h)
                    local checked = self:GetChecked()
                    surface.SetDrawColor(255, 0, 0)
                    surface.DrawOutlinedRect(0,0,w,h,1)
                    
                    if checked or self:IsHovered() then
                        if checked then
                            surface.SetDrawColor(255, 0, 0)
                        else
                            surface.SetDrawColor(139, 0, 0)
                        end
                        surface.DrawRect(3,3,w-6,h-6)
                    end
                end
                break
            end
        end
    end
end

exechack_cc_hvh_obkak.ttable = {}

exechack_cc_hvh_obkak.ttable["Aimbot"]   = exechack_cc_hvh_obkak.tabs.Aimbot
exechack_cc_hvh_obkak.ttable["Rage"]     = exechack_cc_hvh_obkak.tabs.Rage
exechack_cc_hvh_obkak.ttable["Visuals"]  = exechack_cc_hvh_obkak.tabs.Visuals
exechack_cc_hvh_obkak.ttable["Misc"]     = exechack_cc_hvh_obkak.tabs.Misc
exechack_cc_hvh_obkak.ttable["Fun"]      = exechack_cc_hvh_obkak.tabs.Fun
exechack_cc_hvh_obkak.ttable["Config"] = exechack_cc_hvh_obkak.tabs.Config
exechack_cc_hvh_obkak.ttable["Players"]  = exechack_cc_hvh_obkak.tabs.Players
exechack_cc_hvh_obkak.ttable["Entities"]  = exechack_cc_hvh_obkak.tabs.Entities
--exechack_cc_hvh_obkak.ttable["resolver"]  = exechack_cc_hvh_obkak.tabs.resolver

function exechack_cc_hvh_obkak.initTab(tab)
    if exechack_cc_hvh_obkak.scrollpanel != nil then exechack_cc_hvh_obkak.scrollpanel:Remove() end

    exechack_cc_hvh_obkak.scrollpanel = vgui.Create("UScroll",exechack_cc_hvh_obkak.frame)

    exechack_cc_hvh_obkak.pty = { 5, 5, 5 }
    // exechack_cc_hvh_obkak.ESPPP:Hide()
    exechack_cc_hvh_obkak.ttable[tostring(tab)]()
end

function exechack_cc_hvh_obkak.tabButton(tab,par) 
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(tab)

    local fw = w + 35

    local tx, ty = fw/2 - w/2, 25/2-h/2 - 1

    local b = par:Add("DButton")
    b:Dock(LEFT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        exechack_cc_hvh_obkak.activetab = tab
        exechack_cc_hvh_obkak.initTab(tab)
    end

    function b:Paint(width,height)
        if exechack_cc_hvh_obkak.activetab == tab or self:OnDepressed() then
            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
            surface.SetTextColor(245,245,245,255)
        elseif self:IsHovered() then
            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[40])
            surface.SetTextColor(225,225,225,255)
        else
            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[30])
            surface.SetTextColor(200,200,200,255)
        end
        
        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(tab)
    end
end

exechack_cc_hvh_obkak.tabButton( "Aimbot",        exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
exechack_cc_hvh_obkak.tabButton( "Rage",          exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
exechack_cc_hvh_obkak.tabButton( "Visuals",       exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
exechack_cc_hvh_obkak.tabButton( "Misc",          exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
exechack_cc_hvh_obkak.tabButton( "Fun",           exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
exechack_cc_hvh_obkak.tabButton( "Config",        exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
exechack_cc_hvh_obkak.tabButton( "Players",       exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
exechack_cc_hvh_obkak.tabButton( "Entities",       exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
--exechack_cc_hvh_obkak.tabButton( "resolver",       exechack_cc_hvh_obkak.frame:GetTopPanel() ) 
                    
exechack_cc_hvh_obkak.ttable["Aimbot"]()

// Input 

function exechack_cc_hvh_obkak.IsKeyDown( key )
	if not key then return false end
	if key >= 107 then
		return input.IsMouseDown( key )
	end

	return input.IsKeyDown( key )
end

/*
    Create Move start
*/

// cm stuff

exechack_cc_hvh_obkak.target             = false  
exechack_cc_hvh_obkak.aimingrn           = false 

exechack_cc_hvh_obkak.targetVector       = Vector()
exechack_cc_hvh_obkak.predictedVector    = Vector()
exechack_cc_hvh_obkak.backtrackVector    = Vector()
exechack_cc_hvh_obkak.nullVec            = Vector() * -1

exechack_cc_hvh_obkak.SilentAngle        = pLocalPlayer:EyeAngles()

exechack_cc_hvh_obkak.SkipCommand        = false
exechack_cc_hvh_obkak.SendPacket         = true

exechack_cc_hvh_obkak.traceStruct        = { mask = MASK_SHOT, filter = pLocalPlayer }
exechack_cc_hvh_obkak.badSweps           = { ["gmod_camera"] = true, ["manhack_welder"] = true, ["weapon_medkit"] = true, ["gmod_tool"] = true, ["weapon_physgun"] = true, ["weapon_physcannon"] = true, ["weapon_bugbait"] = true, }
exechack_cc_hvh_obkak.badSeqs            = { [ACT_VM_RELOAD] = true, [ACT_VM_RELOAD_SILENCED] = true, [ACT_VM_RELOAD_DEPLOYED] = true, [ACT_VM_RELOAD_IDLE] = true, [ACT_VM_RELOAD_EMPTY] = true, [ACT_VM_RELOADEMPTY] = true, [ACT_VM_RELOAD_M203] = true, [ACT_VM_RELOAD_INSERT] = true, [ACT_VM_RELOAD_INSERT_PULL] = true, [ACT_VM_RELOAD_END] = true, [ACT_VM_RELOAD_END_EMPTY] = true, [ACT_VM_RELOAD_INSERT_EMPTY] = true, [ACT_VM_RELOAD2] = true }
exechack_cc_hvh_obkak.cones              = {}
exechack_cc_hvh_obkak.parsedbones        = {}

exechack_cc_hvh_obkak.swbNormal          = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
exechack_cc_hvh_obkak.swbWall            = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
exechack_cc_hvh_obkak.swbPen             = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
exechack_cc_hvh_obkak.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

exechack_cc_hvh_obkak.m9kPenetration     = { ["SniperPenetratedRound"] = 20, ["pistol"] = 9, ["357"] = 12, ["smg1"] = 14, ["ar2"] = 16, ["buckshot"] = 5, ["slam"] = 5, ["AirboatGun"] = 17, }
exechack_cc_hvh_obkak.m9kMaxRicochet     = { ["SniperPenetratedRound"] = 10, ["pistol"] = 2, ["357"] = 5, ["smg1"] = 4, ["ar2"] = 5, ["buckshot"] = 0, ["slam"] = 0, ["AirboatGun"] = 9, }
exechack_cc_hvh_obkak.m9kCanRicochet     = { ["SniperPenetratedRound"] = true, ["pistol"] = true, ["buckshot"] = true, ["slam"] = true }
exechack_cc_hvh_obkak.m9kPenMaterial     = { [MAT_GLASS] = true, [MAT_PLASTIC] = true, [MAT_WOOD] = true, [MAT_FLESH] = true, [MAT_ALIENFLESH] = true }

exechack_cc_hvh_obkak.activeWeapon       = false 
exechack_cc_hvh_obkak.activeWeaponClass  = false 
exechack_cc_hvh_obkak.moveType           = pLocalPlayer:GetMoveType() 

exechack_cc_hvh_obkak.backtracktick      = 0

function exechack_cc_hvh_obkak.AutoWall( dir, plyTarget )
	if not exechack_cc_hvh_obkak.activeWeapon or exechack_cc_hvh_obkak.swbShit[ exechack_cc_hvh_obkak.activeWeaponClass ] then return false end 

	local eyePos = pLocalPlayer:EyePos()
	
	local function SWBAutowall()

        exechack_cc_hvh_obkak.traceStruct.start = eyePos
        exechack_cc_hvh_obkak.traceStruct.endpos = eyePos + dir * exechack_cc_hvh_obkak.activeWeapon.PenetrativeRange
        exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer
        exechack_cc_hvh_obkak.traceStruct.mask = exechack_cc_hvh_obkak.swbNormal

		local tr = TraceLine( exechack_cc_hvh_obkak.traceStruct )
		
		if tr.Hit and !tr.HitSky then
			local dot = -dir:Dot(tr.HitNormal)
			
			if exechack_cc_hvh_obkak.activeWeapon.CanPenetrate and dot > 0.26 then

                exechack_cc_hvh_obkak.traceStruct.start = tr.HitPos
                exechack_cc_hvh_obkak.traceStruct.endpos = tr.HitPos + dir * exechack_cc_hvh_obkak.activeWeapon.PenStr * ( exechack_cc_hvh_obkak.swbPen[tr.MatType] or 1 ) * exechack_cc_hvh_obkak.activeWeapon.PenMod
                exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer
                exechack_cc_hvh_obkak.traceStruct.mask = exechack_cc_hvh_obkak.swbWall

				tr = TraceLine( exechack_cc_hvh_obkak.traceStruct )

                exechack_cc_hvh_obkak.traceStruct.start = tr.HitPos
                exechack_cc_hvh_obkak.traceStruct.endpos = tr.HitPos + dir * 0.1
                exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer
                exechack_cc_hvh_obkak.traceStruct.mask = exechack_cc_hvh_obkak.swbNormal

				tr = TraceLine( exechack_cc_hvh_obkak.traceStruct) 
				
				if tr.Hit then return false end

                exechack_cc_hvh_obkak.traceStruct.start = tr.HitPos
                exechack_cc_hvh_obkak.traceStruct.endpos = tr.HitPos + dir * 32768
                exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer
                exechack_cc_hvh_obkak.traceStruct.mask = MASK_SHOT

				tr = TraceLine( exechack_cc_hvh_obkak.traceStruct )
				
                if exechack_cc_hvh_obkak.cfg.vars["Ignores-Head unhitable"] then
                    return tr.Entity == plyTarget and tr.HitGroup == 1
                else
                    return tr.Entity == plyTarget
                end
			end
		end
		
		return false
	end
	
	local function M9KAutowall()
        local penetrate_cvar = GetConVar( "M9KDisablePenetration" )
        if IsValid(penetrate_cvar) then
            if ( penetrate_cvar:GetBool() ) then
                return false 
            end
        end

		if !exechack_cc_hvh_obkak.activeWeapon.Penetration then
			return false
		end

		local function BulletPenetrate( tr, bounceNum, damage )
			if damage < 1 then
				return false
			end
			
			local maxPenetration    = 14
            local maxRicochet       = 0
            local isRicochet        = false

            if exechack_cc_hvh_obkak.m9kPenetration[ exechack_cc_hvh_obkak.activeWeapon.Primary.Ammo ] then
                maxPenetration = exechack_cc_hvh_obkak.m9kPenetration[ exechack_cc_hvh_obkak.activeWeapon.Primary.Ammo ]
            end
			
            if exechack_cc_hvh_obkak.m9kMaxRicochet[ exechack_cc_hvh_obkak.activeWeapon.Primary.Ammo ] then
                maxRicochet = exechack_cc_hvh_obkak.m9kMaxRicochet[ exechack_cc_hvh_obkak.activeWeapon.Primary.Ammo ]
            end

            if exechack_cc_hvh_obkak.m9kCanRicochet[ exechack_cc_hvh_obkak.activeWeapon.Primary.Ammo ] then
                isRicochet = exechack_cc_hvh_obkak.m9kMaxRicochet[ exechack_cc_hvh_obkak.activeWeapon.Primary.Ammo ]
            end

			if tr.MatType == MAT_METAL and isRicochet and exechack_cc_hvh_obkak.activeWeapon.Primary.Ammo != "SniperPenetratedRound" then
				return false
			end

			if bounceNum > maxRicochet then
				return false
			end

			local penetrationDir = tr.Normal * maxPenetration

			if exechack_cc_hvh_obkak.m9kPenMaterial[ tr.MatType ] then
				penetrationDir = tr.Normal * ( maxPenetration * 2 ) 
			end

			if tr.Fraction <= 0 then
				return false
			end

			exechack_cc_hvh_obkak.traceStruct.endpos    = tr.HitPos
			exechack_cc_hvh_obkak.traceStruct.start     = tr.HitPos + penetrationDir
			exechack_cc_hvh_obkak.traceStruct.mask      = MASK_SHOT
			exechack_cc_hvh_obkak.traceStruct.filter    = pLocalPlayer

			local trace = TraceLine( exechack_cc_hvh_obkak.traceStruct )

			if trace.StartSolid or trace.Fraction >= 1 then
				return false
			end

			exechack_cc_hvh_obkak.traceStruct.endpos = trace.HitPos + tr.Normal * 32768
			exechack_cc_hvh_obkak.traceStruct.start  = trace.HitPos
			exechack_cc_hvh_obkak.traceStruct.mask   = MASK_SHOT
			exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer

			local penTrace = TraceLine( exechack_cc_hvh_obkak.traceStruct )

            if exechack_cc_hvh_obkak.cfg.vars["Ignores-Head unhitable"] then
                return penTrace.Entity == plyTarget and penTrace.HitGroup == 1
            else
                return penTrace.Entity == plyTarget
            end

			local damageMulti = 0.5
			if exechack_cc_hvh_obkak.activeWeapon.Primary.Ammo == "SniperPenetratedRound" then
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

        exechack_cc_hvh_obkak.traceStruct.start = eyePos
        exechack_cc_hvh_obkak.traceStruct.endpos = eyePos + dir * 32768
        exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer
        exechack_cc_hvh_obkak.traceStruct.mask = MASK_SHOT

		local trace = TraceLine( exechack_cc_hvh_obkak.traceStruct )

		return BulletPenetrate( trace, 0, exechack_cc_hvh_obkak.activeWeapon.Primary.Damage )
	end
	
    if string.StartsWith( exechack_cc_hvh_obkak.activeWeaponClass, "m9k_" ) or string.StartsWith( exechack_cc_hvh_obkak.activeWeaponClass, "bender_" ) then
		return M9KAutowall()
	elseif string.StartsWith( exechack_cc_hvh_obkak.activeWeaponClass, "swb_" ) then
		return SWBAutowall()
	end
	
	return false
end

function exechack_cc_hvh_obkak.VisibleCheck( who, where, predticks, awalldir )
    local start = pLocalPlayer:EyePos()

    if predticks then start = start + ( pLocalPlayer:GetVelocity() * flTickInterval ) * predticks end

    exechack_cc_hvh_obkak.traceStruct.start = start
	exechack_cc_hvh_obkak.traceStruct.endpos = where
	exechack_cc_hvh_obkak.traceStruct.mask = MASK_SHOT
    exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer

    local tr = TraceLine( exechack_cc_hvh_obkak.traceStruct )

    local canhit = tr.Entity == who or tr.Fraction == 1

    if !canhit and awalldir and exechack_cc_hvh_obkak.cfg.vars["Wallz"] then 
        return exechack_cc_hvh_obkak.AutoWall( awalldir, who )
    end

    if exechack_cc_hvh_obkak.cfg.vars["Ignores-Head unhitable"] and tr.HitGroup != 1 then return false end

    return canhit
end

exechack_cc_hvh_obkak.flServerTime = 0
function exechack_cc_hvh_obkak.CanShoot( cmd )
	if not exechack_cc_hvh_obkak.activeWeapon then return false end
	local seq = exechack_cc_hvh_obkak.activeWeapon:GetSequence()

    if exechack_cc_hvh_obkak.cfg.binds["Aim on key"] != 0 and not exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Aim on key"] ) then
        return false
    end

	if exechack_cc_hvh_obkak.badSweps[ exechack_cc_hvh_obkak.activeWeaponClass ] then
		return false
	end

    if exechack_cc_hvh_obkak.moveType == MOVETYPE_NOCLIP then
        return false
    end

    if exechack_cc_hvh_obkak.cfg.vars["Auto fire"] and cmd:KeyDown(IN_ATTACK) then
        return false
    end

	if exechack_cc_hvh_obkak.cfg.vars["Bullet time"] and exechack_cc_hvh_obkak.activeWeapon:GetNextPrimaryFire() >= exechack_cc_hvh_obkak.flServerTime then
		return false
	end

    // print(ded.GetRandomSeed( cmd ))
    if exechack_cc_hvh_obkak.cfg.vars["Wait for seed"] and ded.GetRandomSeed( cmd ) != 134 then
        return false 
    end

	return exechack_cc_hvh_obkak.activeWeapon:Clip1() != 0 and !exechack_cc_hvh_obkak.badSeqs[ seq ] 
end 

function exechack_cc_hvh_obkak.Spread( cmd, ang, spread )
	if not exechack_cc_hvh_obkak.activeWeapon or not exechack_cc_hvh_obkak.cones[ exechack_cc_hvh_obkak.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()

	return newangle
end

/*
    Nospread 
*/

exechack_cc_hvh_obkak.CustomSpread = {}

function exechack_cc_hvh_obkak.CustomSpread.swb( cmd, ang )
    /*
    local vel = pLocalPlayer:GetVelocity():Length()
    local dir = ang:Forward()
    
    if !pLocalPlayer.LastView then
        pLocalPlayer.LastView = dir
        pLocalPlayer.ViewAff = 0
    else
        pLocalPlayer.ViewAff = Lerp( 0.25, pLocalPlayer.ViewAff, ( dir - pLocalPlayer.LastView ):Length() * 0.5 )
    end
    
    if exechack_cc_hvh_obkak.activeWeapon.dt and exechack_cc_hvh_obkak.activeWeapon.meSpread and exechack_cc_hvh_obkak.activeWeapon.dt.State == SWB_AIMING then
        exechack_cc_hvh_obkak.activeWeapon.BaseCone = exechack_cc_hvh_obkak.activeWeapon.meSpread
        
        if exechack_cc_hvh_obkak.activeWeapon.Owner.Expertise then
            exechack_cc_hvh_obkak.activeWeapon.BaseCone = exechack_cc_hvh_obkak.activeWeapon.BaseCone * ( 1 - exechack_cc_hvh_obkak.activeWeapon.Owner.Expertise["steadyme"].val * 0.0015 )
        end
    else
        exechack_cc_hvh_obkak.activeWeapon.BaseCone = exechack_cc_hvh_obkak.activeWeapon.HipSpread
        
        if exechack_cc_hvh_obkak.activeWeapon.Owner.Expertise then
            exechack_cc_hvh_obkak.activeWeapon.BaseCone = exechack_cc_hvh_obkak.activeWeapon.BaseCone * ( 1 - exechack_cc_hvh_obkak.activeWeapon.Owner.Expertise["wepprof"].val * 0.0015 )
        end
    end
    
    if pLocalPlayer:Crouching() then
        exechack_cc_hvh_obkak.activeWeapon.BaseCone = exechack_cc_hvh_obkak.activeWeapon.BaseCone * ( exechack_cc_hvh_obkak.activeWeapon.dt.State == SWB_AIMING and 0.9 or 0.75 )
    end
    
    exechack_cc_hvh_obkak.activeWeapon.CurCone = math.Clamp( exechack_cc_hvh_obkak.activeWeapon.BaseCone + exechack_cc_hvh_obkak.activeWeapon.AddSpread + ( vel / 10000 * exechack_cc_hvh_obkak.activeWeapon.VelocitySensitivity ) * ( exechack_cc_hvh_obkak.activeWeapon.dt.State == SWB_AIMING and exechack_cc_hvh_obkak.activeWeapon.meMobilitySpreadMod or 1 ) + pLocalPlayer.ViewAff, 0, 0.09 + exechack_cc_hvh_obkak.activeWeapon.MaxSpreadInc )
    
    if CurTime() > exechack_cc_hvh_obkak.activeWeapon.SpreadWait then
        exechack_cc_hvh_obkak.activeWeapon.AddSpread = math.Clamp( exechack_cc_hvh_obkak.activeWeapon.AddSpread - 0.005 * exechack_cc_hvh_obkak.activeWeapon.AddSpreadSpeed, 0, exechack_cc_hvh_obkak.activeWeapon.MaxSpreadInc )
        exechack_cc_hvh_obkak.activeWeapon.AddSpreadSpeed = math.Clamp( exechack_cc_hvh_obkak.activeWeapon.AddSpreadSpeed + 0.05, 0, 1 )
    end
    */

    local cone = exechack_cc_hvh_obkak.activeWeapon.CurCone
    if !cone then return ang end

    if pLocalPlayer:Crouching() then
        cone = cone * 0.85
    end

    math.randomseed( cmd:CommandNumber() )
    return ang - Angle( math.Rand(-cone, cone), math.Rand(-cone, cone), 0 ) * 25
end

function exechack_cc_hvh_obkak.CustomSpread.cw( cmd, ang )
    local cone = exechack_cc_hvh_obkak.activeWeapon.CurCone
    if !cone then return ang end

    math.randomseed( cmd:CommandNumber() )
    return ang - Angle( math.Rand(-cone, cone), math.Rand(-cone, cone), 0 ) * 25
end

function exechack_cc_hvh_obkak.CustomSpread.fas2( cmd, ang )
    math.randomseed( CurTime() )

    local dir = Angle( math.Rand( -exechack_cc_hvh_obkak.activeWeapon.CurCone, exechack_cc_hvh_obkak.activeWeapon.CurCone ), math.Rand( -exechack_cc_hvh_obkak.activeWeapon.CurCone, exechack_cc_hvh_obkak.activeWeapon.CurCone ), 0 ) * 25
    local dir2 = dir 
            
    if exechack_cc_hvh_obkak.activeWeapon.ClumpSpread and exechack_cc_hvh_obkak.activeWeapon.ClumpSpread > 0 then
        dir2 = dir + Vector( math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * exechack_cc_hvh_obkak.activeWeapon.ClumpSpread
    end

    return ang - dir2
end

function exechack_cc_hvh_obkak.CustomSpread.tfa( cmd, ang )

    
    return ang
end

function exechack_cc_hvh_obkak.CustomSpread.mg( cmd, ang )
    /*
    local pWeapon = exechack_cc_hvh_obkak.activeWeapon

    local flCone = pWeapon:GetCone()

    math.randomseed( pWeapon.Cone.Seed + pWeapon:Clip1() + pWeapon:Ammo1() )

    local flSpread = math.Rand( -flCone, flCone ) * 1000

    if ( flSpread < -flCone ) then
        flSpread = -flCone
    elseif ( flSpread > flCone ) then
        flSpread = flCone
    end

    flSpread = flSpread * 0.1

    local vSpread = Vector( 1, -flSpread, flSpread )
    local newAngle = ang + vSpread:Angle()
    newAngle:Normalize()

    return newAngle
    */
end

/*
local function Zc(self, bd)
    local cd = self:GetCone()
    Xc(self.Cone.Seed + self:Clip1() + self:Ammo1())
    local dd = Wc(-cd, cd) * 1000
    if (dd < -cd) then
        dd = -cd
    elseif (dd > cd) then
        dd = cd
    end
    dd = dd * 0.1
    Yc.x = dd
    Yc.y = -dd
    local ed = self.Bullet
    self:FireBullets(
        {
            Attacker = bd,
            Src = bd:EyePos(),
            Dir = (bd:EyeAngles() + bd:GetViewPunchAngles()):Forward(),
            Spread = Yc,
            Num = ed.NumBullets,
            Distance = (ed.Range * 100) / 2.54,
            Tracer = ed.Tracer and 1 or 0,
            Callback = function(fd, gd, hd)
            end
        }
    )
end
*/

exechack_cc_hvh_obkak.SpreadComps = {}

exechack_cc_hvh_obkak.SpreadComps["swb"]     = exechack_cc_hvh_obkak.CustomSpread.swb
exechack_cc_hvh_obkak.SpreadComps["cw"]      = exechack_cc_hvh_obkak.CustomSpread.cw
exechack_cc_hvh_obkak.SpreadComps["fas2"]    = exechack_cc_hvh_obkak.CustomSpread.fas2
exechack_cc_hvh_obkak.SpreadComps["tfa"]     = exechack_cc_hvh_obkak.CustomSpread.tfa
exechack_cc_hvh_obkak.SpreadComps["mg"]     = exechack_cc_hvh_obkak.CustomSpread.mg








function exechack_cc_hvh_obkak.NoSpread(cmd, ang)
    if not exechack_cc_hvh_obkak.activeWeapon or exechack_cc_hvh_obkak.swbShit[ exechack_cc_hvh_obkak.activeWeaponClass ] then return ang end
    local base = string.Split( exechack_cc_hvh_obkak.activeWeaponClass, "_" )[ 1 ]

    if exechack_cc_hvh_obkak.SpreadComps[ base ] then
        ang = exechack_cc_hvh_obkak.SpreadComps[ base ]( cmd, ang )
    elseif exechack_cc_hvh_obkak.cones[ exechack_cc_hvh_obkak.activeWeaponClass ] then
        local spread = exechack_cc_hvh_obkak.cones[ exechack_cc_hvh_obkak.activeWeaponClass ]
        return exechack_cc_hvh_obkak.Spread( cmd, ang, spread ) 
    end

    return ang
end

function exechack_cc_hvh_obkak.NoRecoil( ang )  
	if exechack_cc_hvh_obkak.activeWeaponClass == "weapon_pistol" or string.StartsWith( exechack_cc_hvh_obkak.activeWeaponClass,"m9k_" ) or string.StartsWith( exechack_cc_hvh_obkak.activeWeaponClass,"bb_" ) or string.StartsWith( exechack_cc_hvh_obkak.activeWeaponClass,"unclen8_" ) then
		return ang
	else
	    ang = ang - pLocalPlayer:GetViewPunchAngles()
    end

	return ang
end

/*
exechack_cc_hvh_obkak.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )

*/

function exechack_cc_hvh_obkak.ParseBones( ply, bone )
    local mdl = ply:GetModel()

    if exechack_cc_hvh_obkak.parsedbones[ mdl ] and exechack_cc_hvh_obkak.parsedbones[ mdl ][ bone ] then 
        return exechack_cc_hvh_obkak.parsedbones[ mdl ][ bone ]
    end

    if not exechack_cc_hvh_obkak.parsedbones[ mdl ] then
        exechack_cc_hvh_obkak.parsedbones[ mdl ] = {}
    end
        
    local set = ply:GetHitboxSet()
    local bonecount = ply:GetBoneCount()

    for i = 0, bonecount - 1 do 
		local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

		if bone == group then
			exechack_cc_hvh_obkak.parsedbones[ mdl ][ bone ] = i

            return i
        end
	end

    for i = 0, bonecount - 1 do 
        local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

        if bone > 1 and group == 0 then
            exechack_cc_hvh_obkak.parsedbones[ mdl ][ bone ] = i

            return i
        end
    end

    return 0
end

function exechack_cc_hvh_obkak.MultipointGroupCheck( group )
    if group == 1 and not exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Head"] then return false end
    if group == 2 and not exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Chest"] then return false end
    if group == 3 and not exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Stomach"] then return false end
    if group == 4 or group == 5 and not exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Arms"] then return false end
    if group == 6 or group == 7 and not exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Legs"] then return false end
    if group == 0 and not exechack_cc_hvh_obkak.cfg.vars["Multipoint groups-Generic"] then return false end

    return true 
end

function exechack_cc_hvh_obkak.GetBones( ply )
    local scale = exechack_cc_hvh_obkak.cfg.vars["Multipoint scale"]
    local pos = ply:LocalToWorld( ply:OBBCenter() )
    local set = ply:GetHitboxSet()

    if exechack_cc_hvh_obkak.cfg.vars["Hitscan"] then
        local set = ply:GetHitboxSet()
        local bonecount = ply:GetBoneCount()

        pos = {}

        for i = 0, bonecount - 1 do 
            local group = ply:GetHitBoxHitGroup( i, set )

            if group == nil then continue end

            if group == 1 and not exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Head"] then continue end
            if group == 2 and not exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Chest"] then continue end
            if group == 3 and not exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Stomach"] then continue end
            if group == 4 or group == 5 and not exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Arms"] then continue end
            if group == 6 or group == 7 and not exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Legs"] then continue end
            if group == 0 and not exechack_cc_hvh_obkak.cfg.vars["Hitscan groups-Generic"] then continue end

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
            
            if exechack_cc_hvh_obkak.cfg.vars["Multipoint"] and exechack_cc_hvh_obkak.MultipointGroupCheck( pos[ i ].hitgroup ) then
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
        local bone = exechack_cc_hvh_obkak.ParseBones( ply, exechack_cc_hvh_obkak.cfg.vars["Hitbox selection"] ) 

        local hitboxbone = ply:GetHitBoxBone( bone, set )

        if hitboxbone == nil then 
            return { pos }  
        end 

        local mins, maxs = ply:GetHitBoxBounds( bone, set )

        if not mins or not maxs then 
            return { pos } 
        end 

        local bonepos, ang = ply:GetBonePosition( hitboxbone )  

        if exechack_cc_hvh_obkak.cfg.vars["Multipoint"] then
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

function exechack_cc_hvh_obkak.GetSortedPlayers( mode, selfpred, plypred, vischeck )
    local players   = player.GetAll()   
    local eyepos    = pLocalPlayer:EyePos()       
    local valid     = {}   

	if selfpred then
		eyepos = eyepos + (pLocalPlayer:GetVelocity() * flTickInterval) * selfpred
	end

    local iTeamLocal = exechack_cc_hvh_obkak.GetTeam( pLocalPlayer )

    for i = 1, #players do
        local v = players[i]

        if v == pLocalPlayer then 
            continue 
        end 

        if not v:Alive() or v:IsDormant() then 
            continue 
        end

        if exechack_cc_hvh_obkak.cfg.vars["Ignores-Bots"] and v:IsBot() then continue end 
        if exechack_cc_hvh_obkak.cfg.vars["Ignores-Friends"] and exechack_cc_hvh_obkak.cfg.friends[v:SteamID()] then continue end 
        if exechack_cc_hvh_obkak.cfg.vars["Ignores-Steam friends"] and v:GetFriendStatus() == "friend" then continue end 
        if exechack_cc_hvh_obkak.cfg.vars["Ignores-Admins"] and v:IsAdmin() then continue end 
        if exechack_cc_hvh_obkak.cfg.vars["Ignores-Frozen"] and v:IsFlagSet( FL_FROZEN ) then continue end 
        if exechack_cc_hvh_obkak.cfg.vars["Ignores-Nodraw"] and v:IsEffectActive( EF_NODRAW ) then continue end 
        if exechack_cc_hvh_obkak.cfg.vars["Ignores-God time"] and v:GetColor().a < 255 then continue end 
        if exechack_cc_hvh_obkak.cfg.vars["Ignores-Driver"] and v:InVehicle() then continue end 
        if exechack_cc_hvh_obkak.cfg.vars["Target-Priority-Only"] and not exechack_cc_hvh_obkak.cfg.priorityList[v:SteamID()] then continue end

        local iTeamEnemy = exechack_cc_hvh_obkak.GetTeam( v )

        if st == TEAM_SPECTATOR or exechack_cc_hvh_obkak.cfg.vars["Ignores-Teammates"] and iTeamLocal == iTeamEnemy then 
            continue 
        end 

        if exechack_cc_hvh_obkak.cfg.vars["Ignores-Nocliping"] and v:GetMoveType() == MOVETYPE_NOCLIP then 
            continue 
        end 

        if vischeck then
			local bone = exechack_cc_hvh_obkak.GetBones( v )[1]
			local dir = pLocalPlayer:GetShootPos() - bone
			dir:Normalize()

			if !exechack_cc_hvh_obkak.VisibleCheck( v, bone, selfpred, dir ) then
				continue
			end
		end

        local pos = v:GetPos()
        if plypred then 
            pos = pos + (v:GetVelocity() * flTickInterval) * plypred
        end

        valid[#valid+1] = { v, pos }
    end

    if mode == 1 then
        table.sort(valid, function( a, b )
            return ( a[2] - eyepos ):LengthSqr() < ( b[2] - eyepos ):LengthSqr()       
        end)
    elseif mode == 2 then
        table.sort(valid, function( a, b )
            local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()

            local aDist
            do
                local dx = ( screenWidth * 0.5 ) - aScr.x
                local dy = ( screenHeight * 0.5 ) - aScr.y
                aDist = dx * dx + dy * dy
            end
    
            local bDist
            do
                local dx = ( screenWidth * 0.5 ) - bScr.x
                local dy = ( screenHeight * 0.5 ) - bScr.y
                bDist = dx * dx + dy * dy
            end
    
            return aDist < bDist
        end)
    end

    if #valid == 0 then return end

    return valid
end

function exechack_cc_hvh_obkak.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = exechack_cc_hvh_obkak.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - exechack_cc_hvh_obkak.btrecords[ ply ][ tick ].simulationtime

    if diff > exechack_cc_hvh_obkak.cfg.vars["Backtrack time"] / 1000 then return false end

    return true
end

function exechack_cc_hvh_obkak.FindBacktrack( cmd, ply )
    local ticks = #exechack_cc_hvh_obkak.btrecords[ ply ]
    local canhit = {}

    for i = 1, ticks do
        if exechack_cc_hvh_obkak.IsTickHittable( ply, cmd, i ) then
            canhit[ #canhit + 1 ] = i
        end
    end

    return canhit
end

function exechack_cc_hvh_obkak.FindFirstHittableTicks( ply, cmd )
    local tickcount = #exechack_cc_hvh_obkak.btrecords[ ply ]

    if !tickcount then return 1 end

    for i = 1, tickcount do
        if exechack_cc_hvh_obkak.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end
end

do
    local lastdist, lasttick = 1337, 1

    function exechack_cc_hvh_obkak.FindClosestHittableTicks( ply, cmd )
        local mypos = pLocalPlayer:EyePos()
        local records = exechack_cc_hvh_obkak.btrecords[ ply ]
        local firstticks = exechack_cc_hvh_obkak.FindFirstHittableTicks( ply, cmd )
        local tickcount = #records

        if !tickcount or !firstticks then return 1 end

        lastdist = math.huge
    
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

function exechack_cc_hvh_obkak.SelectTarget( cmd )
    local plys = exechack_cc_hvh_obkak.GetSortedPlayers( exechack_cc_hvh_obkak.cfg.vars["Target selection"] )
    exechack_cc_hvh_obkak.target     = false


    if !plys then return end 

    local maxplys       = exechack_cc_hvh_obkak.cfg.vars["Max targets"]
    local curplys       = #plys

    if maxplys != 0 and curplys > maxplys then
        curplys = maxplys
    end

    local vEyePos = pLocalPlayer:EyePos()

    local aimAng
    for i = 1, curplys do
		local ply = plys[i][1]

        -- distance check 
        local iMaxDistance = exechack_cc_hvh_obkak.cfg.vars[ "Max distance" ]
        local iDistance = vEyePos:DistToSqr( ply:EyePos() )

        if ( iMaxDistance ~= 0 and iDistance > ( iMaxDistance * iMaxDistance ) ) then
            continue 
        end
        






        if not exechack_cc_hvh_obkak.cfg.vars["Always backtrack"] then
            local bones = exechack_cc_hvh_obkak.GetBones( ply )

            for o = 1, #bones do
                local bone = bones[o]
                aimAng = ( bone - pLocalPlayer:EyePos() ):Angle()

                if exechack_cc_hvh_obkak.VisibleCheck( ply, bone, nil, aimAng:Forward() ) then 
                    exechack_cc_hvh_obkak.target = ply
                    return ply, bone, aimAng, false, 0
                end
            end

        elseif exechack_cc_hvh_obkak.cfg.vars["Extrapolation"] and exechack_cc_hvh_obkak.predicted[ ply ] then
            if not exechack_cc_hvh_obkak.predicted[ ply ].pos then return end

            aimAng = ( exechack_cc_hvh_obkak.predicted[ ply ].pos - pLocalPlayer:EyePos() ):Angle()

            exechack_cc_hvh_obkak.traceStruct.start = pLocalPlayer:EyePos()
            exechack_cc_hvh_obkak.traceStruct.endpos = exechack_cc_hvh_obkak.predicted[ ply ].pos
            exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer
            exechack_cc_hvh_obkak.traceStruct.mask = MASK_SHOT

            local tr = TraceLine( exechack_cc_hvh_obkak.traceStruct )

            if !tr.Hit or tr.Entity == ply then
                exechack_cc_hvh_obkak.target = ply
                return ply, exechack_cc_hvh_obkak.predicted[ ply ].pos, aimAng, false, 0
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Backtrack"] then
            local ticks = exechack_cc_hvh_obkak.FindBacktrack( cmd, ply )

            if exechack_cc_hvh_obkak.btrecords[ ply ] and not ply.break_lc then 
                local ts = 0 
                
                if exechack_cc_hvh_obkak.cfg.vars["Backtrack mode"] == 3 then
                    for p = 1, #ticks do
                        if not exechack_cc_hvh_obkak.btrecords[ ply ][ p ] then continue end

                        aimAng = ( exechack_cc_hvh_obkak.btrecords[ ply ][ p ].aimpos - pLocalPlayer:EyePos() ):Angle()

                        exechack_cc_hvh_obkak.traceStruct.start = pLocalPlayer:EyePos()
                        exechack_cc_hvh_obkak.traceStruct.endpos = exechack_cc_hvh_obkak.btrecords[ ply ][ p ].aimpos
                        exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer
                        exechack_cc_hvh_obkak.traceStruct.mask = MASK_SHOT

                        local tr = TraceLine( exechack_cc_hvh_obkak.traceStruct )

                        if !tr.Hit or tr.Entity == ply then
                            exechack_cc_hvh_obkak.target = ply
                            exechack_cc_hvh_obkak.backtracktick = p

                            return ply, exechack_cc_hvh_obkak.btrecords[ ply ][ p ].aimpos, aimAng, true, p
                        end
                    end
                end

                if exechack_cc_hvh_obkak.cfg.vars["Backtrack mode"] == 3 then return end

                if exechack_cc_hvh_obkak.cfg.vars["Backtrack mode"] == 1 then
                    ts = exechack_cc_hvh_obkak.FindFirstHittableTicks( ply, cmd )
                elseif exechack_cc_hvh_obkak.cfg.vars["Backtrack mode"] == 2 then
                    ts = exechack_cc_hvh_obkak.FindClosestHittableTicks( ply, cmd )
                end

                if not exechack_cc_hvh_obkak.btrecords[ ply ][ ts ] then return end

                aimAng = ( exechack_cc_hvh_obkak.btrecords[ ply ][ ts ].aimpos - pLocalPlayer:EyePos() ):Angle()

                exechack_cc_hvh_obkak.traceStruct.start = pLocalPlayer:EyePos()
                exechack_cc_hvh_obkak.traceStruct.endpos = exechack_cc_hvh_obkak.btrecords[ ply ][ ts ].aimpos
                exechack_cc_hvh_obkak.traceStruct.filter = pLocalPlayer
                exechack_cc_hvh_obkak.traceStruct.mask = MASK_SHOT

                local tr = TraceLine( exechack_cc_hvh_obkak.traceStruct )

                if !tr.Hit or tr.Entity == ply then
                    exechack_cc_hvh_obkak.target = ply
                    exechack_cc_hvh_obkak.backtracktick = ts

                    return ply, exechack_cc_hvh_obkak.btrecords[ ply ][ ts ].aimpos, aimAng, true, ts
                end
            end
        end
	end
end

function exechack_cc_hvh_obkak.IsMovementKeysDown( cmd )

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

function exechack_cc_hvh_obkak.MovementFix( cmd, wish_yaw )

	local pitch = math.NormalizeAngle( cmd:GetViewAngles().x )
	local inverted = -1
	
	if ( pitch > 89 || pitch < -89 ) then
		inverted = 1
	end

	local ang_diff = math.rad( math.NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw ) * inverted ) )

	local forwardmove = cmd:GetForwardMove()
	local sidemove = cmd:GetSideMove()

	local new_forwardmove = forwardmove * -math.cos( ang_diff ) * inverted + sidemove * math.sin( ang_diff )
	local new_sidemove = forwardmove * math.sin( ang_diff ) * inverted + sidemove * math.cos( ang_diff )

	cmd:SetForwardMove( new_forwardmove )
	cmd:SetSideMove( new_sidemove )
end

function exechack_cc_hvh_obkak.DoSilentAngleUpdate( UserCmd )
    local pWeapon = pLocalPlayer:GetActiveWeapon()

    if ( IsValid( pWeapon ) ) then
        if ( pWeapon.FreezeMovement and pWeapon:FreezeMovement() ) then 
            return 
        end

        local bIsInUse = UserCmd:KeyDown( IN_USE ) or pLocalPlayer:KeyDown(IN_USE)

        if ( pWeapon:GetClass() == "weapon_physgun" and IsValid( pWeapon:GetInternalVariable( "m_hGrabbedEntity" ) ) and bIsInUse ) then 
            return 
        end
    end

    local mYaw = GetConVar( "m_yaw" ):GetFloat()
    local mPitch = GetConVar( "m_pitch" ):GetFloat()

    local silentAngle = exechack_cc_hvh_obkak.SilentAngle

    silentAngle.x = math.Clamp( silentAngle.x + UserCmd:GetMouseY() * mPitch, -89, 89 )
    silentAngle.y = silentAngle.y + UserCmd:GetMouseX() * -mYaw
    silentAngle.r = 0
    
    silentAngle:Normalize()

    return silentAngle
end





















// Knife bot ( Etot zaichik knifer )

exechack_cc_hvh_obkak.knifes = {}

exechack_cc_hvh_obkak.knifes[1] = {
    str = "csgo_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

exechack_cc_hvh_obkak.knifes[2] = {
    str = "swb_",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

exechack_cc_hvh_obkak.knifes[3] = {
    str = "weapon_crowba",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 75*75,

    rightdmg = 10,
    rightdmgb = 10,
    rightdist = 75*75,
}

exechack_cc_hvh_obkak.knifes[4] = {
    str = "knife_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

exechack_cc_hvh_obkak.knifes[5] = {
    str = "umb_",

    canbackstab = false,

    leftdmg = 1000,
    leftdmgb = 1000,
    leftdist = 300*300,

    rightdmg = 1000,
    rightdmgb = 1000,
    rightdist = 300*300,
}

exechack_cc_hvh_obkak.knifes[6] = {
    str = "weapon_fists",

    canbackstab = false,

    leftdmg = 8,
    leftdmgb = 12,
    leftdist = 50*50,

    rightdmg = 8,
    rightdmgb = 12,
    rightdist = 50*50,
}
function exechack_cc_hvh_obkak:EntityFaceBack( ent )
    local angle = pLocalPlayer:GetAngles().y - ent:GetAngles().y

    if angle < -180 then angle = 360 + angle end

    if angle <= 90 and angle >= -90 then return true end

    return false
end

function exechack_cc_hvh_obkak.CanStab( ent, pos, health )
    local mypos = pLocalPlayer:GetShootPos()
    local tbl = exechack_cc_hvh_obkak.knifes[1]
    local wc = pLocalPlayer:GetActiveWeapon():GetClass()
    local canuse = false 

    for i = 1, #exechack_cc_hvh_obkak.knifes do
        if string.StartsWith(wc,exechack_cc_hvh_obkak.knifes[i].str) then
            canuse = true 
            tbl = exechack_cc_hvh_obkak.knifes[i]
            break
        end
    end 

    if not canuse then return false, false end

    if exechack_cc_hvh_obkak.canBacktrack( ent ) and exechack_cc_hvh_obkak.btrecords[ent][exechack_cc_hvh_obkak.backtracktick] then
        pos = exechack_cc_hvh_obkak.btrecords[ ent ][ exechack_cc_hvh_obkak.backtracktick ].aimpos
    end

    local backstab = tbl.canbackstab and exechack_cc_hvh_obkak:EntityFaceBack( ent ) or false
    local dist = mypos:DistToSqr( pos )
    local mode = exechack_cc_hvh_obkak.cfg.vars["Knifebot mode"]
    
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

function GetServerTime(cmd)
    if cmd == "get" then
        return os.date("%c", os.time())
    else
        return "Invalid command"
    end
end

function GetServerTime()
    return CurTime()   
end

exechack_cc_hvh_obkak.grabbingEnt = false 

function exechack_cc_hvh_obkak.DrawPhysgunBeamFunc( ply, wep, e, tar, bone, hitpos )
    if ply != me then return end 

    exechack_cc_hvh_obkak.grabbingEnt = IsValid( tar ) and tar or false
end

function exechack_cc_hvh_obkak.LagCompensation(cmd)
    local ply = exechack_cc_hvh_obkak.SelectTarget(cmd)
    local ping = ply:Ping()

    local compensationAmount = ping * 0.001 


    local serverTime = GetServerTime()
    local compensatedTime = serverTime - compensationAmount
end


// Crossbow prediction 

function exechack_cc_hvh_obkak.CrossbowPred( cmd )
    if not exechack_cc_hvh_obkak.CanShoot( cmd ) then return end

    local plys = exechack_cc_hvh_obkak.GetSortedPlayers( exechack_cc_hvh_obkak.cfg.vars["Target selection"] )

    if !plys then return end

    for i = 1, #plys do
        local ply = plys[i][1]

        local eyePos        = pLocalPlayer:EyePos()

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

        if predTime > exechack_cc_hvh_obkak.cfg.vars["Simulation limit"] then continue end

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, math.floor(0.5 + predTime / flTickInterval) do
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()

        aimPos              = data.m_vecAbsOrigin + plyCenter
        distance            = eyePos:Distance( aimPos )
        travelTime          = distance / 3500

        ded.FinishSimulation()

        // Gravity simulation
        local gravity       = GetConVar("sv_gravity"):GetFloat() * 0.05
        gravity             = ( gravity * flTickInterval ) * math.floor(0.5 + travelTime / flTickInterval)

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

exechack_cc_hvh_obkak.grabbingEnt = false 


exechack_cc_hvh_obkak.predictedPoint = {}
function exechack_cc_hvh_obkak.PropAim( cmd )
    if not exechack_cc_hvh_obkak.grabbingEnt or not IsValid( exechack_cc_hvh_obkak.grabbingEnt ) or not cmd:KeyDown( IN_ATTACK ) then return end

    local plys = exechack_cc_hvh_obkak.GetSortedPlayers( exechack_cc_hvh_obkak.cfg.vars["Target selection"] )
    exechack_cc_hvh_obkak.target = false
    exechack_cc_hvh_obkak.targetVector = false

    if !plys then return end

    for i = 1, #plys do
        local ply           = plys[i][1]

        local eyePos        = pLocalPlayer:EyePos() 

        local plyPos        = ply:GetPos()
        local plyVel        = ply:GetVelocity()
        local plyCenter     = ply:OBBCenter()
        local plySpeed      = plyVel:Length()
        //local plyPred       = plyPos + plyVel * flTickInterval

        local propPos       = exechack_cc_hvh_obkak.grabbingEnt:GetPos()
        local propVel       = exechack_cc_hvh_obkak.grabbingEnt:GetVelocity()
        local propSpeed     = propVel:Length()

        local distance      = plyPos:Distance( propPos )
        local plydist       = plyPos:Distance( eyePos )

        if plydist >= 4096 then continue end

        local travelTime    = distance / propSpeed
        //local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if travelTime > exechack_cc_hvh_obkak.cfg.vars["Simulation limit"] then continue end // predTime

        // Prediction

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, math.floor(0.5 + travelTime / flTickInterval) do // predTime
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

        local aimAng        = ( aimPos - pLocalPlayer:EyePos() ):Angle()
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



        
        local predticks = math.floor(0.5 + (ded.GetLatency(0) + ded.GetLatency(1)) / flTickInterval) + 1

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, predticks do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()

        pos = data.m_vecAbsOrigin + ply:OBBCenter()

        ded.FinishSimulation()

        local dist = pos:DistToSqr( pLocalPlayer:EyePos() )

        local clr = dist < 16777216 and Color( 0, 255, 0 ) or Color( 255, 0, 0 )

        debugoverlay.Line( pos, exechack_cc_hvh_obkak.grabbingEnt:GetPos(), 0.1, clr, true )
        debugoverlay.Box( pos - ply:OBBCenter(), ply:OBBMins(), ply:OBBMaxs(), 0.1, Color( 255, 15, 15, 32 ) )

        if dist >= 16777216 then continue end

        local aimAng = ( pos - pLocalPlayer:EyePos() ):Angle()
        local ppd = exechack_cc_hvh_obkak.grabbingEnt:GetPos():DistToSqr( pos )

        local cd = exechack_cc_hvh_obkak.cfg.vars["PA thrower dist"]
        if ppd < ( cd * cd ) and exechack_cc_hvh_obkak.cfg.vars["PA thrower"] then
            cmd:RemoveKey( IN_ATTACK )
        end

        local bmd = math.sqrt( dist - ppd )

        if ( dist - ppd ) < 0 then bmd = 0 end 

        local scrollDelta = math.ceil( bmd > 0 and -ppd or ppd )

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

function exechack_cc_hvh_obkak.Aim(cmd)
    exechack_cc_hvh_obkak.AntiAim(cmd)

    if exechack_cc_hvh_obkak.SendPacket then
        exechack_cc_hvh_obkak.fakeAngles.angle = cmd:GetViewAngles()
        exechack_cc_hvh_obkak.fakeAngles.movex = pLocalPlayer:GetPoseParameter("move_x")
        exechack_cc_hvh_obkak.fakeAngles.movey = pLocalPlayer:GetPoseParameter("move_y")

        local layers = {}

        for i = 0, 13 do
            if pLocalPlayer:IsValidLayer(i) then
                layers[i] = {
                    cycle = pLocalPlayer:GetLayerCycle(i),
                    sequence = pLocalPlayer:GetLayerSequence(i),
                    weight = pLocalPlayer:GetLayerWeight(i)
                }
            end
        end

        exechack_cc_hvh_obkak.fakeAngles.origin = pLocalPlayer:GetNetworkOrigin()
        exechack_cc_hvh_obkak.fakeAngles.seq = pLocalPlayer:GetSequence()
        exechack_cc_hvh_obkak.fakeAngles.cycle = pLocalPlayer:GetCycle()
    else
        exechack_cc_hvh_obkak.realAngle = cmd:GetViewAngles()
    end

    local ply, bone, aimang, backtracking, bttick = exechack_cc_hvh_obkak.SelectTarget(cmd)

    exechack_cc_hvh_obkak.targetVector = bone 

    if not aimang then return end

    aimang:Normalize()  

    if not exechack_cc_hvh_obkak.cfg.vars["Enable aimbot"] or not ply then return end

    local targetTime = ded.GetSimulationTime( ply:EntIndex() )
    local timeOffset = ded.GetServerTime(cmd) - targetTime

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - targetTime


    if diff > 1 and exechack_cc_hvh_obkak.cfg.vars["Adjust tickcount"] then return end

    local oldangs = Angle(aimang)

    if exechack_cc_hvh_obkak.cfg.vars["Always backtrack"] and not backtracking then return end

    if exechack_cc_hvh_obkak.cfg.vars["Fov limit"] then
        local fov = exechack_cc_hvh_obkak.cfg.vars["Aimbot FOV"]

		local view = exechack_cc_hvh_obkak.cfg.vars["Silent aim"] and exechack_cc_hvh_obkak.SilentAngle or cmd:GetViewAngles()
		local ang = aimang - view

		ang:Normalize()

		ang = math.sqrt(ang.x * ang.x + ang.y * ang.y)

        if ang > fov then
            exechack_cc_hvh_obkak.targetVector = false
		    return 
        end
    end

    if not exechack_cc_hvh_obkak.CanShoot(cmd) then return end

    if ( exechack_cc_hvh_obkak.cfg.vars["Wait for simulation"] and ( ply:GetVelocity():Length() ~= 0 and not ply.simtime_updated ) ) then
        return 
    end

    if not exechack_cc_hvh_obkak.cfg.vars["Aimbot smoothing"] and exechack_cc_hvh_obkak.SkipCommand then return end

    exechack_cc_hvh_obkak.aimingrn = true


    // Knife bot 
    local altfire = false
    local canstab, rightstab = exechack_cc_hvh_obkak.CanStab( ply, bone, ply:Health() )

    if exechack_cc_hvh_obkak.cfg.vars["Knifebot"] and canstab then
        altfire = rightstab
    elseif exechack_cc_hvh_obkak.cfg.vars["Knifebot"] and not canstab then
        return 
    end

    local oldAimAng = aimang
    local finalAngle = aimang

    if exechack_cc_hvh_obkak.cfg.vars["Norecoil"] then
        finalAngle = exechack_cc_hvh_obkak.NoRecoil(finalAngle)
    end

    if exechack_cc_hvh_obkak.cfg.vars["Force seed"] then
        //ded.ForceSeed( cmd )
    end

    if exechack_cc_hvh_obkak.cfg.vars["Nospread"] then
        finalAngle = exechack_cc_hvh_obkak.NoSpread(cmd,finalAngle)
    end

    if exechack_cc_hvh_obkak.cfg.vars["On shot aa"] then
        finalAngle.p = -finalAngle.p - 180
        finalAngle.y = finalAngle.y + 180
    end
    
    if exechack_cc_hvh_obkak.cfg.vars["Facestab"] then
        local angles = ply:EyeAngles()

        finalAngle.y = angles.y
        finalAngle.p = angles.p

        altfire = true
    end

    if exechack_cc_hvh_obkak.cfg.vars["Aimbot smoothing"] then
        local va = cmd:GetViewAngles()
        va.r = 0

        local rat = exechack_cc_hvh_obkak.cfg.vars["Smoothing"] * 100
        local ret = LerpAngle( FrameTime()*rat, va, finalAngle )
        
        finalAngle = ret
    end

    if exechack_cc_hvh_obkak.cfg.vars["Projectile aimbot"] then
        local predTime = math.ceil( ( pLocalPlayer:EyePos() ):DistToSqr( ply:GetPos() ) / 3600 )

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

        finalAngle = ( vec - pLocalPlayer:EyePos() ):Angle()
        finalAngle:Normalize()  
    end

    if exechack_cc_hvh_obkak.cfg.vars["Facestab"] then
        cmd:SetViewAngles( finalAngle )
        ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    elseif exechack_cc_hvh_obkak.cfg.vars["pSilent"] then
        ded.SetContextVector( cmd, finalAngle:Forward(), true )
    else
        cmd:SetViewAngles( finalAngle )
    end

    if backtracking then
        targetTime = exechack_cc_hvh_obkak.btrecords[ply][bttick].simulationtime
        timeOffset = exechack_cc_hvh_obkak.flServerTime - targetTime

        serverArriveTick = exechack_cc_hvh_obkak.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
        diff = serverArriveTick - exechack_cc_hvh_obkak.btrecords[ply][bttick].simulationtime

        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            local tick = math.floor(0.5 + targetTime / flTickInterval)
            ded.SetCommandTick(cmd, tick)
        else
            ded.NetSetConVar("cl_interpolate","1")
            ded.NetSetConVar("cl_interp",tostring(exechack_cc_hvh_obkak.flServerTime - targetTime))
            local tick = math.floor(0.5 + exechack_cc_hvh_obkak.flServerTime / flTickInterval)
            ded.SetCommandTick(cmd, tick - 1)
        end
    elseif ( exechack_cc_hvh_obkak.cfg.vars["Adjust tickcount"] and ply.simtime_updated ) then
        local flSimulationTime = ded.GetSimulationTime( ply:EntIndex() )
        local iTickCount = math.floor(0.5 + flSimulationTime / flTickInterval)

        ded.NetSetConVar( "cl_interpolate", "0" )
        ded.NetSetConVar( "cl_interp", "0" )

        ded.SetCommandTick( cmd, iTickCount )
    end
    
    if exechack_cc_hvh_obkak.cfg.vars["Auto fire"] then
        if string.StartsWith( exechack_cc_hvh_obkak.activeWeaponClass, "m9k_" ) then
            cmd:RemoveKey( IN_SPEED )
        end

        exechack_cc_hvh_obkak.SendPacket = true
        pLocalPlayer.simtime_updated = true
        --ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )

        if exechack_cc_hvh_obkak.cfg.vars["Resolver"] then 
            ply.aimshots = (ply.aimshots or 0) + 1
        end

        local isAutomatic = true

        if exechack_cc_hvh_obkak.activeWeapon.Primary then
            isAutomatic = exechack_cc_hvh_obkak.activeWeapon.Primary.Automatic
        else
            if class == "weapon_pistol" then
                isAutomatic = false
            end
        end


        if altfire or ( exechack_cc_hvh_obkak.cfg.vars["Alt Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
            cmd:AddKey(IN_ATTACK2)
        else
            if isAutomatic or ( exechack_cc_hvh_obkak.cfg.vars["Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
                cmd:AddKey(IN_ATTACK)
            end
        end

        exechack_cc_hvh_obkak.SkipCommand = true 
    end
    return true
end


function exechack_cc_hvh_obkak.autoReload(cmd)
    if !exechack_cc_hvh_obkak.cfg.vars["Auto reload"] then return end

	local wep = pLocalPlayer:GetActiveWeapon()

	if IsValid(wep) then
		if wep.Primary then
			if wep:Clip1() == 0 and wep:GetMaxClip1() > 0 and pLocalPlayer:GetAmmoCount(wep:GetPrimaryAmmoType()) > 0 then
				cmd:AddKey(IN_RELOAD)
			end
		end
	end
end

// adaptive Cstrafe

exechack_cc_hvh_obkak.last_ground_pos = 0
exechack_cc_hvh_obkak.cstrafe_dir = 0

function exechack_cc_hvh_obkak.PredictVelocity( velocity, viewangles, dir, maxspeed, accel )

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
	
	local accelspeed = accel * wishspeed * flTickInterval
	
	if ( accelspeed > addspeed ) then
		accelspeed = addspeed
	end
	
	return velocity + ( wishdir * accelspeed )

end
    
function exechack_cc_hvh_obkak.PredictMovement( viewangles, dir, angle )

	local pm

	local sv_airaccelerate = GetConVarNumber( "sv_airaccelerate" )
	local sv_gravity = GetConVarNumber( "sv_gravity" )
	local maxspeed = pLocalPlayer:GetMaxSpeed()
	local jump_power = pLocalPlayer:GetJumpPower()

	local origin = pLocalPlayer:GetNetworkOrigin()
	local velocity = pLocalPlayer:GetAbsVelocity()
	
	local mins = pLocalPlayer:OBBMins()
	local maxs = pLocalPlayer:OBBMaxs()

    local pticks = math.Round(exechack_cc_hvh_obkak.cfg.vars["CStrafe ticks"])
	
	local on_ground = pLocalPlayer:IsFlagSet( FL_ONGROUND )
	
	for i = 1, pticks do

		viewangles.y = math.NormalizeAngle( math.deg( math.atan2( velocity.y, velocity.x ) ) + angle )

		velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )

		if ( on_ground ) then
		
			velocity.z = jump_power
			velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )
			
		end

		velocity = exechack_cc_hvh_obkak.PredictVelocity( velocity, viewangles, dir, maxspeed, sv_airaccelerate )
		
		local endpos = origin + ( velocity * flTickInterval )

		pm = TraceHull( {
			start = origin,
			endpos = endpos,
			filter = pLocalPlayer,
			maxs = maxs,
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		if ( ( pm.Fraction != 1 && pm.HitNormal.z <= 0.9 ) || pm.AllSolid || pm.StartSolid ) then
			return false
		end
		
		if ( pm.Fraction != 1 ) then
		
			local time_left = flTickInterval

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
					filter = pLocalPlayer,
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
		
		if ( ( exechack_cc_hvh_obkak.last_ground_pos - origin.z ) > math.Round(exechack_cc_hvh_obkak.cfg.vars["CStrafe ground diff"]) ) then
			return false
		end
		
		pm = TraceHull( {
			start =  Vector( origin.x, origin.y, origin.z + 2 ),
			endpos = Vector( origin.x, origin.y, origin.z - 1 ),
			filter = pLocalPlayer,
			maxs = Vector( maxs.x, maxs.y, maxs.z * 0.5 ),
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		on_ground = ( ( pm.Fraction < 1 || pm.AllSolid || pm.StartSolid ) && pm.HitNormal.z >= 0.7 )
		
		velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )
		
		if ( on_ground ) then
			velocity.z = 0
		end


	end

	return true

end

function exechack_cc_hvh_obkak.CircleStrafe( cmd )

	local angle = 0
	
	while ( exechack_cc_hvh_obkak.cstrafe_dir < 2 ) do
	
		angle = 0
		local path_found = false
		local step = ( exechack_cc_hvh_obkak.cstrafe_dir == 1 ) && math.Round(exechack_cc_hvh_obkak.cfg.vars["CStrafe angle step"]) || -math.Round(exechack_cc_hvh_obkak.cfg.vars["CStrafe angle step"])
		
		while ( true ) do
		
			if ( exechack_cc_hvh_obkak.cstrafe_dir == 1 ) then
			
				if ( angle > math.Round(exechack_cc_hvh_obkak.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			else
			
				if ( angle < -math.Round(exechack_cc_hvh_obkak.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			end

			if ( exechack_cc_hvh_obkak.PredictMovement( cmd:GetViewAngles(), exechack_cc_hvh_obkak.cstrafe_dir, angle ) ) then
			
				path_found = true
				break
			
			end

			angle = angle + step
		
		end
		
		if ( path_found ) then
			break
		end
		
		exechack_cc_hvh_obkak.cstrafe_dir = exechack_cc_hvh_obkak.cstrafe_dir + 1
	
	end
	
	if ( exechack_cc_hvh_obkak.cstrafe_dir < 2 ) then
	
		local velocity = pLocalPlayer:GetAbsVelocity()
		local viewangles = cmd:GetViewAngles()
		
		viewangles.y = math.NormalizeAngle( math.deg( math.atan2( velocity.y, velocity.x ) ) + angle )
		
		cmd:SetViewAngles( viewangles )
		cmd:SetSideMove( ( exechack_cc_hvh_obkak.cstrafe_dir == 1 ) && -10000 || 10000 )
	
	else
	
		exechack_cc_hvh_obkak.cstrafe_dir = 0
	
	end

end

do
    local ztick = 0
    local prev_yaw = 0
    local old_yaw = 0.0

    function exechack_cc_hvh_obkak.AutoStrafe( cmd )
        ztick = ztick + 1

        if ( exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Circle strafe"]) and exechack_cc_hvh_obkak.cfg.vars["Circle strafe"] ) then
        
            exechack_cc_hvh_obkak.CircleStrafe( cmd )
    
        elseif ( exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Z Hop"]) and exechack_cc_hvh_obkak.cfg.vars["Z Hop"] ) then
            local handler = ztick / 3.14
            
            cmd:SetSideMove( 5000 * math.sin(handler) )
        elseif exechack_cc_hvh_obkak.cfg.vars["Air strafer"] and exechack_cc_hvh_obkak.cfg.vars["Strafe mode"] == 3 then
    
            local get_velocity_degree = function(velocity)
                local tmp = math.deg(math.atan(30.0 / velocity))
                    
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
            local velocity = pLocalPlayer:GetVelocity()
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
            local viewangles = Angle(exechack_cc_hvh_obkak.SilentAngle.x, exechack_cc_hvh_obkak.SilentAngle.y, exechack_cc_hvh_obkak.SilentAngle.z)
    
            if (forwardmove || sidemove) then
                cmd:SetForwardMove(0)
                cmd:SetSideMove(0)
    
                local turn_angle = math.atan2(-sidemove, forwardmove)
                viewangles.y = viewangles.y + (turn_angle * M_RADPI)
            elseif (forwardmove) then
                cmd:SetForwardMove(0)
            end
    
            local strafe_angle = math.deg(math.atan(15 / velocity:Length2D()))
    
            if (strafe_angle > 90) then
                strafe_angle = 90
            elseif (strafe_angle < 0) then
                strafe_angle = 0
            end
    
            local temp = Vector(0, viewangles.y - old_yaw, 0)
            temp.y = math.NormalizeAngle(temp.y)
    
            local yaw_delta = temp.y
            old_yaw = viewangles.y
    
            local abs_yaw_delta = math.abs(yaw_delta)
    
            if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
                local velocity_angles = velocity:Angle()
    
                temp = Vector(0, viewangles.y - velocity_angles.y, 0)
                temp.y = math.NormalizeAngle(temp.y)
    
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
    
            local normalized_x = math.modf(exechack_cc_hvh_obkak.SilentAngle.x + 180, 360) - 180
            local normalized_y = math.modf(exechack_cc_hvh_obkak.SilentAngle.y + 180, 360) - 180
    
            local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)
    
            if (normalized_x >= 90 || normalized_x <= -90 || exechack_cc_hvh_obkak.SilentAngle.x >= 90 && exechack_cc_hvh_obkak.SilentAngle.x <= 200 || exechack_cc_hvh_obkak.SilentAngle.x <= -90 && exechack_cc_hvh_obkak.SilentAngle.x <= 200) then
                cmd:SetForwardMove(-math.cos(yaw) * speed)
            else
                cmd:SetForwardMove(math.cos(yaw) * speed)
            end
    
            cmd:SetSideMove(math.sin(yaw) * speed)

        elseif exechack_cc_hvh_obkak.cfg.vars["Air strafer"] and exechack_cc_hvh_obkak.cfg.vars["Strafe mode"] == 2 then
            cmd:SetForwardMove(0)

            if pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
                cmd:SetForwardMove(10000)
            else
                cmd:SetForwardMove(5850 / pLocalPlayer:GetVelocity():Length2D())
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && -400 || 400)
            end            
        end
    end
end

/*
    Anti aim

*/

exechack_cc_hvh_obkak.aatarget = nil

function exechack_cc_hvh_obkak.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * flTickInterval
end

function exechack_cc_hvh_obkak.PredictedEyePos()
    return pLocalPlayer:EyePos() + pLocalPlayer:GetVelocity() * flTickInterval
end

function exechack_cc_hvh_obkak.GetBaseYaw()
    if not IsValid( exechack_cc_hvh_obkak.aatarget ) or exechack_cc_hvh_obkak.cfg.vars["Yaw base"] != 2 then
        return exechack_cc_hvh_obkak.SilentAngle.y
    end

    return math.NormalizeAngle( (exechack_cc_hvh_obkak.PredictedPos(exechack_cc_hvh_obkak.aatarget) - exechack_cc_hvh_obkak.PredictedEyePos()):Angle().y )
end

function exechack_cc_hvh_obkak.Freestand(cmd)
	if !IsValid(exechack_cc_hvh_obkak.aatarget) then return false end

	local headpos = pLocalPlayer:GetBonePosition(pLocalPlayer:LookupBone("ValveBiped.Bip01_Head1"))
	if !headpos then return end

	local selfpos = pLocalPlayer:GetPos()
	local headoffset = Vector(selfpos.x, selfpos.y, headpos.z):Distance(headpos) + 5

	local found = true

	local pos = exechack_cc_hvh_obkak.aatarget:WorldToLocal(selfpos)
	local bearing = math.deg(-math.atan2(pos.y, pos.x)) + 180 + 90
	local left, right = bearing - 180 - 90, bearing - 180 + 90

	local function CheckYaw(yaw)
		yaw = math.rad(yaw)
		local x, y = math.sin(yaw), math.cos(yaw)

		local headoffsetvec = Vector(x, y, 0) * headoffset
		headoffsetvec.z = headpos.z - selfpos.z

		local tr = TraceLine({
			start = exechack_cc_hvh_obkak.aatarget:EyePos() + exechack_cc_hvh_obkak.aatarget:GetVelocity() * flTickInterval * 4,
			endpos = selfpos + headoffsetvec,
			filter = exechack_cc_hvh_obkak.aatarget
		})

		return tr.Fraction < 1 and tr.Entity != pLocalPlayer
	end

	local function Normalize(ang) return 360 - ang + 90 end

	local leftcheck, rightcheck = CheckYaw(left), CheckYaw(right)

	left, right = Normalize(left), Normalize(right)

	do
		local headlocal = pLocalPlayer:WorldToLocal(headpos)
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

exechack_cc_hvh_obkak.realAngle = pLocalPlayer:EyeAngles()
exechack_cc_hvh_obkak.inverted = false
exechack_cc_hvh_obkak.oldYaw = 0
exechack_cc_hvh_obkak.SwaySide = 1

local baseyaw = 0

exechack_cc_hvh_obkak.CalcYaw = {
    // Backward
    [1] = function( cmd ) 
        return baseyaw - 178 
    end, 
    // Fake forward
    [2] = function( cmd )
        return exechack_cc_hvh_obkak.SendPacket and baseyaw or baseyaw + 178 
    end, 
    // Legit Delta
    [3] = function( cmd )     
        return exechack_cc_hvh_obkak.SendPacket and baseyaw or baseyaw + ( exechack_cc_hvh_obkak.inverted and 43 or - 43 )
    end,
    // Sideways 
    [4] = function( cmd )     
        local delta = exechack_cc_hvh_obkak.inverted and 89 or -89
        return baseyaw - ( exechack_cc_hvh_obkak.SendPacket and delta or -delta ) 
    end,
    // Half Sideways
    [5] = function( cmd )     
        local delta = exechack_cc_hvh_obkak.inverted and 89 or -89
        return baseyaw - ( exechack_cc_hvh_obkak.SendPacket and delta or 178 ) 
    end,
    // Fake Spin
    [6] = function( cmd )     
        local add = math.NormalizeAngle( CurTime() * exechack_cc_hvh_obkak.cfg.vars["Spin speed"] * 10 )
        return exechack_cc_hvh_obkak.SendPacket and ( exechack_cc_hvh_obkak.inverted and ( baseyaw - 178 ) or add ) or ( exechack_cc_hvh_obkak.inverted and add or ( baseyaw - 178 ) )
    end,
    // LBY Spin
    [7] = function( cmd )     
        return ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) + ( exechack_cc_hvh_obkak.SendPacket and 180 or 0)
    end,
    // LBY Breaker
    [8] = function( cmd )   
        local yaw = baseyaw - 178

        if pLocalPlayer:GetVelocity():Length2D() > 1 then
            yaw = ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) + ( exechack_cc_hvh_obkak.SendPacket and 180 or 0)
        elseif not exechack_cc_hvh_obkak.SendPacket then
            local side = exechack_cc_hvh_obkak.inverted and -1 or 1
            local lbyTarget = ded.GetTargetLowerBodyYaw( pLocalPlayer:EntIndex() )

            if math.abs( math.NormalizeAngle( lbyTarget - exechack_cc_hvh_obkak.oldYaw ) ) < exechack_cc_hvh_obkak.cfg.vars["LBY min delta"] then
                yaw = math.NormalizeAngle( exechack_cc_hvh_obkak.oldYaw + exechack_cc_hvh_obkak.cfg.vars["LBY break delta"] * side)
            else
                yaw = math.NormalizeAngle( ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) - 44 * side )
            end
        end
        
        return yaw
    end,
    // Sin Sway
    [9] = function( cmd )     
        local add = exechack_cc_hvh_obkak.cfg.vars["Sin add"]
        local sin = math.sin( CurTime() ) * exechack_cc_hvh_obkak.cfg.vars["Sin delta"]
        return exechack_cc_hvh_obkak.SendPacket and baseyaw + sin + add or baseyaw - sin - add
    end,
    // Pendulum Sway
    [10] = function( cmd )
        local ct = CurTime()
        local delta = exechack_cc_hvh_obkak.cfg.vars["Sin delta"]
        local ct1 = ( ct % 0.9 )
        local ct2 = ( ct % 2 )

        local x1 = ct2 * math.sin(ct1)
        local y1 = ct2 * -1 * math.cos(ct1)
    
        local x2 = x1 + ct1 * math.sin(ct2)
        local y2 = y1 - ct1 * math.cos(ct2)

        local sin = exechack_cc_hvh_obkak.SendPacket and x2 * delta or y2 * delta
        return baseyaw + sin
    end,
    // Lag Sway
    [11] = function( cmd )     
        local swaySpeed = (exechack_cc_hvh_obkak.fakeLagTicks + 1) / 12 * math.pi
        local swayAmount = math.sin(CurTime() * swaySpeed) * 45
    
        return ( baseyaw - 180 ) + 55 * exechack_cc_hvh_obkak.SwaySide + swayAmount * exechack_cc_hvh_obkak.SwaySide * -1
    end,
    // Fake Jitter
    [12] = function( cmd )     
        local delta = exechack_cc_hvh_obkak.cfg.vars["Jitter delta"]
        
        local a = exechack_cc_hvh_obkak.SendPacket and baseyaw - 178 or baseyaw - 178 + math.random( -delta, delta )
        local b = exechack_cc_hvh_obkak.SendPacket and baseyaw - 178 + math.random( -delta, delta ) or baseyaw - 178

        return exechack_cc_hvh_obkak.inverted and a or b
    end,
    // Kappa Jitter 
    [13] = function( cmd )    
        local delta = exechack_cc_hvh_obkak.cfg.vars["Jitter delta"]

        local a = exechack_cc_hvh_obkak.SendPacket and baseyaw - 178 or baseyaw + ( delta * exechack_cc_hvh_obkak.SwaySide )
        local b = exechack_cc_hvh_obkak.SendPacket and baseyaw + ( delta * exechack_cc_hvh_obkak.SwaySide ) or baseyaw - 178

        return exechack_cc_hvh_obkak.inverted and a or b
    end,
    // Abu Jitter 
    [14] = function( cmd )   
        local ctjit = math.sin( CurTime() * 30 ) * 25

        return ctjit + ( exechack_cc_hvh_obkak.SendPacket and baseyaw - 160 * exechack_cc_hvh_obkak.SwaySide or baseyaw - 160 * -exechack_cc_hvh_obkak.SwaySide )
    end,
    // Satanic spinner 
    [15] = function( cmd ) 
        local side = exechack_cc_hvh_obkak.inverted and 1 or -1
        local satanicvalue = math.sin( CurTime() * 666 ) * 666

        return math.NormalizeAngle( exechack_cc_hvh_obkak.SendPacket and satanicvalue * side or satanicvalue * -side )
    end,
    // Custom aa
    [16] = function( cmd )   
        return exechack_cc_hvh_obkak.SendPacket and baseyaw + exechack_cc_hvh_obkak.cfg.vars["Custom real"] or baseyaw + exechack_cc_hvh_obkak.cfg.vars["Custom fake"]
    end,
    // Hand block 
    [17] = function(cmd)
        local target_angle = baseyaw - 90 
        return target_angle
    end,

    // Low Delta
    [18] = function( cmd )
        local delta = exechack_cc_hvh_obkak.cfg.vars["Low delta value"] or 28  // Можно настроить в конфиге
        local dynamic_delta = math.sin(CurTime() * 2) * (delta / 2)  // Плавное изменение дельты
        
        if exechack_cc_hvh_obkak.SendPacket then
            return baseyaw - (exechack_cc_hvh_obkak.inverted and -delta or delta) + dynamic_delta
        else
            return baseyaw + (exechack_cc_hvh_obkak.inverted and -delta or delta) - dynamic_delta
        end
    end,

    // Desync
    [19] = function( cmd )        
            local send = exechack_cc_hvh_obkak.SendPacket
        local baseyaw = exechack_cc_hvh_obkak.GetBaseYaw()
        local inverter = exechack_cc_hvh_obkak.cfg.vars["Inverter"]

        local jitterRange = exechack_cc_hvh_obkak.cfg.vars["Jitter delta"] or 35
        local jitter = math.random(-jitterRange, jitterRange)

        local realYaw = baseyaw + (inverter and -exechack_cc_hvh_obkak.cfg.vars["Custom real"] or exechack_cc_hvh_obkak.cfg.vars["Custom real"])
        local fakeYaw = baseyaw + (inverter and exechack_cc_hvh_obkak.cfg.vars["Custom fake"] or -exechack_cc_hvh_obkak.cfg.vars["Custom fake"]) + jitter

        local timeSwitch = (CurTime() * 3) % 2 > 1
        if timeSwitch then fakeYaw = fakeYaw + math.random(-20, 20) end

        return send and realYaw or fakeYaw
    end,
    [20] = function( cmd )
        
        local tankaarad = 87
        local a = exechack_cc_hvh_obkak.SendPacket and baseyaw - 178 or baseyaw + ( tankaarad * exechack_cc_hvh_obkak.SwaySide )
        local b = exechack_cc_hvh_obkak.SendPacket and baseyaw + ( tankaarad * exechack_cc_hvh_obkak.SwaySide ) or baseyaw - 178
    
        return exechack_cc_hvh_obkak.inverted and a or b

    end,
    // Fake switch
    [21] = function(cmd)
        if not exechack_cc_hvh_obkak.BruteBreaker then
            exechack_cc_hvh_obkak.BruteBreaker = {
                last_angles = {},
                safe_zones = {},
                next_switch = 0,
                lby_timer = 0,
                chaos_level = 1.0
            }
            for i = 1, #exechack_cc_hvh_obkak.BruteBreaker.avoid_angles-1 do
                local mid = (exechack_cc_hvh_obkak.BruteBreaker.avoid_angles[i] + exechack_cc_hvh_obkak.BruteBreaker.avoid_angles[i+1])/2
                table.insert(exechack_cc_hvh_obkak.BruteBreaker.safe_zones, mid)
            end
        end
        local BB = exechack_cc_hvh_obkak.BruteBreaker
        local REAL_POWER = exechack_cc_hvh_obkak.cfg.vars["Custom fake"] or 35 
        local FAKE_POWER = exechack_cc_hvh_obkak.cfg.vars["Fake switch"] or 60 
        local AVOID_FORCE = exechack_cc_hvh_obkak.cfg.vars["Avoid force"] or 2.5

        local current_time = CurTime()
        local vel = pLocalPlayer:GetVelocity():Length2D()
        local is_moving = vel > 15
        local lby = ded.GetCurrentLowerBodyYaw(pLocalPlayer:EntIndex())

        local function get_safest_angle(base)
            local best_angle = base
            local best_score = -math.huge
            
            for _, angle in ipairs(BB.safe_zones) do
                local test_angle = angle + math.random(-15, 15)
                local score = 0

                for _, brute_angle in ipairs(BB.avoid_angles) do
                    local dist = math.abs(math.NormalizeAngle(test_angle - brute_angle))
                    score = score + math.min(dist, 30) * AVOID_FORCE
                end

                score = score + math.random(0, 20)
                
                if score > best_score then
                    best_score = score
                    best_angle = test_angle
                end
            end
            
            return best_angle
        end

        if current_time > BB.next_switch then
            BB.current_real_angle = get_safest_angle(baseyaw)
            BB.next_switch = current_time + math.Rand(0.35, 0.65)
            BB.chaos_level = 0.8 + math.random() * 0.7
            
            if math.random() < 0.2 then
                BB.current_real_angle = BB.current_real_angle * 1.7
            end
        end

        if current_time > BB.lby_timer then
            BB.lby_offset = math.random() > 0.5 and 110 or -110
            BB.lby_timer = current_time + math.Rand(1.3, 2.1)
        end

        local real_angle = BB.current_real_angle * (is_moving and 0.8 or 1.2)
        if math.random() < 0.4 then
            real_angle = real_angle + lby * 0.3 * BB.chaos_level
        end

        local fake_angle = 0
        if is_moving then
            fake_angle = math.sin(current_time * 18) * FAKE_POWER * 0.7 +
                        math.cos(current_time * 7) * FAKE_POWER * 0.4 +
                        math.random(-5, 5)
        else
            fake_angle = math.sin(current_time * 12) * FAKE_POWER *
                        (exechack_cc_hvh_obkak.inverted and -1 or 1) *
                        BB.chaos_level
        end

        return exechack_cc_hvh_obkak.SendPacket and (baseyaw + real_angle * REAL_POWER/35) or 
            (baseyaw + fake_angle)
    end,
    // Dolphin Mode
    [22] = function(cmd)
        local wave1 = math.sin(CurTime() * 2) * 60
        local wave2 = math.cos(CurTime() * 5) * 20
        local combined = wave1 * 0.7 + wave2 * 0.3
        
        return exechack_cc_hvh_obkak.SendPacket and (baseyaw - combined) or 
            (baseyaw + combined * (exechack_cc_hvh_obkak.inverted and -1 or 1))
    end,
    //Freeze Frame
    [23] = function(cmd)
        if not exechack_cc_hvh_obkak.last_freeze then
            exechack_cc_hvh_obkak.last_freeze = CurTime()
            exechack_cc_hvh_obkak.freeze_angle = baseyaw - 90
        end
        
        if CurTime() - exechack_cc_hvh_obkak.last_freeze > 0.8 then
            exechack_cc_hvh_obkak.last_freeze = CurTime()
            exechack_cc_hvh_obkak.freeze_angle = baseyaw + math.random(-120, 120)
        end
        
        return exechack_cc_hvh_obkak.freeze_angle
    end,
    // Invisible Man
    [24] = function(cmd)
        local real_offset = exechack_cc_hvh_obkak.cfg.vars["Custom real"] or 15
        local fake_angle = math.sin(CurTime() * 3) * 60
        
        if exechack_cc_hvh_obkak.SendPacket then
            cmd:SetViewAngles(Angle(0, baseyaw + real_offset, 0))
            return real_offset
        else
            cmd:SetViewAngles(Angle(0, baseyaw + 179.9, 0))
            return 179.9
        end
    end,
    // Matrix Glitch
    [25] = function(cmd)
        local glitch_factor = math.floor(CurTime() * 10) % 3
        local angles = {
            baseyaw - 90,
            baseyaw + 45,
            baseyaw + 179
        }
        
        return angles[glitch_factor + 1]
    end,

    // Unhittable
    [26] = function(cmd)
        local send = exechack_cc_hvh_obkak.SendPacket
        local baseyaw = exechack_cc_hvh_obkak.GetBaseYaw()
        local inverter = exechack_cc_hvh_obkak.cfg.vars["Inverter"]
        
        local realAngle = exechack_cc_hvh_obkak.cfg.vars["Real Angle"] or 124
        local fakeAngle = exechack_cc_hvh_obkak.cfg.vars["Fake Angle"] or -47
        
        local jitterRange = exechack_cc_hvh_obkak.cfg.vars["Jitter Range"] or 12 
        local jitter = math.random(-jitterRange, jitterRange)
        
        local microTicks = (CurTime() * 100) % 360
        local microJitter = math.sin(microTicks * 0.1) * 15
        
        local timeSwitch = (CurTime() * 3) % 2 > 1
        local timeMod = math.sin(CurTime() * 5) * 20
        
        local realYaw = baseyaw + (inverter and -realAngle or realAngle)
        local fakeYaw = baseyaw + (inverter and fakeAngle or -fakeAngle) + jitter + microJitter

        if timeSwitch then 
            fakeYaw = fakeYaw + timeMod + math.random(-25, 25)
        end

        if math.floor(CurTime() * 3.33) % 2 == 0 then
            fakeYaw = fakeYaw + math.random(-35, 35)
        end

        if exechack_cc_hvh_obkak.cfg.vars["Adaptive Mode"] then
            local enemies = {}
            local myPos = me:GetPos()
            
            for _, ply in pairs(player.GetAll()) do
                if IsValid(ply) and ply ~= me and ply:Alive() then
                    local dist = myPos:Distance(ply:GetPos())
                    if dist < 1500 then
                        local angleToEnemy = (ply:GetPos() - myPos):Angle().yaw
                        table.insert(enemies, {angle = angleToEnemy, dist = dist})
                    end
                end
            end
            
            if #enemies > 0 then
                local avgAngle = 0
                for _, enemy in pairs(enemies) do
                    avgAngle = avgAngle + enemy.angle
                end
                avgAngle = avgAngle / #enemies

                fakeYaw = avgAngle + 180 + math.random(-40, 40)
            end
        end
        
        if exechack_cc_hvh_obkak.cfg.vars["Velocity Factor"] then
            local velocity = me:GetVelocity():Length()
            if velocity > 100 then
                local speedMod = math.min(velocity / 300, 1.5)
                fakeYaw = fakeYaw + (math.random(-30, 30) * speedMod)
            end
        end
        
        realYaw = math.NormalizeAngle(realYaw)
        fakeYaw = math.NormalizeAngle(fakeYaw)
        
        return send and realYaw or fakeYaw
    end,
    // Unhittable2
    [27] = function(cmd)
        local send = exechack_cc_hvh_obkak.SendPacket
        local baseyaw = exechack_cc_hvh_obkak.GetBaseYaw()
        local inverter = exechack_cc_hvh_obkak.cfg.vars["Inverter"]
        local me = LocalPlayer()
        if not IsValid(me) then return baseyaw end

        local realAngle = inverter and -155 or 110
        local fakeBase = inverter and 42 or -45
        local jitterRange = 26
        local microPower = 11
        local oscStrength = 25
        local velocityMod = 30
        local timeSeed = math.floor(CurTime() * 4) % 2 == 0 and 1 or -1

        local jitter = math.random(-jitterRange, jitterRange) * timeSeed

        local time = CurTime()
        local micro = math.sin(time * 3) * microPower + math.cos(time * 6.8) * (microPower * 0.6)

        local osc = math.sin(time * 2.4) * oscStrength

        if exechack_cc_hvh_obkak.cfg.vars["Adaptive Mode"] then
            local myPos = me:GetPos()
            local enemies = {}
            for _, ply in ipairs(player.GetAll()) do
                if IsValid(ply) and ply:Alive() and ply ~= me then
                    local dist = myPos:Distance(ply:GetPos())
                    if dist < 1500 then
                        table.insert(enemies, (ply:GetPos() - myPos):Angle().yaw)
                    end
                end
            end
            if #enemies > 0 then
                local avg = 0
                for _, a in ipairs(enemies) do avg = avg + a end
                avg = avg / #enemies
                fakeBase = (avg - baseyaw + 180 + math.random(-35, 35))
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Velocity Factor"] then
            local vel = me:GetVelocity():Length2D()
            if vel > 120 then
                fakeBase = fakeBase + math.sin(time * 10) * velocityMod
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["AntiAim Pitch"] then
            cmd:SetViewAngles(Angle(89, cmd:GetViewAngles().y, 0))
        end

        if math.floor(time * 3.5) % 3 == 0 then
            fakeBase = fakeBase + math.random(-90, 90)
        end

        if math.floor(time * 2.25) % 2 == 0 then
            fakeBase = fakeBase * -1
        end

        local realYaw = math.NormalizeAngle(baseyaw + realAngle)
        local fakeYaw = math.NormalizeAngle(baseyaw + fakeBase + jitter + micro + osc)

        return send and realYaw or fakeYaw
    end


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
        local cfg = exechack_cc_hvh_obkak.cfg.vars["Pitch"]
        local x = 0

        if cfg <= 5 then return pitches[cfg] end

        if exechack_cc_hvh_obkak.SendPacket then
            pitchflip = not pitchflip
        end
        
        if cfg == 6 then
            x = pitchflip and 180 or -180
        elseif cfg == 7 then
            x = pitchflip and -180 or 271
        elseif cfg == 7 then
            x = exechack_cc_hvh_obkak.SendPacket and 89 or -180
        elseif cfg == 8 then
            x = math.random(-180,95) and math.random(177,180)
        elseif cfg == 9 then
            x = math.random(-180,-55) and math.random(180,55)
        elseif cfg == 10 then
            x = math.random(180,95) and math.random(-180,-95)
        elseif cfg == 11 then
            x = math.random(-180,-95) and math.random(166,179+2)
        elseif cfg == 12 then
            x = math.random(-180,-115) and math.random(177,179+2)
        elseif cfg == 13 then
            x = pitchflip and -180 or 271
        elseif cfg == 14 then    
            x = exechack_cc_hvh_obkak.cfg.vars["Custom pitch"]
        end

        return x
    end


    /*




        elseif cfg == 7 then
            
        elseif cfg == 8 then
            
        elseif cfg == 9 then
            local sin = math.sin( CurTime() ) * 89
            y = exechack_cc_hvh_obkak.SendPacket and baseyaw + sin or baseyaw - sin
        elseif cfg == 10 then
            local side = ded.GetPreviousTick() % 2 == 1

            y = exechack_cc_hvh_obkak.SendPacket and baseyaw - 180 or baseyaw + ( side and -89 or 89 )    
        elseif cfg == 11 then

        elseif cfg == 12 then
            y = baseyaw + ( exechack_cc_hvh_obkak.SendPacket && exechack_cc_hvh_obkak.cfg.vars["Custom fake"] || exechack_cc_hvh_obkak.cfg.vars["Custom real"] )
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

if exechack_cc_hvh_obkak.cfg.vars["Jitter"] == 2 and exechack_cc_hvh_obkak.SendPacket then
            local r = math.random(-45,45)
            local lbydiff = ded.GetTargetLBY(pLocalPlayer:EntIndex()) - ded.GetCurrentLBY(pLocalPlayer:EntIndex())

            if y + r > ded.GetTargetLBY(pLocalPlayer:EntIndex()) then
                y = y + math.random(-lbydiff,lbydiff)
            else
                y = y + r
            end
             
        elseif exechack_cc_hvh_obkak.cfg.vars["Jitter"] == 3 and exechack_cc_hvh_obkak.SendPacket then
            y = y + math.random(ded.GetCurrentLBY(pLocalPlayer:EntIndex()),ded.GetTargetLBY(pLocalPlayer:EntIndex()))
        end

        */
    
    local function micromovement(cmd)
        if !exechack_cc_hvh_obkak.cfg.vars["Micromovement"] then return end
        if !pLocalPlayer:Alive() then return end
        if !pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end
        if cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then return end

        cmd:SetSideMove(mm_side and -15.0 or 15.0)
        mm_side = !mm_side
    end

    local function aacheck(cmd)
        if !exechack_cc_hvh_obkak.cfg.vars["Anti aim"] then return false end
        if cmd:KeyDown(IN_ATTACK) then return false end
        if cmd:KeyDown(IN_USE) then return false end
        if exechack_cc_hvh_obkak.moveType == MOVETYPE_LADDER then return false end
        if exechack_cc_hvh_obkak.moveType == MOVETYPE_NOCLIP then return false end

        if exechack_cc_hvh_obkak.cfg.binds["Anti aim"] != 0 and not exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Anti aim"]) then
            return false
        end

        return true 
    end

    function exechack_cc_hvh_obkak.AntiAim(cmd)
        local freestandsucc, freestandsafe, freestandunsafe 

        if exechack_cc_hvh_obkak.cfg.vars["Freestanding"] then
            freestandsucc, freestandsafe, freestandunsafe = exechack_cc_hvh_obkak.Freestand(cmd)
        end

        if exechack_cc_hvh_obkak.SendPacket then
            exechack_cc_hvh_obkak.SwaySide = exechack_cc_hvh_obkak.SwaySide * -1 
        end

        baseyaw = exechack_cc_hvh_obkak.GetBaseYaw()
        pitch = CalcPitch()
        yaw = exechack_cc_hvh_obkak.CalcYaw[exechack_cc_hvh_obkak.cfg.vars["Yaw"] ](cmd)

        if exechack_cc_hvh_obkak.cfg.vars["Yaw randomisation"] then
            yaw = yaw + math.random( -0.9, 0.9 ) 
        end 

        if freestandsucc then
            yaw = exechack_cc_hvh_obkak.SendPacket and freestandunsafe or freestandsafe
        end

        if aacheck(cmd) then
            local pyAngle = Angle(pitch,yaw,0)

            micromovement(cmd)

            cmd:SetViewAngles(pyAngle)
            exechack_cc_hvh_obkak.oldYaw = pyAngle.y
        end
    end
end

/*
    Fake lag  
*/
exechack_cc_hvh_obkak.fakeLagTicks = 0
exechack_cc_hvh_obkak.fakeLagfactor = 0
exechack_cc_hvh_obkak.chokedTicks = 0

exechack_cc_hvh_obkak.peeked = false 
exechack_cc_hvh_obkak.peeking = false 

function exechack_cc_hvh_obkak.FakeLagOnPeek()
    exechack_cc_hvh_obkak.fakeLagTicks = 21 - exechack_cc_hvh_obkak.chokedTicks - 1 

    if exechack_cc_hvh_obkak.chokedTicks >= 20 then
        exechack_cc_hvh_obkak.peeked = true
		exechack_cc_hvh_obkak.peeking = false
		exechack_cc_hvh_obkak.SendPacket = true
        pLocalPlayer.simtime_updated = true
        --ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
		return
    end
end


if exechack_cc_hvh_obkak.cfg.vars["Lag fix"] then
    if exechack_cc_hvh_obkak.cfg.vars["Backshoot"] then
        local targetTime = ded.GetSimulationTime( ply:EntIndex() )
        local timeOffset = ded.GetServerTime(cmd) - targetTime

        -- Check if we can backtrack without cl_interp
        local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
        local diff = serverArriveTick - ply.aimshots.sw_backshoot_data.simTime
        if diff < 0.2 then 
            local tick = math.floor(0.5 + (targetTime + exechack_cc_hvh_obkak.GetLerpTime()) / flTickInterval)
            ded.SetCommandTick(cmd, tick)
        else
            ded.SetTargetInterp(ded.GetServerTime(cmd) - targetTime)

            local tick = math.floor(0.5 + ded.GetServerTime(cmd) / flTickInterval)
            ded.SetCommandTick(cmd, tick - 1)
        end
    else
        local simTime = ded.GetSimulationTime(ply:EntIndex())
        local tick = math.floor(0.5 + (simTime + exechack_cc_hvh_obkak.GetLerpTime()) / flTickInterval)
        ded.SetCommandTick(cmd, tick)
    end
end


function exechack_cc_hvh_obkak.WarpOnPeek()
	ded.StartShifting( true )

	exechack_cc_hvh_obkak.peeked = true
	exechack_cc_hvh_obkak.peeking = false
end

function exechack_cc_hvh_obkak.CheckPeeking()
	local plys

	for extr = 1, 8 do
        plys = exechack_cc_hvh_obkak.GetSortedPlayers( 1, extr, 1, true ) 
		if plys then break end
	end

	if plys and !exechack_cc_hvh_obkak.peeking and !exechack_cc_hvh_obkak.peeked then
		exechack_cc_hvh_obkak.peeking = true
		exechack_cc_hvh_obkak.peeked = false
	elseif !plys then
		exechack_cc_hvh_obkak.peeking = false
		exechack_cc_hvh_obkak.peeked = false
	end

	if exechack_cc_hvh_obkak.peeking and !exechack_cc_hvh_obkak.peeked then
		if !ded.GetIsShifting() and ded.GetCurrentCharge() >= exechack_cc_hvh_obkak.cfg.vars["Shift ticks"] and exechack_cc_hvh_obkak.cfg.vars["Warp on peek"] then
			exechack_cc_hvh_obkak.WarpOnPeek()
        elseif exechack_cc_hvh_obkak.cfg.vars["Freeze on peek"] then
            ded.SetOutSequenceNr( ded.GetOutSequenceNr() + exechack_cc_hvh_obkak.maxFreezeTicks - 1 ) 
		//elseif exechack_cc_hvh_obkak.cfg.vars["Fake lag options-On peek"] then
		//	exechack_cc_hvh_obkak.FakeLagOnPeek()
		end
	end
end




do
    
    local function shouldlag(cmd)
        if not exechack_cc_hvh_obkak.cfg.vars["Fake lag"] then return false end
        if not pLocalPlayer:Alive() then return false end
        if exechack_cc_hvh_obkak.cfg.vars["Fakelag comp"] == 1 and ded.GetCurrentCharge() > 0 then return false end
        if exechack_cc_hvh_obkak.cfg.vars["Fake lag options-Disable on ladder"] and exechack_cc_hvh_obkak.moveType == MOVETYPE_LADDER then return false end
        if exechack_cc_hvh_obkak.cfg.vars["Fake lag options-Disable in attack"] and cmd:KeyDown(IN_ATTACK) then return false end

        if exechack_cc_hvh_obkak.cfg.vars["Allah fly"] and not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
            return false
        end

        return true
    end

    function exechack_cc_hvh_obkak.FakeLag(cmd)
        local factor = math.Round(exechack_cc_hvh_obkak.cfg.vars["Lag limit"])

        if exechack_cc_hvh_obkak.cfg.vars["Fake lag options-Randomise"] then 
            factor =  math.random(exechack_cc_hvh_obkak.cfg.vars["Lag randomisation"],factor) 
        end

        local velocity = pLocalPlayer:GetVelocity():Length2D()
        local pertick = velocity * flTickInterval
        local adaptive_factor = math.Clamp(math.ceil(64 / pertick),1,factor)

        if exechack_cc_hvh_obkak.cfg.vars["Lag mode"] == 1 or exechack_cc_hvh_obkak.cfg.vars["Lag mode"] == 3 then
            exechack_cc_hvh_obkak.fakeLagfactor = factor
        elseif exechack_cc_hvh_obkak.cfg.vars["Lag mode"] == 2 then
            exechack_cc_hvh_obkak.fakeLagfactor = adaptive_factor
        end

        if exechack_cc_hvh_obkak.cfg.vars["Allah walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["allahwalk"]) then
            exechack_cc_hvh_obkak.fakeLagfactor = 21
        end

        //if exechack_cc_hvh_obkak.cfg.vars["Fakelag comp"] == 2 and ded.GetCurrentCharge() > 0 then 
        //    local nfactor = exechack_cc_hvh_obkak.fakeLagfactor - ded.GetMaxShiftTicks() - 1
        //    exechack_cc_hvh_obkak.fakeLagfactor = math.Clamp( nfactor, 0, 21 )
        //end

        if shouldlag(cmd) then
            exechack_cc_hvh_obkak.SendPacket = false

            if exechack_cc_hvh_obkak.fakeLagTicks <= 0 then
                exechack_cc_hvh_obkak.fakeLagTicks = exechack_cc_hvh_obkak.fakeLagfactor
                exechack_cc_hvh_obkak.SendPacket = true
                pLocalPlayer.simtime_updated = true
               --ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
            else
                exechack_cc_hvh_obkak.fakeLagTicks = exechack_cc_hvh_obkak.fakeLagTicks - 1
            end

        else
            if exechack_cc_hvh_obkak.fakeLagfactor > 0 then exechack_cc_hvh_obkak.fakeLagfactor = 0 end
            exechack_cc_hvh_obkak.SendPacket = true
            pLocalPlayer.simtime_updated = true
            --ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
        end
    end
end

function exechack_cc_hvh_obkak.ClampMovementSpeed(cmd, speed)
	local final_speed = speed;

	local squirt = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

	if (squirt > speed) then
		local squirt2 = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

		local cock1 = cmd:GetForwardMove() / squirt2;
		local cock2 = cmd:GetSideMove() / squirt2;

		local Velocity = pLocalPlayer:GetVelocity():Length2D();

		if (final_speed + 1.0 <= Velocity) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
		else
			cmd:SetForwardMove(cock1 * final_speed)
			cmd:SetSideMove(cock2 * final_speed)
        end
    end
end

function exechack_cc_hvh_obkak.FastWalk( cmd )
    if not exechack_cc_hvh_obkak.cfg.vars["Ground strafer"] then return end 
    if math.abs(cmd:GetSideMove()) > 1 or math.abs(cmd:GetForwardMove()) < 1 then return end 
    if not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end

    if exechack_cc_hvh_obkak.moveType == MOVETYPE_NOCLIP or exechack_cc_hvh_obkak.moveType == MOVETYPE_LADDER then return end

    local waterLevel = pLocalPlayer:WaterLevel()

    if waterLevel >= 2 then return end
    
	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function exechack_cc_hvh_obkak.validMoveType()
    return exechack_cc_hvh_obkak.moveType != MOVETYPE_LADDER and exechack_cc_hvh_obkak.moveType != MOVETYPE_NOCLIP and exechack_cc_hvh_obkak.moveType != MOVETYPE_OBSERVER 
end

function exechack_cc_hvh_obkak.isMoving(cmd)
    if not cmd then
        return false
    end

    return exechack_cc_hvh_obkak.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

function exechack_cc_hvh_obkak.Stop(cmd)
    if exechack_cc_hvh_obkak.validMoveType() and pLocalPlayer:IsFlagSet( FL_ONGROUND ) then

        local moving = exechack_cc_hvh_obkak.isMoving(cmd)

        if not moving then

            local vel = pLocalPlayer:GetVelocity()
            local dir = vel:Angle()
                
            dir.yaw = exechack_cc_hvh_obkak.SilentAngle.y - dir.yaw
                
            local newmove = dir:Forward() * vel:Length2D()
        
            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

// Slidewalk 

function exechack_cc_hvh_obkak.SlideWalk( cmd )
    local ticksToStop = exechack_cc_hvh_obkak.fakeLagfactor





end








// Auto peak 

exechack_cc_hvh_obkak.startedPeeking = false 
exechack_cc_hvh_obkak.needToMoveBack = false
exechack_cc_hvh_obkak.startPeekPosition = Vector(0,0,0)

function exechack_cc_hvh_obkak.MoveTo( cmd, pos )
    local ang = ( pos - pLocalPlayer:GetPos() ):Angle().y

    cmd:SetForwardMove(1000)
    cmd:SetSideMove(0)

    cmd:AddKey(IN_SPEED)

    exechack_cc_hvh_obkak.MovementFix( cmd, ang )
end

function exechack_cc_hvh_obkak.checkAutopeak( cmd )
    if exechack_cc_hvh_obkak.startedPeeking and cmd:KeyDown(IN_ATTACK) then 
        exechack_cc_hvh_obkak.needToMoveBack = true
    elseif !exechack_cc_hvh_obkak.startedPeeking and !cmd:KeyDown(IN_ATTACK) then
        exechack_cc_hvh_obkak.needToMoveBack = false
    end  
end

do
    local colorA = Color( 235, 75, 75 )
    local colorB = Color( 75, 235, 75 )

    local apmat = Material( "gui/npc.png" )

    local nullangle = Angle(0,0,0)

    function exechack_cc_hvh_obkak.drawAutopeak()
        local col = exechack_cc_hvh_obkak.needToMoveBack and colorA or colorB
    
        cam.Start3D2D( exechack_cc_hvh_obkak.startPeekPosition, nullangle, 0.5 )
            cam.IgnoreZ( true )

            surface.SetDrawColor( col )
            surface.SetMaterial( apmat )
            surface.DrawTexturedRect( -32, -32, 64, 64 )

            cam.IgnoreZ( false )
        cam.End3D2D()
    end
end

function exechack_cc_hvh_obkak.autopeakThink()
    if exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Auto peak"]) then
        if not exechack_cc_hvh_obkak.startedPeeking then
            exechack_cc_hvh_obkak.startPeekPosition = pLocalPlayer:GetPos()     
        end

        exechack_cc_hvh_obkak.startedPeeking = true
    else
        exechack_cc_hvh_obkak.startedPeeking = false
    end
end








// Sequence Manipulation 

exechack_cc_hvh_obkak.freezedTicks = 0
exechack_cc_hvh_obkak.maxFreezeTicks = math.Round( 1 / flTickInterval ) 
function exechack_cc_hvh_obkak.AnimationFreezer()
    if not exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Animation freezer"] ) then return end

    if exechack_cc_hvh_obkak.freezedTicks < exechack_cc_hvh_obkak.maxFreezeTicks then
        ded.SetOutSequenceNr( ded.GetOutSequenceNr() + exechack_cc_hvh_obkak.maxFreezeTicks - 1 ) 

        exechack_cc_hvh_obkak.freezedTicks = exechack_cc_hvh_obkak.freezedTicks + 1
    else
        exechack_cc_hvh_obkak.freezedTicks = 0
    end
end

exechack_cc_hvh_obkak.seqshit = false
function exechack_cc_hvh_obkak.SequenceShit(cmd)
    if not exechack_cc_hvh_obkak.cfg.vars["Sequence manip"] or not exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Sequence manip"]) then
        
        if exechack_cc_hvh_obkak.seqshit then
            exechack_cc_hvh_obkak.seqshit = false 
        end

        return 
    end

    local amt = exechack_cc_hvh_obkak.cfg.vars["Sequence min random"] and math.random(exechack_cc_hvh_obkak.cfg.vars["Sequence min"],exechack_cc_hvh_obkak.cfg.vars["OutSequence"]) or exechack_cc_hvh_obkak.cfg.vars["OutSequence"] 

    exechack_cc_hvh_obkak.seqshit = true
    exechack_cc_hvh_obkak.SendPacket = true
    ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)
end

// Handjob ( arm breaker )
 
function exechack_cc_hvh_obkak.PerformHandjob( cmd )
    local mode = exechack_cc_hvh_obkak.cfg.vars["Handjob mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math.random(0, 1) == 0 
    end

    ded.SetTyping(cmd, shouldjerk)
end 

// create move hook 

exechack_cc_hvh_obkak.norf = {
    ["laserjetpack"] = true,
    ["weapon_physgun"] = true,
}

exechack_cc_hvh_obkak.vapecd = false
exechack_cc_hvh_obkak.tyaga = 0
exechack_cc_hvh_obkak.maxvape = 5 * math.floor(1 / (engine.TickInterval() or 0.015))
exechack_cc_hvh_obkak.hoppin = false
local ic = false

exechack_cc_hvh_obkak.slams = {}

function exechack_cc_hvh_obkak.OnEntityCreated(ent)
    if ent:GetClass() == "npc_satchel" and ent:GetOwner() == pLocalPlayer then 
        exechack_cc_hvh_obkak.slams[ #exechack_cc_hvh_obkak.slams + 1 ] = ent
    end
end





local bWasOnGround = false 


function exechack_cc_hvh_obkak.CreateMove(cmd)
    exechack_cc_hvh_obkak.DoSilentAngleUpdate( cmd )

    exechack_cc_hvh_obkak.aimingrn = false

    //if ( ded.GetChokedPackets() > 14 ) then ded.SetChokedPackets( 14 ) end

    if cmd:CommandNumber() == 0 then 
        return 
    end

    exechack_cc_hvh_obkak.flServerTime = ded.GetServerTime( cmd )

    //if ded.GetIsShifting() then exechack_cc_hvh_obkak.shiftedTicks = exechack_cc_hvh_obkak.shiftedTicks + 1 end

    local w = pLocalPlayer:GetActiveWeapon()
    exechack_cc_hvh_obkak.activeWeapon       = IsValid( w ) and w or false
    exechack_cc_hvh_obkak.activeWeaponClass  = IsValid( w ) and w:GetClass() or false 
    exechack_cc_hvh_obkak.moveType           = pLocalPlayer:GetMoveType() 

    //if exechack_cc_hvh_obkak.cfg.vars["Passive recharge"] and ded.GetCurrentCharge() < ded.GetMaxShiftTicks() and not pLocalPlayer:Alive() then
    //    ded.SetReloadKeyPressed( true )
    //end


    if exechack_cc_hvh_obkak.cfg.vars["Silent aim"] then cmd:SetViewAngles(exechack_cc_hvh_obkak.SilentAngle) end

    //if ded.GetIsShifting() then
        //  ded.AdjustTickbase()
    //    print("shifting")
    //end

    if exechack_cc_hvh_obkak.cfg.vars["Flashlight spam"] and input.IsKeyDown( KEY_F ) then
        cmd:SetImpulse(100)
    end

    if exechack_cc_hvh_obkak.cfg.vars["Auto Vape"] then
        if cmd:KeyDown( IN_ATTACK ) then
            if exechack_cc_hvh_obkak.tyaga >= exechack_cc_hvh_obkak.maxvape then
                cmd:RemoveKey( IN_ATTACK )
                exechack_cc_hvh_obkak.tyaga = 0
            elseif exechack_cc_hvh_obkak.tyaga < exechack_cc_hvh_obkak.maxvape then
                exechack_cc_hvh_obkak.tyaga = exechack_cc_hvh_obkak.tyaga + 1 
            end
        else
            exechack_cc_hvh_obkak.tyaga = 0
        end
    end 


    if exechack_cc_hvh_obkak.vapecd then 
        exechack_cc_hvh_obkak.vapecd = false 
        cmd:RemoveKey( IN_ATTACK2 ) 
    elseif exechack_cc_hvh_obkak.cfg.vars["Vape spam"] and exechack_cc_hvh_obkak.activeWeapon and not exechack_cc_hvh_obkak.vapecd and string.StartsWith( exechack_cc_hvh_obkak.activeWeaponClass, "weapon_vape" ) then
        cmd:AddKey( IN_ATTACK2 )
        exechack_cc_hvh_obkak.vapecd = true
    end   

    if exechack_cc_hvh_obkak.cfg.vars["Handjob"] then
        exechack_cc_hvh_obkak.PerformHandjob( cmd )
    end 

    //if exechack_cc_hvh_obkak.cfg.vars["Fake latency"] then
    //    local amt = exechack_cc_hvh_obkak.cfg.vars["Max latency"]
    //    ded.SetInSequenceNr(ded.GetInSequenceNr() - amt)
    //end

    if exechack_cc_hvh_obkak.SkipCommand then 
        cmd:RemoveKey( IN_ATTACK ) 
    
        exechack_cc_hvh_obkak.SkipCommand = !exechack_cc_hvh_obkak.SkipCommand 
    end

    if ( pLocalPlayer:IsFlagSet( FL_ONGROUND ) ) then
		exechack_cc_hvh_obkak.last_ground_pos = pLocalPlayer:GetNetworkOrigin().z
	end

    if exechack_cc_hvh_obkak.cfg.vars["Animation freezer"] then exechack_cc_hvh_obkak.AnimationFreezer() end
    
	exechack_cc_hvh_obkak.SequenceShit(cmd)

    if not exechack_cc_hvh_obkak.seqshit then
        exechack_cc_hvh_obkak.FakeLag(cmd)

        if exechack_cc_hvh_obkak.cfg.vars["Allah walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["allahwalk"]) then
            
            if exechack_cc_hvh_obkak.fakeLagTicks != 20 then
                exechack_cc_hvh_obkak.ClampMovementSpeed(cmd, 0)
            else
                exechack_cc_hvh_obkak.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            end

            //if(exechack_cc_hvh_obkak.fakeLagTicks <= 20) then
            //    exechack_cc_hvh_obkak.ClampMovementSpeed(cmd, 0)
            //    exechack_cc_hvh_obkak.Stop(cmd)
                //pLocalPlayer:SetPoseParameter("move_x", 0)
	            //pLocalPlayer:SetPoseParameter("move_y", 0)
            //else
             //   exechack_cc_hvh_obkak.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            //end

            --print(exechack_cc_hvh_obkak.fakeLagTicks,pLocalPlayer:GetVelocity():Length2D())
        end
    end

    if exechack_cc_hvh_obkak.cfg.vars["Fake lag options-On peek"] or exechack_cc_hvh_obkak.cfg.vars["Warp on peek"] or exechack_cc_hvh_obkak.cfg.vars["Freeze on peek"] then
        exechack_cc_hvh_obkak.CheckPeeking()
    end
    
    // Movement
    
    exechack_cc_hvh_obkak.FastWalk( cmd )

    if exechack_cc_hvh_obkak.cfg.vars["Sprint"] then cmd:AddKey(IN_SPEED) end

    exechack_cc_hvh_obkak.hoppin = false

    if pLocalPlayer:GetMoveType() != MOVETYPE_NOCLIP and pLocalPlayer:GetMoveType() != MOVETYPE_LADDER and pLocalPlayer:GetMoveType() != MOVETYPE_OBSERVER then
        if ( cmd:KeyDown( IN_JUMP ) ) then
            local bIsOnGround = pLocalPlayer:IsFlagSet( FL_ONGROUND )

            if ( not bIsOnGround or bWasOnGround ) then
                cmd:RemoveKey( IN_JUMP )

                bWasOnGround = false 

                if ( not bWasOnGround ) then
                    exechack_cc_hvh_obkak.AutoStrafe( cmd )
                end
            else
                bWasOnGround = true
            end

            exechack_cc_hvh_obkak.hoppin = true
        end
    end
    
	if exechack_cc_hvh_obkak.cfg.vars["Fast stop"] then
        exechack_cc_hvh_obkak.Stop(cmd)
    end

    if exechack_cc_hvh_obkak.cfg.vars["Water jump"] and pLocalPlayer:WaterLevel() > 1 then
        cmd:AddKey( IN_JUMP )

    elseif exechack_cc_hvh_obkak.cfg.vars["Jesus lag"] and exechack_cc_hvh_obkak.SendPacket and pLocalPlayer:WaterLevel() == 1 then
        cmd:AddKey( IN_DUCK )
    end

    if exechack_cc_hvh_obkak.cfg.vars["Fake duck"] and exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Fake duck"]) then
        if exechack_cc_hvh_obkak.fakeLagTicks > (exechack_cc_hvh_obkak.fakeLagfactor / 2) then
            cmd:AddKey(IN_DUCK)
        else
            cmd:RemoveKey(IN_DUCK)
        end
    end

    exechack_cc_hvh_obkak.targetVector = false

	ded.StartPrediction(cmd)
        local wish_yaw = exechack_cc_hvh_obkak.SilentAngle.y 

        if ( exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Circle strafe"]) and exechack_cc_hvh_obkak.cfg.vars["Circle strafe"] ) then
            wish_yaw = cmd:GetViewAngles().y
        end

        if exechack_cc_hvh_obkak.cfg.vars["Crossbow prediction"] and exechack_cc_hvh_obkak.activeWeaponClass == "weapon_crossbow" then
            exechack_cc_hvh_obkak.CrossbowPred( cmd )
        elseif exechack_cc_hvh_obkak.cfg.vars["Prop aimbot"] then
            exechack_cc_hvh_obkak.PropAim(cmd)
        else
            if not exechack_cc_hvh_obkak.Aim(cmd) and cmd:KeyDown(IN_ATTACK) then
                local va = Angle( exechack_cc_hvh_obkak.SilentAngle.p, exechack_cc_hvh_obkak.SilentAngle.y, 0 )

                if exechack_cc_hvh_obkak.cfg.vars["Norecoil"] then
                    va = exechack_cc_hvh_obkak.NoRecoil(va)
                end

                if exechack_cc_hvh_obkak.cfg.vars["Nospread"] then
                    va = exechack_cc_hvh_obkak.NoSpread(cmd,va)
                end

                cmd:SetViewAngles( va )
                
            end
        end
        
        if exechack_cc_hvh_obkak.cfg.vars["Silent aim"] then
            exechack_cc_hvh_obkak.MovementFix( cmd, wish_yaw )
        end

    ded.FinishPrediction() 

    if exechack_cc_hvh_obkak.cfg.vars["Trigger bot"] and exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Trigger bot"] ) then
        local tr = pLocalPlayer:GetEyeTrace().Entity 
        
        if tr and tr:IsPlayer() then
            cmd:AddKey( IN_ATTACK )
        end
    end

    if exechack_cc_hvh_obkak.cfg.vars["Double tap"] and exechack_cc_hvh_obkak.cfg.vars["Tickbase shift"] and cmd:KeyDown( IN_ATTACK ) then
        //exechack_cc_hvh_obkak.shiftedTicks = 0
        ded.StartShifting( true )
    end

    if exechack_cc_hvh_obkak.cfg.vars["Auto detonator"] and #exechack_cc_hvh_obkak.slams > 0 then
        local d = exechack_cc_hvh_obkak.cfg.vars["AutoD distance"]
        d = d * d 

        local plys = player.GetAll()

        for jjj = 1, #plys do
            if plys[ jjj ] == pLocalPlayer then continue end
            
            for k, v in pairs(exechack_cc_hvh_obkak.slams) do
                if not IsValid(v) then exechack_cc_hvh_obkak.slams[k] = nil continue end
    
                local pos = v:GetPos()
    
                if pos:DistToSqr( plys[ jjj ]:GetPos() + plys[ jjj ]:GetVelocity() * ( flTickInterval * 4 ) ) < d then
                    cmd:AddKey( IN_ATTACK2 )
                    break
                end
            end
        end
    end

    if exechack_cc_hvh_obkak.cfg.vars["Auto peak"] then
        local ppos = exechack_cc_hvh_obkak.startPeekPosition
        local pposd = pLocalPlayer:GetPos():DistToSqr(ppos)

        if exechack_cc_hvh_obkak.needToMoveBack and pposd < 1024 then //or exechack_cc_hvh_obkak.IsMovementKeysDown( cmd )
            exechack_cc_hvh_obkak.needToMoveBack = false
        end

        if exechack_cc_hvh_obkak.startedPeeking then
            //if not exechack_cc_hvh_obkak.IsMovementKeysDown( cmd ) then
            //    exechack_cc_hvh_obkak.needToMoveBack = true
            //end

            if exechack_cc_hvh_obkak.needToMoveBack then
                exechack_cc_hvh_obkak.MoveTo( cmd, ppos )

                if exechack_cc_hvh_obkak.cfg.vars["Auto peak tp"] and exechack_cc_hvh_obkak.cfg.vars["Tickbase shift"] then
                    //exechack_cc_hvh_obkak.shiftedTicks = 0
                    ded.StartShifting( true )
                end
            end
        end

        exechack_cc_hvh_obkak.checkAutopeak( cmd )
    end

    exechack_cc_hvh_obkak.autoReload(cmd)

    if exechack_cc_hvh_obkak.cfg.vars["Use spam"] then
        if cmd:KeyDown(IN_USE) then
            cmd:RemoveKey(IN_USE)
        else
            cmd:AddKey(IN_USE)
        end
    end

    if exechack_cc_hvh_obkak.cfg.vars["Auto GTA"] then
        local tr = pLocalPlayer:GetEyeTrace().Entity

        if IsValid( tr ) and tr:IsVehicle() then
            cmd:AddKey(IN_USE)
        end
    end

    if exechack_cc_hvh_obkak.cfg.vars["Ghost follower"] then
        local tar = player.GetBySteamID( exechack_cc_hvh_obkak.cfg.vars["GFID"] )

        if IsValid( tar ) then 
            local tang = ( tar:GetPos() - pLocalPlayer:EyePos() ):Angle()

            cmd:ClearMovement()
            cmd:ClearButtons()

            cmd:SetForwardMove( 10000 )
            cmd:SetSideMove(0)

            cmd:AddKey(IN_SPEED)

            cmd:SetViewAngles( tang )
            exechack_cc_hvh_obkak.MovementFix( cmd, tang.y )
        end
    end

    if exechack_cc_hvh_obkak.cfg.vars["Air lag duck"] and exechack_cc_hvh_obkak.SendPacket then
        local startPosUnducked = pLocalPlayer:GetPos()
        local isDucking = bit.band(pLocalPlayer:GetFlags(), FL_DUCKING) != 0
        if isDucking then
            startPosUnducked.z = startPosUnducked.z - (72 - 36)
        end

        ded.StartSimulation( pLocalPlayer:EntIndex() )

        local shouldduck = true 

        for i = 1, 4 do
            ded.SimulateTick()

            local simData = ded.GetSimulationData()

            local maxs = pLocalPlayer:OBBMaxs()
            maxs.z = 72 

            if isDucking then
                simData.m_vecAbsOrigin.z = simData.m_vecAbsOrigin.z - (72 - 36)
            end

            local trace = TraceHull({
                start = startPosUnducked,
                endpos = simData.m_vecAbsOrigin,
                mins = pLocalPlayer:OBBMins(),
                maxs = maxs,
                filter = pLocalPlayer,
                mask = MASK_PLAYERSOLID
            })

            if pLocalPlayer:IsOnGround() and trace.Hit then
                shouldduck = false 
                break
            end
        end

        ded.FinishSimulation()

        if shouldduck and !pLocalPlayer:IsFlagSet( FL_ONGROUND ) then 
            cmd:AddKey( IN_DUCK )   
        end
    end

    if exechack_cc_hvh_obkak.fcenabled then
        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetViewAngles(exechack_cc_hvh_obkak.fcangles)
    end

    /*if exechack_cc_hvh_obkak.cfg.vars["Dodge projectiles"] and ded.GetCurrentCharge() >= ded.GetMaxShiftTicks() and not ded.GetIsShifting() then
        local entitys = ents.GetAll()

        for i = 1, #entitys do
            local v = entitys[ i ]

            if v:GetClass() != "crossbow_bolt" then continue end 

            local mypos = pLocalPlayer:GetPos() + pLocalPlayer:GetVelocity() * flTickInterval 
            local entpos = v:GetPos() + ( v:GetAngles():Forward() * 3500 ) * flTickInterval

            if mypos:DistToSqr( entpos ) > 320 then
                cmd:ClearMovement()
                cmd:ClearButtons()

                cmd:AddKey( IN_SPEED )
                cmd:SetSideMove( 10000 )
                ded.StartShifting( true )
            end
        end
    end*/

    if exechack_cc_hvh_obkak.SendPacket then
        exechack_cc_hvh_obkak.chokedTicks = 0 
    else
        exechack_cc_hvh_obkak.chokedTicks = exechack_cc_hvh_obkak.chokedTicks + 1
    end

    if not exechack_cc_hvh_obkak.cfg.vars["Silent aim"] then exechack_cc_hvh_obkak.SilentAngle = cmd:GetViewAngles() end

    ded.SetBSendPacket( exechack_cc_hvh_obkak.SendPacket )

    if exechack_cc_hvh_obkak.cfg.vars["Lag mode"] == 3 and exechack_cc_hvh_obkak.SendPacket then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 8)
    end
end 
 
/* 
    Render Scene / Anti screengrab 
*/
exechack_cc_hvh_obkak.UnSafeFrame = false
exechack_cc_hvh_obkak.renderTarget = GetRenderTarget( "YaPidoras" .. os.time(), screenWidth, screenHeight )

do
    local oldsky, oldskycolor, oldwallcolor = exechack_cc_hvh_obkak.cfg.vars["Custom sky"], exechack_cc_hvh_obkak.cfg.vars["Sky color"], exechack_cc_hvh_obkak.cfg.vars["Wall color"]
    local oldskyclr, oldwallclr = exechack_cc_hvh_obkak.cfg.colors["Sky color"], exechack_cc_hvh_obkak.cfg.colors["Wall color"]

    local worldcollerp = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Wall color"] )
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
        local cfg = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Sky color"] )
        local vector = setcolor and Vector( cfg.r/255, cfg.g/255, cfg.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, 6 do
            skymat[i]:SetVector( "$color", vector )
        end
    end

    local function setWallColor( setcolor )
        local cfg = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Wall color"] )
        worldcollerp = exechack_cc_hvh_obkak.ColorLerp( worldcollerp, cfg )
        local vector = setcolor and Vector( worldcollerp.r/255, worldcollerp.g/255, worldcollerp.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, #worldmats do
            local value = worldmats[i]

            Material( value ):SetVector( "$color", vector )
            Material( value ):SetFloat( "$alpha", setcolor and (cfg.a / 255) or 255 )
        end
    end

    function exechack_cc_hvh_obkak.RenderScene()

        local newname, newcolor, newcolor2 = exechack_cc_hvh_obkak.cfg.vars["Custom sky"], exechack_cc_hvh_obkak.cfg.vars["Sky color"], exechack_cc_hvh_obkak.cfg.vars["Wall color"]
        local newskyclr, newwallclr = exechack_cc_hvh_obkak.cfg.colors["Sky color"],exechack_cc_hvh_obkak.cfg.colors["Wall color"]
        
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

        if ( !gui.IsConsoleVisible() && !gui.IsGameUIVisible() ) || exechack_cc_hvh_obkak.UnSafeFrame then
            local view = {
                x = 0,
                y = 0,
                w = screenWidth,
                h = screenHeight,
                dopostprocess = true,
                origin = vOrigin,
                angles = vAngle,
                fov = vFOV,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            }
         
            render.RenderView( view )
            render.CopyTexture( nil, exechack_cc_hvh_obkak.renderTarget )
         
            cam.Start2D()
                hook.Run( "Ungrabbable2D" )
            cam.End2D()

            cam.Start3D()
                hook.Run( "Ungrabbable3D" )
            cam.End3D()
    
            render.SetRenderTarget( exechack_cc_hvh_obkak.renderTarget )
         
            return true
        end
    end

end

function exechack_cc_hvh_obkak.PreScreenGrab()
    if exechack_cc_hvh_obkak.UnSafeFrame then return end
	exechack_cc_hvh_obkak.UnSafeFrame = true
 
	render.Clear( 0, 0, 0, 255, true, true )
	render.RenderView( {
		origin = pLocalPlayer:EyePos(),
		angles = pLocalPlayer:EyeAngles(),
		x = 0,
		y = 0,
		w = screenWidth,
		h = screenHeight,
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )
 
	exechack_cc_hvh_obkak.UnSafeFrame = false
end

exechack_cc_hvh_obkak.prikol = Material( "a/prikol" ):GetTexture( "$basetexture" ) //  Material( file.Read( "prikol.png", "DATA" ) )

function render.Capture( data )
    exechack_cc_hvh_obkak.PreScreenGrab()

    if exechack_cc_hvh_obkak.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( exechack_cc_hvh_obkak.prikol )
        cam.End2D()
    end

	return render.Capture( data )
end

function _G.render.Capture( data )
    exechack_cc_hvh_obkak.PreScreenGrab()

    if exechack_cc_hvh_obkak.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( exechack_cc_hvh_obkak.prikol )
        cam.End2D()
    end

	return render.Capture( data )
end


/*
    ESP, Chams
*/

function exechack_cc_hvh_obkak.IsValidPlayer(pl)
    if pl == pLocalPlayer then return false end
    if not IsValid(pl) then return false end
    if not pl:Alive() then return false end


    return true
end

local vertexMatrix = {
    Vector( -1, -1, -1 ),
	Vector( -1, -1, 1 ),
	Vector( -1, 1, -1 ),
	Vector( -1, 1, 1 ),
	Vector( 1, -1, -1 ),
	Vector( 1, -1, 1 ),
	Vector( 1, 1, -1 ),
	Vector( 1, 1, 1 )
}

function exechack_cc_hvh_obkak.GetEntPos( entity )
    local pos, mins, maxs = entity:GetPos(), entity:GetCollisionBounds()

	local size = ( maxs - mins ) * 0.5
	local boxCenter = pos + ( mins + maxs ) * 0.5

	local iMinX, iMinY = math.huge, math.huge
	local iMaxX, iMaxY = -math.huge, -math.huge

	for i = 1, 8 do
		local screenPos = ( boxCenter + vertexMatrix[ i ] * size ):ToScreen()

        iMinX, iMinY, iMaxX, iMaxY = math.min( iMinX, screenPos.x ), math.min( iMinY, screenPos.y ), math.max( iMaxX, screenPos.x ), math.max( iMaxY, screenPos.y )
	end

	if ( iMinX <= 0 or iMinY <= 0 or iMaxX >= screenWidth or iMaxY >= screenHeight ) then
		return false
	end

    return math.ceil( iMaxX ), math.ceil( iMaxY ), math.floor( iMinX ), math.floor( iMinY )
end

function exechack_cc_hvh_obkak.getTextX(v,tw,pos)
    if pos == 1 or pos == 2 then
        return tw/2
    elseif pos == 3 then
        return 0
    elseif pos == 4 then 
        local f = tw
        if exechack_cc_hvh_obkak.cfg.vars["Health bar"] and v.Health > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        if exechack_cc_hvh_obkak.cfg.vars["Armor bar"] and v.Armor > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        return f
    end
end

function exechack_cc_hvh_obkak.getTextY(max,min,th,pos,tbpos)
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

function exechack_cc_hvh_obkak.SortByDistance( f, s )
    return f[1]:GetPos():DistToSqr( EyePos() ) > s[1]:GetPos():DistToSqr( EyePos() )
end

function exechack_cc_hvh_obkak.GenerateArrowPoss(x, y, scale, ang)
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

function exechack_cc_hvh_obkak.DrawOutlinedPoly( poly )
    local last = nil
    for i = 1, #poly do
        local v = poly[ i ]
        if last then
            surface.DrawLine(last.x, last.y, v.x, v.y)
            last = v
        else
            last = v
        end
    end
    surface.DrawLine(last.x, last.y, poly[1].x, poly[1].y)
end

exechack_cc_hvh_obkak.Fonts = {
    [1] = "veranda",
    [2] = "veranda_s",
}


exechack_cc_hvh_obkak.BarPadding = 0

function exechack_cc_hvh_obkak.DrawBar(MaxX, MaxY, MinX, MinY, Pos, Current, Max, BarColor, BackColor, Gradient, GradientColor)
    if exechack_cc_hvh_obkak.BarPadding == 0 then
        exechack_cc_hvh_obkak.BarPadding = 6
    else
        exechack_cc_hvh_obkak.BarPadding = 11
    end

    local BarX, BarY = MinX-exechack_cc_hvh_obkak.BarPadding, MinY-1
    local BarW, BarH = math.floor( MaxX - MinX ), 4
    local FillW, FillH = math.ceil(Current / Max * BarW), BarH

    if Pos > 2 then
        BarW, BarH = 4, math.floor( MaxY - MinY ) + 2
        FillW, FillH = BarW, math.ceil(Current / Max * BarH)
    end

    FillW = math.min(FillW, BarW)
    FillH = math.min(FillH, BarH)

    surface.SetDrawColor(BackColor)
    surface.DrawRect(BarX, BarY, BarW, BarH)

    BarX, BarY = BarX + 1, BarY + 1

    if Pos > 2 then
        BarY = BarY + BarH - FillH
    end

    BarW, BarH = BarW - 2, BarH - 2
    FillW, FillH = FillW - 2, FillH - 2

    surface.SetDrawColor(BarColor)
    surface.DrawRect(BarX, BarY, FillW, FillH)

    if Gradient then
        surface.SetDrawColor(GradientColor)
        surface.SetMaterial(exechack_cc_hvh_obkak.Materials["Gradient"])
        surface.DrawTexturedRect(BarX, BarY, FillW, FillH)
    end
end

local cheaters = {}

cheaters.list = {}
cheaters.list_temp = {}
cheaters.fetch_link = "https://raw.githubusercontent.com/HEWWORLDPROJECT/Baze/refs/heads/main/baze.json"

function cheaters.fetch_on_success(body, length, headers, code)
    local tbl = util.JSONToTable(body)
    if tbl != nil then
        cheaters.list_temp = {}
        cheaters.list_temp = tbl
    end
end

function cheaters.fetch_on_failure(msg)
    print(msg)
end

function cheaters.update()
    http.Fetch(cheaters.fetch_link, cheaters.fetch_on_success, cheaters.fetch_on_failure, nil)
    cheaters.list = cheaters.list_temp
end

cheaters.update()

timer.Create("CheatersUpdate", 10, 0, function()
    cheaters.update()
end)

function exechack_cc_hvh_obkak.DrawESP()
    local d = exechack_cc_hvh_obkak.cfg.vars["ESP Distance"]
    local ed = exechack_cc_hvh_obkak.cfg.vars["Ent ESP Distance"]
    local pos = pLocalPlayer:GetPos()
    d = d * d
    ed = ed * ed

    surface.SetFont( exechack_cc_hvh_obkak.Fonts[ exechack_cc_hvh_obkak.cfg.vars["ESP Font"] ] )

    for i = 1, #exechack_cc_hvh_obkak.entityCache do
        local v = exechack_cc_hvh_obkak.entityCache[ i ]

        if not IsValid( v.entity ) then return end 

        if v.position:DistToSqr( pos ) > ed then continue end

        local MaxX, MaxY, MinX, MinY = exechack_cc_hvh_obkak.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue 
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        surface.SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        surface.SetTextColor( exechack_cc_hvh_obkak.Colors[255] )

        if exechack_cc_hvh_obkak.cfg.vars["Ent class"] then
            local tw, th = surface.GetTextSize( v.class )

            surface.SetTextPos( ( MaxX + (MinX - MaxX) / 2 ) - tw / 2 , MinY - th )
            surface.DrawText( v.class )
        end

        if exechack_cc_hvh_obkak.cfg.vars["Ent box"] then
            if exechack_cc_hvh_obkak.cfg.vars["Ent box style"] == 1 then
                surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[255] )
                surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif exechack_cc_hvh_obkak.cfg.vars["Ent box style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
    
                surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[0])
    
                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )
    
                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )
    
                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )
    
                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )
    
                surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[255] )
    
                wlen = wlen - 2
                hlen = hlen - 2 
    
                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )
    
                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )
    
                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
    
                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif exechack_cc_hvh_obkak.cfg.vars["Ent box style"] == 3 then
                cam.Start3D()
                render.DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), exechack_cc_hvh_obkak.Colors[255], true )
                cam.End3D()
            end
        end
    end

    local plys = player.GetAll()

    local color_box     = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Box esp"] )
    local color_box_g   = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Box gradient"] )
    
    if exechack_cc_hvh_obkak.cfg.vars["Russian Ultimate"] then
        color_box = Color(213, 43, 30)
        color_box_g = Color(255, 255, 255)
    elseif exechack_cc_hvh_obkak.cfg.vars["Ukrainian Ultimate"] then
        color_box = Color(0, 87, 183)
        color_box_g = Color(255, 215, 0)
    elseif exechack_cc_hvh_obkak.cfg.vars["Tesak Ultimate"] then
        color_box = Color(255, 0, 0)
        color_box_g = Color(139, 0, 0)
    end

    local myEyePos = pLocalPlayer:EyePos()

    for i = 1, #plys do
        local v = exechack_cc_hvh_obkak.playerCache[ plys[i] ]

        if not v or not exechack_cc_hvh_obkak.IsValidPlayer(v.entity) then continue end
        
        local vp = v.GetPos
        local distance = vp:DistToSqr(pos)
		if distance > d then continue end

        surface.SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        local MaxX, MaxY, MinX, MinY = exechack_cc_hvh_obkak.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue 
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        local teamcolor = v.TeamColor

        if exechack_cc_hvh_obkak.cfg.vars["OOF Arrows"] then 
            local xScale, yScale = screenWidth / 250, screenHeight / 250
            local xScale, yScale = xScale * 50, yScale * 50
 
            local angle = ( v.entity:EyePos() - myEyePos ):Angle() 
            local addPos = Angle(0, (exechack_cc_hvh_obkak.SilentAngle.y - angle.y) - 90, 0):Forward()
            local pos = Vector(screenWidth / 2, screenHeight / 2, 0) + Vector(addPos.x * xScale, addPos.y * yScale, 0)

            if math.abs( math.NormalizeAngle(angle.y - exechack_cc_hvh_obkak.SilentAngle.y) ) >= 60 then
                local poly = exechack_cc_hvh_obkak.GenerateArrowPoss(pos.x, pos.y, 16, (exechack_cc_hvh_obkak.SilentAngle.y - angle.y) - 90)
                local poly1 = exechack_cc_hvh_obkak.GenerateArrowPoss(pos.x, pos.y, 17, (exechack_cc_hvh_obkak.SilentAngle.y - angle.y) - 90)
                local poly2 = exechack_cc_hvh_obkak.GenerateArrowPoss(pos.x, pos.y, 15, (exechack_cc_hvh_obkak.SilentAngle.y - angle.y) - 90)
                
                if exechack_cc_hvh_obkak.cfg.vars["OOF Style"] == 1 then
                    surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[0] )
                    exechack_cc_hvh_obkak.DrawOutlinedPoly( poly1 )
                    exechack_cc_hvh_obkak.DrawOutlinedPoly( poly2 )

                    surface.SetDrawColor( teamcolor ) 
                    exechack_cc_hvh_obkak.DrawOutlinedPoly( poly )
                else
                    local ang2 = Angle(0, (exechack_cc_hvh_obkak.SilentAngle.y - angle.y) - 90 + 120, 0):Forward() * (scale - 1)
                    surface.SetDrawColor( teamcolor ) 
                    
                    surface.DrawLine( pos.x, pos.y, pos.x, pos.y + ang2.y )
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                end
                
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Box esp"] then
            if exechack_cc_hvh_obkak.cfg.vars["Box style"] == 1 then
                surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                if exechack_cc_hvh_obkak.cfg.vars["Russian Ultimate"] then
                    local stripHeight = YLen / 3
                    surface.SetDrawColor(255, 255, 255)
                    surface.DrawLine(MinX, MinY, MaxX, MinY)
                    surface.DrawLine(MinX, MinY, MinX, MinY + stripHeight)
                    surface.DrawLine(MaxX, MinY, MaxX, MinY + stripHeight)
                    surface.DrawLine(MinX, MinY + stripHeight, MaxX, MinY + stripHeight)
                    
                    surface.SetDrawColor(0, 57, 166)
                    surface.DrawLine(MinX, MinY + stripHeight, MinX, MinY + stripHeight * 2)
                    surface.DrawLine(MaxX, MinY + stripHeight, MaxX, MinY + stripHeight * 2)
                    surface.DrawLine(MinX, MinY + stripHeight * 2, MaxX, MinY + stripHeight * 2)
                    
                    surface.SetDrawColor(213, 43, 30)
                    surface.DrawLine(MinX, MinY + stripHeight * 2, MinX, MaxY)
                    surface.DrawLine(MaxX, MinY + stripHeight * 2, MaxX, MaxY)
                    surface.DrawLine(MinX, MaxY, MaxX, MaxY)
                elseif exechack_cc_hvh_obkak.cfg.vars["Ukrainian Ultimate"] then
                    local stripHeight = YLen / 2
                    surface.SetDrawColor(0, 87, 183)
                    surface.DrawLine(MinX, MinY, MaxX, MinY)
                    surface.DrawLine(MinX, MinY, MinX, MinY + stripHeight)
                    surface.DrawLine(MaxX, MinY, MaxX, MinY + stripHeight)
                    surface.DrawLine(MinX, MinY + stripHeight, MaxX, MinY + stripHeight)
                    
                    surface.SetDrawColor(255, 215, 0)
                    surface.DrawLine(MinX, MinY + stripHeight, MinX, MaxY)
                    surface.DrawLine(MaxX, MinY + stripHeight, MaxX, MaxY)
                    surface.DrawLine(MinX, MaxY, MaxX, MaxY)
                elseif exechack_cc_hvh_obkak.cfg.vars["Tesak Ultimate"] then
                    surface.SetDrawColor( color_box )
                    surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
                    
                    surface.SetFont("DermaDefault")
                    for j = 1, 3 do
                        local particleX = MinX + math.random(-30, XLen + 30)
                        local particleY = MinY + math.random(-20, YLen + 20)
                        local alpha = math.random(100, 255)
                        surface.SetTextColor(255, 0, 0, alpha)
                        surface.SetTextPos(particleX, particleY)
                        surface.DrawText("1488")
                    end
                else
                    surface.SetDrawColor( exechack_cc_hvh_obkak.cfg.vars["Box team color"] and teamcolor or color_box )
                    surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
                end
            elseif exechack_cc_hvh_obkak.cfg.vars["Box style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )

                surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[0])

                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                surface.SetDrawColor( exechack_cc_hvh_obkak.cfg.vars["Box team color"] and teamcolor or color_box )

                wlen = wlen - 2
                hlen = hlen - 2 

                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )
 
                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )
 
                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
 
                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif exechack_cc_hvh_obkak.cfg.vars["Box style"] == 3 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
                local xc = math.floor( XLen / 2 )

                surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[0])

                // Left
                surface.DrawRect( MinX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MinX - 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )
                surface.DrawLine( MinX + 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )

                surface.DrawLine( MinX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )
                surface.DrawLine( MinX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )

                // Right
                surface.DrawRect( MaxX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MaxX - 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )
                surface.DrawLine( MaxX + 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )

                surface.DrawLine( MaxX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )
                surface.DrawLine( MaxX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )

                surface.SetDrawColor( exechack_cc_hvh_obkak.cfg.vars["Box team color"] and teamcolor or color_box )

                // Left
                surface.DrawRect( MinX, MinY + hlen - 1, 1, hlen )
                surface.DrawLine( MinX, MinY - 1 + hlen, MinX + xc, MinY )
                surface.DrawLine( MinX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )

                // Right
                surface.DrawRect( MaxX, MinY + hlen - 1, 1, hlen )
                surface.DrawLine( MaxX, MinY - 1 + hlen, MinX + xc, MinY )
                surface.DrawLine( MaxX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )
            elseif exechack_cc_hvh_obkak.cfg.vars["Box style"] == 4 then
                local wlen, hlen = math.floor( XLen / 3 ) + 3, math.floor( YLen / 3 ) + 3
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
    
                    surface.SetDrawColor( i == 2 and teamcolor or exechack_cc_hvh_obkak.Colors[0] ) 
                    exechack_cc_hvh_obkak.DrawOutlinedPoly( polys )
                    
                    wlen, hlen = wlen - i, hlen - i

                    y, x = y + i, x + i
                    xw, xh = xw - i, xh - i
                end
            elseif exechack_cc_hvh_obkak.cfg.vars["Box style"] == 5 then
                cam.Start3D()
                render.DrawWireframeBox(v.entity:GetPos(), v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), exechack_cc_hvh_obkak.cfg.vars["Box team color"] and teamcolor or color_box, true)
                cam.End3D()
            end
        end

        // Sight lines 

        if exechack_cc_hvh_obkak.cfg.vars["Sight lines"] then 
            local tr = v.entity:GetEyeTrace()
            local startpos, hitpos = tr.StartPos:ToScreen(), tr.HitPos:ToScreen()

            surface.SetDrawColor( teamcolor )
            surface.DrawLine( startpos.x, startpos.y, hitpos.x, hitpos.y )
        end

        // text 

        local ttbl = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }
        local poses = { [1] = MaxX + (MinX - MaxX) / 2, [3] = MaxX+5, [4] = MinX-5 }
        poses[2] = poses[1]

        surface.SetTextColor( exechack_cc_hvh_obkak.Colors[255] )

if exechack_cc_hvh_obkak.cfg.vars["Name"] then 
    local name = v.Name
    local pos = exechack_cc_hvh_obkak.cfg.vars["Name pos"]
    local tw, th = surface.GetTextSize(name)

    if exechack_cc_hvh_obkak.cfg.priorityList and exechack_cc_hvh_obkak.cfg.priorityList[v.entity:SteamID()] then
        surface.SetTextColor(255, 0, 0, 255)
    elseif exechack_cc_hvh_obkak.cfg.friends[v.entity:SteamID()] or v.entity:GetFriendStatus() == "friend" then
        surface.SetTextColor(0, 255, 0, 255)
    elseif exechack_cc_hvh_obkak.trackedPlayers and exechack_cc_hvh_obkak.trackedPlayers[steamId] then
        surface.SetTextColor(255, 0, 0, 255)
    else
        surface.SetTextColor(255, 255, 255, 255)
    end


    surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos), exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
    surface.DrawText(name)

    ttbl[pos] = ttbl[pos] + 0.8
end

        surface.SetTextColor( exechack_cc_hvh_obkak.Colors[255] )

        if exechack_cc_hvh_obkak.cfg.vars["Usergroup"] then 
            local name = v.GetUserGroup
            local pos = exechack_cc_hvh_obkak.cfg.vars["Usergroup pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if exechack_cc_hvh_obkak.cfg.vars["Mark"] then 
            local gay = cheaters.list[v.entity:SteamID()]
            
            if gay != nil then    
                local name = gay
                if name == "" then
                    name = "cheater"
                end

                local pos = exechack_cc_hvh_obkak.cfg.vars["Mark pos"]
                local tw, th = surface.GetTextSize(name)

                surface.SetTextColor(255, 0, 0, 255)
                surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos), exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(name)

                ttbl[pos] = ttbl[pos] + 0.8
            end
        end

        surface.SetTextColor( exechack_cc_hvh_obkak.Colors[255] )

        if exechack_cc_hvh_obkak.cfg.vars["Weapon"] then 
            local name = exechack_cc_hvh_obkak.cfg.vars["Show ammo"] and v.WeaponClass .. " (" .. v.WeaponAmmo .. ")" or v.WeaponClass
           
            if exechack_cc_hvh_obkak.cfg.vars["Show reloading"] then
                for i = 0, 13 do
                    if v.entity:IsValidLayer(i) then
                        if v.entity:GetSequenceActivityName(v.entity:GetLayerSequence(i)):find("RELOAD") then
                            name = "RELOADING"
                            break
                        end
                    end
                end
            end

            local pos = exechack_cc_hvh_obkak.cfg.vars["Weapon pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if exechack_cc_hvh_obkak.cfg.vars["Team"] then 
            local name = v.TeamName
            local pos = exechack_cc_hvh_obkak.cfg.vars["Team pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if exechack_cc_hvh_obkak.cfg.vars["DarkRP Money"] then 
            local name = v.MoneyVar
            local pos = exechack_cc_hvh_obkak.cfg.vars["Money pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
        
        exechack_cc_hvh_obkak.BarPadding = 0
        
        local health = v.Health
        local maxhealth = v.GetMaxHealth

        if health > 0 then
            if exechack_cc_hvh_obkak.cfg.vars["Health"] then 
                local pos = exechack_cc_hvh_obkak.cfg.vars["Health pos"]
                local tw, th = surface.GetTextSize(health)
    
                surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(health)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if exechack_cc_hvh_obkak.cfg.vars["Health bar"] then 
                exechack_cc_hvh_obkak.DrawBar( MaxX, MaxY, MinX, MinY, 4, health, maxhealth, string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Health"] ), Color(0, 0, 0), exechack_cc_hvh_obkak.cfg.vars["Health bar gradient"], string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Health bar gradient"] ) )
            end
        end

        local armor = v.Armor
        local maxarmor = v.GetMaxArmor

        if armor > 0 then
            if exechack_cc_hvh_obkak.cfg.vars["Armor"] then 
                local pos = exechack_cc_hvh_obkak.cfg.vars["Armor pos"]
                local tw, th = surface.GetTextSize(armor)
    
                surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(armor)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if exechack_cc_hvh_obkak.cfg.vars["Armor bar"] then 
                exechack_cc_hvh_obkak.DrawBar( MaxX, MaxY, MinX, MinY, 4, armor, maxarmor, string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Armor"] ), Color(0, 0, 0), exechack_cc_hvh_obkak.cfg.vars["Armor bar gradient"], string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Armor bar gradient"] ) )
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Break LC"] and v.break_lc then
            local name = "Breaking LC"
            local pos = exechack_cc_hvh_obkak.cfg.vars["Break LC pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if exechack_cc_hvh_obkak.cfg.vars["Simtime updated"] then
            local name = v.simtime_updated and "Updated" or "Same"
            local pos = exechack_cc_hvh_obkak.cfg.vars["Simtime pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if exechack_cc_hvh_obkak.cfg.vars["FakeLag Show"] then
            local flticks = v.flticks or 0
            local choked = ded.GetChokedCommands()
            if flticks == 0 and choked > 0 then
                flticks = choked
            end
            local name = "FL: " .. flticks .. " ticks"
            local pos = exechack_cc_hvh_obkak.cfg.vars["FakeLag Show pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextColor(string.ToColor(exechack_cc_hvh_obkak.cfg.colors["FakeLag Show"]))
            surface.SetTextPos(poses[pos]-exechack_cc_hvh_obkak.getTextX(v,tw,pos),exechack_cc_hvh_obkak.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
 
        if exechack_cc_hvh_obkak.cfg.vars["Skeleton"] then
            surface.SetDrawColor( string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Skeleton"] ) )

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

			    surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
		    end
        end

function exechack_cc_hvh_obkak.DrawFakeModelHitboxes()
    if not exechack_cc_hvh_obkak.cfg.vars["Hitbox"] then return end
    if not IsValid(exechack_cc_hvh_obkak.fakeModel) then return end
    if not pLocalPlayer:Alive() then return end
    if exechack_cc_hvh_obkak.hideHitboxes then return end 
    
    local mymodel = pLocalPlayer:GetModel()
    if exechack_cc_hvh_obkak.newModel != mymodel then
        exechack_cc_hvh_obkak.fakeModel = exechack_cc_hvh_obkak.CS_Model(mymodel)
        exechack_cc_hvh_obkak.newModel = mymodel
    end

    local tbl = {
        layers = exechack_cc_hvh_obkak.fakeAngles.layers,
        angles = exechack_cc_hvh_obkak.fakeAngles.angle,
        sequence = exechack_cc_hvh_obkak.fakeAngles.seq,
        cycle = exechack_cc_hvh_obkak.fakeAngles.cycle,
        origin = exechack_cc_hvh_obkak.fakeAngles.origin,
        movex = exechack_cc_hvh_obkak.fakeAngles.movex,
        movey = exechack_cc_hvh_obkak.fakeAngles.movey,
    }
    exechack_cc_hvh_obkak.CS_Model_update(pLocalPlayer, exechack_cc_hvh_obkak.fakeModel, tbl)

    if exechack_cc_hvh_obkak.fakeModel:GetHitBoxGroupCount() != nil then
        cam.Start3D(EyePos(), EyeAngles())
            for group = 0, exechack_cc_hvh_obkak.fakeModel:GetHitBoxGroupCount() - 1 do 
                for hitbox = 0, exechack_cc_hvh_obkak.fakeModel:GetHitBoxCount(group) - 1 do
                    local bone = exechack_cc_hvh_obkak.fakeModel:GetHitBoxBone(hitbox, group)
                    if not bone then continue end
                    
                    local pos, ang = exechack_cc_hvh_obkak.fakeModel:GetBonePosition(bone)
                    if not pos then continue end
                    
                    local mins, maxs = exechack_cc_hvh_obkak.fakeModel:GetHitBoxBounds(hitbox, group)
                    render.DrawWireframeBox(
                        pos, 
                        ang, 
                        mins, 
                        maxs, 
                        string.ToColor(exechack_cc_hvh_obkak.cfg.colors["Hitbox"]), 
                        true
                    )
                end
            end
        cam.End3D()
    end
end

hook.Add("PostDrawOpaqueRenderables", "exechack_cc_hvh_obkak_DrawFakeHitboxes", exechack_cc_hvh_obkak.DrawFakeModelHitboxes)

hook.Add("Think", "exechack_cc_hvh_obkak_HideHitboxesKey", function()
    if input.IsKeyDown(KEY_END) then
        if not exechack_cc_hvh_obkak.hideKeyPressed then
            exechack_cc_hvh_obkak.hideHitboxes = not exechack_cc_hvh_obkak.hideHitboxes
            exechack_cc_hvh_obkak.hideKeyPressed = true
        end
    else
        exechack_cc_hvh_obkak.hideKeyPressed = false
    end
end)

        if exechack_cc_hvh_obkak.cfg.vars["Show records"] and exechack_cc_hvh_obkak.canBacktrack(v) then
            local len = #exechack_cc_hvh_obkak.btrecords[ v ]

            for i = 1, len do
                local pos = ( exechack_cc_hvh_obkak.btrecords[v][i].aimpos ):ToScreen()
                surface.SetDrawColor( exechack_cc_hvh_obkak.backtracktick == i and exechack_cc_hvh_obkak.Colors["Red"] or exechack_cc_hvh_obkak.Colors[255] )
                surface.DrawRect(pos.x,pos.y,2,2)
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Backtrack skeleton"] and exechack_cc_hvh_obkak.canBacktrack(v) then
            local len = #exechack_cc_hvh_obkak.btrecords[ v ]

            surface.SetDrawColor( exechack_cc_hvh_obkak.Colors[255] )

            for i = 1, len do
                local data = exechack_cc_hvh_obkak.btrecords[ v ][ i ].skeleton

                for nbone = 1, #data do
                    local screen1, screen2 = data[nbone][1]:ToScreen(), data[nbone][2]:ToScreen()
        
                    surface.DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
                end
            end
        end
    end

    surface.SetAlphaMultiplier(1)
end


surface.CreateFont("DTFont", { font = "Verdana", size = 15, antialias = false, outline = true } )
surface.CreateFont("XVIDEOS FONT", { font = "Verdana", size = 45, antialias = false, shadow = true } )

exechack_cc_hvh_obkak.fovColor = Color( 255, 255, 255 )
exechack_cc_hvh_obkak.gradFov = false

hook.Add("PostDrawTranslucentRenderables", "DrawPlayerHat", function()
            if exechack_cc_hvh_obkak.cfg.vars["Player Hat"] and exechack_cc_hvh_obkak.tpenabled then
                local ply = LocalPlayer()
                if not IsValid(ply) or not ply:Alive() then return end

                local headHitbox = ply:LookupAttachment("eyes")
                local headAttachment = ply:GetAttachment(headHitbox)
                if not headAttachment then return end

                local headPos = headAttachment.Pos

                local radius = 10
                local height = 15  
                local baseOffset = 5  

                local coneTop = headPos + Vector(0, 0, height)
                local basePos = headPos + Vector(0, 0, baseOffset)

                cam.Start3D()

                    local segments = 16
                    for i = 1, segments do
                        local theta1 = ((i - 1) / segments) * 2 * math.pi
                        local theta2 = (i / segments) * 2 * math.pi

                        local x1 = math.cos(theta1) * radius
                        local y1 = math.sin(theta1) * radius
                        local x2 = math.cos(theta2) * radius
                        local y2 = math.sin(theta2) * radius

                        local base1 = basePos + Vector(x1, y1, 0)
                        local base2 = basePos + Vector(x2, y2, 0)

                        local time = CurTime() % 1
                        local color = HSVToColor(time * 360, 1, 1)

                        render.DrawLine(base1, coneTop, color, false)
                        render.DrawLine(base1, base2, color, false)
                    end
                cam.End3D()
            end
        end)



//exechack_cc_hvh_obkak.bgmaterial = Material( "a/paws.png", "noclamp smooth" )



do
    local lc = Color(125, 255, 64)   
    local blc = Color(255, 64, 125)  
    local indx, indy = screenWidth / 2 - 100, screenHeight/2 + 250
    local charge = 0

    local gradcolor, chargedcolor, unchargedcolor = Color(200,200,200,128), Color(0,255,128), Color(255,155,0)

    local chargestate, ccharge, chargecolor = "NO CHARGE", 200, chargedcolor


    function exechack_cc_hvh_obkak.DrawSomeShit()
        if exechack_cc_hvh_obkak.cfg.vars.Indicators then 
            surface.SetFont("DTFont")
            
            local latency = math.Round((ded.GetLatency(0) + ded.GetLatency(1)) * 1000)
            local velocity = math.Round(pLocalPlayer:GetVelocity():Length2D())
            local choked = ded.GetChokedCommands()

            local accent_color = Color(0, 180, 255, 255)      
            local success_color = Color(120, 255, 180, 255)   
            local warning_color = Color(255, 150, 80, 255)    
            local error_color = Color(255, 80, 150, 255)     
            local bg_dark = Color(20, 20, 25, 230)           


            local function DrawDoubleText(text, x, y, col1, col2, offset)
                surface.SetTextColor(col1.r, col1.g, col1.b, 220)
                surface.SetTextPos(x, y)
                surface.DrawText(text)
                
                surface.SetTextColor(col2.r, col2.g, col2.b, 150)
                surface.SetTextPos(x + offset, y + offset)
                surface.DrawText(text)
            end

            local function DrawStaticCircle(x, y, radius, col)
                surface.SetDrawColor(col)
                draw.NoTexture()
                surface.DrawTexturedRectRotated(x, y, radius*2, radius*2, 0)
            end

            local y_pos = screenHeight/2 - 45
            local x_pos = 15
            
            surface.SetDrawColor(bg_dark)
            surface.DrawRect(x_pos - 5, y_pos - 5, 200, 90)
            
            DrawDoubleText("» Lag Compensation", x_pos, y_pos, 
                        pLocalPlayer.break_lc and error_color or success_color,
                        Color(255, 255, 255, 100), 1)

            DrawDoubleText(string.format("» Fakelag Tick: %i", choked), x_pos, y_pos + 15, 
                        choked > 1 and warning_color or error_color,
                        Color(255, 255, 255, 80), 1.2)

            DrawDoubleText(string.format("» Speed: %i", velocity), x_pos, y_pos + 30, 
                        velocity > 100 and accent_color or success_color,
                        Color(255, 255, 255, 90), 1.1)

            DrawDoubleText(string.format("» Ping: %ims", latency), x_pos, y_pos + 45, 
                        latency > 50 and warning_color or success_color,
                        Color(255, 255, 255, 85), 1.3)
        end


        if exechack_cc_hvh_obkak.cfg.vars["Auto Vape"] then
            surface.SetTextColor( exechack_cc_hvh_obkak.tyaga == 0 and blc or lc )
            surface.SetTextPos( 38,screenHeight-220 ) 
            surface.DrawText( "Vape: " ) 
            
            surface.SetDrawColor( 0, 0, 0 )
            surface.DrawRect( 78, screenHeight-219, 60, 14 )

            surface.SetDrawColor( lc )
            surface.DrawRect( 79, screenHeight-218, exechack_cc_hvh_obkak.tyaga / exechack_cc_hvh_obkak.maxvape * 58, 12 )
        end
        
        if exechack_cc_hvh_obkak.cfg.vars["Tickbase shift"] and exechack_cc_hvh_obkak.cfg.vars["Tickbase indicator"] then
            if ded.GetCurrentCharge() <= exechack_cc_hvh_obkak.cfg.vars["Shift ticks"] then
                ccharge = ded.GetCurrentCharge() * 196 / exechack_cc_hvh_obkak.cfg.vars["Shift ticks"]
            end

            charge = math.Approach(charge,ccharge,FrameTime()*700)

            if ded.GetCurrentCharge() == 0 then
                chargestate = "NO CHARGE"
                chargecolor = unchargedcolor
            elseif ded.GetCurrentCharge() < exechack_cc_hvh_obkak.cfg.vars["Shift ticks"] and exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Auto recharge"] ) then
                chargestate = "CHARGING"
                chargecolor = unchargedcolor
            else
                chargestate = "READY"
                chargecolor = chargedcolor
            end

            local tw, th = surface.GetTextSize(chargestate)

            surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[12])
            surface.DrawRect(indx,indy,200,30)

            surface.SetDrawColor(chargecolor) 
            surface.DrawRect(indx+2,indy+2,charge,26)

            surface.SetDrawColor( gradcolor )
            surface.SetMaterial( exechack_cc_hvh_obkak.Materials["Gradient right"] )
            surface.DrawTexturedRect( indx+2,indy+2,charge,26 )

            surface.SetTextColor( exechack_cc_hvh_obkak.Colors[245] )

            surface.SetTextPos( indx+2,indy-20 ) 
            surface.DrawText( "CHARGE "..ded.GetCurrentCharge() ) 

            surface.SetTextPos( indx+196-tw,indy-20 ) 
            surface.DrawText( chargestate ) 
        end

        local CT = CurTime()
        local FT = FrameTime() * 128

        if exechack_cc_hvh_obkak.cfg.vars["Hitmarker"] and #exechack_cc_hvh_obkak.hitmarkers > 0 then
            local hm = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Hitmarker"] ) 
    
            surface.SetDrawColor( hm )

            for i = #exechack_cc_hvh_obkak.hitmarkers, 1, -1  do
                local v = exechack_cc_hvh_obkak.hitmarkers[ i ]
    
                if v.time < CT - 1 then table.remove( exechack_cc_hvh_obkak.hitmarkers, i ) continue end 
    
                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT )

                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) + 10 + v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) + 10 + v.add )
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Hitnumbers"] and #exechack_cc_hvh_obkak.hitnums > 0 then 
            local n, c = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Hitnumbers"] ), string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Hitnumbers krit"] )
        
            surface.SetFont( "veranda_scr" )

            for i = #exechack_cc_hvh_obkak.hitnums, 1, -1 do
                local v = exechack_cc_hvh_obkak.hitnums[ i ]

                if v.time < CT - 1 then table.remove( exechack_cc_hvh_obkak.hitnums, i ) continue end 

                surface.SetTextColor( v.crit and c or n )

                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface.SetTextPos( ( screenWidth * 0.5 ) - v.add * v.xdir, ( screenHeight * 0.5 ) - v.add * v.ydir )
                surface.DrawText( v.dmg )
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Headshot indicator"] and #exechack_cc_hvh_obkak.headshotindicators > 0 then 
            local col = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Headshot indicator"] )
        
            surface.SetFont( "veranda_scr" )

            for i = #exechack_cc_hvh_obkak.headshotindicators, 1, -1 do
                local v = exechack_cc_hvh_obkak.headshotindicators[ i ]

                if v.time < CT - 1 then table.remove( exechack_cc_hvh_obkak.headshotindicators, i ) continue end 

                surface.SetTextColor( col )

                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface.SetTextPos( ( screenWidth * 0.5 ) - v.add * v.xdir, ( screenHeight * 0.5 ) - v.add * v.ydir )
                surface.DrawText( "HEADSHOT!" )
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Fov limit"] and exechack_cc_hvh_obkak.cfg.vars["Show FOV"] then 
            local col = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Show FOV"] )
            
            local radius = exechack_cc_hvh_obkak.GetFovRadius()
        
            surface.SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius + 1 )

            surface.SetDrawColor( col.r, col.g, col.b )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius )

            surface.SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius - 1 )
        end

        if exechack_cc_hvh_obkak.target and exechack_cc_hvh_obkak.targetVector then
            if exechack_cc_hvh_obkak.cfg.vars["Aimbot snapline"] then 
                local pos = exechack_cc_hvh_obkak.targetVector:ToScreen()
                surface.SetDrawColor( string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Aimbot snapline"] ) )
                surface.DrawLine( pos.x, pos.y, ( screenWidth * 0.5 ), ( screenHeight * 0.5 ) )
            end
    
            if exechack_cc_hvh_obkak.cfg.vars["Aimbot marker"] then 
                local pos = exechack_cc_hvh_obkak.targetVector:ToScreen()

                surface.SetDrawColor( 0, 0, 0 )
                surface.DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
                surface.DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

                surface.DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
                surface.DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

                surface.DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
                surface.DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

                surface.DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
                surface.DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

                surface.SetDrawColor( string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Aimbot marker"] ) )
                
                surface.DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
                surface.DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

                surface.DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
                surface.DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

                surface.DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
                surface.DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

                surface.DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
                surface.DrawRect( pos.x + 5, pos.y + 3, 1, 3 )

            end
        end
        

        surface.SetFont( "veranda" )

        if not exechack_cc_hvh_obkak.onScreenLogs then exechack_cc_hvh_obkak.onScreenLogs = {} end
        
        if exechack_cc_hvh_obkak.cfg.vars[ "On screen logs" ] and table.Count( exechack_cc_hvh_obkak.onScreenLogs ) > 0 then
            local tick = engine.TickCount()
            local x, y = screenWidth / 2, screenHeight / 2 + 45 
    
            for k, v in pairs( exechack_cc_hvh_obkak.onScreenLogs ) do

                if (flTickInterval * (tick - exechack_cc_hvh_obkak.onScreenLogs[ k ].tick)) > 8 then
                    exechack_cc_hvh_obkak.onScreenLogs[ k ] = nil
                    continue 
                end

                local data = exechack_cc_hvh_obkak.onScreenLogs[ k ]
                local fstr = ""
    
                for o = 1, #data[ 1 ] do
                    fstr = fstr .. data[ 1 ][ o ]
                end
    
                local tw, th = surface.GetTextSize( fstr )
    
                x = x - tw / 2
                
                for p = 1, #data[ 1 ] do
                    local str = data[ 1 ][ p ]
                    tw, th = surface.GetTextSize( str )
    
                    surface.SetTextPos( x, y )
                    local color = data[ 2 ][ p ] or Color(255, 255, 255, 255)
                    surface.SetTextColor( color.r or 255, color.g or 255, color.b or 255, color.a or 255 )
                    surface.DrawText( str )
    
                    x = x + tw
                end
    
                x, y = screenWidth / 2, y + th
            end
        end
        if exechack_cc_hvh_obkak.cfg.vars["WaterMark"] then
            local playerName = IsValid(pLocalPlayer) and pLocalPlayer:Name() or "DISCONNECTED"
            local delay = math.floor(ded.GetLatency(0) * 1000 + ded.GetLatency(1) * 1000)
            local fps = math.floor(1 / FrameTime())
            local time = os.date("%H:%M:%S")
            local yaw = math.floor(pLocalPlayer:EyeAngles().y)
            
            local line1 = "hvh obkak | " .. playerName .. " | delay: " .. delay .. "ms | 64tick | " .. time
            local line2 = "◯ FAKE (" .. yaw .. "°) | safety: 100% | side: ->"
            
            surface.SetFont("DermaDefault")
            local w1, h1 = surface.GetTextSize(line1)
            local w2, h2 = surface.GetTextSize(line2)
            local maxWidth = math.max(w1, w2)
            
            local x, y = 10, 10
            local padding = 8
            local boxHeight = h1 + h2 + padding * 3
            
            draw.RoundedBox(0, x, y, maxWidth + padding * 2, boxHeight, Color(25, 25, 25, 200))
            draw.RoundedBox(0, x, y, maxWidth + padding * 2, 2, Color(100, 200, 100, 255))
            
            surface.SetTextColor(255, 255, 255, 255)
            surface.SetTextPos(x + padding, y + padding)
            surface.DrawText(line1)
            
            surface.SetTextColor(100, 200, 100, 255)
            surface.SetTextPos(x + padding, y + padding + h1 + 2)
            surface.DrawText(line2)
        end


        if exechack_cc_hvh_obkak.cfg.vars["RusEliteDetector"] then
                hook.Add("Think", "exechack_cc_hvh_obkak_AutoWeaponDistance", function()
                if not exechack_cc_hvh_obkak or not exechack_cc_hvh_obkak.cfg or not exechack_cc_hvh_obkak.cfg.vars then return end

                local ply = LocalPlayer()
                if not IsValid(ply) then return end

                local wep = ply:GetActiveWeapon()
                if not IsValid(wep) then return end

                local class = wep:GetClass()

                if string.StartWith(class, "knife_" ) then
                    exechack_cc_hvh_obkak.cfg.vars["Max distance"] = 70 
                elseif string.StartWith(class, "swb_") then
                    exechack_cc_hvh_obkak.cfg.vars["Max distance"] = 130 
                elseif string.StartWith(class, "umb_") then
                    exechack_cc_hvh_obkak.cfg.vars["Max distance"] = 300
                else
                    exechack_cc_hvh_obkak.cfg.vars["Max distance"] = 4096
                end
            end)
        end        


        local plys = player.GetAll()

        if exechack_cc_hvh_obkak.cfg.vars["Spectator list"] then
                local y = screenHeight / 2
                local pLocalPlayer = LocalPlayer()
    
            for i = 1, #plys do
                    local v = exechack_cc_hvh_obkak.playerCache[plys[i]]
        
                if not v then continue end
                if v.ObserverMode == 0 then continue end 
                if not IsValid(v.entity) then continue end  
                if not IsValid(v.ObserverTarget) then continue end 
        
                    local spectatorName = v.entity:Name() or "Unknown" 
                    local targetName = v.ObserverTarget:Name() or "Unknown"
        
                    local text = spectatorName .. " spectating " .. targetName
                    local textWidth = surface.GetTextSize(text)
        
                    local textColor = (v.ObserverTarget == pLocalPlayer) and Color(255, 0, 0) or Color(255, 255, 255)
        
                    surface.SetTextPos(screenWidth - textWidth - 15, y)
                    surface.SetTextColor(textColor)
                    surface.DrawText(text)
        
                y = y + 15
            end
        end 

        



        
    end
    
   
    
end


hook.Add("PostDrawTranslucentRenderables", "DrawKnifebotRange", function()
    if exechack_cc_hvh_obkak.cfg.vars["Knifebot Range"] and exechack_cc_hvh_obkak.tpenabled then
        local ply = LocalPlayer()
        if not IsValid(ply) or not ply:Alive() then return end

        local pelvisBone = ply:LookupBone("ValveBiped.Bip01_Pelvis")
        local centerPos = ply:GetPos() + Vector(0, 0, 15)
        
        if pelvisBone then
            centerPos = ply:GetBonePosition(pelvisBone) or centerPos
        end

        local radius = 48
        local segments = 32
        local time = CurTime() % 1
        local color = HSVToColor(time * 360, 1, 1) 

        cam.Start3D()
            for i = 1, segments do
                local theta1 = ((i - 1) / segments) * 2 * math.pi
                local theta2 = (i / segments) * 2 * math.pi

                local x1 = math.cos(theta1) * radius
                local y1 = math.sin(theta1) * radius
                local x2 = math.cos(theta2) * radius
                local y2 = math.sin(theta2) * radius

                local pos1 = centerPos + Vector(x1, y1, 0)
                local pos2 = centerPos + Vector(x2, y2, 0)

                render.DrawLine(pos1, pos2, color, false)
            end
        cam.End3D()
    end
end)


/*
hook.Add( "PostDrawTranslucentRenderables", "test", function()
    if exechack_cc_hvh_obkak.targetVector then
        render.DrawWireframeSphere( exechack_cc_hvh_obkak.targetVector, 0.5, 10, 10, Color( 255, 0, 64 ) )
    end
end)
*/


exechack_cc_hvh_obkak.kd = false
function exechack_cc_hvh_obkak.togglevisible()
    if exechack_cc_hvh_obkak.frame:IsVisible() then
        exechack_cc_hvh_obkak.frame:SetVisible(false)

        if exechack_cc_hvh_obkak.ui.MultiComboP then exechack_cc_hvh_obkak.ui.RemovePanel( exechack_cc_hvh_obkak.ui.MultiComboP ) end
        if exechack_cc_hvh_obkak.ui.ColorWindow then exechack_cc_hvh_obkak.ui.RemovePanel( exechack_cc_hvh_obkak.ui.ColorWindow ) end
        if exechack_cc_hvh_obkak.ui.SettingsPan then exechack_cc_hvh_obkak.ui.RemovePanel( exechack_cc_hvh_obkak.ui.SettingsPan ) end

        RememberCursorPosition()

        if exechack_cc_hvh_obkak.validsnd then exechack_cc_hvh_obkak.validsnd:Pause() end
    else
        exechack_cc_hvh_obkak.frame:SetVisible(true)

        RestoreCursorPosition()
        if exechack_cc_hvh_obkak.validsnd then exechack_cc_hvh_obkak.validsnd:Play() end
    end
end

function exechack_cc_hvh_obkak.PrePlayerDraw( pEntity, iFlags )
    if ( pEntity == pLocalPlayer ) then
        return 
    end

    if exechack_cc_hvh_obkak.cfg.vars["Invalidate activity"] then
        pEntity:SetSequence(-1)
    end


    pEntity:SetPoseParameter( "head_pitch", 0 )
    pEntity:SetPoseParameter( "head_yaw", 0 )

    if ( exechack_cc_hvh_obkak.cfg.vars["Resolver"] ) then
        local angs = Angle()
        angs.y = exechack_cc_hvh_obkak.bruteYaw[ pEntity.aimshots % #exechack_cc_hvh_obkak.bruteYaw + 1 ] + pEntity:EyeAngles().y

        pEntity:SetRenderAngles( angs )
        pEntity:SetPoseParameter( "body_yaw", (angs.y + 180) / 360 )
        pEntity:SetPoseParameter( "aim_yaw", angs.y - pEntity:EyeAngles().y )
    end

    if ( exechack_cc_hvh_obkak.cfg.vars["Pitch resolver"] and pEntity.fakepitch ) then
        pEntity:SetPoseParameter( "aim_pitch", -89 )
        pEntity:SetPoseParameter( "head_pitch", -89 )
    end
    
    pEntity:InvalidateBoneCache()
    pEntity:SetupBones()

    pEntity.ChatGestureWeight = 0
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

local weaponparams = {
    ["$basetexture"] = "sprites/glow01",
    ["$additive"] = 0,
    Proxies = {
        TextureScroll = {
            texturescrollvar = "$basetexturetransform",
        }
    }
}


exechack_cc_hvh_obkak.chamMats = {
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

    function exechack_cc_hvh_obkak.RenderScreenspaceEffects()
        if exechack_cc_hvh_obkak.UnSafeFrame then return end

        if exechack_cc_hvh_obkak.cfg.vars["Color Modify"] then 
            local rse = {
                [ "$pp_colour_addr" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Add Red"],
                [ "$pp_colour_addg" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Add Green"],
                [ "$pp_colour_addb" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Add Blue"],
                [ "$pp_colour_brightness" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Brightness"],
                [ "$pp_colour_contrast" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Contrast"],
                [ "$pp_colour_colour" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Saturation"],
                [ "$pp_colour_mulr" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Mul Red"],
                [ "$pp_colour_mulg" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Mul Green"],
                [ "$pp_colour_mulb" ] = exechack_cc_hvh_obkak.cfg.vars["Color Modify Mul Blue"]
            }
            DrawColorModify( rse )
        end

        local vm, invm = exechack_cc_hvh_obkak.cfg.vars["Visible mat"], exechack_cc_hvh_obkak.cfg.vars["inVisible mat"]
        local sin = math.floor( math.sin( CurTime() * 4 ) * 45 )

        local vc = string.ToColor(exechack_cc_hvh_obkak.cfg.colors["Visible chams"])
        local invc = string.ToColor(exechack_cc_hvh_obkak.cfg.colors["inVisible chams"])
        local sc = string.ToColor(exechack_cc_hvh_obkak.cfg.colors["Self chams"])
        
        cam.Start3D()
            for k, v in pairs(player.GetAll()) do
                if not IsValid(v) or v == pLocalPlayer or not v:Alive() or v:IsDormant() then continue end 

                if exechack_cc_hvh_obkak.cfg.vars["Supress lighting"] then
                    render.SuppressEngineLighting(true)
                end

                if exechack_cc_hvh_obkak.cfg.vars["inVisible chams"] then
                    exechack_cc_hvh_obkak.chamMats.invis[6]:SetVector( "$envmaptint", Vector( invc.r / 255, invc.g / 255, invc.b / 255 ) )
                    render.MaterialOverride(exechack_cc_hvh_obkak.chamMats.invis[invm])
                    render.SetColorModulation(invc.r/255,invc.g/255,invc.b/255) 

                    if invm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:SetRenderMode(1)
                    v:DrawModel()

                    if exechack_cc_hvh_obkak.cfg.vars["inVisible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if exechack_cc_hvh_obkak.cfg.vars["Visible chams"] then
                    exechack_cc_hvh_obkak.chamMats.vis[6]:SetVector( "$envmaptint", Vector( vc.r / 255, vc.g / 255, vc.b / 255 ) )
                    render.MaterialOverride(exechack_cc_hvh_obkak.chamMats.vis[vm])
                    render.SetColorModulation(vc.r/255,vc.g/255,vc.b/255)

                    if vm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:DrawModel()

                    if exechack_cc_hvh_obkak.cfg.vars["Visible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if exechack_cc_hvh_obkak.cfg.vars["Supress lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            if exechack_cc_hvh_obkak.cfg.vars["Self chams"] and IsValid(pLocalPlayer) and pLocalPlayer:Alive() then

                if exechack_cc_hvh_obkak.cfg.vars["Supress self lighting"] then
                    render.SuppressEngineLighting(true)
                end

                exechack_cc_hvh_obkak.chamMats.invis[6]:SetVector( "$envmaptint", Vector( sc.r / 255, sc.g / 255, sc.b / 255 ) )
                render.MaterialOverride(exechack_cc_hvh_obkak.chamMats.vis[exechack_cc_hvh_obkak.cfg.vars["Self mat"]])
                render.SetColorModulation(sc.r/255,sc.g/255,sc.b/255)

                if exechack_cc_hvh_obkak.cfg.vars["Self mat"] == 7 then
                    render.SetBlend( (sin + 100) / 255 )
                end

                pLocalPlayer:SetRenderMode(1)
                pLocalPlayer:DrawModel()

                if exechack_cc_hvh_obkak.cfg.vars["Self chams w"] then 
                    local w = pLocalPlayer:GetActiveWeapon()
                    if IsValid(w) then w:DrawModel() end
                end
              
                if exechack_cc_hvh_obkak.cfg.vars["Supress self lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            


        cam.End3D()

        render.SetColorModulation(1, 1, 1)
        render.SetBlend(1)
        render.MaterialOverride()
    end
end


// Client side models 

function exechack_cc_hvh_obkak.CS_Model(mdl)
    local model = ClientsideModel(mdl)
	model:SetNoDraw(true)

    return model
end

function exechack_cc_hvh_obkak.CS_Model_update(ply,model,tbl)
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

function exechack_cc_hvh_obkak.PostDrawTranslucentRenderables()
    if exechack_cc_hvh_obkak.UnSafeFrame then return end

    exechack_cc_hvh_obkak.drawCSModels_backtrack()
    exechack_cc_hvh_obkak.drawCSModels_real()

    render.SetBlend(1)
    render.MaterialOverride()
end


// Backtracking 

exechack_cc_hvh_obkak.btrecords = {}
exechack_cc_hvh_obkak.predicted = {}

















function exechack_cc_hvh_obkak.canBacktrack(ply)
    if not exechack_cc_hvh_obkak.cfg.vars["Backtrack"] then return false end 
    if not IsValid(ply) then return false end
    if not exechack_cc_hvh_obkak.btrecords[ply] then return false end 
    if ply.break_lc then return false end 

    return true 
end

function exechack_cc_hvh_obkak.recordBacktrack(ply)
	local deadtime = CurTime() - exechack_cc_hvh_obkak.cfg.vars["Backtrack time"] / 1000
	
	local records = exechack_cc_hvh_obkak.btrecords[ply]

	if !records then
        records = {}
		exechack_cc_hvh_obkak.btrecords[ply] = records
	end
	
	local i = 1
	while i < #records do
		local record = records[i]
		
		if record.simulationtime < deadtime then
			table.remove(records, i)
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
		aimpos =            exechack_cc_hvh_obkak.GetBones( ply )[1],
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

exechack_cc_hvh_obkak.btmodel = exechack_cc_hvh_obkak.CS_Model("models/player/kleiner.mdl")

function exechack_cc_hvh_obkak.drawCSModels_backtrack()
    if not exechack_cc_hvh_obkak.cfg.vars["Backtrack chams"] then return end 
    if not exechack_cc_hvh_obkak.canBacktrack(exechack_cc_hvh_obkak.target) then return end

    local len = #exechack_cc_hvh_obkak.btrecords[exechack_cc_hvh_obkak.target]
    local tbl = exechack_cc_hvh_obkak.btrecords[exechack_cc_hvh_obkak.target][exechack_cc_hvh_obkak.backtracktick]
    local m = exechack_cc_hvh_obkak.btmodel

    exechack_cc_hvh_obkak.CS_Model_update(exechack_cc_hvh_obkak.target,m,tbl)

    if exechack_cc_hvh_obkak.cfg.vars["Backtrack fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(exechack_cc_hvh_obkak.cfg.colors["Backtrack chams"])
    exechack_cc_hvh_obkak.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(exechack_cc_hvh_obkak.chamMats.invis[exechack_cc_hvh_obkak.cfg.vars["Backtrack material"]]) 
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if exechack_cc_hvh_obkak.cfg.vars["Backtrack fullbright"] then
        render.SuppressEngineLighting(false)
    end
end

exechack_cc_hvh_obkak.hitmarkers = {}
exechack_cc_hvh_obkak.hitnums = {}
exechack_cc_hvh_obkak.headshotindicators = {}

gameevent.Listen( "player_hurt" )

function exechack_cc_hvh_obkak.player_hurt(data)
    local health = data.health
	local priority = SERVER and data.Priority or 5
	local hurted = Player( data.userid )
	local attackerid = data.attacker

	if attackerid == pLocalPlayer:UserID() then
        
        if exechack_cc_hvh_obkak.cfg.vars[ "On screen logs" ] then
            local hlcolor = string.ToColor( exechack_cc_hvh_obkak.cfg.colors[ "On screen logs" ] )
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
                    exechack_cc_hvh_obkak.HitLogsWhite,
                    hlcolor,
                    exechack_cc_hvh_obkak.HitLogsWhite,
                    hlcolor,
                    exechack_cc_hvh_obkak.HitLogsWhite,
                }
            }
            
            exechack_cc_hvh_obkak.onScreenLogs[ engine.TickCount() ] = data
            //print( "hurt", engine.TickCount() )
        end

        if exechack_cc_hvh_obkak.cfg.vars["Hitmarker"] then
            exechack_cc_hvh_obkak.hitmarkers[ #exechack_cc_hvh_obkak.hitmarkers + 1 ] = { time = CurTime(), add = 0 }
        end

        if exechack_cc_hvh_obkak.cfg.vars["Hitnumbers"] then
            local hp = hurted:Health() - health
            exechack_cc_hvh_obkak.hitnums[ #exechack_cc_hvh_obkak.hitnums + 1 ] = { time = CurTime(), add = 0, xdir = math.random(-1,1), ydir = math.random(-1,1), dmg = hp, crit = health <= 0 }
        end

        if exechack_cc_hvh_obkak.cfg.vars["Headshot indicator"] then
            local hitgroup = data.hitgroup or data.hit_group or data.HitGroup or data.bodypart
            local damage = hurted:Health() - health
            local isHeadshot = false
            
            if hitgroup then
                isHeadshot = (hitgroup == 1)
            else
                isHeadshot = (damage >= 80) or (health <= 0 and damage >= 50)
            end
            
            if not isHeadshot and health <= 0 then
                isHeadshot = true
            end
            
            if isHeadshot then
                exechack_cc_hvh_obkak.headshotindicators[ #exechack_cc_hvh_obkak.headshotindicators + 1 ] = { time = CurTime(), add = 0, xdir = math.random(-1,1), ydir = math.random(-1,1) }
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Hitsound"] then
            surface.PlaySound( exechack_cc_hvh_obkak.cfg.vars["Hitsound str"] )
        end

        if exechack_cc_hvh_obkak.cfg.vars["Resolver"] then 
            hurted.aimshots = (hurted.aimshots or 0) - 1
        end

    end
end

/*
    Player vars 
*/

function exechack_cc_hvh_obkak.initPlayerVars( v )
    v.ult_prev_pos = Vector()

    v.ult_prev_simtime = 0 
    v.flticks = 0 
    v.aimshots = 0
    v.missedanimticks = 0

    v.break_lc = false 
    v.simtime_updated = false 
    v.fakepitch = false

    exechack_cc_hvh_obkak.btrecords[ v ] = {}
    exechack_cc_hvh_obkak.predicted[ v ] = {}
end

for k, v in ipairs(player.GetAll()) do
	exechack_cc_hvh_obkak.initPlayerVars( v )
end


exechack_cc_hvh_obkak.chatmsg = 
{
        [1] = {
    "%s, еба тя расплющило жирнич", 
    "%s, 《AK•47•KILLER》☆",
    "%s, Теперь я - Ютубер Truckach (◣_◢)",
    "%s, FIX KD NN DOGGO", 
    "%s, طلقه واحده هههههههههه",
    "%s, Я играю на лайфхакерском конфиге от Серёжи (◣_◢)",
    "%s, нищий улетел", 
    "%s, *忍び 1 УПАЛ び忍", 
    "%s, ХАХАХАХАХХАХА НИЩИЙ УЛЕТЕЛ (◣_◢)",
    "%s, я ķ¤нɥåλ ϯβ¤£ü ɱåɱķ£ β Ƥ¤ϯ", 
    "%s, ⒶaŴÞ ︻デ═一 -™",
    "%s, Желток в деле! Белок на пределе! (◣_◢)",
    "%s, опущены стяги, легион и.. А БЛЯТЬ ТЫЖ ТУТ ОПУЩ НАХУЙ ПХГАХААХАХАХАХА)))))))", 
    "%s, але ты там из хрущевки выеди а потом выпрыгивай блять", 
    "%s, ебать ты красиво на бутылку упал",
    "%s, ты как ваще живешь в коробке 1х1м где ты деньги на акк взял нищ ахахах",
    "%s, ╭∩╮(◣_◢)╭∩╮",
    "%s, co‌mm‌it‌ n‌ec‌k ‌ro‌pe‌ u‌r ‌to‌o ‌ba‌d ‌xa‌xa", 
    "%s, op‌ti‌on‌s ‌=>‌ h‌ow‌ t‌o ‌pl‌ay", 
    "%s, who (кто) you (ты) ватофак мен))",
    "%s, ->‌> ‌si‌rg‌ay‌zo‌rh‌ac‌k.‌pw‌/в‌оз‌вр‌ат‌де‌не‌г.‌ph‌p ‌«‌-", 
    "%s, в окно паунс сделай у тя даже юида нету ЛОООЛ",
    "%s, better buy the sergayzorhack!", 
    "%s, земля те землей хуй до чиста еденицей отлетел))",
    "%s, 8====={Headshot beath]==0", 
    "%s,  $$$ 1 TAP UFF YA $$$ ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "%s, ху‌я ‌ты‌ н‌а ‌бу‌ты‌лк‌у ‌уп‌ал‌ х‌ах‌ах‌ах‌а", 
    "%s, I'm not using sergayzorhack.pw, you're just bad",
    "%s, мн‌е ‌по‌ху‌й ‌на‌ к‌ри‌ти‌ку‌ о‌че‌ре‌дн‌ог‌о ‌ны‌ти‌ка‌, ‌со‌ м‌но‌й ‌мо‌и ‌лю‌ди‌, ‌мо‌й ‌ра‌йо‌н,‌ м‌оя‌ ",  
    "%s, AHXAAP!! oNe.TaP.!*", 
    "%s, cya @ dog", 
    "%s, Я играю на вкуснейшем конфиге от Серёжи ツ", 
    "%s, как ты на пк накопил даже не знаю )))))))))", 
    "%s, ✘︎NeveR●︎Give●︎Up✘︎ヅ", 
    "%s, найс 0.5х0.5м комната блять ХАХАХАХА ТЫ ТАМ ЖЕ ДАЖЕ ПОВЕСИТЬСЯ НЕ МОЖЕШЬ МЕСТА НЕТ ПХПХПХППХ", 
    "%s, (っ◔◡◔)っ ❤️Ace Awp❤", 
    "%s, THIS IS OMLEEEEEEET (◣◢)", 
    "%s, ● Loading sergayzorhack... ] 99.9%", 
    "%s, デ ︻ ₳₭-❹❼ ���", 
    "%s, VAAAAAAAC в чат!!! (づ ◕‿◕ )づ", 
    "%s, AWPutin༻︻デ 一",
    "%s, LIFEEEEHAAAACK BITCH!!! (◣_◢)", 
    "%s, AHAHAHHAAH (◣_◢)",
    "%s, а у вас походу умирать это семейное)", 
    "%s, нахуя пидораса убил?", 
    "%s, чао персик дозревай", 
    "%s, уважаемый в тюрьме вы будете водолазом",
    "%s, говори буду плохо говорить буду сосать, буду плохо сосать буду пересасывать", 
    "%s, долбаеб иди башмачки в сундучок школьный собирай", 
    "%s, ботинок ебаный чо слетел", 
    "%s, братик маме привет передай",
    "%s, не противник",
    "%s, а ты че клоун???", 
    "%s, я обоссал тебя (", 
    "%s, ты че там отлетел то?",
    "%s, упал хуета ебаная , но в боди забрал да похуй все равно упал",
    "%s, *DEAD* ливай с хвх (", 
    "%s, до связи башмак",
    "%s, нищета глупейшая играть учись", 
    "%s, опущен сын твари",
    "%s, нищий улетел", 
    "%s, *DEAD* пофикси нищ", 
    "%s, сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
    "%s, животное аддон скачай а то падаешь", 
    "%s, оттарабанен армянская королева", 
    "%s, сука не позорься и ливни",
    "%s, улетел тапочек ебаный", 
    "%s, единицей свалился фуфлыжник",
    "%s, зачем ты играешь тут безмозглый", 
    "%s, иди кумыса попей очередняра",
    "%s, откисай сочняра", 
    "%s, АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК HVH #1 * M9K * CSS * RU",
    "%s, на Truckach.tech то деньги есть????", 
    "%s, ИЩИ СЕБЯ НА https://www.youtube.com/@Truckach",
    "%s, свежий кабанчик", 
        },
        [2] = {
            "я ЂÖг ₸ӹ ԉÖχ",
            "I am ♛ you noob",
            "{X}o4y kak PR0™ moGy kak DNO",
            "(‿!‿) Попа ищет ПрИкЛюченИй•",
            "٠●•۩۞۩[̲̲̅И̲̅Д̲̅И̲̲̅(ٿ)̲̅H̲̅A̲̅X̲̅У̲̅Й]۩۞۩•●٠",
            "DOLBIT N0RMALNO",
            "♛Truckach♛.CFG injecting",
            "Держи ✈ и лети нахуй !",
            "(Ауф)ᶜʸᵇᵉʳˢᵖᵒʳᵗЯ VIP А ТЫ RIP",
            "Следующая остановка – голова",
            "ᵗᵠ ᵉᵇᵃⁿᵘˡˢʸᵃ?",
            "!!!!ОР ВЫШЕ ГОР!!!!",
            "-===≡≡≡( ͝° ͜ʖ͡°) сперма летит тебе в FACE",
            "(っ´ཀ`)っ  ⋃  соси!!1",
            "★А мНе ВсЁ пОфИг★",
            "ОРЕЛ-КАВКАЗА ЛЕТИТ ВЕРШИТЬ СУДЬБУ",
            "•Я АШОТ ТЕБЕ~ХЭДШОТ•",
            "Ð•Ē•M•Ø•Ŋ KILLED YOU",
            "•Я_tOT_komy_HaBce||OX•",
            "༼ つ ◕_◕ ༽つ {лежи ннчик}",
            "4iTeRoc_Ha_SeRvErE",
            "ЂΣƊOŁ∆G∆",
            "-n๏ȼąȼέʍȼя?",
            "АхТы?НеГодЯй!",
            "TRUCKACH.TECH RELEASE ACTIVATED ....",
            "%s EB@NYHKA S CHITOM",
            "给这个亚洲人吹箫",
            "ПуЛя_В_гЛаЗ_и_Ты_УнИТаЗ",
            "$$$ 1 TAP BY ME $$$ ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
            "Ты К@К-т0 Н3ЖН0 СТbIлRЕШЬ ТЫ ЧТО НОВИЧ0К?",
            "эй бро у меня есть truckach.lua тебе дать?",
            "༻︻デ 一♣️ u suk♡︎◕︎‿︎◕︎​",
            "растреливаю детей  ︻   一 - - -  - - -",
            "часы - накрутил✔⼺  ⼺㆔[̲̅Х̲̅][̲̅а̲̅][̲̅р̲̅][̲̅а̲̅][̲̅к̲̅][̲̅т̲̅][̲̅е̅",
            "çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ",
            "%s, юзает пасту сережехак в6 пастед бу ILYAtrasher$",
            "ᴇꜱʟɪ ʏᴀ xᴏʀᴏʜᴏ ɪɢʀᴀɪ ᴇᴛᴏ ɴᴇ ᴢɴᴀʜɪᴛ ʜᴛᴏ ʏᴀ ᴄʜᴇᴀᴛᴇʀ",
            "нож - скамнул✔♕        Я ПЕРСОН  V I P  ТЫ ПАЦАН ВЛИП     ?"
        }, 
        [3] = { 
            "you're cute yknow :3",
            "i'd love to cuddle you <3'",
            ">:3",
            "NYYYAAAAAA!!!~~~",
            "hii daddy~ >w<",
            "soooorry =w=",
            "nice try <3",
            "S-Sorry onii-chan p-please d-do me harder ;w;",
            "Y-You got me all wet now Senpai!",
            "D-Don't t-touch me there Senpai",
            "P-Please l-love me harder oniichan ohh grrh aahhhh~!",
            "Give me all your cum Senpai ahhhhh~",
            "F-Fuck me harder chan! (⊙_⊙;)",
            "Slvtsewer is such a cute femboy ahh~~ f-fuck... ⊙.☉",
            "Oh my god I hate you so much Senpai but please k-keep fucking me harder! ahhh~",
            "D-Do you like my stripped panties getting soaked by you and your hard cock? ehhh master you're so lewd ^0^~",
            "Kun your cute little dick between my bussy looks really cute, I am blushing (*/ω＼*)",
            "M-Master does it feel good when I slide my smoll hand up and down on your cute manly part?",
            "O-Oniichan my t-toes are so warm with your cum all over them (^///^)~",
            "Lets take this swimsuit off already <3 i'll drink your unknown melty juice",
            "S-Stop Senpai if we keep making these lewd sounds im going to cum~~",
            "You're such a pervert for filling me up with your seman Senpai~~",
            "Fill up my bussy with your semen kun ^-^",
            "M-Master d-dont spank my petite butt so hard ahhhH~~~ you're getting me so w-wet~",
            "Senpai your cock is already throbbing from my huge ass~",
            "Hey kun, Can I have some semen?",
            "M-My bussy is overflowing with your semen M-Master",
            "Fill my throat bwussy with your semen kun",
            "It-It's not gay if you're wearing thigh highs M-Master",
            "I-I need somewhere to blow my load. Can i borrow your bussy?",
            "A-ah shit... Y-your cock is big and in my ass -- already~?!",
            "I'll swallow your sticky essence along with you~!",
            "B-Baka please let me be your femboy cum slut!",
            "That's a penis UwU you towd me you wewe a giww!!",
            "Ahhhh... It's like a dream come true... I get to stick my dick inside your ass...!",
            "Hey, who wants a piece of this plump 19-year-old boy-bussy? Single file, boys, come get it while it's hot!",
            "M-Master, if you keep thrusting that hard, i am going to pass out!",
            "When do you wanna meet up again? I've really taken a liking to your dick! (,,◠∇◠) I want you and only you to slam it into my buwssy every day! (≧∇≦)",
            "All I did was crossplay 'cause I felt like it might be fun... But now I am just a little boy that cums from big dicks!",
            "D-Don't get the wrong idea!!! I don't w-want you to fuck my b-bussy because I l-love you or anything! d-definitely not!",
            "I-I know I said you could be as rough as you want... But surprise fisting wasn't what I had in mind!!",
            "W-Why is it that lately... Y-You haven't been playing with my ass!!?",
            "Hehe don't touch me there Onii-chann UwU",
            "Your cum is all over my wet bussy M-Master",
            "It Feels like you're pounding me with the force of a thousand suns Senpai",
            "Y-Yes right there S-Sempai hooyah",
            "P-Please keep filling my bussy S-Sempai",
            "O-Onii-chan it felt so good when you punded my bussy",
            "P-Please Onii-chan keep filling my bussy with your melty juice",
            "O-Onii-chan you just one shot my bussy",
            "I-Im nothing but a f-fucktoy slut for your m-monster fuckmeat!",
            "Dominate my bussy with your vicious swimmers!",
            "Y-Your meat septer has penetrated my tight boy hole",
            "Mnn FASTER... HARDER! Turn me into your femboy slut~!",
            "Mmmm- soothe me, caress me, Fuck me, breed me!",
            "Probe your thick, wet, throbbing cock deeper and deeper into my boipussy~!!",
            "Hya! Not my ears! Ah... It tickles! Ah!",
            "Kouta... I can't believe how BIG his... Wait! Forget about that!! Is Nyuu-chan really giving him a Ass-Fuck!?",
            "Senpai shove deeper your penis in m-my bussy (>ω<) please",
            "I'm coming fwom you fwuking my asshole mmyyy!",
            "P-Please be gentle, S-Senpai!",
            "D-Don't get the wrong idea!! I didn't give up my viginity to you because I like you or anything!!",
            "Let me taste your futa cock with my bussy~",
        },
        [4] = {
            "хуевый ресолвер",
            "хуевые фейклаги",
            "хуевый антиаим",
            "хуевый спинбот",
            "хуевый бхоп",
            "хуевый аим",
            "найс паста аимвара",
            "найс паста мемевара",
            "неужели это идиотбокс???",
            "ого идиотбокс???",
            "неужели это аосхак???",
            "ого аосхак???",
            "неужели это ехек хак???",
            "ого ехек хак???",
            "что за ебанутый у тебя чит?",
            "ez",
            "ezz",
            "изи",
            "ииииииизи",
            "упал",
            "спи",
            "отдыхай",
            "отлетел дебил)",
            "упал пастер",
            "пастер лег",
            "изи даун",
            "ору отлетела дура",
            "найс ресолвер стен",
            "найс ресолвер деревьев",
            "бро имажин ресолвинг ин гмод",
            "улетел фанат артемкинга4",
            "упал фанат артемкинга4",
            "ты куда стреляешь)))",
            "упал ннчик без самоваре",
            "умер ннчик без самоваре",
            "отдыхай ннчик без самоваре",
            "упал подписчик урбанички",
            "умер подписчик урбанички",
            "отдыхай подписчик урбанички",
            "енжинпред где???",
            "антиаим где???",
            "фейклаги где???",
            "антиаим не спас",
            "фейклаги не спасли",
            "даун с пастой отлетел",
            "упал баимер ебаный",
            "отлетел ебаный баимер))",
            "охуеть даун с пастой аимвара",
            "упал дебил",
            "выйди не позорься",
            "найс брейн иссуе",
            "найс кфг иссуе",
            "сука не позорься и ливни лол",
            "*DEAD* пофикси нищ",
            "нищий улетел",
            "набутылирован лол",
            "ебать ты красиво на бутылку упал",
            "хуя тебя опустили))",
            "прости что без смазки)",
            "обоссан",
            "обоссал юзера пасты аимвара",
            "алло это скорая? тут такая ситуация нищ упал)))",
            "на завод иди",
            "ебать тебя унесло",
            "ой нищий упал щас скорую вызовем",
            "научи потом как так сосать на хвх",
            "нихуя ты там как самолет отлетел",
        },
        [5] = {
    "%s еба тя расплющило жирнич", 
    "%s 《AK•47•KILLER》☆",
    "%s Теперь я - Ютубер Truckach (◣_◢)",
    "%s FIX KD NN DOGGO", 
    "%s طلقه واحده هههههههههه",
    "%s Я играю на лайфхакерском конфиге от Серёжи (◣_◢)",
    "%s нищий улетел", 
    "%s *忍び 1 УПАЛ び忍", 
    "%s ХАХАХАХАХХАХА НИЩИЙ УЛЕТЕЛ (◣_◢)",
    "%s я ķ¤нɥåλ ϯβ¤£ü ɱåɱķ£ β Ƥ¤ϯ", 
    "%s ⒶaŴÞ ︻デ═一 -™",
    "%s Желток в деле! Белок на пределе! (◣_◢)",
    "%s опущены стяги, легион и.. А БЛЯТЬ ТЫЖ ТУТ ОПУЩ НАХУЙ ПХГАХААХАХАХАХА)))))))", 
    "%s але ты там из хрущевки выеди а потом выпрыгивай блять", 
    "%s ебать ты красиво на бутылку упал",
    "%s ты как ваще живешь в коробке 1х1м где ты деньги на акк взял нищ ахахах",
    "%s ╭∩╮(◣_◢)╭∩╮",
    "%s co‌mm‌it‌ n‌ec‌k ‌ro‌pe‌ u‌r ‌to‌o ‌ba‌d ‌xa‌xa", 
    "%s op‌ti‌on‌s ‌=>‌ h‌ow‌ t‌o ‌pl‌ay", 
    "%s who (кто) you (ты) ватофак мен))",
    "%s ->‌> ‌si‌rg‌ay‌zo‌rh‌ac‌k.‌pw‌/в‌оз‌вр‌ат‌де‌не‌г.‌ph‌p ‌«‌-", 
    "%s в окно паунс сделай у тя даже юида нету ЛОООЛ",
    "%s better buy the sergayzorhack!", 
    "%s земля те землей хуй до чиста еденицей отлетел))",
    "%s 8====={Headshot beath]==0", 
    "%s  $$$ 1 TAP UFF YA $$$ ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "%s ху‌я ‌ты‌ н‌а ‌бу‌ты‌лк‌у ‌уп‌ал‌ х‌ах‌ах‌ах‌а", 
    "%s I'm not using sergayzorhack.pw, you're just bad",
    "%s мн‌е ‌по‌ху‌й ‌на‌ к‌ри‌ти‌ку‌ о‌че‌ре‌дн‌ог‌о ‌ны‌ти‌ка‌, ‌со‌ м‌но‌й ‌мо‌и ‌лю‌ди‌, ‌мо‌й ‌ра‌йо‌н,‌ м‌оя‌ ",  
    "%s AHXAAP!! oNe.TaP.!*", 
    "%s cya @ dog", 
    "%s Я играю на вкуснейшем конфиге от Серёжи ツ", 
    "%s как ты на пк накопил даже не знаю )))))))))", 
    "%s ✘︎NeveR●︎Give●︎Up✘︎ヅ", 
    "%s найс 0.5х0.5м комната блять ХАХАХАХА ТЫ ТАМ ЖЕ ДАЖЕ ПОВЕСИТЬСЯ НЕ МОЖЕШЬ МЕСТА НЕТ ПХПХПХППХ", 
    "%s (っ◔◡◔)っ ❤️Ace Awp❤", 
    "%s THIS IS OMLEEEEEEET (◣◢)", 
    "%s ● Loading sergayzorhack... ] 99.9%", 
    "%s デ ︻ ₳₭-❹❼ ���", 
    "%s VAAAAAAAC в чат!!! (づ ◕‿◕ )づ", 
    "%s AWPutin༻︻デ 一",
    "%s LIFEEEEHAAAACK BITCH!!! (◣_◢)", 
    "%s AHAHAHHAAH (◣_◢)",
    "%s а у вас походу умирать это семейное)", 
    "%s нахуя пидораса убил?", 
    "%s чао персик дозревай", 
    "%s уважаемый в тюрьме вы будете водолазом",
    "%s говори буду плохо говорить буду сосать, буду плохо сосать буду пересасывать", 
    "%s долбаеб иди башмачки в сундучок школьный собирай", 
    "%s ботинок ебаный чо слетел", 
    "%s братик маме привет передай",
    "%s не противник",
    "%s а ты че клоун???", 
    "%s я обоссал тебя (", 
    "%s ты че там отлетел то?",
    "%s упал хуета ебаная , но в боди забрал да похуй все равно упал",
    "%s *DEAD* ливай с хвх (", 
    "%s до связи башмак",
    "%s нищета глупейшая играть учись", 
    "%s опущен сын твари",
    "%s нищий улетел", 
    "%s *DEAD* пофикси нищ", 
    "%s сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
    "%s животное аддон скачай а то падаешь", 
    "%s оттарабанен армянская королева", 
    "%s сука не позорься и ливни",
    "%s улетел тапочек ебаный", 
    "%s единицей свалился фуфлыжник",
    "%s зачем ты играешь тут безмозглый", 
    "%s иди кумыса попей очередняра",
    "%s откисай сочняра", 
    "%s АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК HVH #1 * M9K * CSS * RU",
    "%s на Truckach.tech то деньги есть????", 
    "%s ИЩИ СЕБЯ НА https://www.youtube.com/@Truckach",
    "%s свежий кабанчик", 
        },    
        [6] = {"HVH OBKAK – DOMINATE EVERY SERVER!",  
"HVH OBKAK – AIMBOT THAT NEVER MISSES!",  
"HVH OBKAK – PERFECT LAG COMPENSATION!",  
"HVH OBKAK – DT THAT BREAKS HITBOXES!",  
"HVH OBKAK – FAKE LAG TO TRICK ENEMIES!",  
"HVH OBKAK – ESP WITH CUSTOM COLORS!",  
"HVH OBKAK – CLOUD CFG FOR INSTANT SETUPS!",  
"HVH OBKAK – HVH TOOLS TO DESTROY ALL!",  
"HVH OBKAK – ANTI-AIM THAT MAKES YOU GHOST!",  
"HVH OBKAK – RAGE MODE FOR EASY WINS!",  
"HVH OBKAK – TRIGGERBOT FOR INSTANT KILLS!",  
"HVH OBKAK – BUNNYHOP WITH PERFECT SYNC!",  
"HVH OBKAK – BACKTRACK TO HIT PAST SHOTS!",  
"HVH OBKAK – CHAMS THAT SEE THROUGH WALLS!",  
"HVH OBKAK – LEGIT MODE FOR STEALTH HACKS!",  
"HVH OBKAK – AUTOSTRAFE LIKE A PRO!",  
"HVH OBKAK – FAKE PING TO BAIT SHOTS!",  
"HVH OBKAK – RESOLVER THAT NEVER FAILS!",  
"HVH OBKAK – INSTANT HITSCAN HEADSHOTS!",  
"HVH OBKAK – AUTO PEEK FOR EASY KILLS!",  
"HVH OBKAK – UNDETECTED BY ANY SERVER!",  
"HVH OBKAK – 3D RADAR FOR FULL CONTROL!",  
"HVH OBKAK – NO RECOIL, NO PROBLEM!",  
"HVH OBKAK – FAKE DUCK TO BAIT ENEMIES!",  
"HVH OBKAK – MANUAL AA FOR PRO PLAYERS!",  
"HVH OBKAK – BULLET TRACERS TO FLEX!",  
"HVH OBKAK – AUTO PISTOL FOR FAST KILLS!",  
"HVH OBKAK – THE KING OF HVH CHEATS!",  
"HVH OBKAK – DOUBLE TAP TO BREAK ANIMATIONS!",  
"HVH OBKAK – ONSHOT AA TO DODGE BULLETS!",  
"HVH OBKAK – FAKE ORIGIN TO CONFUSE AIM!",  
"HVH OBKAK – UNDETECTED = NO BANS!",  
"HVH OBKAK – THE LAST CHEAT YOU'LL NEED!",  
"HVH OBKAK – OWN THE SERVER OR DIE TRYING!",  
"HVH OBKAK – BEST VISUALS IN GARRY'S MOD!",  
"HVH OBKAK – AUTO WALL FOR EASY PENETRATION!",  
"HVH OBKAK – PERFECT SILENT AIM!",  
"HVH OBKAK – SHOT PREDICTION FOR HITS!",  
"HVH OBKAK – FAST LOADING, NO DELAYS!",  
"HVH OBKAK – CUSTOM CONFIGS FOR EVERY PLAYSTYLE!",  
"HVH OBKAK – AIMLOCK THAT FEELS NATURAL!",  
"HVH OBKAK – NO SPREAD FOR PERFECT ACCURACY!",  
"HVH OBKAK – INSTANT SWITCH FOR QUICK KILLS!",  
"HVH OBKAK – PROOF AGAINST SCREENSHOTS!",  
"HVH OBKAK – FULLY CUSTOMIZABLE MENU!",  
"HVH OBKAK – ANTI-SCREENSHOT PROTECTION!",  
"HVH OBKAK – AUTO-BLOCK TO COUNTER ATTACKS!",  
"HVH OBKAK – REAL-TIME UPDATES!",  
"HVH OBKAK – VIP SUPPORT 24/7!",  
"HVH OBKAK – JOIN THE WINNERS TODAY!",  
        },
        [7] = {"%s HVH OBKAK – DOMINATE EVERY SERVER!",
"%s HVH OBKAK – AIMBOT THAT NEVER MISSES!",
"%s HVH OBKAK – PERFECT LAG COMPENSATION!",
"%s HVH OBKAK – DT THAT BREAKS HITBOXES!",
"%s HVH OBKAK – FAKE LAG TO TRICK ENEMIES!",
"%s HVH OBKAK – ESP WITH CUSTOM COLORS!",
"%s HVH OBKAK – CLOUD CFG FOR INSTANT SETUPS!",
"%s HVH OBKAK – HVH TOOLS TO DESTROY ALL!",
"%s HVH OBKAK – ANTI-AIM THAT MAKES YOU GHOST!",
"%s HVH OBKAK – RAGE MODE FOR EASY WINS!",
"%s HVH OBKAK – TRIGGERBOT FOR INSTANT KILLS!",
"%s HVH OBKAK – BUNNYHOP WITH PERFECT SYNC!",
"%s HVH OBKAK – BACKTRACK TO HIT PAST SHOTS!",
"%s HVH OBKAK – CHAMS THAT SEE THROUGH WALLS!",
"%s HVH OBKAK – LEGIT MODE FOR STEALTH HACKS!",
"%s HVH OBKAK – AUTOSTRAFE LIKE A PRO!",
"%s HVH OBKAK – FAKE PING TO BAIT SHOTS!",
"%s HVH OBKAK – RESOLVER THAT NEVER FAILS!",
"%s HVH OBKAK – INSTANT HITSCAN HEADSHOTS!",
"%s HVH OBKAK – AUTO PEEK FOR EASY KILLS!",
"%s HVH OBKAK – UNDETECTED BY ANY SERVER!",
"%s HVH OBKAK – 3D RADAR FOR FULL CONTROL!",
"%s HVH OBKAK – NO RECOIL, NO PROBLEM!",
"%s HVH OBKAK – FAKE DUCK TO BAIT ENEMIES!",
"%s HVH OBKAK – MANUAL AA FOR PRO PLAYERS!",
"%s HVH OBKAK – BULLET TRACERS TO FLEX!",
"%s HVH OBKAK – AUTO PISTOL FOR FAST KILLS!",
"%s HVH OBKAK – THE KING OF HVH CHEATS!",
"%s HVH OBKAK – DOUBLE TAP TO BREAK ANIMATIONS!",
"%s HVH OBKAK – ONSHOT AA TO DODGE BULLETS!",
"%s HVH OBKAK – FAKE ORIGIN TO CONFUSE AIM!",
"%s HVH OBKAK – UNDETECTED = NO BANS!",
"%s HVH OBKAK – THE LAST CHEAT YOU'LL NEED!",
"%s HVH OBKAK – OWN THE SERVER OR DIE TRYING!",
"%s HVH OBKAK – BEST VISUALS IN GARRY'S MOD!",
"%s HVH OBKAK – AUTO WALL FOR EASY PENETRATION!",
"%s HVH OBKAK – PERFECT SILENT AIM!",
"%s HVH OBKAK – SHOT PREDICTION FOR HITS!",
"%s HVH OBKAK – FAST LOADING, NO DELAYS!",
"%s HVH OBKAK – CUSTOM CONFIGS FOR EVERY PLAYSTYLE!",
"%s HVH OBKAK – AIMLOCK THAT FEELS NATURAL!",
"%s HVH OBKAK – NO SPREAD FOR PERFECT ACCURACY!",
"%s HVH OBKAK – INSTANT SWITCH FOR QUICK KILLS!",
"%s HVH OBKAK – PROOF AGAINST SCREENSHOTS!",
"%s HVH OBKAK – FULLY CUSTOMIZABLE MENU!",
"%s HVH OBKAK – ANTI-SCREENSHOT PROTECTION!",
"%s HVH OBKAK – AUTO-BLOCK TO COUNTER ATTACKS!",
"%s HVH OBKAK – REAL-TIME UPDATES!",
"%s HVH OBKAK – VIP SUPPORT 24/7!",
"%s HVH OBKAK – JOIN THE WINNERS TODAY!",
        },
        [8] = {"HVH OBKAK JUST OBLITERATED YOU - UNINSTALL NOOB!",

"MY AIMBOT NEVER MISSES - THANKS HVH OBKAK!",

"WHY SHOOT? HVH OBKAK MAKES ME UNTOUCHABLE!",

"LOL YOUR HACKS ARE TRASH COMPARED TO HVH OBKAK!",

"HVH OBKAK'S BACKTRACK DELETED YOUR HITBOX!",

"I SEE THROUGH WALLS - HVH OBKAK ESP OP!",

"CRY HARDER - HVH OBKAK OWNS THIS SERVER!",

"YOUR CHEATS CAN'T COMPETE WITH HVH OBKAK!",

"HVH OBKAK'S DT SHOT THROUGH TIME AND SPACE!",

"MY BULLETS CURVE - HVH OBKAK MAGIC!",

"REPORT ME? HVH OBKAK IS UNDETECTED!",

"I DON'T AIM - HVH OBKAK DOES IT FOR ME!",

"YOUR TEAM IS NEXT - HVH OBKAK RAGE MODE!",

"WHY RUN? HVH OBKAK SEES EVERYTHING!",

"HVH OBKAK'S FAKE LAG MAKES YOU LOOK DUMB!",

"I KILL BEFORE YOU SEE ME - HVH OBKAK OP!",

"UPGRADE TO HVH OBKAK OR STAY TRASH!",

"HVH OBKAK JUST MADE YOU UNINSTALL GMOD!",

"I NEVER MISS - YOUR HITBOX VANISHED!",

"HVH OBKAK SILENT AIM = INSTANT DEATH!",

"YOU SHOOT MY FAKE ORIGIN - NICE TRY!",

"MY CHAMS MAKE YOU GLOW LIKE XMAS!",

"HVH OBKAK RESOLVER FIXES YOUR BAD ANGLES!",

"I KILL WHILE LOOKING AWAY - HVH OBKAK OP!",

"YOUR AIM SUCKS - HVH OBKAK FIXES THAT!",

"HVH OBKAK AUTO WALL IGNORES COVER!",

"I DON'T DIE - HVH OBKAK ANTI-AIM OP!",

"YOU VS HVH OBKAK = NO CHANCE!",

"HVH OBKAK MADE YOU RAGE QUIT - GG!",

"MY TRIGGERBOT KILLS IN NANOSECONDS!",

"YOUR MOVEMENT IS PREDICTABLE - HVH OBKAK KNOWS!",

"I SEE YOUR HEALTH - YOU'RE ALREADY DEAD!",

"HVH OBKAK FAKE DUCK BAITED YOU!",

"NOT LAGGING - THAT'S HVH OBKAK FAKE PING!",

"MY ESP SHOWS YOUR WEAKNESSES!",

"HVH OBKAK MADE YOU LOOK LIKE A BOT!",

"I NEED NO SKILL - HVH OBKAK IS MY SKILL!",

"YOUR HACKS ARE TOYS - MINE ARE WEAPONS!",

"HVH OBKAK CLOUD CFG = PRO SETTINGS INSTANT!",

"I KILL WHILE AFK - HVH OBKAK OP!",

"YOUR TEAM FEEDS ME KILLS - THANKS!",

"HVH OBKAK AIMLOCK SNAPS TO YOUR FACE!",

"YOU CAN'T HIDE - MY WALLHACK SEES ALL!",

"I DON'T MISS - YOUR HITBOX FEARS ME!",

"HVH OBKAK MADE YOU UNINSTALL STEAM!",

"MY BUNNYHOP IS SMOOTHER THAN YOUR SALT!",

"YOUR SHOTS PHASE THROUGH ME - MAGIC!",

"HVH OBKAK AUTO PEEK = FREE KILLS!",

"I KILL EYES CLOSED - HVH OBKAK OP!",

"YOUR HACKS GET DESTROYED - SAD!",

"HVH OBKAK HVH MODE = YOU LOSE!",

"I DON'T TRY - HVH OBKAK CARRIES ME!",

"YOUR AIM LIKE STORM - MISSES EVERYTHING!",

"HVH OBKAK MADE YOU QUESTION LIFE!",

"MY NO RECOIL = LASER PRECISION!",

"NOT LAGGING - HVH OBKAK FAKE LAG!",

"HVH OBKAK MADE YOU LOOK NOOB!",

"I KILL ACROSS MAP - HVH OBKAK OP!",

"YOUR HACKS OBSOLETE - UPGRADE NOW!",

"HVH OBKAK AIM ASSIST = AUTO HS!",

"YOU SHOOT AIR - I'M OVER HERE!",

"MY ESP SHOWS YOUR POVERTY!",

"HVH OBKAK MADE YOU LEAVE SERVER!",

"I DON'T MOVE - AIMBOT DOES ALL!",

"YOUR HACKS WEAK - MINE STRONG!",

"HVH OBKAK FAKE ORIGIN = CAN'T HIT ME!",

"YOU VS CHEAT = GIVE UP!",

"MY BULLET TRACERS HUMILIATE YOU!",

"HVH OBKAK MADE YOU UNINSTALL CSGO!",

"I KILL WHILE TYPING - HVH OBKAK OP!",

"YOUR MOVEMENT LIKE BOT - EASY!",

"HVH OBKAK AUTO PISTOL = INSTANT HS!",

"YOU'RE NOT INVISIBLE - I SEE ALL!",

"I DON'T NEED SEE YOU - AIMBOT DOES!",

"YOUR HACKS JOKE - MINE REAL!",

"HVH OBKAK MADE YOU RAGE IN CHAT!",

"MY DOUBLE TAP BREAKS HITBOXES!",

"NOT LAGGING - HVH OBKAK ANTI-AIM!",

"HVH OBKAK = REASON YOU LOSE!",

"HVH OBKAK'S TRIGGERBOT = INSTANT KILLS!",

"YOUR POSITION KNOWN - HVH OBKAK RADAR!",

"I CONTROL SERVER - HVH OBKAK OP!",

"YOUR ANGLES BROKEN - HVH OBKAK FIXED!",

"HVH OBKAK'S MOVEMENT HACKS = GODLIKE!",

"I SHOOT THROUGH WALLS - NO PROBLEM!",

"YOUR CONFIG TRASH - MINE PERFECT!",

"HVH OBKAK'S RESOLVER = NO MISSES!",

"I OWN YOU - HVH OBKAK UNDETECTED!",

"YOUR TEAM SUCKS - HVH OBKAK CARRIES!",

"HVH OBKAK'S FAKE DUCK = BAIT KING!",

"I DODGE ALL SHOTS - LIKE MATRIX!",

"YOUR HACKS DETECTED - MINE SAFE!",

"HVH OBKAK'S CLOUD SYSTEM = PRO INSTANT!",

"I HAVE WALLS - YOU HAVE NOTHING!",

"YOUR LOSSES = HVH OBKAK WINS!",

"HVH OBKAK'S MENU = MOST BEAUTIFUL!",

"I TOGGLE CHEATS - YOU TOGGLE TEARS!",

"YOUR AIM BAD - MY AIMBOT PERFECT!",

"HVH OBKAK'S"
        }
    }


exechack_cc_hvh_obkak.killstreak = 0 

// Init player vars 
gameevent.Listen( "player_spawn" )
gameevent.Listen( "player_activate" )
gameevent.Listen( "entity_killed" )

function exechack_cc_hvh_obkak.entity_killed(data)
    local aid = Entity(data.entindex_attacker)  
    local vid = Entity(data.entindex_killed)

    if aid == pLocalPlayer and aid != vid and !vid:IsNPC() and (vid:IsPlayer() or vid:IsBot() ) then
        if exechack_cc_hvh_obkak.cfg.vars["Killsay"] then
            local chatPrefixes = {
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm "
            }
            
            local chatGroup = exechack_cc_hvh_obkak.cfg.vars["Killsay group"]
            
            local prefix = chatPrefixes[chatGroup] or ""
        
            local tbl = exechack_cc_hvh_obkak.chatmsg[ exechack_cc_hvh_obkak.cfg.vars["Killsay mode"] ]
            local str = prefix .. tbl[ math.random( 1, #tbl ) ]
            
            if str:find("%s") then 
                str = str:gsub("%%s", vid:Nick()) 
            end
            if str:find("%s") then 
                str = str:gsub("%%s", vid:SteamID()) 
            end

            RunConsoleCommand( "say", str )
        end

        
        if exechack_cc_hvh_obkak.cfg.vars["Killsound"] then
            surface.PlaySound( exechack_cc_hvh_obkak.cfg.vars["Killsound str"] )
        end

        if exechack_cc_hvh_obkak.cfg.vars["Killstreak"] then
            exechack_cc_hvh_obkak.killstreak = (exechack_cc_hvh_obkak.killstreak or 0) + 1  
            
            if exechack_cc_hvh_obkak.killstreak > 0 then
                if exechack_cc_hvh_obkak.killstreak == 1 then
                    surface.PlaySound("firstblood.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 2 then
                    surface.PlaySound("doublekill.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 3 then
                    surface.PlaySound("killingspree.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 4 then
                    surface.PlaySound("unstoppable.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 5 then
                    surface.PlaySound("triplekill.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 7 then
                    surface.PlaySound("wickedsick.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 9 then
                    surface.PlaySound("dominating.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 11 then
                    surface.PlaySound("ultrakill.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 15 then
                    surface.PlaySound("holyshit.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 17 then
                    surface.PlaySound("godlike.wav")
                elseif exechack_cc_hvh_obkak.killstreak == 20 then
                    surface.PlaySound("rampage.wav")
                elseif exechack_cc_hvh_obkak.killstreak > 20 then
                    exechack_cc_hvh_obkak.killstreak = 0  -- Сброс после 20 убийств
                end
            end
        end
    end
end

function exechack_cc_hvh_obkak.updatePlayerVars( data )
    local id = data.userid  

    local ply = Player( id )

    ply.ult_prev_pos = Vector()
    // ply.ult_prev_hitbox_pos = Vector()
    
    ply.ult_prev_simtime = 0
    ply.flticks = 0
        
    ply.simtime_updated = false
    ply.break_lc = false
    ply.fakepitch = false

    exechack_cc_hvh_obkak.btrecords[ ply ] = {}
    exechack_cc_hvh_obkak.predicted[ ply ] = {}
end



















// Menu hints 

function exechack_cc_hvh_obkak.DrawMenuHints()
    if not exechack_cc_hvh_obkak.frame:IsVisible() then return end

    if not exechack_cc_hvh_obkak.hint then
        exechack_cc_hvh_obkak.hintText = ""
        return
    end

    surface.SetTextColor(exechack_cc_hvh_obkak.Colors[165])
    surface.SetFont("DermaSmall")

    local tw, th = surface.GetTextSize(exechack_cc_hvh_obkak.hintText)

    surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[35])
    surface.DrawRect(exechack_cc_hvh_obkak.hintX,exechack_cc_hvh_obkak.hintY,tw+20,th+10)
    surface.SetDrawColor(exechack_cc_hvh_obkak.Colors[54])
    surface.DrawOutlinedRect(exechack_cc_hvh_obkak.hintX,exechack_cc_hvh_obkak.hintY,tw+20,th+10,1)    

    surface.SetTextPos(exechack_cc_hvh_obkak.hintX+10,exechack_cc_hvh_obkak.hintY+5)
    surface.DrawText(exechack_cc_hvh_obkak.hintText)

    exechack_cc_hvh_obkak.hint = false
end

function exechack_cc_hvh_obkak.DrawOverlay()
    if exechack_cc_hvh_obkak.UnSafeFrame then return end

    exechack_cc_hvh_obkak.DrawMenuHints()
end


// Gamemode UpdateClientsideAnimation

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




/*
    Libs -> Color
*/



//function exechack_cc_hvh_obkak.


function exechack_cc_hvh_obkak.ColorLerp( first, second )
    local FT = FrameTime() * 350

    first.r = math.Approach( first.r, second.r, FT )
    first.g = math.Approach( first.g, second.g, FT )
    first.b = math.Approach( first.b, second.b, FT )
    first.a = math.Approach( first.a, second.a, FT )

    math.Round( first.r, 0 )
    math.Round( first.g, 0 )
    math.Round( first.b, 0 )
    math.Round( first.a, 0 )

    return first
end

function exechack_cc_hvh_obkak.ColorEqual( first, second )
    if first.r != second.r or first.g != second.g or first.b != second.b or first.a != second.a then
        return false
    end

    return true 
end





/* 
    hooks -> Think 
*/

exechack_cc_hvh_obkak.ekd = false
exechack_cc_hvh_obkak.ekd2 = false
exechack_cc_hvh_obkak.ekd3 = false
exechack_cc_hvh_obkak.fbkd = false

// Dancer ( act / taunt spam )

exechack_cc_hvh_obkak.nextact = 0
exechack_cc_hvh_obkak.actCommands = {"robot","muscle","laugh","bow","cheer","wave","becon","agree","disagree","forward","group","half","zombie","dance","pers","halt","salute"}
exechack_cc_hvh_obkak.nextact2 = 0
exechack_cc_hvh_obkak.act2Commands = {"melee", "frenzy", "melee2", "poke"}

// Name changer 

do
    local cooldown = GetConVarNumber("sv_namechange_cooldown_seconds")
    local curtime = CurTime()
    local lastname = pLocalPlayer:Name()
    local changed = 0

    local function check(pl,mn,ptbl)
        if pl == pLocalPlayer then return false end 

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

    function exechack_cc_hvh_obkak.nameChanger() 
        if curtime > CurTime() then return end

        local pltbl = player.GetAll()

        local len = pLocalPlayer:Name():len()

        local mname = string.sub(pLocalPlayer:Name(),1,len-1)

        local i = math.random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
end

do
    local tply
    local chatdelay = CurTime()
    local inverterdown = false
        
    function exechack_cc_hvh_obkak.Think()
        if input.IsKeyDown(KEY_END) then 
            exechack_cc_hvh_obkak.Unload()
        end

        if input.IsKeyDown(KEY_INSERT) and not exechack_cc_hvh_obkak.kd then 
            exechack_cc_hvh_obkak.togglevisible()
    
            CloseDermaMenus()
        end

        exechack_cc_hvh_obkak.kd = input.IsKeyDown(KEY_INSERT)

        if exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Ent add"] ) and not exechack_cc_hvh_obkak.ekd then
            local tr = pLocalPlayer:GetEyeTrace().Entity

            if IsValid( tr ) then 
                local class = tr:GetClass()

                if not exechack_cc_hvh_obkak.cfg.ents[ class ] then
                   exechack_cc_hvh_obkak.cfg.ents[ class ] = true
                else
                   exechack_cc_hvh_obkak.cfg.ents[ class ] = nil
                end
            end
        end

if exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Player add"]) and not exechack_cc_hvh_obkak.ekd2 then
    local tr = pLocalPlayer:GetEyeTrace().Entity

    if IsValid(tr) and tr:GetClass() == "player" then 
        local steamId = tr:SteamID()

        if not exechack_cc_hvh_obkak.cfg.friends[steamId] then
            exechack_cc_hvh_obkak.cfg.friends[steamId] = true
        else
            exechack_cc_hvh_obkak.cfg.friends[steamId] = nil
        end
    end
end

if exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Priority add"] or KEY_F4) and not exechack_cc_hvh_obkak.ekd3 then
    local tr = pLocalPlayer:GetEyeTrace().Entity

    if IsValid(tr) and tr:GetClass() == "player" then 
        local steamId = tr:SteamID()

        if not exechack_cc_hvh_obkak.cfg.priorityList[steamId] then
            exechack_cc_hvh_obkak.cfg.priorityList[steamId] = true
            print("[Priority] Добавлен игрок: "..tr:Name())
        else
            exechack_cc_hvh_obkak.cfg.priorityList[steamId] = nil
            print("[Priority] Удален игрок: "..tr:Name())
        end
    end
end

        if exechack_cc_hvh_obkak.cfg.vars["Inverter"] and exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Inverter"] ) and not inverterdown then
            exechack_cc_hvh_obkak.inverted = !exechack_cc_hvh_obkak.inverted 
        end

        inverterdown = exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Inverter"] )

        exechack_cc_hvh_obkak.ekd = exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Ent add"] )
        exechack_cc_hvh_obkak.ekd2 = exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Player add"] )
        exechack_cc_hvh_obkak.ekd3 = exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Priority add"] )

        if exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Fullbright"] ) and not exechack_cc_hvh_obkak.fbkd then
            exechack_cc_hvh_obkak.fbe = not exechack_cc_hvh_obkak.fbe
        end

        exechack_cc_hvh_obkak.fbkd = exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Fullbright"] )

        if exechack_cc_hvh_obkak.cfg.vars["FSpec ClickTP"] and exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["FSpec ClickTP"] ) then
            local pos = pLocalPlayer:GetEyeTrace().HitPos
            
            //print(pos)

            //RunConsoleCommand( "ba", "spec" )

            RunConsoleCommand( "FTPToPos", string.format("%d, %d, %d", pos.x, pos.y, pos.z), string.format("%d, %d, %d", 0, 0, 0) )
        end

        
        
        // exechack_cc_hvh_obkak.cfg.vars["FSpec Teleport"] = false
        // exechack_cc_hvh_obkak.cfg.binds["FSpec Teleport"] = 0
        
        // exechack_cc_hvh_obkak.cfg.vars["FSpec Masskill"] = false
        // exechack_cc_hvh_obkak.cfg.binds["FSpec Masskill"] = 0
        
        // exechack_cc_hvh_obkak.cfg.vars["FSpec Velocity"] = false
        // exechack_cc_hvh_obkak.cfg.binds["FSpec Velocity"] = 0

        if exechack_cc_hvh_obkak.cfg.vars["Chat spammer"] and CurTime() > chatdelay then
            local chatPrefixes = {
                [2] = "/ooc ",
                [3] = "/ad "
            }
            
            local chatGroup = exechack_cc_hvh_obkak.cfg.vars["Chat group"]
            
            local prefix = chatPrefixes[chatGroup] or ""
        
            local tbl = exechack_cc_hvh_obkak.chatmsg[ exechack_cc_hvh_obkak.cfg.vars["Chat mode"] ]
            local str = prefix .. tbl[ math.random( 1, #tbl ) ]

            local players   = player.GetAll()

            local random_ply = players[ math.random( 1, #players ) ]
            if random_ply == pLocalPlayer then return end

            str = string.format( str, exechack_cc_hvh_obkak.playerCache[ random_ply ].Name )

            RunConsoleCommand("say", str)

            chatdelay = CurTime() + exechack_cc_hvh_obkak.cfg.vars["Chat delay"]
        end
    
        if exechack_cc_hvh_obkak.cfg.vars["Name stealer"] then exechack_cc_hvh_obkak.nameChanger() end
    
        if ded.GetCurrentCharge() < exechack_cc_hvh_obkak.cfg.vars["Shift ticks"] then ded.StartShifting( false ) end

        if exechack_cc_hvh_obkak.cfg.vars["Tickbase shift"] then 
            if exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Tickbase shift"] ) then
                ded.StartShifting( true )
            end
            
            local shouldcharge =  ded.GetCurrentCharge() < exechack_cc_hvh_obkak.cfg.vars["Charge ticks"] and exechack_cc_hvh_obkak.IsKeyDown( exechack_cc_hvh_obkak.cfg.binds["Auto recharge"] )
            
            ded.StartRecharging( shouldcharge )
        
            if shouldcharge then
                ded.StartShifting( false )
            end
        end
    
        if exechack_cc_hvh_obkak.cfg.vars["Taunt spam"] and exechack_cc_hvh_obkak.nextact < CurTime() and pLocalPlayer:Alive() then 
            local act = exechack_cc_hvh_obkak.actCommands[exechack_cc_hvh_obkak.cfg.vars["Taunt"]]
    
            RunConsoleCommand("act", act)
            exechack_cc_hvh_obkak.nextact = CurTime() + 0.3
        end
    
        if exechack_cc_hvh_obkak.cfg.vars["Taunt 2"] and exechack_cc_hvh_obkak.nextact2 < CurTime() and pLocalPlayer:Alive() then
            local act2 = exechack_cc_hvh_obkak.act2Commands[exechack_cc_hvh_obkak.cfg.vars["Taunt 2.1"]]
    
            RunConsoleCommand("act2", act2)
            exechack_cc_hvh_obkak.nextact2 = CurTime() + 0.3
        end

        if exechack_cc_hvh_obkak.cfg.vars["Yaw base"] == 2 then
            tply = exechack_cc_hvh_obkak.GetSortedPlayers( 1, 0, 1, false ) 
    
            if tply then
                exechack_cc_hvh_obkak.aatarget = tply[1][1]
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Auto peak"] then
            exechack_cc_hvh_obkak.autopeakThink()
        end
    end
end


/*
    hooks -> CalcView
*/

exechack_cc_hvh_obkak.vieworigin = pLocalPlayer:EyePos()
exechack_cc_hvh_obkak.viewfov    = 0
exechack_cc_hvh_obkak.znear      = 0

exechack_cc_hvh_obkak.tpenabled = false
exechack_cc_hvh_obkak.tptoggled = false

exechack_cc_hvh_obkak.fcvector = pLocalPlayer:EyePos()
exechack_cc_hvh_obkak.fcangles = pLocalPlayer:EyeAngles()
exechack_cc_hvh_obkak.fcenabled = false
exechack_cc_hvh_obkak.fctoggled = false


/* // TODO
exechack_cc_hvh_obkak.checkbox("Collision","Third person collision",p:GetItemPanel())
exechack_cc_hvh_obkak.checkbox("Smoothing","Third person smoothing",p:GetItemPanel())

exechack_cc_hvh_obkak.slider("X","Viewmodel x",1,180,0,p:GetItemPanel())
exechack_cc_hvh_obkak.slider("Y","Viewmodel y",1,180,0,p:GetItemPanel())
exechack_cc_hvh_obkak.slider("Z","Viewmodel z",1,180,0,p:GetItemPanel())
exechack_cc_hvh_obkak.slider("Roll","Viewmodel r",1,360,0,p:GetItemPanel())
*/

function exechack_cc_hvh_obkak.ShouldDrawLocalPlayer(ply)
    if ( exechack_cc_hvh_obkak.tpenabled ) then
        ply:SetNoDraw( false )
    end
    return exechack_cc_hvh_obkak.tpenabled 
end

exechack_cc_hvh_obkak.cameraHullMax = Vector( 3, 3, 3 )
exechack_cc_hvh_obkak.cameraHullMin = Vector( -3, -3, -3 )
function exechack_cc_hvh_obkak.CalcView( ply, origin, angles, fov, znear, zfar )
    if exechack_cc_hvh_obkak.UnSafeFrame then 
        return { origin = origin, angles = angles, fov = fov } 
    end

    local view = {}

    local tppressed = exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Third person"])
    local fcpressed = exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Free camera"])

    if exechack_cc_hvh_obkak.cfg.vars["Third person"] and tppressed and not exechack_cc_hvh_obkak.tptoggled then
        exechack_cc_hvh_obkak.tpenabled = not exechack_cc_hvh_obkak.tpenabled
    end

    if exechack_cc_hvh_obkak.cfg.vars["Free camera"] and fcpressed and not exechack_cc_hvh_obkak.fctoggled then
        exechack_cc_hvh_obkak.fcenabled = not exechack_cc_hvh_obkak.fcenabled
        exechack_cc_hvh_obkak.fcangles = pLocalPlayer:EyeAngles()
    elseif exechack_cc_hvh_obkak.fcenabled and not exechack_cc_hvh_obkak.cfg.vars["Free camera"] then
        exechack_cc_hvh_obkak.fcenabled = false
    end

    exechack_cc_hvh_obkak.tptoggled = tppressed
    exechack_cc_hvh_obkak.fctoggled = fcpressed


    if exechack_cc_hvh_obkak.cfg.vars["Fake duck"] and exechack_cc_hvh_obkak.IsKeyDown(exechack_cc_hvh_obkak.cfg.binds["Fake duck"]) then
        origin.z = pLocalPlayer:GetPos().z + 64
    end

    local fangs = exechack_cc_hvh_obkak.cfg.vars["Silent aim"] and exechack_cc_hvh_obkak.SilentAngle or angles

    //angles = fangs
    //if not exechack_cc_hvh_obkak.cfg.vars[ "Norecoil" ] then
    //    angles:Add( ply:GetViewPunchAngles() )
    //end

    if exechack_cc_hvh_obkak.fcenabled then
        local speed = exechack_cc_hvh_obkak.cfg.vars["Free camera speed"]
        
        if input.IsKeyDown(KEY_W) then
            exechack_cc_hvh_obkak.fcvector = exechack_cc_hvh_obkak.fcvector + exechack_cc_hvh_obkak.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_S) then
            exechack_cc_hvh_obkak.fcvector = exechack_cc_hvh_obkak.fcvector - exechack_cc_hvh_obkak.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_A) then
            exechack_cc_hvh_obkak.fcvector = exechack_cc_hvh_obkak.fcvector - exechack_cc_hvh_obkak.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_D) then
            exechack_cc_hvh_obkak.fcvector = exechack_cc_hvh_obkak.fcvector + exechack_cc_hvh_obkak.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_SPACE) then
            exechack_cc_hvh_obkak.fcvector.z = exechack_cc_hvh_obkak.fcvector.z + speed
        end

        if input.IsKeyDown(KEY_LSHIFT) then
            exechack_cc_hvh_obkak.fcvector.z = exechack_cc_hvh_obkak.fcvector.z - speed
        end

        view.origin = exechack_cc_hvh_obkak.fcvector
        view.angles = fangs
        view.fov = exechack_cc_hvh_obkak.cfg.vars["Fov override"]
        view.drawviewer = !exechack_cc_hvh_obkak.cfg.vars["Ghetto free cam"]
    else
        exechack_cc_hvh_obkak.fcvector = origin
        view.origin = exechack_cc_hvh_obkak.tpenabled and origin - ( (fangs):Forward() * exechack_cc_hvh_obkak.cfg.vars["Third person distance"] ) or origin

        if exechack_cc_hvh_obkak.tpenabled and exechack_cc_hvh_obkak.cfg.vars["Third person collision"] then
            local tr = {}

            tr.start = origin
            tr.endpos = origin - ( (fangs):Forward() * exechack_cc_hvh_obkak.cfg.vars["Third person distance"] )
            tr.mins = exechack_cc_hvh_obkak.cameraHullMin
            tr.maxs = exechack_cc_hvh_obkak.cameraHullMax
            tr.filter = ply
            tr.mask = MASK_BLOCKLOS

            local res = TraceHull( tr )

            view.origin = res.HitPos
        end

        view.angles = fangs
        view.fov = exechack_cc_hvh_obkak.cfg.vars["Fov override"]
        view.drawviewer = hook.Call( "ShouldDrawLocalPlayer", nil, ply )
    end

    exechack_cc_hvh_obkak.vieworigin = ( exechack_cc_hvh_obkak.cfg.vars["Ghetto free cam"] and exechack_cc_hvh_obkak.fcenabled ) and exechack_cc_hvh_obkak.fcvector or origin
    exechack_cc_hvh_obkak.viewfov    = view.fov
    exechack_cc_hvh_obkak.znear      = znear

    if ( not exechack_cc_hvh_obkak.cfg.vars["Override view"] ) then
        if ( math.floor( fov ) ~= GetConVar( "fov_desired" ):GetFloat() ) then
            view.fov = fov 
        end

        local pVehicle = pLocalPlayer:GetVehicle()

        if ( IsValid( pVehicle ) ) then
            view = hook.Run( "CalcVehicleView", pVehicle, ply, view )
        end

        local pWeapon = pLocalPlayer:GetActiveWeapon()
        
        if ( IsValid( pWeapon ) ) then
            local pWeaponCalcView = pWeapon.CalcView 

            if ( pWeaponCalcView ) then
                local origin, angles, fov = pWeaponCalcView( pWeapon, ply, Vector( view.origin ), Angle( view.angles ), view.fov ) 
			    view.origin, view.angles, view.fov = origin or view.origin, angles or view.angles, fov or view.fov
            end
        end
    end
	return view
end

function exechack_cc_hvh_obkak.GetFovRadius()
    local Radius = exechack_cc_hvh_obkak.cfg.vars["Aimbot FOV"]

    local Ratio = screenWidth / screenHeight
    local AimFOV = Radius * (math.pi / 180)
    local GameFOV = exechack_cc_hvh_obkak.viewfov * (math.pi / 180)
    local ViewFOV = 2 * math.atan(Ratio * (exechack_cc_hvh_obkak.znear / 2) * math.tan(GameFOV / 2))



    return (math.tan(AimFOV) / math.tan(ViewFOV / 2)) * screenWidth
end

/*
    hooks -> CalcViewModelView
*/

function exechack_cc_hvh_obkak.CalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)
    if wep.CalcViewModelView then wep.CalcViewModelView = nil end

    pos = exechack_cc_hvh_obkak.vieworigin 
	ang = exechack_cc_hvh_obkak.cfg.vars["Silent aim"] and exechack_cc_hvh_obkak.SilentAngle or ang

	return pos, ang
end

/*
    hooks -> Pre / Post DrawViewModel
*/

do
    local drawing = false

    function exechack_cc_hvh_obkak.PreDrawViewModel( vm, ply, w )
        if exechack_cc_hvh_obkak.UnSafeFrame then return end
        if ply != pLocalPlayer then return end

        if exechack_cc_hvh_obkak.cfg.vars["Viewmodel chams"] then
            local col = string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Viewmodel chams"] )
            exechack_cc_hvh_obkak.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = exechack_cc_hvh_obkak.chamMats.vis[exechack_cc_hvh_obkak.cfg.vars["Viewmodel chams type"]] 

            render.SetBlend(col.a/255)
            render.SetColorModulation(col.r/255,col.g/255,col.b/255)
            render.MaterialOverride(mat)
        end

        if exechack_cc_hvh_obkak.cfg.vars["Fullbright viewmodel"] then
            render.SuppressEngineLighting( true )
        end

        if exechack_cc_hvh_obkak.cfg.vars["Viewmodel fov"] != GetConVar("viewmodel_fov"):GetInt() and not drawing then 
            cam.Start3D(nil, nil, exechack_cc_hvh_obkak.cfg.vars["Viewmodel fov"])

                drawing = true

                render.DepthRange( 0, 0.01 )

                vm:DrawModel()

                render.DepthRange( 0, 1 )

                drawing = false

            cam.End3D()
        else
            return 
        end
        
        return true
    end

end

function exechack_cc_hvh_obkak.PostDrawViewModel( vm, ply, w )
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride()
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
end

/*
    hooks -> OnImpact ( c++ module )
*/
exechack_cc_hvh_obkak.bulletImpacts = {}

function exechack_cc_hvh_obkak.OnImpact( data )
    local startpos = data.m_vStart 

    if exechack_cc_hvh_obkak.cfg.vars[ "Bullet tracers muzzle" ] and data.m_vStart == pLocalPlayer:EyePos() then
        local vm = pLocalPlayer:GetViewModel()
	    local wep = pLocalPlayer:GetActiveWeapon()

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

    exechack_cc_hvh_obkak.bulletImpacts[#exechack_cc_hvh_obkak.bulletImpacts + 1] = {
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
    local oldtrmat = exechack_cc_hvh_obkak.cfg.vars["Bullet tracers material"]
    local tracemat = Material("sprites/tp_beam001")

    local realcolor, fakecolor, lbycolor = Color( 0, 255, 0 ), Color( 255, 0, 0 ), Color( 0, 0, 255 )



    -- Saddam Hussein
    /*
    local bIsSaddamHusseinGenerated = false 
    local pSaddamHussein = { Model = ClientsideModel( "models/player/breen.mdl" ) }
    local flSysTime = SysTime()

    while ( not pSaddamHussein.Position ) do
        local vecRandom = VectorRand( -4096, 4096 )

        if ( not util.TraceLine( { collisiongroup = COLLISION_GROUP_WORLD, start = pos, endpos = pos } ).HitWorld ) then
            pSaddamHussein.Position = util.TraceLine( { collisiongroup = COLLISION_GROUP_WORLD, start = vecRandom, endpos = vecRandom + Vector( 0, 0, -1 ) * 50000 } ).HitPos
            pSaddamHussein.Position.z = pSaddamHussein.Position.z + 16
        end
    end

    print( string.format( "Generated Saddam Hussein in %fs, approximate location: %s.", SysTime() - flSysTime, pSaddamHussein.Position ) )

    pSaddamHussein.Model:SetPos( pSaddamHussein.Position )
    pSaddamHussein.Model:SetAngles( Angle( -90, 0, 0 ) )
    pSaddamHussein.Model:SetNoDraw( true )
*/

    function exechack_cc_hvh_obkak.PostDrawOpaqueRenderables()

        if exechack_cc_hvh_obkak.UnSafeFrame then return end

        if exechack_cc_hvh_obkak.cfg.vars["Angle arrows"] then
            local pos = pLocalPlayer:GetPos()

            cam.IgnoreZ(true)

            cam.Start3D2D( pos, Angle(0, exechack_cc_hvh_obkak.realAngle.y + 45, 0), 1 )
                surface.SetDrawColor( realcolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            cam.Start3D2D( pos, Angle(0, exechack_cc_hvh_obkak.fakeAngles.angle.y + 45, 0), 1 )
                surface.SetDrawColor( fakecolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            local lby = pLocalPlayer:GetPoseParameter("body_yaw") * 360 - 180
            cam.Start3D2D( pos, Angle(0, lby + 45, 0), 1 )
                surface.SetDrawColor( lbycolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            cam.IgnoreZ( false )
        end

        if exechack_cc_hvh_obkak.cfg.vars["Bullet tracers"] then
            local trmat = exechack_cc_hvh_obkak.cfg.vars["Bullet tracers material"] 
    
            if trmat != oldtrmat then
                tracemat = Material( trmat )
                oldtrmat = trmat
            end

            render.SetMaterial( tracemat ) 
    
            local tracercolor = string.ToColor(exechack_cc_hvh_obkak.cfg.colors["Bullet tracers"])
            local oldAlpha = tracercolor.a

            local curTime = CurTime()
            local dieTime = exechack_cc_hvh_obkak.cfg.vars["Tracers die time"]
    
            for i = #exechack_cc_hvh_obkak.bulletImpacts, 1, -1 do
                local impact = exechack_cc_hvh_obkak.bulletImpacts[i]

                if (curTime - impact.shootTime) > dieTime then
                    table.remove(exechack_cc_hvh_obkak.bulletImpacts, i)
                    continue
                end

                tracercolor.a = 255 - ( ( curTime - impact.shootTime ) / dieTime * 255 )
    
                render.DrawBeam( impact.startPos, impact.endPos, 1, 1, 1, tracercolor )
            end

            tracercolor.a = oldAlpha
        end

        

        if exechack_cc_hvh_obkak.cfg.vars["Auto peak"] and exechack_cc_hvh_obkak.startedPeeking then
            exechack_cc_hvh_obkak.drawAutopeak()
        end






        -- Saddam Hussein
        /*
        if ( pSaddamHussein.Position:DistToSqr( pLocalPlayer:EyePos() ) <= ( 2048 ^ 2 ) ) then
            render.MaterialOverride( Material( "!flat" ) ) 
            render.SetColorModulation( 255, 0, 0 )
            render.SetBlend( 255 ) 

            cam.IgnoreZ( true )
                pSaddamHussein.Model:DrawModel()

                cam.Start3D2D( pSaddamHussein.Position, Angle( 0, 0, 90 ), 0.25 )
                    surface.SetDrawColor( 0, 0, 0 )
                    surface.DrawRect( -128, -200, 4, 200 )

                    surface.SetFont( "saddamhussein" )
                    surface.SetTextColor( 0, 0, 0 )

                    surface.SetTextPos( -128, -256 )
                    surface.DrawText( "Saddam Hussein" )
                cam.End3D2D()
            cam.IgnoreZ( false )
        end
        */
    end 
end

/*
    hooks -> FrameStageNotify ( c++ module )
*/

function exechack_cc_hvh_obkak.GetUserGroup(ply)
    if ply.GetUserGroup then
        return ply:GetUserGroup()
    elseif ply.GetRankTable and ply:GetRankTable().NiceName then
        // fix for RusEliteRP
        return ply:GetRankTable().NiceName
    else
        return "unknown"
    end
end

function exechack_cc_hvh_obkak.GetTeam( ply )
    local iTeam = ply:Team()

    if rp and rp.GetJobWithoutDisguise then
        local index = rp.GetJobWithoutDisguise( ply:EntIndex() ) 
        local tbl = rp.jobs.List[ index ]

        return index, tbl.Name, tbl.Color
    else
        return iTeam, team.GetName(iTeam), team.GetColor(iTeam)
    end
end

// Player data tables

exechack_cc_hvh_obkak.playerCache = {}

function exechack_cc_hvh_obkak.playerTableUpdate( ply )
    if not exechack_cc_hvh_obkak.playerCache[ ply ] then
        exechack_cc_hvh_obkak.playerCache[ ply ] = {}
    end
    
    local v = exechack_cc_hvh_obkak.playerCache[ ply ]

    v.entity = ply
    
    v.Name = ply:Name()

    local index, name, color = exechack_cc_hvh_obkak.GetTeam( ply )

    v.Team = index
    v.TeamColor = color
    v.TeamName = name

    v.GetUserGroup = exechack_cc_hvh_obkak.GetUserGroup(ply)

    v.Health = ply:Health()
    v.GetMaxHealth = ply:GetMaxHealth()

    v.Armor = ply:Armor()
    v.GetMaxArmor = ply:GetMaxArmor()

    v.GetPos = ply:GetPos()

    v.ObserverMode = ply:GetObserverMode()
    v.ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    v.WeaponClass = IsValid(w) and ( exechack_cc_hvh_obkak.cfg.vars["Weapon printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    v.WeaponAmmo = IsValid(w) and w:Clip1() or "-"
 
    v.MoneyVar = MetaPlayer.getDarkRPVar and DarkRP.formatMoney(ply:getDarkRPVar("money")) or "beggar"
end

function exechack_cc_hvh_obkak.playerDataUpdate( )

    exechack_cc_hvh_obkak.playerCache = {}

    local plys = player.GetAll()

    for i = 1, #plys do
        local v = plys[i]

        if v == pLocalPlayer then continue end
    
        exechack_cc_hvh_obkak.playerTableUpdate( v )
    end
end

// Entity data

exechack_cc_hvh_obkak.entityCache = {}
exechack_cc_hvh_obkak.cfg.ents = {}

function exechack_cc_hvh_obkak.entTableUpdate()
    
    exechack_cc_hvh_obkak.entityCache = {}

    local entitys = ents.GetAll()

    for i = 1, #entitys do
        local v = entitys[ i ]
        local v_class = v:GetClass()

        if not IsValid( v ) then continue end 
        if v_class == "player" then continue end
        if not exechack_cc_hvh_obkak.cfg.ents[ v_class ] then continue end

        exechack_cc_hvh_obkak.entityCache[ #exechack_cc_hvh_obkak.entityCache + 1 ] = {
            entity = v,
            class = v_class,
            position = v:GetPos(),
        }
    end
end



// Resolver 

exechack_cc_hvh_obkak.bruteYaw = { -180, -120, -90, -60, -30, 0, 30, 60, 90, 120, 180  }



do
    local localData = {}

    localData.origin = Vector()

    function exechack_cc_hvh_obkak.FillLocalNetworkData( netdata )
        localData.origin     =   netdata[1]
    end
    
    function exechack_cc_hvh_obkak.GetLocalNetworkData()
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

    function exechack_cc_hvh_obkak.PreFrameStageNotify( stage )
        local plys = player.GetAll()

        if stage == FRAME_NET_UPDATE_POSTDATAUPDATE_END then

            exechack_cc_hvh_obkak.entTableUpdate()

            plys = player.GetAll()

            local orig = pLocalPlayer:GetNetworkOrigin()

            local data = {}

            data[1] = orig      // last networked origin

            exechack_cc_hvh_obkak.FillLocalNetworkData( data )

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

                    exechack_cc_hvh_obkak.btrecords[ v ] = {}
                    exechack_cc_hvh_obkak.predicted[ v ] = {}

                    v.aimshots = 0
                    v.fakepitch = v:EyeAngles().p > 90

                elseif v.ult_prev_simtime != cur_simtime then
                    local time_diff = (cur_simtime or 0) - (v.ult_prev_simtime or 0)
                    local flticks = 1
                    
                    if time_diff > 0 then
                        local success, result = pcall(function() return math.floor(0.5 + time_diff / flTickInterval) end)
                        flticks = success and result or math.max(1, math.floor(time_diff * 66.67))
                    end

                    // print(v,flticks )

                    ded.SetMissedTicks( flticks )
                    ded.AllowAnimationUpdate( true )

                    v.flticks = math.Clamp(flticks,1,24)

                    v.ult_prev_simtime = cur_simtime

                    v.break_lc = cur_pos:DistToSqr(v.ult_prev_pos) > 4096

                    --if v.ult_prev_pos != v.ult_cur_pos then
                    v.ult_prev_pos = cur_pos

                    // v.ult_prev_hitbox_pos = exechack_cc_hvh_obkak.getHitbox(v)
                    --end 
                    v.fakepitch = v:EyeAngles().p > 90

                    v.simtime_updated = true
                else
                    v.simtime_updated = false
                end

                if exechack_cc_hvh_obkak.canBacktrack(v) and v != pLocalPlayer and v.simtime_updated then
                    exechack_cc_hvh_obkak.recordBacktrack(v)
                end

                if v.break_lc then
                    exechack_cc_hvh_obkak.btrecords[ v ] = {}
                end

                /*
                if exechack_cc_hvh_obkak.cfg.vars["Extrapolation"] and v.simtime_updated and v != pLocalPlayer then
                    -- Получаем текущую позицию игрока
                    local currentPos = v:GetNetworkOrigin()
                    local currentTime = ded.GetSimulationTime(v:EntIndex())
                    
                    -- Вычисляем время предсказания с ограничением
                    local predTime = math.min(ded.GetLatency(0) + ded.GetLatency(1), 0.2) -- Максимум 200ms
                    
                    -- Проверяем, есть ли предыдущая позиция для сравнения
                    if not v.ult_prev_pos then
                        v.ult_prev_pos = currentPos
                        v.ult_prev_time = currentTime
                        return
                    end
                    
                    -- Вычисляем скорость движения
                    local timeDelta = currentTime - (v.ult_prev_time or currentTime)
                    if timeDelta <= 0 then return end
                    
                    local velocity = (currentPos - v.ult_prev_pos) / timeDelta
                    local speed = velocity:Length()
                    
                    -- Ограничиваем максимальную скорость для предотвращения телепортации
                    local maxSpeed = 1000 -- Максимальная разумная скорость
                    if speed > maxSpeed then
                        velocity = velocity:GetNormalized() * maxSpeed
                    end
                    
                    -- Начинаем симуляцию
                    ded.StartSimulation(v:EntIndex())
                    
                    local predictedPos = currentPos
                    local ticks = math.floor(0.5 + predTime / flTickInterval)
                    
                    -- Ограничиваем количество тиков
                    ticks = math.min(ticks, 20) -- Максимум 20 тиков
                    
                    for tick = 1, ticks do
                        ded.SimulateTick()
                        local data = ded.GetSimulationData()
                        
                        -- Проверяем на разумность позиции
                        local posChange = (data.m_vecAbsOrigin - predictedPos):Length()
                        if posChange > 200 then -- Если изменение позиции слишком большое
                            break -- Прерываем симуляцию
                        end
                        
                        predictedPos = data.m_vecAbsOrigin
                        debugoverlay.Cross(predictedPos, 6, 0.1, exechack_cc_hvh_obkak.Colors["Red"], true)
                    end
                    
                    local finalData = ded.GetSimulationData()
                    
                    -- Дополнительная проверка на разумность финальной позиции
                    local totalChange = (finalData.m_vecAbsOrigin - currentPos):Length()
                    if totalChange > 500 then -- Если изменение слишком большое
                        -- Используем линейную экстраполяцию вместо симуляции
                        predictedPos = currentPos + velocity * predTime
                    else
                        predictedPos = finalData.m_vecAbsOrigin
                    end
                    
                    -- Плавное смешивание между текущей и предсказанной позицией
                    local blendFactor = math.min(predTime * 2, 1.0) -- Плавность смешивания
                    local smoothedPos = currentPos + (predictedPos - currentPos) * blendFactor
                    
                    -- Устанавливаем позицию рендеринга
                    v:SetRenderOrigin(smoothedPos)
                    
                    -- Обновляем debug информацию
                    debugoverlay.Box(smoothedPos, v:OBBMins(), v:OBBMaxs(), 0.1, color_white)
                    
                    -- Сохраняем данные для следующего кадра
                    v.ult_prev_pos = currentPos
                    v.ult_prev_time = currentTime
                    
                    -- Обновляем таблицу предсказанных позиций
                    local boneData = exechack_cc_hvh_obkak.GetBones(v)
                    if boneData and boneData[1] then
                        exechack_cc_hvh_obkak.predicted[v] = {
                            pos = boneData[1],

                            
                            confidence = math.max(0, 1 - (predTime * 2)) -- Уверенность в предсказании
                        }
                    end
                    
                    ded.FinishSimulation()
                end
                */

                if exechack_cc_hvh_obkak.cfg.vars["Extrapolation"] and v.break_lc then
                    local predTime = ded.GetLatency(0) + ded.GetLatency(1)
                    ded.StartSimulation(v:EntIndex())
        
                    for tick = 1, math.floor(0.5 + predTime / flTickInterval) do
                        ded.SimulateTick()
                    end
        
                    local data = ded.GetSimulationData()
                    v:SetRenderOrigin(data.m_vecAbsOrigin)
                    v:SetNetworkOrigin(data.m_vecAbsOrigin)
                    ded.FinishSimulation()
                end

            end
        elseif stage == FRAME_RENDER_START then
            plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[i]

                if v == pLocalPlayer then continue end
            end
        end
    end
end


function exechack_cc_hvh_obkak.PostFrameStageNotify( stage ) 
    if stage == 3 then
        exechack_cc_hvh_obkak.playerDataUpdate()

        /*local playerlist = player.GetAll()

        for i = 1, #playerlist do
            local pEntity = playerlist[ i ]

            local iEntIndex = pEntity:EntIndex()
            local pTable = pEntity:GetTable()

            -- Simulation time 
            local flSimulationTime = ded.GetSimulationTime( iEntIndex )

            pTable.iChokedCommands = Utility.TimeToTicks( flSimulationTime - pTable.flSimulationTime )
            pTable.bIsSimulated = flSimulationTime ~= pTable.flSimulationTime
            pTable.flSimulationTime = flSimulationTime    
        end*/
    end
end

/*
    hooks -> ShouldUpdateAnimation ( cpp )
*/

exechack_cc_hvh_obkak.fakeAngles = {
    angle = pLocalPlayer:EyeAngles(),
    movex = 0,
    movey = 0,
    layers = {},
    seq = 0,
    cycle = 0,
    origin = pLocalPlayer:GetPos(),
}

function exechack_cc_hvh_obkak.UpdateAnimation( v )
    v:InvalidateBoneCache()
end

function exechack_cc_hvh_obkak.ShouldUpdateAnimation( entIndex ) 
    local ent = Entity( entIndex )

    if not ent.simtime_updated then return end

    ded.SetMissedTicks( ent.flticks )
    ded.AllowAnimationUpdate( true )
end

// AA shit
exechack_cc_hvh_obkak.realModel = exechack_cc_hvh_obkak.CS_Model( pLocalPlayer:GetModel() )
exechack_cc_hvh_obkak.fakeModel = exechack_cc_hvh_obkak.CS_Model( pLocalPlayer:GetModel() )

exechack_cc_hvh_obkak.newModel = pLocalPlayer:GetModel()

function exechack_cc_hvh_obkak.drawCSModels_real()
    if not exechack_cc_hvh_obkak.cfg.vars["Anti aim chams"] or not exechack_cc_hvh_obkak.tpenabled then 
        return 
    end 
    if not pLocalPlayer:Alive() then 
        return 
    end

    local mymodel = pLocalPlayer:GetModel()

    if exechack_cc_hvh_obkak.newModel != mymodel then
        exechack_cc_hvh_obkak.CS_Model( mymodel )
        exechack_cc_hvh_obkak.newModel = mymodel
    end

    local tbl = {
        layers = exechack_cc_hvh_obkak.fakeAngles.layers,
        angles = exechack_cc_hvh_obkak.fakeAngles.angle,
        sequence = exechack_cc_hvh_obkak.fakeAngles.seq,
        cycle = exechack_cc_hvh_obkak.fakeAngles.cycle,
        origin = exechack_cc_hvh_obkak.fakeAngles.origin,
        movex = exechack_cc_hvh_obkak.fakeAngles.movex,
        movey = exechack_cc_hvh_obkak.fakeAngles.movey,
    }

    exechack_cc_hvh_obkak.CS_Model_update( pLocalPlayer, exechack_cc_hvh_obkak.realModel, tbl )

    if exechack_cc_hvh_obkak.cfg.vars["Antiaim fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(exechack_cc_hvh_obkak.cfg.colors["Real chams"])
    exechack_cc_hvh_obkak.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(exechack_cc_hvh_obkak.chamMats.invis[exechack_cc_hvh_obkak.cfg.vars["Antiaim material"]]) 
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    render.SetBlend(col.a/255) 
    exechack_cc_hvh_obkak.realModel:SetRenderMode(1)
    exechack_cc_hvh_obkak.realModel:DrawModel()

    if exechack_cc_hvh_obkak.cfg.vars["Antiaim fullbright"] then
        render.SuppressEngineLighting(false)
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
    
    exechack_cc_hvh_obkak.cfg.vars["Player outline"] = false
    exechack_cc_hvh_obkak.cfg.vars["Entity outline"] = false
    exechack_cc_hvh_obkak.cfg.colors["Player outline"] = "45 255 86 255"
    exechack_cc_hvh_obkak.cfg.colors["Entity outline"] = "255 86 45 255"

    local StoreTexture	= render.GetScreenEffectTexture(0)
    local DrawTexture	= render.GetScreenEffectTexture(1)

    function exechack_cc_hvh_obkak.RenderOutline()
        local renderEnts = {}

        if exechack_cc_hvh_obkak.cfg.vars["Player outline"] then
            local plys = player.GetAll()

            for i = 1, #plys do 
                local v = plys[ i ]

                if not IsValid( v ) or v == pLocalPlayer or not v:Alive() or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if exechack_cc_hvh_obkak.cfg.vars["Entity outline"] then
            for i = 1, #exechack_cc_hvh_obkak.entityCache do
                local v = exechack_cc_hvh_obkak.entityCache[ i ].entity 

                if not IsValid( v ) or v:IsDormant() then continue end
        
                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if #renderEnts == 0 then return end

        local scene = render.GetRenderTarget()
        render.CopyRenderTargetToTexture(StoreTexture)
        
        if subclear[ exechack_cc_hvh_obkak.cfg.vars["Outline style"] ] then
            render.Clear( 255, 255, 255, 255, true, true )
        else
            render.Clear( 0, 0, 0, 0, true, true )
        end

        render.SetStencilEnable(true)
            cam.IgnoreZ(true)
            render.SuppressEngineLighting(true)
        
            render.SetStencilWriteMask(255)
            render.SetStencilTestMask(255)
            
            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilPassOperation(STENCIL_REPLACE)
            
            cam.Start3D()
                for i = 1, #renderEnts do 
                    render.SetStencilReferenceValue( i )

                    renderEnts[i]:DrawModel()
                end
            cam.End3D()
            
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            cam.Start2D()
                for i = 1, #renderEnts do 
                    local c = renderEnts[i]:IsPlayer() and string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Player outline"] ) or string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Entity outline"] ) 

				    render.SetStencilReferenceValue( i )

                    surface.SetDrawColor( c )
                    surface.DrawRect( 0, 0, screenWidth, screenHeight )

                    // surface_SimpleTexturedRect( 0, 0, screenWidth, screenHeight, string.ToColor( exechack_cc_hvh_obkak.cfg.colors["Health bar gradient"] ) , exechack_cc_hvh_obkak.Materials["Gradient"] )
                end
            cam.End2D()
            
            render.SuppressEngineLighting(false)
            cam.IgnoreZ(false)
        render.SetStencilEnable(false)
        
        render.CopyRenderTargetToTexture(DrawTexture)

        if exechack_cc_hvh_obkak.cfg.vars["Outline style"] > 1 then 
            render.BlurRenderTarget( DrawTexture, 1, 1, 1 )
        end

        render.SetRenderTarget(scene)
        CopyMat:SetTexture("$basetexture",StoreTexture)
        render.SetMaterial(CopyMat)
        render.DrawScreenQuad()
        
        render.SetStencilEnable(true)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            local mat = outline_mats[ exechack_cc_hvh_obkak.cfg.vars["Outline style"] ]

            mat:SetTexture( "$basetexture", DrawTexture )
            render.SetMaterial( mat )
            
            for x=-1,1 do
                for y=-1,1 do
                    if x==0 and x==0 then continue end
                    
                    render.DrawScreenQuadEx(x,y,screenWidth,screenHeight)
                end
            end
        render.SetStencilEnable(false)
    end
end

hook.Add("PrePlayerDraw",  "WIP", function()
	for k, v in ipairs(player.GetAll()) do
        if exechack_cc_hvh_obkak.cfg.vars["Modelchanger"] then
            LocalPlayer():InvalidateBoneCache()
			LocalPlayer():SetSequence(LocalPlayer():GetSequence())
            local state = LocalPlayer():GetPredictable()
            LocalPlayer():SetPredictable(not state)
            LocalPlayer():SetPredictable(state)
            if exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 1 then
                LocalPlayer():SetModel("models/cyanblue/fate_extella_link/astolfo/astolfo.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 2 then
                LocalPlayer():SetModel("models/squids_pms/ocs/xani_protogen/xani_pm.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 3 then
                LocalPlayer():SetModel("models/walter/playermodels/walter.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 4 then
                LocalPlayer():SetModel("models/survivors/survivor_mechanic.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 5 then
                LocalPlayer():SetModel("models/ray/nikoo/nikopm.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 6 then
                LocalPlayer():SetModel("models/player/floyd/georgedroyd.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 7 then
                LocalPlayer():SetModel("models/jazzmcfly/bgs/bgs.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 8 then
                LocalPlayer():SetModel("models/invincible/mark/mark.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 9 then
                LocalPlayer():SetModel("models/good/goob_outlined.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 10 then
                LocalPlayer():SetModel("models/boykisser/boykisser.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Modelchanger model"] == 11 then   
                LocalPlayer():SetModel("models/adidas_combine/playermodel/adidas_combine.mdl")            
            end
            LocalPlayer():SetupBones()
        end
        /*if exechack_cc_hvh_obkak.cfg.vars["Player_modelchanger"] then
            v:InvalidateBoneCache()	
            v:SetupBones()
            if exechack_cc_hvh_obkak.cfg.vars["Player_modelchanger_agent"] == 1 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/charple.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Player_modelchanger_agent"] == 2 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/Group01/male_03.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Player_modelchanger_agent"] == 3 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/gman_high.mdl")
            elseif exechack_cc_hvh_obkak.cfg.vars["Player_modelchanger_agent"] == 4 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/zombie_classic.mdl")
                elseif exechack_cc_hvh_obkak.cfg.vars["Player_modelchanger_agent"] == 5 then
                v:InvalidateBoneCache()    
                v:SetupBones()
                v:SetModel("models/player/Astolfo.mdl")
            end			
        end*/
    
    end
		
	
end)


function exechack_cc_hvh_obkak.PostDrawEffects()
    if exechack_cc_hvh_obkak.UnSafeFrame then return end
    if not exechack_cc_hvh_obkak.cfg.vars["Player outline"] and not exechack_cc_hvh_obkak.cfg.vars["Entity outline"] then return end

    exechack_cc_hvh_obkak.RenderOutline()
end
    
function exechack_cc_hvh_obkak.AdjustMouseSensitivity( defaultSensivity )
    return exechack_cc_hvh_obkak.cfg.vars["Disable sensivity adjustment"] and 0 or nil
end

exechack_cc_hvh_obkak.fbe = false

function exechack_cc_hvh_obkak.PreRender()
    if exechack_cc_hvh_obkak.cfg.vars["Fullbright"] and exechack_cc_hvh_obkak.fbe then
        render.SetLightingMode( exechack_cc_hvh_obkak.cfg.vars["Fullbright mode"] )
    end
end

function exechack_cc_hvh_obkak.GetMotionBlurValues()
    render.SetLightingMode( 0 )
end

ded.ConVarSetFlags( "mat_fullbright", 0 )
ded.ConVarSetFlags( "r_aspectratio", 0 )
ded.ConVarSetFlags( "cl_showhitboxes", 0 )

function GAMEMODE:CreateMove( cmd ) return true end
function GAMEMODE:CalcView( view )  return true end
function GAMEMODE:ShouldDrawLocal() return true end

GAMEMODE["EntityFireBullets"] = function( self, p, data ) 
    if not exechack_cc_hvh_obkak.activeWeapon then return end

    local tick = engine.TickCount()
    if exechack_cc_hvh_obkak.cfg.vars[ "On screen logs" ] and data.Src == pLocalPlayer:EyePos() and exechack_cc_hvh_obkak.aimingrn and exechack_cc_hvh_obkak.target and not exechack_cc_hvh_obkak.onScreenLogs[ tick ] and IsFirstTimePredicted() then
        local reason = 1
        
        local tr = {}
        tr.filter = pLocalPlayer 
        tr.start = data.Src 
        tr.endpos = data.Src + data.Dir * 13337
        tr.mask = MASK_SHOT

        tr = TraceLine( tr )

        local seq = exechack_cc_hvh_obkak.target:GetSequence()
        local seqName = exechack_cc_hvh_obkak.target:GetSequenceName(seq) or ""
        
        if string.find(seqName:lower(), "taunt") or string.find(seqName:lower(), "dance") or string.find(seqName:lower(), "robot") then
            reason = 5
        elseif exechack_cc_hvh_obkak.cfg.vars["Resolver"] and exechack_cc_hvh_obkak.target.aimshots and exechack_cc_hvh_obkak.target.aimshots > 0 then
            reason = 2
        elseif exechack_cc_hvh_obkak.target.break_lc or (exechack_cc_hvh_obkak.target.flticks and exechack_cc_hvh_obkak.target.flticks > 5) then
            reason = 3
        elseif exechack_cc_hvh_obkak.firedShots and exechack_cc_hvh_obkak.firedShots > 0 and exechack_cc_hvh_obkak.lastShotTime and (CurTime() - exechack_cc_hvh_obkak.lastShotTime) < 0.1 then
            reason = 4
        elseif data.Spread and data.Spread.x > 0.01 or data.Spread.y > 0.01 then
            reason = 1
        end
        
        if not exechack_cc_hvh_obkak.MissReasons then
            exechack_cc_hvh_obkak.MissReasons = {
                [1] = { str = "spread", var = "Miss spread" },
                [2] = { str = "resolver", var = "Miss fail" },
                [3] = { str = "fake lag", var = "Miss lagcomp" },
                [4] = { str = "fast shooting", var = "Miss spread" },
                [5] = { str = "taunt", var = "Miss fail" },
            }
        end
        
        reason = math.Clamp(reason or 1, 1, 5)
        local missReason = exechack_cc_hvh_obkak.MissReasons[reason] or exechack_cc_hvh_obkak.MissReasons[1]
        
        local hlcolor = string.ToColor( exechack_cc_hvh_obkak.cfg.colors[ missReason.var ] or "255 69 69 255" )
        local data = {
            tick = tick,
            { "Shot at ", exechack_cc_hvh_obkak.target:Name(), " missed due to ", missReason.str, },
            { exechack_cc_hvh_obkak.HitLogsWhite, hlcolor, exechack_cc_hvh_obkak.HitLogsWhite, hlcolor, }
        }
            
        exechack_cc_hvh_obkak.onScreenLogs[ tick ] = data
    end
    
    exechack_cc_hvh_obkak.lastShotTime = CurTime()
    exechack_cc_hvh_obkak.firedShots = (exechack_cc_hvh_obkak.firedShots or 0) + 1
 
    local spread = data.Spread * -1
    
	if exechack_cc_hvh_obkak.cones[ exechack_cc_hvh_obkak.activeWeaponClass ] == spread or spread == exechack_cc_hvh_obkak.nullVec then return end

    exechack_cc_hvh_obkak.cones[ exechack_cc_hvh_obkak.activeWeaponClass ] = spread;
end

function exechack_cc_hvh_obkak.SetupWorldFog()
    if not exechack_cc_hvh_obkak.cfg.vars[ "FogChanger" ] then return end 

    local color = string.ToColor(exechack_cc_hvh_obkak.cfg.colors["FogChanger"])
    

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( exechack_cc_hvh_obkak.cfg.vars[ "FogStart" ] )
    render.FogEnd( exechack_cc_hvh_obkak.cfg.vars[ "FogEnd" ] ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function exechack_cc_hvh_obkak.SetupSkyboxFog( SkyboxSize )
    if not exechack_cc_hvh_obkak.cfg.vars[ "FogChanger" ] then return end 

    local color = string.ToColor(exechack_cc_hvh_obkak.cfg.colors["FogChanger"])

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( exechack_cc_hvh_obkak.cfg.vars[ "FogStart" ] * SkyboxSize )
    render.FogEnd( exechack_cc_hvh_obkak.cfg.vars[ "FogEnd" ] * SkyboxSize ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end


net.Receive("rp.police.SetLocalHandcuff", function()
    if not exechack_cc_hvh_obkak.cfg.vars["Retry on handcuff"] then return end
    
    RunConsoleCommand("retry")
end)

/*
    Hooks
*/

exechack_cc_hvh_obkak.hooks           = {}

function exechack_cc_hvh_obkak.AddHook( event, func )
    if func == nil and not exechack_cc_hvh_obkak[ event ] then print("Failed to find hook: " .. event) return end
    local name = util.Base64Encode( event ) .. CurTime()
    hook.Add( event, name, exechack_cc_hvh_obkak[ event ] or func )
    exechack_cc_hvh_obkak.hooks[ #exechack_cc_hvh_obkak.hooks + 1 ] = { event, name }
end

function exechack_cc_hvh_obkak.RemoveAllHooks()
    for i = #exechack_cc_hvh_obkak.hooks, 1, -1 do
        local chk = exechack_cc_hvh_obkak.hooks[i]
        hook.Remove(chk[1], chk[2])
        table.remove(exechack_cc_hvh_obkak.hooks, i)
    end
end

function exechack_cc_hvh_obkak.Unload()
    exechack_cc_hvh_obkak.frame:Remove()

    ded.SetBSendPacket( true )
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    exechack_cc_hvh_obkak.RemoveAllHooks() 

    render.SetLightingMode( 0 )
end

exechack_cc_hvh_obkak.AddHook( "CreateMove" )
exechack_cc_hvh_obkak.AddHook( "Think" )

exechack_cc_hvh_obkak.AddHook( "RenderScene", exechack_cc_hvh_obkak.RenderScene )
exechack_cc_hvh_obkak.AddHook( "DrawOverlay" )
exechack_cc_hvh_obkak.AddHook( "Ungrabbable2D", function() exechack_cc_hvh_obkak.DrawESP() exechack_cc_hvh_obkak.DrawSomeShit() end )   

exechack_cc_hvh_obkak.AddHook( "CalcView" )
exechack_cc_hvh_obkak.AddHook( "CalcViewModelView" )

exechack_cc_hvh_obkak.AddHook( "PreDrawViewModel" )
exechack_cc_hvh_obkak.AddHook( "PostDrawViewModel" )

exechack_cc_hvh_obkak.AddHook( "PostDrawOpaqueRenderables" )
exechack_cc_hvh_obkak.AddHook( "PostDrawEffects" )

exechack_cc_hvh_obkak.AddHook( "OnImpact" )

exechack_cc_hvh_obkak.AddHook( "PreFrameStageNotify" )
exechack_cc_hvh_obkak.AddHook( "PostFrameStageNotify" )

exechack_cc_hvh_obkak.AddHook( "UpdateAnimation" )
exechack_cc_hvh_obkak.AddHook( "ShouldUpdateAnimation" )

exechack_cc_hvh_obkak.AddHook( "AdjustMouseSensitivity" )

exechack_cc_hvh_obkak.AddHook( "RenderScreenspaceEffects" )
exechack_cc_hvh_obkak.AddHook( "PostDrawTranslucentRenderables" )

exechack_cc_hvh_obkak.AddHook( "PreRender" )
exechack_cc_hvh_obkak.AddHook( "GetMotionBlurValues" )

--exechack_cc_hvh_obkak.AddHook( "DrawPhysgunBeam" )

exechack_cc_hvh_obkak.AddHook( "PrePlayerDraw" )

exechack_cc_hvh_obkak.AddHook( "OnEntityCreated" )  

exechack_cc_hvh_obkak.AddHook( "entity_killed" )  
exechack_cc_hvh_obkak.AddHook( "player_hurt" )  

exechack_cc_hvh_obkak.AddHook( "SetupWorldFog" )
exechack_cc_hvh_obkak.AddHook( "SetupSkyboxFog" )

exechack_cc_hvh_obkak.AddHook( "ShouldDrawLocalPlayer" )
