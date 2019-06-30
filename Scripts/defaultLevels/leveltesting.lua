-- include useful files
execScript("utils.lua")
execScript("common.lua")
execScript("commonpatterns.lua")
execScript("commonpatternsv5.lua")
execScript("hxdstripatterns.lua")
execScript("hxdssquarepatterns.lua")
execScript("hxdspentpatterns.lua")
execScript("hxdshexpatterns.lua")
execScript("hxdsheptpatterns.lua")
execScript("hxdsoctpatterns.lua")
execScript("expatterns.lua")
execScript("expatterns3.lua")
execScript("quantumoct.lua")
execScript("quantumenn.lua")
execScript("KeyboardHelper1.2.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
	if mKey == 0 and getSides() ~= 9 then pAltBarrage(math.random(2, 4), 2)
	elseif mKey == 1 then pBarrageSpiral(math.random(0, 3), 1, 1)
	elseif mKey == 2 then pDMInverseBarrage(0, 1.2)
	elseif mKey == 3 then pRandomBarrageNoRepeats(math.random(5, 8), barrageAdjust) --equal difficulty on all sides
	elseif mKey == 4 then pBarrageSpiralLR(math.random(2, 3), 1)
	elseif mKey == 5 and getSides() == 3 then pDMTunnel(math.random(2, 5), 0.65) wait(7)
	elseif mKey == 5 and getSides() > 3 then pDMTunnel(math.random(2, 5), tunnelAdjust) --equal difficulty on all sides
	elseif mKey == 6 and getSides() >= 5 and getSides() ~= 9 and getSides() ~= 7 then pMirrorSpiral(math.random(2, 5), getHalfSides() - 3)
	elseif mKey == 7 and getSides() % 2 == 0 then pRandomWallExVortexNoRepeats(math.random(2, 5), getHalfSides() - 2, barrageAdjust)
	elseif mKey == 8 and getSides() == 3 then pTriSingleSpiral(math.random(4, 7), 0)
	elseif mKey == 9 and getSides() == 4 then pSquare2Sp(math.random(1, 3), 1.1)
	elseif mKey == 10 and getSides() == 5 then pPentInverseBarrage43Sid(math.random(1, 2), 1.21)
	elseif mKey == 11 and getSides() == 6 then pAltBarrage3(math.random(2, 4), 2)
	elseif mKey == 12 and getSides() == 7 then pHeptBackAndForth(math.random(2, 3), 1)--0.58
	elseif mKey == 13 and getSides() == 9 then pTripleSpiral(math.random(3, 6))
	elseif mKey == 14 and getSides() == 9 then pBackAndForthTriple2(math.random(1,2), 1)
	elseif mKey == 15 and getSides() == 9 then pVortexTriple2(1)
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15 }
keys = shuffle(keys)
index = 0

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	--these adjusts are so the varation in distance between gaps as side number changes are taken into account in the delay
	barrageAdjust = 3.5
	barrageAdjust = barrageAdjust * (5 / getSides())
	tunnelAdjust = 0.9
	tunnelAdjust = tunnelAdjust * 2 * (getSides()-2) / getSides()
end
-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()	
	addPattern(keys[index])
	index = index + 1
	
	if index - 1 == table.getn(keys) then
		index = 1
	end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame

--local level_time = -.8
function onUpdate(mFrameTime)
	--level_time = level_time +mFrameTime/60
	--if (math.floor(level_time*10)/10) == 5 then
	--	execEvent("legendkeeperbegin")
	--end
end