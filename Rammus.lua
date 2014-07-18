if myHero.charName ~= "Rammus" then return end


require 'SOW'
require 'VPrediction'
require 'Prodiction'

--[AUTOUPDATER]--

local version = "1.12"
local author = "Teecolz"
local scriptName = "Rammus"
local AUTOUPDATE = false
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/Teecolz/Teecolz---idylkarthus-Scripts/blob/master/Maokai.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."Maokai.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

DashList = {
       ['Ahri']        = {true, spell = 'AhriTumble'},
        ['Aatrox']      = {true, spell = 'AatroxQ'},
        ['Akali']       = {true, spell = 'AkaliShadowDance'}, -- Targeted ability
        ['Alistar']     = {true, spell = 'Headbutt'}, -- Targeted ability
        ['Diana']       = {true, spell = 'DianaTeleport'}, -- Targeted ability
        ['Gragas']      = {true, spell = 'GragasE'},
        ['Graves']      = {true, spell = 'GravesMove'},
        ['Hecarim']     = {true, spell = 'HecarimUlt'},
        ['Irelia']      = {true, spell = 'IreliaGatotsu'}, -- Targeted ability
        ['JarvanIV']    = {true, spell = 'jarvanAddition'}, -- Skillshot/Targeted ability
        ['Jax']         = {true, spell = 'JaxLeapStrike'}, -- Targeted ability
        ['Jayce']       = {true, spell = 'JayceToTheSkies'}, -- Targeted ability
	['Katarina']	 = {true, spell = 'KatarinaE'},
        ['Khazix']      = {true, spell = 'KhazixW'},
        ['Leblanc']     = {true, spell = 'LeblancSlide'},
        ['LeeSin']      = {true, spell = 'blindmonkqtwo'},
        ['Leona']       = {true, spell = 'LeonaZenithBlade'},
        ['Malphite']    = {true, spell = 'UFSlash'},
        ['Maokai']      = {true, spell = 'MaokaiTrunkLine',}, -- Targeted ability	
	['MasterYi']	=  {true, spell = 'AlphaStrike',}, -- Targeted
        ['MonkeyKing']  = {true, spell = 'MonkeyKingNimbus'}, -- Targeted ability
        ['Pantheon']    = {true, spell = 'PantheonW'}, -- Targeted ability
        ['Pantheon']    = {true, spell = 'PantheonRJump'},
        ['Pantheon']    = {true, spell = 'PantheonRFall' },
        ['Poppy']       = {true, spell = 'PoppyHeroicCharge'}, -- Targeted ability
        --['Quinn']       = {true, spell = 'QuinnE',                  range = 725,   projSpeed = 2000, }, -- Targeted ability
        ['Renekton']    = {true, spell = 'RenektonSliceAndDice'},
        ['Sejuani']     = {true, spell = 'SejuaniArcticAssault'},
        ['Shen']        = {true, spell = 'ShenShadowDash'},
        ['Tristana']    = {true, spell = 'RocketJump'},
        ['Tryndamere']  = {true, spell = 'Slash'},
        ['XinZhao']     = {true, spell = 'XenZhaoSweep'}, -- Targeted ability
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




function AutoupdaterMsg(msg) print("<font color='#5F9EA0'><b>[".. scriptName .."] </font><font color='#cffffffff'> "..msg..".</font>") end
if AUTOUPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/Teecolz/Teecolz---idylkarthus-Scripts/blob/master/Maokai.version")
  if ServerData then
    ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
    if ServerVersion then
      if tonumber(version) < ServerVersion then
        AutoupdaterMsg("New version available"..ServerVersion)
        AutoupdaterMsg("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
      else
        AutoupdaterMsg("You have got the latest version ("..ServerVersion..")")
      end
    end
  else
    AutoupdaterMsg("Error downloading version info")
  end
end

-------------------------------------------------
-------------------------------------------------

--[Other Stuff]--
local menu
local ts
local levelSequence = {3, 1, 2, 1, 2, 4, 1, 2, 1, 2, 4, 2, 1, 3, 3, 4, 3, 3}
local target
local enemyTable = {}
local PowerBallOn = false

local Prodict
local ProdictE, ProdictQ


local TMTSlot, RAHSlot = nil, nil
local TMTREADY, RAHREADY = false, false
--[Spell Data]--
local Qready, Wready, Eready, Rready = false, false, false, false


-------------------------------------------------
-------------------------------------------------
--[OnLoad]--
function OnLoad()
  VP    = VPrediction()
  iSOW  = SOW(VP)
  Menu()
  Init()
  PrintChat("<font color=\"#78CCDB\"><b>" ..">> Maokai has been loaded")
  Loaded = true
  Variables()
  JungVariables()
  EnemyMinions = minionManager(MINION_ENEMY, Erange, myHero, MINION_SORT_HEALTH_ASC)
  
  for i, enemy in pairs(GetEnemyHeroes()) do
    if enemy then 
      local a = {}
      a.object = enemy
      a.stack = 0
      table.insert(enemyTable, a)
    end
  end
end

    if VIP_USER then
        Prodict = ProdictManager.GetInstance()
        ProdictQ = Prodict:AddProdictionObject(_Q, Qrange, Qspeed, Qdelay, Qwidth)
        ProdictE = Prodict:AddProdictionObject(_E, Erange, Espeed, Edelay, Ewidth)
    end

function Variables()

  AARange = 125

  Qrange = 600
  Qwidth = 110 
  Qspeed = 1200
  Qdelay = 0.5

  Wrange = 525
  Wwidth = nil 
  Wspeed = nil
  Wdelay = 0

  Erange = 325
  Ewidth = 250 
  Espeed = 1500 
  Edelay = 1.0

  Rrange = 625
  Rwidth = 475 
  Rspeed = nil 
  Rdelay = 0.5
end


function Init()
  --[TargetSelector]--
    ts      = TargetSelector(TARGET_LESS_CAST, 1100, DAMAGE_MAGIC)
    ts.name = "Maokai"
  end
  
function Menu()  
        menu = scriptConfig("Maokai: Main Menu", "Maokai")

          menu:addSubMenu("Maokai: Orbwalk", "Orbwalk")
            iSOW:LoadToMenu(menu.Orbwalk)  
 
          menu:addSubMenu("Maokai: Combo", "combo")
            menu.combo:addParam("combokey", "Combo",    SCRIPT_PARAM_ONKEYDOWN, false, 32)


          menu:addSubMenu("Maokai: Harass", "harass")
            menu.harass:addParam("harasskey", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))

            
          menu:addSubMenu("Maokai: Lane Clear", "lane")
            menu.lane:addParam("lanekey", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))

            
          menu:addSubMenu("Maokai: Jungle Clear", "jungle")
            menu.jungle:addParam("junglekey", "Jungle Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))

          menu:addSubMenu("Maokai: Killsteal", "killsteal")


          menu:addSubMenu("Maokai: Drawings", "draw")


          menu:addSubMenu("Maokai: Extras", "extra")
            menu.extra:addParam("autolevel", "AutoLevel Spells", SCRIPT_PARAM_ONOFF, false)
            menu.extra:addParam("prediction", "Prodiction = ON, VPred = OFF", SCRIPT_PARAM_ONOFF, true)
            menu.extra:addParam("autoE", "Auto E under Turrets", SCRIPT_PARAM_ONOFF, false)
            menu.extra:addParam("debug", "Debug", SCRIPT_PARAM_ONOFF, false)
	    menu.extra:addParam("QMethod", "Avoiding Method (False - Old, True - New)", SCRIPT_PARAM_ONOFF, true)
	    menu.extra:addParam("QBuffer", "Distance to Avoid Minions",SCRIPT_PARAM_SLICE, 250, 0, 500, 1)
            menu.extra:addParam("QBufferMove", "Distance to Move Away from minions",SCRIPT_PARAM_SLICE, 150, 0, 500, 1)

      --[PermaShow]--
      menu.combo:permaShow("combokey")
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
  EnemyMinions:update()
  UpdateAreas()
  spell_check()
  if menu.extra.autolevel then
    autoLevelSetSequence(levelSequence)
  end

  iSOW:EnableAttacks()
  target = ts.target

  if menu.combo.combokey then
    Combo()
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
  if menu.extra.autoE then
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
--[Ball Stuff]--
function OnGainBuff(unit, buff)
  if unit and unit.charName == myHero.charName and buff.name == "PowerBall" then
     PowerBallOn = true
  end
end

function OnLoseBuff(unit, buff)
  if unit and unit.charName == myHero.charName and buff.name == "PowerBall" then
     PowerBallOn = false
  end
end

function AvoidMinions(Area)
	myPosV = Vector(myHero.x, myHero.z)
	AreaV = Vector(Area.x, Area.z)
	calc = GetDistance(AreaV, myPosV)
        dodgex = Area.x + ((menu.extra.QBufferMove + Area.range + (myHero.ms/100)^2)/calc)*(myHero.x-Area.x)  
        dodgez = Area.z + ((menu.extra.QBufferMove + Area.range +(myHero.ms/100)^2)/calc)*(myHero.z-Area.z) 
	MoveV = AreaV+(myPosV - AreaV):normalized() * (Area.range + menu.extra.QBufferMove + (myHero.ms/100)^2)
	if menu.extra.QMethod then
		myHero:MoveTo(dodgex, dodgez)
	else
		myHero:MoveTo(MoveV.x, MoveV.y)
	end
end

function UpdateAreas()
	MinionsArea = {}	
	GetMinionsArea()
end

function GetMinionsArea()
	for _, enemy in pairs(EnemyMinions.objects) do
		if ValidTarget(enemy) then
			QBuffer = menu.extra.QBuffer
			table.insert(MinionsArea, {x = enemy.x, y = enemy.y, z = enemy.z, range = QBuffer})
		end
	end
end

-------------------------------------------------
-------------------------------------------------
--[Combo]--
function Combo()
	if Qready and not PowerBallOn then

	end
	for _, Area in pairs(MinionsArea) do
		if GetDistance(Area) < Area.range + (myHero.ms/100)^2 then
			AvoidMinions(Area)
		end
	end
end

-------------------------------------------------
-------------------------------------------------
--[Harass]--
function Harass()

end

-------------------------------------------------
-------------------------------------------------
--[LaneClear]--
function LaneClear()

end

-------------------------------------------------
-------------------------------------------------
--[JungleCLear]--
function JungleClear()

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
    if UnitAtTower(enemy, 0) and GetDistanceSqr(enemy) <= Erange^2 then
      CastSpell(_E, enemy)
    end
  end
end
-------------------------------------------------
-------------------------------------------------
--[KillSteal]--
function killsteal()

end

-------------------------------------------------
-------------------------------------------------
--[OnDraw]--
function OnDraw()
  if myHero.dead then return end
  PowerDistance = (menu.extra.QBuffer + menu.extra.QBufferMove + (myHero.ms/100)^2)
  DrawText3D("["..PowerDistance.."]", myHero.x, myHero.y, myHero.z, 20, RGB(0, 255, 0), 0)
end


