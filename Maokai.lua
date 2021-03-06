if myHero.charName ~= "Maokai" then return end


require 'SOW'
require 'VPrediction'
require 'Prodiction'
require 'Sourcelib'

--[AUTOUPDATER]--

local version = "2.1"
local author = "Teecolz"

local AUTOUPDATE = true
local SCRIPT_NAME = "Maokai"
local SOURCELIB_URL = "https://raw.github.com/TheRealSource/public/master/common/SourceLib.lua"
local SOURCELIB_PATH = LIB_PATH.."SourceLib.lua"
if FileExist(SOURCELIB_PATH) then
  require("SourceLib")
else
  DOWNLOADING_SOURCELIB = true
  DownloadFile(SOURCELIB_URL, SOURCELIB_PATH, function() print("Required libraries downloaded successfully, please reload") end)
end

if DOWNLOADING_SOURCELIB then print("Downloading required libraries, please wait...") return end

if AUTOUPDATE then
  SourceUpdater(SCRIPT_NAME, version, "raw.github.com", "/Teecolz/Teecolz---idylkarthus-Scripts/blob/master/"..SCRIPT_NAME..".lua", SCRIPT_PATH .. GetCurrentEnv().FILE_NAME, "/Teecolz/Teecolz---idylkarthus-Scripts/master/"..SCRIPT_NAME..".version"):CheckUpdate()
end

local RequireI = Require("SourceLib")
RequireI:Add("vPrediction", "https://raw.github.com/Hellsing/BoL/master/common/VPrediction.lua")
RequireI:Add("SOW", "https://raw.github.com/Hellsing/BoL/master/common/SOW.lua")
RequireI:Add("Prodiction", "https://bitbucket.org/Klokje/public-klokjes-bol-scripts/raw/ec830facccefb3b52212dba5696c08697c3c2854/Test/Prodiction/Prodiction.lua")

RequireI:Check()

if RequireI.downloadNeeded == true then return end

--------------------BoL Tracker-----------------------------
HWID = Base64Encode(tostring(os.getenv("PROCESSOR_IDENTIFIER")..os.getenv("USERNAME")..os.getenv("COMPUTERNAME")..os.getenv("PROCESSOR_LEVEL")..os.getenv("PROCESSOR_REVISION")))
-- DO NOT CHANGE. This is set to your proper ID.
id = 15
ScriptName = "Maokai"

-- Thank you to Roach and Bilbao for the support!
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIDAAAAJQAAAAgAAIAfAIAAAQAAAAQKAAAAVXBkYXRlV2ViAAEAAAACAAAADAAAAAQAETUAAAAGAUAAQUEAAB2BAAFGgUAAh8FAAp0BgABdgQAAjAHBAgFCAQBBggEAnUEAAhsAAAAXwAOAjMHBAgECAgBAAgABgUICAMACgAEBgwIARsNCAEcDwwaAA4AAwUMDAAGEAwBdgwACgcMDABaCAwSdQYABF4ADgIzBwQIBAgQAQAIAAYFCAgDAAoABAYMCAEbDQgBHA8MGgAOAAMFDAwABhAMAXYMAAoHDAwAWggMEnUGAAYwBxQIBQgUAnQGBAQgAgokIwAGJCICBiIyBxQKdQQABHwCAABcAAAAECAAAAHJlcXVpcmUABAcAAABzb2NrZXQABAcAAABhc3NlcnQABAQAAAB0Y3AABAgAAABjb25uZWN0AAQQAAAAYm9sLXRyYWNrZXIuY29tAAMAAAAAAABUQAQFAAAAc2VuZAAEGAAAAEdFVCAvcmVzdC9uZXdwbGF5ZXI/aWQ9AAQHAAAAJmh3aWQ9AAQNAAAAJnNjcmlwdE5hbWU9AAQHAAAAc3RyaW5nAAQFAAAAZ3N1YgAEDQAAAFteMC05QS1aYS16XQAEAQAAAAAEJQAAACBIVFRQLzEuMA0KSG9zdDogYm9sLXRyYWNrZXIuY29tDQoNCgAEGwAAAEdFVCAvcmVzdC9kZWxldGVwbGF5ZXI/aWQ9AAQCAAAAcwAEBwAAAHN0YXR1cwAECAAAAHBhcnRpYWwABAgAAAByZWNlaXZlAAQDAAAAKmEABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQA1AAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAMAAAADAAAAAwAAAAMAAAAEAAAABAAAAAUAAAAFAAAABQAAAAYAAAAGAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAgAAAAHAAAABQAAAAgAAAAJAAAACQAAAAkAAAAKAAAACgAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAAMAAAACwAAAAkAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAGAAAAAgAAAGEAAAAAADUAAAACAAAAYgAAAAAANQAAAAIAAABjAAAAAAA1AAAAAgAAAGQAAAAAADUAAAADAAAAX2EAAwAAADUAAAADAAAAYWEABwAAADUAAAABAAAABQAAAF9FTlYAAQAAAAEAEAAAAEBvYmZ1c2NhdGVkLmx1YQADAAAADAAAAAIAAAAMAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))()
-------------------------------------------------

