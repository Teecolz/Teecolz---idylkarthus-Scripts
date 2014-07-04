if myHero.charName ~= "Rammus" then return end


require 'SOW'
require 'VPrediction'

local menu
local ts
local levelSequence = {}
local target
local Qready, Wready, Eready, Rready = false, false, false, false

--[Spell Range]--
local AARange = 125
local Qrange  = 
local Wrange  = 
local Erange  = 325
local Rrange  = 300

-------------------------------------------------
-------------------------------------------------
--[OnLoad]--
function OnLoad()
  VP    = VPrediction()
  iSOW  = SOW(VP)
  Menu()
  Init()
  PrintChat("<font color=\"#78CCDB\"><b>" ..">> Rammus has been loaded")
  Loaded = true
  JungVariables()
  EnemyMinions = minionManager(MINION_ENEMY, 425, myHero, MINION_SORT_HEALTH_ASC)
end
  
function Init()
  --[TargetSelector]--
    ts      = TargetSelector(TARGET_LESS_CAST, 540, DAMAGE_PHYSICAL)
    ts.name = "Rammus"
end

function Menu()  
        menu = scriptConfig("Rammus: Main Menu", "Rammus")

          menu:addSubMenu("Rammus: Orbwalk", "Orbwalk")
            iSOW:LoadToMenu(menu.Orbwalk)  
 
          menu:addSubMenu("Rammus: Combo", "combo")
            menu.combo:addParam("combokey", "Combo",    SCRIPT_PARAM_ONKEYDOWN, false, 32)
            menu.combo:addParam("useQ", "Use Q-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.combo:addParam("useW", "Use W-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.combo:addParam("useE", "Use E-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.combo:addParam("useR", "Use R-Spell",  SCRIPT_PARAM_ONOFF, true)
            menu.combo:addParam("useITEM", "Use Items",  SCRIPT_PARAM_ONOFF, true)

          menu:addSubMenu("Rammus: Harass", "harass")
            menu.harass:addParam("harasskey", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
            menu.harass:addParam("useQ", "Use Q-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.harass:addParam("mana", "Dont Harass if mana < %", SCRIPT_PARAM_SLICE, 0, 0, 100)
            
          menu:addSubMenu("Rammus: Lane Clear", "lane")
            menu.lane:addParam("lanekey", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
            menu.lane:addParam("useQ", "Use Q-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.lane:addParam("useW", "Use W-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.lane:addParam("useITEM", "Use Items",  SCRIPT_PARAM_ONOFF, true)
            
          menu:addSubMenu("Rammus: Jungle Clear", "jungle")
            menu.jungle:addParam("junglekey", "Jungle Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
            menu.jungle:addParam("useQ", "Use Q-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.jungle:addParam("useW", "Use W-Spell", SCRIPT_PARAM_ONOFF, true)
            menu.jungle:addParam("useITEM", "Use Items",  SCRIPT_PARAM_ONOFF, true)

          menu:addSubMenu("Rammus: Killsteal", "killsteal")
            menu.killsteal:addParam("killstealR", "Use R-Spell to Killsteal", SCRIPT_PARAM_ONOFF, true)
            menu.killsteal:addParam("killstealQ", "Use Q-Spell to Killsteal", SCRIPT_PARAM_ONOFF, true)

          menu:addSubMenu("Rammus: Drawings", "draw")
            menu.draw:addParam("drawAA", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
            menu.draw:addParam("drawQ", "Draw Q Range",   SCRIPT_PARAM_ONOFF, true)
            menu.draw:addParam("drawE", "Draw E Range",   SCRIPT_PARAM_ONOFF, true)
            menu.draw:addParam("drawR", "Draw R Range",   SCRIPT_PARAM_ONOFF, true)

          menu:addSubMenu("Rammus: Extras", "extra")
            menu.extra:addParam("autolevel", "AutoLevel Spells", SCRIPT_PARAM_ONOFF, false)
            menu.extra:addParam("debug", "Debug", SCRIPT_PARAM_ONOFF, false)

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
  spell_check()
  if menu.extra.autolevel then
    autoLevelSetSequence(levelSequence)
  end
  iSOW:EnableAttacks()

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
  TurretStun()
end

function spell_check()
  
  TMTSlot, RAHSlot = GetInventorySlotItem(3077), GetInventorySlotItem(3074)
  
  TMTREADY = (TMTSlot ~= nil and myHero:CanUseSpell(TMTSlot) == READY)
  RAHREADY = (RAHSlot ~= nil and myHero:CanUseSpell(RAHSlot) == READY)

  Qready = (myHero:CanUseSpell(_Q) == READY)
  Wready = (myHero:CanUseSpell(_W) == READY)
  Eready = (myHero:CanUseSpell(_E) == READY)
  Rready = (myHero:CanUseSpell(_R) == READY)
end

-------------------------------------------------
-------------------------------------------------
--[Combo]--
function Combo()
  local Enemies = GetEnemyHeroes
  local target  = ts.target

end

-------------------------------------------------
-------------------------------------------------
--[LaneClear]--
function LaneClear() --[[DIDNT CHANGE, REDO THIS]]--
  if not GetJungleMob() then
    for i, minion in pairs(EnemyMinions.objects) do
  if minion and minion.valid and not minion.dead then
        if menu.lane.useQ and GetDistanceSqr(minion) <= 180625 then CastSpell(_Q) end
        if menu.lane.useITEM and TMTREADY and GetDistance(minion) < 275 then CastSpell(TMTSlot) end
        if menu.lane.useITEM and RAHREADY and GetDistance(minion) < 275 then CastSpell(RAHSlot) end
      end    
    end
  end
end

-------------------------------------------------
-------------------------------------------------
--[JungleCLear]--
function JungleClear() --[[DIDNT CHANGE, REDO THIS]]--
    local JungleMob = GetJungleMob()
    if JungleMob ~= nil then
      if menu.jungle.useQ and GetDistanceSqr(JungleMob) <= 180625 then CastSpell(_Q) end
      if menu.jungle.useITEM and TMTREADY and GetDistance(JungleMob) < 275 then CastSpell(TMTSlot) end
      if menu.jungle.useITEM and RAHREADY and GetDistance(JungleMob) < 275 then CastSpell(RAHSlot) end
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
      if turret.team ~= myHero.team then
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
--[OnDraw]--
function OnDraw()
  if myHero.dead then return end
  draw_Range()
end

function draw_Range()
  if menu.draw.drawAA then
    DrawCircle(myHero.x, myHero.y, myHero.z, AARange, ARGB(255,100,0,50))
  end
  if menu.draw.drawE and Eready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Erange, ARGB(255,100,0,50))
  end
  if menu.draw.drawR and Rready then
    DrawCircle(myHero.x, myHero.y, myHero.z, Rrange, ARGB(255,100,0,50))
  end
end
