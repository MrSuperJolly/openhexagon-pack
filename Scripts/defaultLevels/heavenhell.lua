-- include useful files
execScript("utils.lua")
execScript("common.lua")
execScript("commonpatterns.lua")
execScript("KeyboardHelper1.2.lua")
execScript("mathExtended.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
		if mKey == 0 then pAltBarrage(math.random(2, 4), 2) 
	elseif mKey == 1 then pMirrorSpiral(math.random(2, 5), getHalfSides() - 3)
	elseif mKey == 2 then pBarrageSpiral(math.random(0, 3), 1, 1)
	elseif mKey == 3 then pInverseBarrage(0)
	elseif mKey == 4 then pTunnel(math.random(1, 3))
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0, 0, 1, 1, 2, 2, 3, 3, 4 }
keys = shuffle(keys)
index = 0

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	rotinc = 0.8
	skewinc = -0.4
	hell = false
	level_time = -0.8
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
	if rotinc <= 1.6 then 
		rotinc = rotinc + 0.1
	end
	
	if skewinc >= -0.8 then 
		skewinc = skewinc - 0.05
	end
	
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
	level_time = level_time + mFrameTime / 60
	level_time_rounded = level_time + math.precision(level_time, 1)

	if level_time_rounded < 2 and level_time_rounded > 0 then
		messageImportantAdd("which to choose?", 0)
	end

	if isKeyDown(keyboard.LEFT) then
		log(skewinc)
		execEvent("hell")
		
		hell = true
	elseif isKeyDown(keyboard.RIGHT) then
		
		execEvent("heaven")
		hell = false
	end

	if hell then
		setStyleValueFloat("3D_skew", skewinc)
		setLevelValueFloat("rotation_speed", -0.8)
	else
		setStyleValueFloat("3D_skew", 0.1)
		setLevelValueFloat("rotation_speed", rotinc)
	end	

	--updateKeysPressed()
end