DashList = {
        ['Ahri']        = {true, spell = 'AhriTumble'},
        ['Aatrox']      = {true, spell = 'AatroxQ'},
        ['Akali']       = {true, spell = 'AkaliShadowDance'}, -- Targeted ability
        ['Alistar']     = {true, spell = 'Headbutt'}, -- Targeted ability
        ['Corki']       = {true, spell = 'CarpetBomb'},
        ['Diana']       = {true, spell = 'DianaTeleport'}, -- Targeted ability
        ['Elise']       = {true, spell = 'EliseSpiderQCast'}, -- Targeted ability
        ['Fiora']       = {true, spell = 'FioraQ'}, -- Targeted ability
        ['Fizz']      = {true, spell = 'FizzPiercingStrike'}, -- Targeted ability
        ['Gragas']      = {true, spell = 'GragasE'},
        ['Graves']      = {true, spell = 'GravesMove'},
        ['Hecarim']     = {true, spell = 'HecarimUlt'},
        ['Irelia']      = {true, spell = 'IreliaGatotsu'}, -- Targeted ability
        ['JarvanIV']    = {true, spell = 'jarvanAddition'}, -- Skillshot/Targeted ability
        ['Jax']         = {true, spell = 'JaxLeapStrike'}, -- Targeted ability
        ['Jayce']       = {true, spell = 'JayceToTheSkies'}, -- Targeted ability
        ['Kassadin']    = {true, spell = 'RiftWalk'},
        ['Khazix']      = {true, spell = 'KhazixW'},
        ['Leblanc']     = {true, spell = 'LeblancSlide'},
        ['LeeSin']      = {true, spell = 'blindmonkqtwo'},
        ['Leona']       = {true, spell = 'LeonaZenithBlade'},
        ['Lucian']      = {true, spell = 'LucianE'},
        ['Malphite']    = {true, spell = 'UFSlash'},
        ['Maokai']      = {true, spell = 'MaokaiTrunkLine',}, -- Targeted ability 
    ['MasterYi']    = {true, spell = 'AlphaStrike',}, -- Targeted
        ['MonkeyKing']  = {true, spell = 'MonkeyKingNimbus'}, -- Targeted ability
        ['Nidalee']     = {true, spell = 'Pounce'},
        ['Pantheon']    = {true, spell = 'PantheonW'}, -- Targeted ability
        ['Pantheon']    = {true, spell = 'PantheonRJump'},
        ['Pantheon']    = {true, spell = 'PantheonRFall'},
        ['Poppy']       = {true, spell = 'PoppyHeroicCharge'}, -- Targeted ability
      --['Quinn']       = {true, spell = 'QuinnE',                  range = 725,   projSpeed = 2000, }, -- Targeted ability
        ['Rammus']      = {true, spell = 'PowerBall'},
        ['Renekton']    = {true, spell = 'RenektonSliceAndDice'},
        ['Riven']     = {true, spell = 'RivenFeint'},
        ['Sejuani']     = {true, spell = 'SejuaniArcticAssault'},
        ['Shyvana']     = {true, spell = 'ShyvanaTransformCast'},
        ['Shen']        = {true, spell = 'ShenShadowDash'},
        ['Talon']       = {true, spell = 'TalonCutthroat'},
        ['Tristana']    = {true, spell = 'RocketJump'},
        ['Tryndamere']  = {true, spell = 'Slash'},
        ['Vi']      = {true, spell = 'ViQ'},
        ['XinZhao']     = {true, spell = 'XenZhaoSweep'}, -- Targeted ability
        ['Yasuo']       = {true, spell = 'YasuoDashWrapper'} -- Targeted ability
}

StunList = {
                { charName = "Katarina",        spellName = "KatarinaR" ,                  important = 0},
                { charName = "Galio",           spellName = "GalioIdolOfDurand" ,          important = 0},
                { charName = "FiddleSticks",    spellName = "Crowstorm" ,                  important = 1},
                { charName = "FiddleSticks",    spellName = "DrainChannel" ,               important = 1},
                { charName = "Nunu",            spellName = "AbsoluteZero" ,               important = 0},
                { charName = "Shen",            spellName = "ShenStandUnited" ,            important = 0},
                { charName = "Urgot",           spellName = "UrgotSwap2" ,                 important = 0},
                { charName = "Malzahar",        spellName = "AlZaharNetherGrasp" ,         important = 0},
                { charName = "Karthus",         spellName = "FallenOne" ,                  important = 0},
                { charName = "Pantheon",        spellName = "PantheonRJump" ,              important = 0},
                { charName = "Pantheon",        spellName = "PantheonRFall",               important = 0},
                { charName = "Varus",           spellName = "VarusQ" ,                     important = 1},
                { charName = "Caitlyn",         spellName = "CaitlynAceintheHole" ,        important = 1},
                { charName = "MissFortune",     spellName = "MissFortuneBulletTime" ,      important = 1},
                { charName = "Warwick",         spellName = "InfiniteDuress" ,             important = 0}
}

-------------------------------------------------
-------------------------------------------------

--[Other Stuff]--
local menu
local ts
local levelSequence = {3, 1, 2, 1, 2, 4, 1, 2, 1, 2, 4, 2, 1, 3, 3, 4, 3, 3}
local target
local MaokaiROn = false

local Prodict
local ProdictE, ProdictQ


local TMTSlot, RAHSlot = nil, nil
local TMTREADY, RAHREADY = false, false
local Qready, Wready, Eready, Rready = false, false, false, false


-------------------------------------------------
-------------------------------------------------
--[OnLoad]--
function OnLoad()
  VP    = VPrediction()
  iSOW  = SOW(VP)
  Menu()
  Init()
  PrintChat("<font color=\"#78CCDB\"><b>" ..">> Maokai by Teecolz has been loaded")
  Loaded = true
  Variables()
  JungVariables()
  EnemyMinions = minionManager(MINION_ENEMY, Erange, myHero, MINION_SORT_HEALTH_ASC)
  UpdateWeb(true, ScriptName, id, HWID)
end

    --[[if VIP_USER then
        Prodict = ProdictManager.GetInstance()
        ProdictQ = Prodict:AddProdictionObject(_Q, Qrange, Qspeed, Qdelay, Qwidth)
        ProdictE = Prodict:AddProdictionObject(_E, Erange, Espeed, Edelay, Ewidth)
    end]]

function Variables()

  AARange = 125

  Qrange = menu.extra.Qrange
  Qwidth = 110 
  Qspeed = 1200
  Qdelay = 0.5

  Wrange = 525
  Wwidth = nil 
  Wspeed = nil
  Wdelay = 0

  Erange = 1100
  Ewidth = 250 
  Espeed = 1500 
  Edelay = 1.0

  Rrange = 625
  Rwidth = 475 
  Rspeed = nil 
  Rdelay = 0.5
end


function Init()
    ts      = TargetSelector(TARGET_LESS_CAST, 1100, DAMAGE_MAGIC)
  end
  
function Menu()  
        menu = scriptConfig("Maokai: Main Menu", "Maokai")

          menu:addSubMenu("Maokai: Orbwalk", "Orbwalk")
            iSOW:LoadToMenu(menu.Orbwalk)  
 
          menu:addSubMenu("Maokai: Combo", "combo")
            menu.combo:addParam("combokey", "Combo",    SCRIPT_PARAM_ONKEYDOWN, false, 32)
            menu.combo:addParam("useQ", "Use Q-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.combo:addParam("useW", "Use W-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.combo:addParam("useE", "Use E-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.combo:addParam("useR", "Use R-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.combo:addParam("minR", "Min Enemys for (R)", SCRIPT_PARAM_SLICE, 1, 0, 5, 0)
            menu.combo:addParam("manaR", "Turn off R at % Mana", SCRIPT_PARAM_SLICE, 0, 0, 100)

          menu:addSubMenu("Maokai: Gank", "gank")
            menu.gank:addParam("gankkey", "Gank",    SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
            menu.gank:addParam("useQ", "Use Q-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.gank:addParam("useW", "Use W-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.gank:addParam("useE", "Use E-Spell",  SCRIPT_PARAM_ONOFF, true)

          menu:addSubMenu("Maokai: Harass", "harass")
            menu.harass:addParam("harasskey", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
            menu.harass:addParam("useQ", "Use Q-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.harass:addParam("useE", "Use E-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.harass:addParam("mana", "Dont Harass if mana < %", SCRIPT_PARAM_SLICE, 0, 0, 100)
            
          menu:addSubMenu("Maokai: Lane Clear", "lane")
            menu.lane:addParam("lanekey", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
            menu.lane:addParam("useQ", "Use Q-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.lane:addParam("useE", "Use E-Spell", SCRIPT_PARAM_ONOFF, true)
            
          menu:addSubMenu("Maokai: Jungle Clear", "jungle")
            menu.jungle:addParam("junglekey", "Jungle Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
            menu.jungle:addParam("useQ", "Use Q-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.jungle:addParam("useW", "Use W-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.jungle:addParam("useE", "Use E-Spell", SCRIPT_PARAM_ONOFF, true)

          menu:addSubMenu("Maokai: Killsteal", "killsteal")
            menu.killsteal:addParam("killstealQ", "Use Q-Spell to Killsteal", SCRIPT_PARAM_ONOFF, true)
            menu.killsteal:addParam("killstealE", "Use E-Spell to Killsteal", SCRIPT_PARAM_ONOFF, true)
            menu.killsteal:addParam("killstealR", "Use R-Spell to Killsteal When its up", SCRIPT_PARAM_ONOFF, true)
          
          menu:addSubMenu("Maokai: Drawings", "draw")
            menu.draw:addParam("drawAA", "Draw AA Range", SCRIPT_PARAM_ONOFF, false)
            menu.draw:addParam("drawQ", "Draw Q Range",   SCRIPT_PARAM_ONOFF, false)
            menu.draw:addParam("drawW", "Draw W Range",   SCRIPT_PARAM_ONOFF, true)
            menu.draw:addParam("drawE", "Draw E Range",   SCRIPT_PARAM_ONOFF, false)
            menu.draw:addParam("drawR", "Draw R Range",   SCRIPT_PARAM_ONOFF, true)
            menu.draw:addParam("aftercombo", "Draw Ranges When on CD",   SCRIPT_PARAM_ONOFF, true)

          menu:addSubMenu("Maokai: Extras", "extra")
            menu.extra:addParam("autolevel", "AutoLevel Spells", SCRIPT_PARAM_ONOFF, false)
            menu.extra:addParam("prediction", "Prodiction = ON, VPred = OFF", SCRIPT_PARAM_ONOFF, true)
            menu.extra:addParam("autoW", "Auto W under Turrets", SCRIPT_PARAM_ONOFF, false)
            menu.extra:addParam("gapClose", "Auto-Knockback Gapclosers", SCRIPT_PARAM_ONOFF, true)
            menu.extra:addParam("stun", "Auto-Interrupt Important Spells", SCRIPT_PARAM_ONOFF, true)
            menu.extra:addParam("Qrange", "Q Range Slider", SCRIPT_PARAM_SLICE, 600, 1, 600, 0)  
            menu.extra:addParam("debug", "Debug", SCRIPT_PARAM_ONOFF, false)

      menu.combo:permaShow("combokey")
      menu.gank:permaShow("gankkey")
      menu.harass:permaShow("harasskey")
end

-------------------------------------------------
-------------------------------------------------
--[OnTick]--
function OnTick()
  if myHero.dead then return end
  if Loaded then
    ts:update()
  end
  ManaChecks()
  EnemyMinions:update()
  spell_check()
  CheckEnemies()
  if menu.extra.autolevel then
    autoLevelSetSequence(levelSequence)
  end
  Qrange = menu.extra.Qrange
  iSOW:EnableAttacks()
  
  target = ts.target

  if menu.combo.combokey then
    Combo()
  end
  if menu.gank.gankkey then
    Gank()
  end
  if menu.harass.harasskey then
    Harass()
  end
  if menu.lane.lanekey then
    LaneClear()
  end
  if menu.jungle.junglekey then
    JungleClear()
  end
  if menu.killsteal.killstealQ or menu.killsteal.killstealE then
    killsteal()
  end
  if menu.extra.autoW then
    TurretStun()
  end

end

function spell_check()
  
  Qready = (myHero:CanUseSpell(_Q) == READY)
  Wready = (myHero:CanUseSpell(_W) == READY)
  Eready = (myHero:CanUseSpell(_E) == READY)
  Rready = (myHero:CanUseSpell(_R) == READY)

end

-------------------------------------------------
-------------------------------------------------
--[Combo and Gank]--
function Combo()
  if menu.combo.useW and Wready then CastW() end
  if menu.combo.useQ and Qready then CastQ() end
  if menu.combo.useE and Eready then CastE() end
end

function Gank()
  if menu.gank.useW and Wready then CastW() end
  if menu.gank.useE and Eready and not Wready then CastE() end
  if menu.gank.useQ and Qready and not EReady and not WReady then CastQ() end
end

function CastQ()
  if target and GetDistance(target) < Qrange then
      if not menu.extra.prediction then
        local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, Qdelay, Qwidth, Qrange, Qspeed, myHero) 
        if HitChance >= 1 then CastSpell(_Q, CastPosition.x, CastPosition.z) end
      else
        local pos, info = Prodiction.GetPrediction(target, Qrange, Qspeed, Qdelay, Qwidth)
        if pos and info.hitchance > 0 then
            CastSpell(_Q, pos.x, pos.z)
        end
      end
  end
end
            
        
function CastW()
    if target and GetDistance(target) < Wrange then
      CastSpell(_W, target)
    end
end

function CastE()
    local EspeedDist = 1500-GetDistance(target)
    if target and GetDistance(target) < Erange then
      if not menu.extra.prediction then
        local AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(target, Edelay, Ewidth, Erange, EspeedDist, myHero)
        if nTargets >= 1 and GetDistance(AOECastPosition) <= Erange and MainTargetHitChance >= 1 then
          CastSpell(_E, AOECastPosition.x, AOECastPosition.z)
        end
      else
         local pos, info = Prodiction.GetCircularAOEPrediction(target, Erange, EspeedDist, Edelay, Ewidth)
         if pos and info.hitchance > 0 and GetDistance(pos) < Erange then
          CastSpell(_E, pos.x, pos.z)
         end
      end
    end
end


-------------------------------------------------
-------------------------------------------------
--[Harass]--
function Harass()
  if menu.harass.mana > (myHero.mana / myHero.maxMana) * 100 then return end
  if target == nil then return end
  
  if menu.harass.useQ and Qready then HarassQ() end
  if menu.harass.useW and Wready then HarassW() end
  if menu.harass.useE and Eready then HarassE() end
  
end
function HarassQ()
    if target and GetDistanceSqr(target) <= Qrange^2 then
      if not menu.extra.prediction then
        local CastPosition, HitChance, Position = VP:GetLineCastPosition(target, Qdelay, Qwidth, Qrange, Qspeed, myHero) 
        if HitChance >= 2 then CastSpell(_Q, CastPosition.x, CastPosition.z) end
      else
         local pos, info = Prodiction.GetPrediction(target, Qrange, Qspeed, Qdelay, Qwidth)
         if pos then
          CastSpell(_Q, pos.x, pos.z)
         end
      end
    end
end

function HarassW()
    if target and GetDistanceSqr(target) <= Wrange^2 then
      CastSpell(_W, target)
    end
end
    
function HarassE()
    if target and GetDistanceSqr(target) <= Erange^2 then
      if not menu.extra.prediction then
        EspeedDist = 1500-GetDistance(target)
        AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(target, Edelay, Ewidth, Erange, EspeedDist, myHero)
        if nTargets >= 1 and GetDistance(AOECastPosition) <= Erange and MainTargetHitChance >= 2 then
          CastSpell(_E, AOECastPosition.x, AOECastPosition.z) end
      else
         local pos, info = Prodiction.GetPrediction(target, Erange, Espeed, Edelay, Ewidth)
         if pos then
          CastSpell(_E, pos.x, pos.z)
         end
      end
    end
end

-------------------------------------------------
-------------------------------------------------
--[LaneClear]--
function LaneClear()
  if not GetJungleMob() then
    for i, minion in pairs(EnemyMinions.objects) do
      if minion and minion.valid and not minion.dead then
        if menu.lane.useQ and GetDistanceSqr(minion) <= Qrange^2 and Qready then
          local CastPosition, HitChance, Position = VP:GetLineCastPosition(minion, Qdelay, Qwidth, Qrange, Qspeed, myHero) 
          if HitChance >= 2 then CastSpell(_Q, CastPosition.x, CastPosition.z) end
        end
        if minion and menu.lane.useE and GetDistanceSqr(minion) <= Erange^2 and Eready then
          AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(minion, Edelay, Ewidth, Erange, Espeed, myHero)
          if nTargets >= 1 and GetDistance(AOECastPosition) <= Erange and MainTargetHitChance >= 2 then
            CastSpell(_E, AOECastPosition.x, AOECastPosition.z)
          end
        end
      end
    end
  end
end

-------------------------------------------------
-------------------------------------------------
--[JungleCLear]--
function JungleClear()
  local JungleMob = GetJungleMob()
  if JungleMob ~= nil then
    if JungleMob and menu.jungle.useW and GetDistanceSqr(JungleMob) < Wrange^2 and Wready then
      CastSpell(_W, JungleMob)
    end
    if JungleMob and menu.jungle.useQ and GetDistanceSqr(JungleMob) <= Qrange^2 and Qready then
        local CastPosition, HitChance, Position = VP:GetLineCastPosition(JungleMob, Qdelay, Qwidth, Qrange, Qspeed, myHero) 
      if HitChance >= 1 then CastSpell(_Q, CastPosition.x, CastPosition.z) end
    end
    if JungleMob and menu.jungle.useE and GetDistanceSqr(JungleMob) <= Erange^2 and Eready then
      AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(JungleMob, Edelay, Ewidth, Erange, Espeed, myHero)
      if nTargets >= 1 and GetDistance(AOECastPosition) <= Erange and MainTargetHitChance >= 2 then
        CastSpell(_E, AOECastPosition.x, AOECastPosition.z)
      end
    end
  end
end

function GetJungleMob()
  for _, Mob in pairs(JungleFocusMobs) do
    if ValidTarget(Mob, 425) then return Mob end
  end
  for _, Mob in pairs(JungleMobs) do
    if ValidTarget(Mob, 425) then return Mob end
  end
end

function OnCreateObj(obj)
  if obj.valid then
    if FocusJungleNames[obj.name] then
      JungleFocusMobs[#JungleFocusMobs+1] = obj
    elseif JungleMobNames[obj.name] then
      JungleMobs[#JungleMobs+1] = obj
    end
  end
end

function OnDeleteObj(obj)
  for i, Mob in pairs(JungleMobs) do
    if obj.name == Mob.name then
      table.remove(JungleMobs, i)
    end
  end
  for i, Mob in pairs(JungleFocusMobs) do
    if obj.name == Mob.name then
      table.remove(JungleFocusMobs, i)
    end
  end
end

function JungVariables()
  JungleMobs = {}
  JungleFocusMobs = {}
  JungleMobNames = { 
    ["Wolf8.1.2"]     = true,
    ["Wolf8.1.3"]     = true,
    ["YoungLizard7.1.2"]  = true,
    ["YoungLizard7.1.3"]  = true,
    ["LesserWraith9.1.3"] = true,
    ["LesserWraith9.1.2"] = true,
    ["LesserWraith9.1.4"] = true,
    ["YoungLizard10.1.2"] = true,
    ["YoungLizard10.1.3"] = true,
    ["SmallGolem11.1.1"]  = true,
    ["Wolf2.1.2"]     = true,
    ["Wolf2.1.3"]     = true,
    ["YoungLizard1.1.2"]  = true,
    ["YoungLizard1.1.3"]  = true,
    ["LesserWraith3.1.3"] = true,
    ["LesserWraith3.1.2"] = true,
    ["LesserWraith3.1.4"] = true,
    ["YoungLizard4.1.2"]  = true,
    ["YoungLizard4.1.3"]  = true,
    ["SmallGolem5.1.1"]   = true
  }
  
  FocusJungleNames = {
    ["Dragon6.1.1"]     = true,
    ["Worm12.1.1"]      = true,
    ["GiantWolf8.1.1"]    = true,
    ["AncientGolem7.1.1"] = true,
    ["Wraith9.1.1"]     = true,
    ["LizardElder10.1.1"] = true,
    ["Golem11.1.2"]     = true,
    ["GiantWolf2.1.1"]    = true,
    ["AncientGolem1.1.1"] = true,
    ["Wraith3.1.1"]     = true,
    ["LizardElder4.1.1"]  = true,
    ["Golem5.1.2"]      = true,
    ["GreatWraith13.1.1"] = true,
    ["GreatWraith14.1.1"] = true
  }
    
  for i = 0, objManager.maxObjects do
    local object = objManager:getObject(i)
    if object and object.valid and not object.dead then
      if FocusJungleNames[object.name] then
        JungleFocusMobs[#JungleFocusMobs+1] = object
      elseif JungleMobNames[object.name] then
        JungleMobs[#JungleMobs+1] = object
      end
    end
  end
end


-------------------------------------------------
-------------------------------------------------
--[Tower Stuff]--
function UnitAtTower(unit,offset)
  for i, turret in pairs(GetTurrets()) do
    if turret ~= nil then
      if turret.team == myHero.team then
        if GetDistance(unit, turret) <= turret.range+offset then
          return true
        end
      end
    end
  end
  return false
end

function TurretStun()
  for _, enemy in ipairs(GetEnemyHeroes()) do
    if UnitAtTower(enemy, 0) and GetDistanceSqr(enemy) <= Wrange^2 then
      CastSpell(_W, enemy)
    end
  end
end
-------------------------------------------------
-------------------------------------------------
--[KillSteal]--
function killsteal()
    for _, enemy in ipairs(GetEnemyHeroes()) do
    if GetDistance(enemy) < Erange then
      local qDmg = getDmg("Q", enemy, myHero)
      local eDmg = getDmg("E", enemy, myHero)
      local rDmg = getDmg("R", enemy, myHero)
      if enemy and not enemy.dead and GetDistanceSqr(enemy) <= Qrange^2 and enemy.health <= qDmg and menu.killsteal.killstealQ then
        local CastPosition, HitChance, Position = VP:GetLineCastPosition(enemy, Qdelay, Qwidth, Qrange, Qspeed, myHero) 
        if HitChance >= 2 then CastSpell(_Q, CastPosition.x, CastPosition.z) end
      end
      if enemy and not enemy.dead and GetDistanceSqr(enemy) <= Erange^2 and enemy.health <= eDmg and menu.killsteal.killstealE then
        EspeedDist = 1+GetDistance(enemy)
        AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(enemy, Edelay, Ewidth, Erange, EspeedDist, myHero)
        if nTargets >= 1 and GetDistance(AOECastPosition) <= Erange and MainTargetHitChance >= 2 then
          CastSpell(_E, AOECastPosition.x, AOECastPosition.z)
        end
      end
      if enemy and ValidTarget(enemy) and not enemy.dead then
        if menu.killsteal.killstealR and Rready and MaokaiROn and GetDistanceSqr(enemy) <= Rwidth^2 and enemy.health <= rDmg then
          CastSpell(_R)
        end
      end
    end
  end
end

-------------------------------------------------
-------------------------------------------------
--[OnDraw]--
function OnDraw()
  if myHero.dead then return end
  draw_Range()
  draw_Range_aftercombo()
end

function draw_Range()
  if menu.draw.drawAA then
    DrawCircle(myHero.x, myHero.y, myHero.z, AARange, ARGB(255,100,0,50))
  end
  if menu.draw.drawQ and Qready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Qrange, ARGB(255,100,0,50))
  end
  if menu.draw.drawW and Wready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Wrange, ARGB(255,100,0,50))
  end
  if menu.draw.drawE and Eready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Erange, ARGB(255,100,0,50))
  end
  if menu.draw.drawR and Rready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Rrange, ARGB(255,100,0,50))
  end
end

function draw_Range_aftercombo()
  if menu.draw.drawQ and menu.draw.aftercombo and not Qready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Qrange, ARGB(85,77,0,77))
  end
  if menu.draw.drawW and menu.draw.aftercombo and not Wready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Wrange, ARGB(85,77,0,77))
  end
  if menu.draw.drawE and menu.draw.aftercombo and not Eready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Erange, ARGB(85,77,0,77))
  end
  if menu.draw.drawR and menu.draw.aftercombo and not Rready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Rrange, ARGB(85,77,0,77))
  end
end


function OnProcessSpell(unit, spell)
  if menu.extra.gapClose and Qready then
    if unit.team ~= myHero.team then
      local spellName = spell.name
      if DashList[unit.charName] and spellName == DashList[unit.charName].spell and GetDistance(unit) < 2000 then
        if spell.target ~= nil and spell.target.name == myHero.name or DashList[unit.charName].spell == 'blindmonkqtwo' then
          local CastPosition, HitChance, Position = VP:GetLineCastPosition(unit, Qdelay, Qwidth, Qrange, Qspeed, myHero) 
          CastSpell(_Q, CastPosition.x, CastPosition.z)
        end
      end
    end
  end
  if menu.extra.stun then
    if unit.team ~= myHero.team and GetDistance(unit) < Wrange then
      local spellName = spell.name
      for i = 1, #StunList do
        if unit.charName == StunList[i].charName and spellName == StunList[i].spellName then
          local CastPosition, HitChance, Position = VP:GetLineCastPosition(unit, Qdelay, Qwidth, Qrange, Qspeed, myHero) 
          CastSpell(_Q, CastPosition.x, CastPosition.z)
        end
      end
    end 
  end
end

function OnGainBuff(unit, buff)
  if unit and unit.charName == myHero.charName and buff.name == "MaokaiDrain3" then
     MaokaiROn = true
     if menu.extra.debug then print("MaokaiROn") end
  end
end

function OnLoseBuff(unit, buff)
  if unit and unit.charName == myHero.charName and buff.name == "MaokaiDrain3" then
     MaokaiROn = false
     if menu.extra.debug then print("MaokaiROff") end
  end
end


function CheckEnemies()
  EnemysInR = CountEnemies(Rwidth, myHero)
  if menu.combo.useR and Rready and menu.combo.combokey and not MaokaiROn and EnemysInR >= menu.combo.minR then
    CastSpell(_R)
  end
end

function CountEnemies(range, unit)
    local Enemies = 0
    for _, enemy in ipairs(GetEnemyHeroes()) do
        if ValidTarget(enemy) and GetDistance(enemy, unit) < (range or math.huge) then
            Enemies = Enemies + 1
        end
    end
    return Enemies
end


function ManaChecks()
  if MaokaiROn and myHero.mana/myHero.maxMana < menu.combo.manaR/100 then 
    CastSpell(_R)
  end
end

function OnBugsplat()
  UpdateWeb(false, ScriptName, id, HWID)
end

function OnUnload()
  UpdateWeb(false, ScriptName, id, HWID)
end
